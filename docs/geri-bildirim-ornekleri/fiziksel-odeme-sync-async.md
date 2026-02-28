# Fiziksel Ödeme (Sync/Async)

<table><thead><tr><th>Anahtar</th><th>Açıklama</th></tr></thead><tbody><tr><td><pre><code>ConnectionId
</code></pre></td><td>Fiziksel pos sağlayıcısının bağlantı kimliği</td></tr><tr><td><pre><code>TerminalId
</code></pre></td><td>Terminal/Cihaz kimliği</td></tr><tr><td><pre><code>PaymentRequestId
</code></pre></td><td>Ödeme emrine ait Paywall kimliği</td></tr><tr><td><pre><code>PaymentRequestActivityId
</code></pre></td><td>Ödemenin son hareketinin kimliği</td></tr><tr><td><pre><code>PaymentTypeId
</code></pre></td><td>Ödeme tipi<br><br>Bkz: <a href="../fiziksel-pos/sistem-verileri/odeme-tipleri">Ödeme Tipleri</a></td></tr><tr><td><pre><code>PaymentStatusId
</code></pre></td><td>Ödeme durumu<br><br>Bkz: <a href="../fiziksel-pos/sistem-verileri/odeme-durumu">Ödeme Durumları</a></td></tr><tr><td><pre><code>MerchantUniqueCode
</code></pre></td><td>Ödeme oluşturma anında verilen takip/sipariş değeri</td></tr><tr><td><pre><code>DisplayCode
</code></pre></td><td>Ödemenin görüntülenme bilgisi (Cihaz üzerinde ödemenin listelendiği senaryolarda görüntülenir)</td></tr><tr><td><pre><code>Amount
</code></pre></td><td>Ödeme tutarı</td></tr><tr><td><pre><code>Message
</code></pre></td><td>Ödemenin başarısız olması durumunda başarısızlık mesajı</td></tr><tr><td><pre><code>Hash
</code></pre></td><td>İsteğin Paywall'dan geldiğinin doğrulanması için kullanılan Hash değeridir. Paywall panelinden oluşturulan <code>Fiziksel Pos Webhook Hash Anahtarı</code> kullanılarak oluşturulmaktadır<br><br>Yukarda belirtilen anahtar <code>HashKeyType</code> parametresinin değerine göre değişkenlik gösterebilir. Dinamik yapı kurgulanmalıdır</td></tr><tr><td><p></p><pre><code>HashFormat
</code></pre></td><td>Hash bilgisinin oluşturulduğu format tipi<br><br>Bkz: <a href="../hash-olusturma/formatlar">Hash Formatları</a></td></tr><tr><td><p></p><pre><code>HashKeyType
</code></pre></td><td>Hash bilgisinin oluşturulmasında kullanılan anahtar tipi<br><br>Bkz: <a href="../hash-olusturma/anahtar-tipleri">Anahtar Tipleri</a></td></tr></tbody></table>

```csharp
public class PhysicalPosCallbackModel
{
    public Guid ConnectionId { get; set; }
    public Guid TerminalId { get; set; }
    public Guid PaymentRequestId { get; set; }
    public Guid PaymentRequestActivityId { get; set; }
    public PaymentType PaymentTypeId { get; set; }
    public PaymentStatus PaymentStatusId { get; set; }
    public Guid MerchantUniqueCode { get; set; }
    public string DisplayCode { get; set; }
    public decimal Amount { get; set; }
    public string Message { get; set; }
    public string Hash { get; set; }
}
```
