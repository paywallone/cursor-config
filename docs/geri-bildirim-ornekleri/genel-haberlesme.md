# Genel Haberleşme

**Örnek:** <https://domain.com/paywall/generalcallback> adında bir adresiniz var ve bu adresi Paywall paneline tanımadınız. Tanımın sırasında sadece İade, İptal, Kısmi iadeleri buraya gönder dediniz. Paywall ilgili adrese, ilgili durumdaki ödemelerin haberini gönderir

<table><thead><tr><th>Anahtar</th><th>Açıklama</th></tr></thead><tbody><tr><td><pre><code>Type
</code></pre></td><td>Bildirim tipi<br>Bkz: <a href="../sistem-verileri/geri-bildirim-tipleri">İncele</a></td></tr><tr><td><pre><code>PaymentId
</code></pre></td><td>Ödemenin kimlik bilgisi</td></tr><tr><td><pre><code>Amount
</code></pre></td><td>Ödeme tutarı</td></tr><tr><td><pre><code>OperationAmount
</code></pre></td><td>Ödemeye alınan aksiyon tutarı. Örnek: Kısmi iade işlemiyse, kısmi iade tutarı</td></tr><tr><td><pre><code>IP
</code></pre></td><td>Paywall'a istek gönderen IP</td></tr><tr><td><pre><code>UniqueCode
</code></pre></td><td>Ödeme oluşturma anında verilen takip numarası</td></tr><tr><td><pre><code>CurrencyId
</code></pre></td><td>Para birimi<br>Bkz: <a href="../sistem-verileri/para-birimleri">İncele</a></td></tr><tr><td><pre><code>PaymentMethodId
</code></pre></td><td>Ödeme yöntemi<br>Bkz: <a href="../sistem-verileri/odeme-yontemleri">İncele</a></td></tr><tr><td><pre><code>Installment
</code></pre></td><td>Ödeme taksit değeri</td></tr><tr><td><pre><code>ChannelId
</code></pre></td><td>Ödeme kanal kimliği<br>Bkz: <a href="broken-reference">İncele</a></td></tr><tr><td><pre><code>TagId
</code></pre></td><td>Ödeme etiketi kimliği. Ödeme oluşturma anında göndermeniz durumunda ilgili parametre gönderilmektedir</td></tr><tr><td><pre><code>DateTime
</code></pre></td><td>Ödemenin gerçekleştirildiği tarih</td></tr><tr><td><pre><code>Hash
</code></pre></td><td>İsteğin Paywall'dan geldiğinin doğrulanması için kullanılan Hash değeridir. Paywall panelinden oluşturulan <code>Sistem Webhook Hash Anahtarı</code> kullanılarak oluşturulmaktadır<br><br>Yukarda belirtilen anahtar <code>HashKeyType</code> parametresinin değerine göre değişkenlik gösterebilir. Dinamik yapı kurgulanmalıdır</td></tr><tr><td><pre><code>HashFormat
</code></pre></td><td>Hash bilgisinin oluşturulduğu format tipi<br><br>Bkz: <a href="../hash-olusturma/formatlar">Hash Formatları</a></td></tr><tr><td><pre><code>HashKeyType
</code></pre></td><td>Hash bilgisinin oluşturulmasında kullanılan anahtar tipi<br><br>Bkz: <a href="../hash-olusturma/anahtar-tipleri">Anahtar Tipleri</a></td></tr></tbody></table>

```csharp
public class GeneralCallbackModel
{
    public int Type { get; set; }
    public int PaymentId { get; set; }
    public decimal Amount { get; set; }
    public decimal OperationAmount { get; set; }
    public string IP { get; set; }
    public string UniqueCode { get; set; }
    public short CurrencyId { get; set; }
    public int PaymentMethodId { get; set; }
    public byte Installment { get; set; }
    public int ChannelId { get; set; }
    public int TagId { get; set; }
    public DateTime DateTime { get; set; }
    public string Hash { get; set; }
}
```
