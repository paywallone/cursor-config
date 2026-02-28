# Tekrarlı Ödeme

<table><thead><tr><th>Anahtar</th><th>Açıklama</th></tr></thead><tbody><tr><td><pre><code>SubscriptionId
</code></pre></td><td>Tekrarlı ödemenin kimlik bilgisi</td></tr><tr><td><pre><code>SubscriptionType
</code></pre></td><td><p>Tekrarlı ödeme tipi</p><p><br>Bkz: <a href="../sistem-verileri/tekrarli-odeme">İncele</a></p></td></tr><tr><td><pre><code>SubscriptionCode
</code></pre></td><td>Tekrarlı ödemenin Paywall takip numarası</td></tr><tr><td><pre><code>SubscriptionMerchantCode
</code></pre></td><td>Oluşturma anında verdiğiniz takip numarası</td></tr><tr><td><pre><code>Amount
</code></pre></td><td>Tekrarlı ödeme tutarı</td></tr><tr><td><pre><code>Success
</code></pre></td><td>True | False</td></tr><tr><td><pre><code>FailReason
</code></pre></td><td>Başarısız olduğundaki başarısızlık sebebi</td></tr><tr><td><pre><code>PaymentId
</code></pre></td><td>Paywall ödeme kimlik bilgisi</td></tr><tr><td><pre><code>Attempt
</code></pre></td><td>Deneme adedi</td></tr><tr><td><pre><code>AttemptFinished
</code></pre></td><td>Denemenin bitip bitmediği bilgisi</td></tr><tr><td><pre><code>Hash
</code></pre></td><td>Bildirimin Paywall'dan gönderildiğinin doğrulanması için kullanılan Hash değeridir. Paywall panelinden aktif edilen <code>Sistem Webhook Hash Anahtarı</code> ile oluşturulur<br><br>Yukarda belirtilen anahtar <code>HashKeyType</code> parametresinin değerine göre değişkenlik gösterebilir. Dinamik yapı kurgulanmalıdır</td></tr><tr><td><pre><code>HashFormat
</code></pre></td><td>Hash bilgisinin oluşturulduğu format tipi<br><br>Bkz: <a href="../hash-olusturma/formatlar">Hash Formatları</a></td></tr><tr><td><pre><code>HashKeyType
</code></pre></td><td>Hash bilgisinin oluşturulmasında kullanılan anahtar tipi<br><br>Bkz: <a href="../hash-olusturma/anahtar-tipleri">Anahtar Tipleri</a></td></tr></tbody></table>

```csharp
public class RecurringCallbackRequest
{
    public int SubscriptionId { get; set; }
    public int SubscriptionType { get; set; }
    public Guid SubscriptionCode { get; set; }
    public string SubscriptionMerchantCode { get; set; }
    public decimal Amount { get; set; }
    public bool Success { get; set; }
    public string FailReason { get; set; }
    public int? PaymentId { get; set; }
    public int Attempt { get; set; }
    public bool AttemptFinished { get; set; }
}
```
