# APM

<table><thead><tr><th>Anahtar</th><th>Açıklama</th></tr></thead><tbody><tr><td><pre><code>Id
</code></pre></td><td>APM işlemine ait kimlik bilgisi</td></tr><tr><td><pre><code>Result
</code></pre></td><td>True | False</td></tr><tr><td><pre><code>ResultMessage
</code></pre></td><td>Success | Unsuccessful</td></tr><tr><td><pre><code>CurrencyId
</code></pre></td><td>Ödemenin para birimi<br>Bkz: <a href="../sistem-verileri/para-birimleri">İncele</a></td></tr><tr><td><pre><code>ApmProviderId
</code></pre></td><td>Apm sağlayıcı kimliği</td></tr><tr><td><pre><code>ApmProviderName
</code></pre></td><td>Apm sağlayıcı adı</td></tr><tr><td><pre><code>ApmProviderConnectionId
</code></pre></td><td>Apm sağlayıcı bağlantı kimliği</td></tr><tr><td><pre><code>ApmProviderConnectionName
</code></pre></td><td>Apm sağlayıcı bağlantı adı</td></tr><tr><td><pre><code>Amount
</code></pre></td><td>Ödeme tutarı</td></tr><tr><td><pre><code>UniqueCode
</code></pre></td><td>Ödemenin Paywall benzersiz takip numarası</td></tr><tr><td><pre><code>MerchantUniqueCode
</code></pre></td><td>Ödemenin oluşturma anında verilen takip numarası</td></tr><tr><td><pre><code>Hash
</code></pre></td><td>Bildirimin Paywall'dan gönderildiğinin doğrulanması için kullanılan Hash değeridir. Paywall panelinden aktif edilen <code>APM Webhook Hash Anahtarı</code> ile oluşturulur<br><br>Yukarda belirtilen anahtar <code>HashKeyType</code> parametresinin değerine göre değişkenlik gösterebilir. Dinamik yapı kurgulanmalıdır</td></tr><tr><td><pre><code>HashFormat
</code></pre></td><td>Hash bilgisinin oluşturulduğu format tipi<br><br>Bkz: <a href="../hash-olusturma/formatlar">Hash Formatları</a></td></tr><tr><td><pre><code>HashKeyType
</code></pre></td><td>Hash bilgisinin oluşturulmasında kullanılan anahtar tipi<br><br>Bkz: <a href="../hash-olusturma/anahtar-tipleri">Anahtar Tipleri</a></td></tr><tr><td><pre><code>CallbackAddress
</code></pre></td><td>Ödeme oluşturma anında verilen adres</td></tr><tr><td><pre><code>Date
</code></pre></td><td>Ödemenin tarihi</td></tr></tbody></table>

**Web Geri Bildirim:**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <form action="your_callback_url" method="post">
        <input type="hidden" name="date" value="apmDateValue">
        <input type="hidden" name="status" value="statusValue">
        <input type="hidden" name="errorCode" value="errorCodeValue">
        <input type="hidden" name="errorMessage" value="errorMessageValue">
        <input type="hidden" name="uniqueCode" value="uniqueCodeValue">
        <input type="hidden" name="merchantUniqueCode" value="merchantUniqueCodeValue">
        <input type="hidden" name="amount" value="amountValue">
        <input type="hidden" name="apmTransactionId" value="apmTransactionIdValue">
        // Eğer Hash mekanizması Paywall panelde aktif edildiyse aşağıdaki satır da iletilir
        <input type="hidden" name="hash" value="dfgh87df98h79dfh7987dfh==">
    </form>
</body>
</html>
```

**Sunucu Geri Bildirim:**

```csharp
public class ApmCallbackRequestModel
{
    public int Id { get; set; }
    public bool Result { get; set; }
    public string ResultMessage { get; set; }
    public short CurrencyId { get; set; }
    public int ApmProviderId { get; set; }
    public string ApmProviderName { get; set; }
    public int ApmProviderConnectionId { get; set; }
    public string ApmProviderConnectionName { get; set; }
    public decimal Amount { get; set; }
    public string UniqueCode { get; set; }
    public string MerchantUniqueCode { get; set; }
    public string Hash { get; set; }
    public string CallbackAddress { get; set; }
    public DateTime Date { get; set; }
}
```
