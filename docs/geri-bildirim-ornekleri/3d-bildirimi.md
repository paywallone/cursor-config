# 3D Bildirimi

<table><thead><tr><th>Anahtar</th><th>Açıklama</th></tr></thead><tbody><tr><td><pre><code>date
</code></pre></td><td>Ödeme tarihi</td></tr><tr><td><pre><code>status
</code></pre></td><td>Ödemenin durum bilgisi <strong>Success</strong> veya <strong>Unsuccessful</strong> olarak döner</td></tr><tr><td><pre><code>errorCode
</code></pre></td><td>0: Başarılı<br>1: Başarısız<br><br>Bu hata kodu Paywall hata kodudur</td></tr><tr><td><pre><code>errorMessage
</code></pre></td><td>Base64 Encoded olarak hatayla ilgili mesaj<br><br>Bu hata mesajı Paywall hata mesajıdır</td></tr><tr><td><pre><code>paymentCode
</code></pre></td><td>Ödemenin Paywall'daki benzersiz takip kodudur</td></tr><tr><td><pre><code>uniqueCode
</code></pre></td><td>Ödemeyi oluşturduğunuz anda sizin tarafınızdan verilen takip numarasıdır</td></tr><tr><td><pre><code>amount
</code></pre></td><td>Ödemenin tutarı</td></tr><tr><td><pre><code>installment
</code></pre></td><td>Ödemenin taksit tutarı</td></tr><tr><td><pre><code>paymentId
</code></pre></td><td>Ödemenin Paywall'daki Id (kimlik) bilgisidir</td></tr><tr><td><pre><code>providerErrorCode
</code></pre></td><td>Ödemenin geçtiği sağlayıcının hata kodu</td></tr><tr><td><pre><code>providerErrorMessage
</code></pre></td><td>Ödemenin geçtiği sağlayıcının hata mesajı</td></tr><tr><td><pre><code>providerBankErrorCode
</code></pre></td><td>Ödeme, bir ödeme kuruluşundan geçiyorsa ilgili ödeme kuruluşunun arkada ödemeyi gönderdiği bankadan gelen hata kodudur</td></tr><tr><td><pre><code>providerBankErrorMessage
</code></pre></td><td>Ödeme, bir ödeme kuruluşundan geçiyorsa ilgili ödeme kuruluşunun arkada ödemeyi gönderdiği bankadan gelen hata mesajıdır</td></tr><tr><td><pre><code>cardSaved
</code></pre></td><td>Ödeme emri içerisinde kart kaydet emri verilirse ödemenin başarılı olması sonrasında kart kayıt edilmeye çalışılır. Eğer kart kaydetme işlemi de başarılı olursa cardSaved nesnesi true döner. Aksi halde false döner.</td></tr><tr><td><pre><code>cardSavedUniqueCode
</code></pre></td><td>Bir yukardaki parametrenin true dönmesi durumda ilgili nesne kayıt edilen kartın Paywall tarafındaki kimlik bilgisini döner. Bu bilgiyle birlikte ödeme emri gönderilebilir</td></tr><tr><td><pre><code>hash
</code></pre></td><td>Ödemenin Paywall'dan geldiğinin kontrol edilebilmesi için kullanılan, ödeme bilgileri ve sizin Paywall panelinde oluşturduğunuz anahtar kullanılarak oluşturulan Hash değeridir.<br><br><strong>Not:</strong> Bu parametre Paywall panelinde <em><strong>Geliştirici > Özel Anahtarlar</strong></em> sayfasında 3D Hash Anahtarı'nı aktif etmediğiniz sürece gönderilmez<br><br>Yukarda belirtilen anahtar <code>HashKeyType</code> parametresinin değerine göre değişkenlik gösterebilir. Dinamik yapı kurgulanmalıdır</td></tr><tr><td><pre><code>hashFormat
</code></pre></td><td>Hash bilgisinin oluşturulduğu format tipi<br><br>Bkz: <a href="../hash-olusturma/formatlar">Hash Formatları</a></td></tr><tr><td><pre><code>hashKeyType
</code></pre></td><td>Hash bilgisinin oluşturulmasında kullanılan anahtar tipi<br><br>Bkz: <a href="../hash-olusturma/anahtar-tipleri">Anahtar Tipleri</a></td></tr></tbody></table>

{% tabs %}
{% tab title="HTML" %}
{% code lineNumbers="true" %}

```html
<!doctype html>
<html lang="en">
    <body>
        <form id="paywall-callback-form" action="{sizinadresiniz}" method="post">
            <input type="hidden" name="date" value="{paymentDate}">
            <input type="hidden" name="status" value="{status}">
            <input type="hidden" name="errorCode" value="{errorCode}">
            <input type="hidden" name="errorMessage" value="{errorMessage}">
            <input type="hidden" name="errorMessage" value="{providerErrorMessage}">
            <input type="hidden" name="paymentCode" value="{uniqueCode}">
            <input type="hidden" name="uniqueCode" value="{merchantUniqueCode}">
            <input type="hidden" name="amount" value="{amount}">
            <input type="hidden" name="installment" value="{installment}">
            <input type="hidden" name="paymentId" value="{paymentId}">
            <input type="hidden" name="providerErrorCode" value="{providerErrorCode}">
            <input type="hidden" name="providerErrorMessage" value="{providerErrorMessage}">
            <input type="hidden" name="providerBankErrorCode" value="{providerBankErrorCode}">
            <input type="hidden" name="providerBankErrorMessage" value="{providerBankErrorMessage}">
            <input type="hidden" name="cardSaved" value="{cardSavedResult}">
            <input type="hidden" name="cardSavedUniqueCode" value="{cardSavedUniqueCodeResult}">
            <input type="hidden" name="trackingCode" value="{trackingCode}">
            <input type="hidden" name="paymentGatewayId" value="{paymentGatewayId}">
            <input type="hidden" name="paymentGatewayName" value="{paymentGatewayName}">
            <input type="hidden" name="paymentGatewayProviderName" value="{paymentGatewayProviderName}">
            <input type="hidden" name="hash" value="{hash}">
        </form>
    </body>
</html>

```

{% endcode %}
{% endtab %}
{% endtabs %}
