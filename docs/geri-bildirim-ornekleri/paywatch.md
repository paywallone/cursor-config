# PayWatch

**Tanıtım:** İlgili algoritma ödemelerin askıda kalması durumunda devreye girer ve varsayılan olarak ödemeleri 25 dakika sonrasında kontrol eder. Askıda kalan ödemeler için son durumu bildiren bir bildirim atar. Bu bildirimin atılabilmesi için ödeme emri anında PayWatch yapılandırmasını yapmanız gerekmektedir. Aksi taktirde Paywall ödemenin kontrolünü yine yapar ancak size bildirim gönderemez.

<table><thead><tr><th>Anahtar</th><th>Açıklama</th></tr></thead><tbody><tr><td><pre><code>PayWatchId
</code></pre></td><td>Paywatch kimlik bilgisi (bilgi amacıyla gönderilir)</td></tr><tr><td><pre><code>PaymentId
</code></pre></td><td>Ödemenin kimlik bilgisi</td></tr><tr><td><pre><code>MerchantUniqueCode
</code></pre></td><td>Ödeme oluşturma anında verilen takip numarası</td></tr><tr><td><pre><code>PaymentLastStatusId
</code></pre></td><td>Ödemenin PayWatch öncesindeki durumu<br>Bkz: <a href="../sistem-verileri/odeme-kanallari">İncele</a></td></tr><tr><td><pre><code>PaymentNewStatusId
</code></pre></td><td>Ödemenin PayWatch sonrasındaki durumu<br>Bkz: <a href="../sistem-verileri/odeme-kanallari">İncele</a></td></tr><tr><td><pre><code>PaymentStatusChanged
</code></pre></td><td>Ödeme durumunda değişiklik oldu mu? Örnek: Başladı -> Başarılı</td></tr><tr><td><pre><code>ProviderRequest
</code></pre></td><td>Ödeme sorgulama anında sağlayıcıya gönderilen istek</td></tr><tr><td><pre><code>ProviderResponse
</code></pre></td><td>Ödeme sorgulama anında sağlayıcıdan alınan cevap</td></tr><tr><td><pre><code>ProviderHttpStatus
</code></pre></td><td>Sağlayıcıdan sorgulama anında alınan HTTP cevabı</td></tr><tr><td><pre><code>PaymentDateTime
</code></pre></td><td>Ödemenin tarihi</td></tr><tr><td><pre><code>Hash
</code></pre></td><td>İsteğin Paywall'dan geldiğinin doğrulanması için kullanılan Hash değeridir. Paywall panelinden oluşturulan <code>Sistem Webhook Hash Anahtarı</code> kullanılarak oluşturulmaktadır<br><br>Yukarda belirtilen anahtar <code>HashKeyType</code> parametresinin değerine göre değişkenlik gösterebilir. Dinamik yapı kurgulanmalıdır</td></tr><tr><td><pre><code>HashFormat
</code></pre></td><td>Hash bilgisinin oluşturulduğu format tipi<br><br>Bkz: <a href="../hash-olusturma/formatlar">Hash Formatları</a></td></tr><tr><td><pre><code>HashKeyType
</code></pre></td><td>Hash bilgisinin oluşturulmasında kullanılan anahtar tipi<br><br>Bkz: <a href="../hash-olusturma/anahtar-tipleri">Anahtar Tipleri</a></td></tr></tbody></table>

```csharp
public class PayWatchCallbackRequest
{
    public int PayWatchId { get; set; }
    public int PaymentId { get; set; }
    public string MerchantUniqueCode { get; set; }
    public int PaymentLastStatusId { get; set; }
    public int PaymentNewStatusId { get; set; }
    public bool PaymentStatusChanged { get; set; }
    public object ProviderRequest { get; set; }
    public object ProviderResponse { get; set; }
    public int ProviderHttpStatus { get; set; }
    public DateTime PaymentDateTime { get; set; }
}
```
