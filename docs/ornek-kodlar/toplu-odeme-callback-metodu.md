# Toplu Ödeme Callback Metodu

Örnek Kod Bloğu

{% tabs %}
{% tab title="C#" %}

```csharp
using System.IO.Compression;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace PaywallBulkPaymentCalback;
[ApiController]
[Route("api/[controller]")]
public class WebhookController : ControllerBase
{
    private readonly ILogger<WebhookController> _logger;

    public WebhookController(ILogger<WebhookController> logger)
    {
        _logger = logger;
    }

    public class FileUploadRequest
    {
        public int Type { get; set; }
        public int BulkPaymentId { get; set; }
        public int FileRecordId { get; set; }
        public required string FileName { get; set; }
        public long FileSize { get; set; }
        public int LineCount { get; set; }
        public required string FileFormat { get; set; }
        public bool IsCompressed { get; set; }
        public required string ErrorMessage { get; set; }
        public DateTime DateTime { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime FinishedAt { get; set; }
        public double DurationTime { get; set; }
        public required string Hash { get; set; }
        public required string HashFormat { get; set; }
        public short? HashKeyType { get; set; }
        public string? MerchantUniqueCode { get; set; }
    }

    [HttpPost("receive")]
    public async Task<IActionResult> ReceiveFileWithData()
    {
        try
        {
            if (!Request.HasFormContentType)
            {
                return BadRequest("Multipart form data expected");
            }

            var form = await Request.ReadFormAsync();

            // JSON data'yı al
            FileUploadRequest? uploadRequest = null;
            if (form.ContainsKey("data"))
            {
                var jsonData = form["data"].ToString();
                uploadRequest = JsonConvert.DeserializeObject<FileUploadRequest>(jsonData);
                _logger.LogInformation($"Received data: {jsonData}");
            }

            // Dosyayı al
            var file = form.Files.GetFile("file");
            if (file == null || file.Length == 0)
            {
                return BadRequest("No file received");
            }

            byte[] fileBytes;
            string originalFileName = file.FileName;
            long originalSize = file.Length;
            long processedSize;

            // Dosyayı işle - compressed ise decompress et
            if (uploadRequest?.IsCompressed == true)
            {
                _logger.LogInformation($"Decompressing file: {file.FileName}");
                
                using var compressedStream = file.OpenReadStream();
                using var gzipStream = new GZipStream(compressedStream, CompressionMode.Decompress);
                using var decompressedStream = new MemoryStream();
                
                await gzipStream.CopyToAsync(decompressedStream);
                fileBytes = decompressedStream.ToArray();
                processedSize = fileBytes.Length;
                
                _logger.LogInformation($"File decompressed: {originalSize} bytes -> {processedSize} bytes");
            }
            else
            {
                using var memoryStream = new MemoryStream();
                await file.CopyToAsync(memoryStream);
                fileBytes = memoryStream.ToArray();
                processedSize = fileBytes.Length;
            }

            // Dosyayı kaydet
            var savedFilePath = await SaveFile(originalFileName, fileBytes);

            // Response hazırla
            var response = new
            {
                message = "File and data received successfully",
                uploadRequest,
                file = new
                {
                    originalName = originalFileName,
                    originalSize = originalSize,
                    processedSize = processedSize,
                    contentType = file.ContentType,
                    savedPath = savedFilePath,
                    wasCompressed = uploadRequest?.IsCompressed == true
                },
                processedAt = DateTime.UtcNow
            };

            _logger.LogInformation($"File processed: {originalFileName} (Original: {originalSize} bytes, Processed: {processedSize} bytes)");
                
            return Ok(response);
        }
        catch (InvalidDataException ex)
        {
            _logger.LogError(ex, "Invalid compressed data format");
            return BadRequest("Invalid compressed file format");
        }
        catch (Newtonsoft.Json.JsonException ex)
        {
            _logger.LogError(ex, "Invalid JSON in data field");
            return BadRequest("Invalid JSON format in data field");
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error processing upload request");
            return StatusCode(500, "Upload processing failed");
        }
    }

    private async Task<string> SaveFile(string originalFileName, byte[] fileBytes)
    {
        var uploadsDirectory = Path.Combine(Directory.GetCurrentDirectory(), "uploads");

        if (!Directory.Exists(uploadsDirectory))
        {
            Directory.CreateDirectory(uploadsDirectory);
        }

        var fileName = $"{DateTime.UtcNow:yyyyMMdd_HHmmss}_{Path.GetFileName(originalFileName)}";
        var filePath = Path.Combine(uploadsDirectory, fileName);

        await System.IO.File.WriteAllBytesAsync(filePath, fileBytes);

        return filePath;
    }
}
```

{% endtab %}

{% tab title="Java" %}

```java
package com.paywallbulkpaymentcallback.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.zip.GZIPInputStream;

@RestController
@RequestMapping("/api/webhook")
public class WebhookController {
    
    private static final Logger logger = LoggerFactory.getLogger(WebhookController.class);
    private final ObjectMapper objectMapper = new ObjectMapper();

    public static class FileUploadRequest {
        private int type;
        private int bulkPaymentId;
        private int fileRecordId;
        private String fileName;
        private long fileSize;
        private int lineCount;
        private String fileFormat;
        private boolean isCompressed;
        private String errorMessage;
        private LocalDateTime dateTime;
        private LocalDateTime createdAt;
        private LocalDateTime finishedAt;
        private double durationTime;
        private String hash;
        private String hashFormat;
        private Short hashKeyType;
        private String merchantUniqueCode;

        // Getters and Setters
        public int getType() { return type; }
        public void setType(int type) { this.type = type; }

        public int getBulkPaymentId() { return bulkPaymentId; }
        public void setBulkPaymentId(int bulkPaymentId) { this.bulkPaymentId = bulkPaymentId; }

        public int getFileRecordId() { return fileRecordId; }
        public void setFileRecordId(int fileRecordId) { this.fileRecordId = fileRecordId; }

        public String getFileName() { return fileName; }
        public void setFileName(String fileName) { this.fileName = fileName; }

        public long getFileSize() { return fileSize; }
        public void setFileSize(long fileSize) { this.fileSize = fileSize; }

        public int getLineCount() { return lineCount; }
        public void setLineCount(int lineCount) { this.lineCount = lineCount; }

        public String getFileFormat() { return fileFormat; }
        public void setFileFormat(String fileFormat) { this.fileFormat = fileFormat; }

        public boolean isCompressed() { return isCompressed; }
        public void setCompressed(boolean compressed) { isCompressed = compressed; }

        public String getErrorMessage() { return errorMessage; }
        public void setErrorMessage(String errorMessage) { this.errorMessage = errorMessage; }

        public LocalDateTime getDateTime() { return dateTime; }
        public void setDateTime(LocalDateTime dateTime) { this.dateTime = dateTime; }

        public LocalDateTime getCreatedAt() { return createdAt; }
        public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

        public LocalDateTime getFinishedAt() { return finishedAt; }
        public void setFinishedAt(LocalDateTime finishedAt) { this.finishedAt = finishedAt; }

        public double getDurationTime() { return durationTime; }
        public void setDurationTime(double durationTime) { this.durationTime = durationTime; }

        public String getHash() { return hash; }
        public void setHash(String hash) { this.hash = hash; }

        public String getHashFormat() { return hashFormat; }
        public void setHashFormat(String hashFormat) { this.hashFormat = hashFormat; }

        public Short getHashKeyType() { return hashKeyType; }
        public void setHashKeyType(Short hashKeyType) { this.hashKeyType = hashKeyType; }

        public String getMerchantUniqueCode() { return merchantUniqueCode; }
        public void setMerchantUniqueCode(String merchantUniqueCode) { this.merchantUniqueCode = merchantUniqueCode; }
    }

    @PostMapping("/receive")
    public ResponseEntity<?> receiveFileWithData(
            @RequestParam(value = "data", required = false) String jsonData,
            @RequestParam(value = "file", required = false) MultipartFile file) {
        
        try {
            // JSON verilerini işle
            FileUploadRequest uploadRequest = null;
            if (jsonData != null && !jsonData.isEmpty()) {
                uploadRequest = objectMapper.readValue(jsonData, FileUploadRequest.class);
                logger.info("Received data: {}", jsonData);
            }

            // Dosya kontrolü
            if (file == null || file.isEmpty()) {
                return ResponseEntity.badRequest().body("No file received");
            }

            String originalFileName = file.getOriginalFilename();
            long originalSize = file.getSize();
            byte[] fileBytes;
            long processedSize;

            // Dosyayı işle - compressed ise decompress et
            if (uploadRequest != null && uploadRequest.isCompressed()) {
                logger.info("Decompressing file: {}", originalFileName);
                
                try (InputStream compressedStream = file.getInputStream();
                     GZIPInputStream gzipStream = new GZIPInputStream(compressedStream);
                     ByteArrayOutputStream decompressedStream = new ByteArrayOutputStream()) {
                    
                    byte[] buffer = new byte[1024];
                    int len;
                    while ((len = gzipStream.read(buffer)) != -1) {
                        decompressedStream.write(buffer, 0, len);
                    }
                    
                    fileBytes = decompressedStream.toByteArray();
                    processedSize = fileBytes.length;
                    
                    logger.info("File decompressed: {} bytes -> {} bytes", originalSize, processedSize);
                }
            } else {
                fileBytes = file.getBytes();
                processedSize = fileBytes.length;
            }

            // Dosyayı kaydet
            String savedFilePath = saveFile(originalFileName, fileBytes);

            // Response hazırla
            Map<String, Object> fileInfo = new HashMap<>();
            fileInfo.put("originalName", originalFileName);
            fileInfo.put("originalSize", originalSize);
            fileInfo.put("processedSize", processedSize);
            fileInfo.put("contentType", file.getContentType());
            fileInfo.put("savedPath", savedFilePath);
            fileInfo.put("wasCompressed", uploadRequest != null && uploadRequest.isCompressed());

            Map<String, Object> response = new HashMap<>();
            response.put("message", "File and data received successfully");
            response.put("uploadRequest", uploadRequest);
            response.put("file", fileInfo);
            response.put("processedAt", LocalDateTime.now());

            logger.info("File processed: {} (Original: {} bytes, Processed: {} bytes)", 
                       originalFileName, originalSize, processedSize);

            return ResponseEntity.ok(response);

        } catch (IOException ex) {
            if (ex.getMessage().contains("Not in GZIP format") || ex.getMessage().contains("invalid")) {
                logger.error("Invalid compressed data format", ex);
                return ResponseEntity.badRequest().body("Invalid compressed file format");
            }
            logger.error("IO error processing upload request", ex);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Upload processing failed");
        } catch (Exception ex) {
            if (ex.getMessage().contains("JSON")) {
                logger.error("Invalid JSON in data field", ex);
                return ResponseEntity.badRequest().body("Invalid JSON format in data field");
            }
            logger.error("Error processing upload request", ex);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Upload processing failed");
        }
    }

    private String saveFile(String originalFileName, byte[] fileBytes) throws IOException {
        String uploadsDirectory = System.getProperty("user.dir") + "/uploads";
        Path uploadsPath = Paths.get(uploadsDirectory);
        
        if (!Files.exists(uploadsPath)) {
            Files.createDirectories(uploadsPath);
        }

        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss"));
        String fileName = timestamp + "_" + originalFileName;
        Path filePath = uploadsPath.resolve(fileName);

        Files.write(filePath, fileBytes);

        return filePath.toString();
    }
}
```

{% endtab %}
{% endtabs %}
