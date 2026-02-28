# Toplu Ödeme GZip İsteği

```csharp
using System.IO.Compression;

public class PaywallApiClient
{
    private readonly HttpClient _httpClient;
    private readonly string _baseUrl;

    public PaywallApiClient(string baseUrl = "https://test-payment-api.itspaywall.com")
    {
        _httpClient = new HttpClient();
        _baseUrl = baseUrl;
    }

    public async Task<string> SendBulkPaymentAsync(string filePath, BulkPaymentRequest request)
    {
        try
        {
            var gzippedData = CompressFile(filePath);
            
            using var formData = new MultipartFormDataContent();
            
            var fileContent = new ByteArrayContent(gzippedData);
            fileContent.Headers.Add("Content-Type", "application/gzip");
            formData.Add(fileContent, "File", Path.GetFileName(filePath) + ".gz");
            
            formData.Add(new StringContent(request.FileFormat), "FileFormat");
            formData.Add(new StringContent(request.FilePattern), "FilePattern");
            formData.Add(new StringContent(request.CallbackAddress), "CallbackAddress");

            _httpClient.DefaultRequestHeaders.Clear();
            _httpClient.DefaultRequestHeaders.Add("apiclientpublic", request.ApiClientPublic);
            _httpClient.DefaultRequestHeaders.Add("apikeypublic", request.ApiKeyPublic);
            var response = await _httpClient.PostAsync($"{_baseUrl}/api/paywall/payment/bulk/file/startdirect", formData);
            var responseContent = await response.Content.ReadAsStringAsync();
            
            if (response.IsSuccessStatusCode)
            {
                Console.WriteLine("İstek başarılı!");
                Console.WriteLine($"Status Code: {response.StatusCode}");
                return responseContent;
            }
            else
            {
                Console.WriteLine($"Hata: {response.StatusCode} - {responseContent}");
                return null;
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Hata oluştu: {ex.Message}");
            return null;
        }
    }

    private byte[] CompressFile(string filePath)
    {
        if (!File.Exists(filePath))
        {
            throw new FileNotFoundException($"Dosya bulunamadı: {filePath}");
        }

        var fileBytes = File.ReadAllBytes(filePath);
        
        Console.WriteLine($"Orijinal dosya boyutu: {fileBytes.Length} bytes");
        
        using var outputStream = new MemoryStream();
        using (var gzipStream = new GZipStream(outputStream, CompressionMode.Compress))
        {
            gzipStream.Write(fileBytes, 0, fileBytes.Length);
        }
        
        var compressedData = outputStream.ToArray();
        Console.WriteLine($"Sıkıştırılmış dosya boyutu: {compressedData.Length} bytes");
        
        return compressedData;
    }

    public void Dispose()
    {
        _httpClient?.Dispose();
    }
}

public class BulkPaymentRequest
{
    public string FileFormat { get; set; }
    public string FilePattern { get; set; }
    public string CallbackAddress { get; set; }
    public string ApiClientPublic { get; set; }
    public string ApiKeyPublic { get; set; }
}

public class Program
{
    public static async Task Main(string[] args)
    {
        var client = new PaywallApiClient();
        
        var request = new BulkPaymentRequest
        {
            FileFormat = "5",
            FilePattern = "1",
            CallbackAddress = "your_callback_address_here",
            ApiClientPublic = "your_api_client_public_key_here",
            ApiKeyPublic = "your_api_key_here" 
        };
        
        // Select the file path to be processed
        // Ensure the file exists at this path
        // Example: Adjust the path according to your environment
        string filePath = "/Users/userName/bulkPaymentRequestFile/yuz_pw_test.txt";
        
        Console.WriteLine($"Dosya işleniyor: {filePath}");
        
        var result = await client.SendBulkPaymentAsync(filePath, request);
        
        if (result != null)
        {
            Console.WriteLine("API Yanıtı:");
            Console.WriteLine(result);
        }
        
        client.Dispose();
        
        Console.WriteLine("İşlem tamamlandı. Devam etmek için bir tuşa basın...");
        Console.ReadKey();
    }
}
 
```
