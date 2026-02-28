# PayOut

<table><thead><tr><th>Anahtar</th><th>Açıklama</th></tr></thead><tbody><tr><td><pre><code>MerchantGroupCode
</code></pre></td><td>Ödemeyi oluşturma anında verdiğiniz takip grup kodu. Örnek: X gününde yaptığınız 1000 para transferi de gruplayabilmek için grup kodu XYZ olabilir.</td></tr><tr><td><pre><code>MerchantUniqueCode
</code></pre></td><td>Ödemeyi oluşturma anında verdiğiniz takip numarası</td></tr><tr><td><pre><code>PayoutTransactionId
</code></pre></td><td>Ödeme kimliği</td></tr><tr><td><pre><code>PayoutTransactionAmount
</code></pre></td><td>Ödeme tutarı</td></tr><tr><td><pre><code>PayoutTransactionDate
</code></pre></td><td>Ödeme tarihi</td></tr><tr><td><pre><code>PayoutConnectedId
</code></pre></td><td>Ödemenin gerçekleştirildiği PayOut bağlantı kimliği</td></tr><tr><td><pre><code>LastStatusId
</code></pre></td><td>Son durum<br>Bkz: <a href="../sistem-verileri/payout-durumlari">İncele</a></td></tr><tr><td><pre><code>NewStatusId
</code></pre></td><td>Yeni durum<br>Bkz: <a href="../sistem-verileri/payout-durumlari">İncele</a></td></tr><tr><td><pre><code>Message
</code></pre></td><td>Ödeme durum mesajı</td></tr><tr><td><pre><code>Hash
</code></pre></td><td>Bildirimin Paywall'dan gönderildiğinin doğrulanması için kullanılan Hash değeridir. Paywall panelinden aktif edilen <code>PayOut Webhook Hash Anahtarı</code> ile oluşturulur<br><br>Yukarda belirtilen anahtar <code>HashKeyType</code> parametresinin değerine göre değişkenlik gösterebilir. Dinamik yapı kurgulanmalıdır</td></tr><tr><td><pre><code>HashFormat
</code></pre></td><td>Hash bilgisinin oluşturulduğu format tipi<br><br>Bkz: <a href="../hash-olusturma/formatlar">Hash Formatları</a></td></tr><tr><td><pre><code>HashKeyType
</code></pre></td><td>Hash bilgisinin oluşturulmasında kullanılan anahtar tipi<br><br>Bkz: <a href="../hash-olusturma/anahtar-tipleri">Anahtar Tipleri</a></td></tr></tbody></table>

```csharp
public class PayoutCallbackRequest
{
    public string MerchantGroupCode { get; set; }
    public string MerchantUniqueCode { get; set; }
    public int PayoutTransactionId { get; set; }
    public decimal PayoutTransactionAmount { get; set; }
    public DateTime PayoutTransactionDate { get; set; }
    public int PayoutConnectedId { get; set; }
    public int LastStatusId { get; set; }
    public int NewStatusId { get; set; }
    public string Message { get; set; }
    public string Hash { get; set; }
}
```
