# Parçalı İşlem Geri Bildirim

Parçalı ödeme işlemlerinde, bir veya birden fazla ödemenin <mark style="color:red;">`başarısız`</mark> olması durumunda, <mark style="color:green;">`başarılı`</mark> ödemeler için AutoRollback parametresi `true` olarak gönderildiyse iptal işlemi başlatılır. Bu iptal işlemleri tamamlandığında, belirtilen Callback adresine ödeme sonuçları gönderilir ve nihai durum bildirilir.

Örnek: 10 parçalı ödemenin 9’u <mark style="color:green;">`başarılı`</mark>, 1’i <mark style="color:red;">`başarısız`</mark> olduğunda, AutoRollback `true` ise <mark style="color:green;">`başarılı`</mark> olan 9 ödeme iptal edilir. Tüm işlemler tamamlandıktan sonra, sistem belirtilen Callback adresine ödeme durumlarını iletir.

<table><thead><tr><th>Anahtar</th><th>Açıklama</th></tr></thead><tbody><tr><td><pre><code>Type
</code></pre></td><td>Bildirim tipi<br><br>Bkz: <a href="../sistem-verileri/geri-bildirim-tipleri">İncele</a></td></tr><tr><td><pre><code>SplitPaymentId
</code></pre></td><td>Parçalı ödeme/işlem kimliği</td></tr><tr><td><pre><code>ErrorMessage
</code></pre></td><td>Parçalı işlem sırasında hata oluşması durumunda, ilgili hatanın açıklayıcı mesajıdır</td></tr><tr><td><pre><code>DateTime
</code></pre></td><td>Parçalı işlem son aksiyon tarihi</td></tr><tr><td><pre><code>FinishedAt
</code></pre></td><td>Parçalı işlemin bitme tarihi</td></tr><tr><td><pre><code>CreatedAt
</code></pre></td><td>Parçalı işlemin oluşturulma tarihi</td></tr><tr><td><p></p><pre><code>MerchantUniqueCode
</code></pre></td><td>Parçalı ödeme emri anında sizin tarafınızdan tanımlanan işlem numarası </td></tr><tr><td><pre><code>Hash
</code></pre></td><td>Bildirimin Paywall'dan gönderildiğinin doğrulanması için kullanılan Hash değeridir. Paywall panelinden aktif edilen <code>Sistem Webhook Hash Anahtarı</code> ile oluşturulur<br><br>Yukarda belirtilen anahtar <code>HashKeyType</code> parametresinin değerine göre değişkenlik gösterebilir. Dinamik yapı kurgulanmalıdır</td></tr><tr><td><pre><code>HashFormat
</code></pre></td><td>Hash bilgisinin oluşturulduğu format tipi<br><br>Bkz: <a href="../hash-olusturma/formatlar">Hash Formatları</a></td></tr><tr><td><pre><code>HashKeyType
</code></pre></td><td>Hash bilgisinin oluşturulmasında kullanılan anahtar tipi<br><br>Bkz: <a href="../hash-olusturma/anahtar-tipleri">Anahtar Tipleri</a></td></tr><tr><td><p></p><pre><code>List&#x3C;Payments>
</code></pre></td><td>Ödemelere ilişkin detay listesi</td></tr></tbody></table>

**List**<mark style="color:orange;">**\<Payments>**</mark>**&#x20;Detay:**

<table><thead><tr><th>Anahtar</th><th>Açıklama</th></tr></thead><tbody><tr><td><pre><code>PaymentId
</code></pre></td><td>Ödeme işlem kimliği</td></tr><tr><td><pre><code>Amount
</code></pre></td><td>Tutar bilgisi</td></tr><tr><td><pre><code>UniqueCode
</code></pre></td><td>Paywall tarafından işleme atanan takip numarası<br><br><mark style="color:purple;">* Başarılı işlemler için saklanmalıdır</mark></td></tr><tr><td><pre><code>MerchantUniqueCode
</code></pre></td><td>Bu parametre de Paywall tarafından otomatik atanmaktadır<br><br><mark style="color:purple;">* Başarılı işlemler için saklanmalıdır</mark></td></tr><tr><td><pre><code>CurrencyId
</code></pre></td><td>Para birimi<br><br>Bkz: <a href="../sistem-verileri/para-birimleri">Para birimleri</a></td></tr><tr><td><pre><code>Installment
</code></pre></td><td>Taksit değeri</td></tr><tr><td><p></p><pre><code>ActivityTypeId
</code></pre></td><td>İşlem tipi<br><br>Bkz: <a href="../sistem-verileri/odeme-tipleri">İşlem tipleri</a></td></tr><tr><td><pre><code>ActivityStatusId
</code></pre></td><td>İşlem durumu<br><br>Bkz: <a href="../sistem-verileri/odeme-durumlari">İşlem durumları</a></td></tr></tbody></table>

**Örnek Json:**

```json
{
    "Type": 1,
    "SplitPaymentId": 2881,
    "Payments": [
        {
            "PaymentId": 3705770,
            "Amount": 1.00,
            "UniqueCode": "E86FFB24-CCA4-4F8B-A3B5-BC6A328C0F3B",
            "MerchantUniqueCode": "9f23c7df-f798-4c52-b38a-0d7b52e76f8b",
            "CurrencyId": 1,
            "Installment": 1,
            "ActivityTypeId": 1,
            "ActivityStatusId": 5
        },
        {
            "PaymentId": 3705771,
            "Amount": 1.00,
            "UniqueCode": "56CBA995-1B4B-4B83-BFA1-056715F42B83",
            "MerchantUniqueCode": "d09d5ff2-ba8d-48bc-8a66-9c2ffd47e23b",
            "CurrencyId": 1,
            "Installment": 1,
            "ActivityTypeId": 1,
            "ActivityStatusId": 5
        },
        {
            "PaymentId": 3705772,
            "Amount": 1.00,
            "UniqueCode": "1FBC95B5-F811-4BCE-A216-F9B799F53E97",
            "MerchantUniqueCode": "5b10063c-f715-4644-bf59-dd85b0c59afe",
            "CurrencyId": 1,
            "Installment": 1,
            "ActivityTypeId": 1,
            "ActivityStatusId": 4
        },
        {
            "PaymentId": 3705773,
            "Amount": 1.00,
            "UniqueCode": "0F6B0BAA-FA66-4E62-8EE2-3AFACF3CEABE",
            "MerchantUniqueCode": "56d7bcb0-4434-4584-8586-3b86186d92bb",
            "CurrencyId": 1,
            "Installment": 1,
            "ActivityTypeId": 1,
            "ActivityStatusId": 4
        },
        {
            "PaymentId": 3705774,
            "Amount": 1.00,
            "UniqueCode": "4A6926AD-C340-4283-ADB8-0EDB57123213",
            "MerchantUniqueCode": "d7fdfbda-3173-48d4-8d12-8964867174f7",
            "CurrencyId": 1,
            "Installment": 1,
            "ActivityTypeId": 1,
            "ActivityStatusId": 5
        },
        {
            "PaymentId": 3705775,
            "Amount": 1.00,
            "UniqueCode": "77AC004E-E641-43B7-952B-F932EBCCF5F9",
            "MerchantUniqueCode": "d5ec3bd9-9596-49da-9d6a-519c2d75574c",
            "CurrencyId": 1,
            "Installment": 1,
            "ActivityTypeId": 1,
            "ActivityStatusId": 4
        },
        {
            "PaymentId": 3705776,
            "Amount": 1.00,
            "UniqueCode": "5BE6E448-E675-422D-8D73-1DF025D72660",
            "MerchantUniqueCode": "d3d3ad91-ebea-41b3-80dd-77977ffac2e6",
            "CurrencyId": 1,
            "Installment": 1,
            "ActivityTypeId": 1,
            "ActivityStatusId": 4
        }
    ],
    "ErrorMessage": "",
    "DateTime": "2025-04-03T23:53:33.018504+03:00",
    "CreatedAt": "2025-04-03T22:01:05.357",
    "FinishedAt": "2025-04-03T22:01:12.0185082+03:00",
    "Hash": "95126cbeba7efabdda705d24568f2f4edc17c986b1022603cff4c99bfc4b9a8b"
}
```
