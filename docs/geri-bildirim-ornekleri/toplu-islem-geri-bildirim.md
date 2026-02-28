# Toplu İşlem Geri Bildirim

Gerçekleştirilen toplu işlemler, Paywall tarafından tamamlandığında toplu işlem emri içerisinde iletilen geri bildirim (CallbackAddress) adresine gönderilir. Gönderilen bu geri bildirim ile sisteminiz işlemin son durumundan haberdar olur

<table><thead><tr><th>Anahtar</th><th>Açıklama</th></tr></thead><tbody><tr><td><pre><code>Type
</code></pre></td><td>Bildirim tipi<br>Bkz: <a href="../sistem-verileri/geri-bildirim-tipleri">İncele</a></td></tr><tr><td><pre><code>BulkPaymentId
</code></pre></td><td>Toplu ödeme/işlem kimliği</td></tr><tr><td><pre><code>ErrorMessage
</code></pre></td><td>Toplu işlem sırasında hata oluşması durumunda, ilgili hatanın açıklayıcı mesajıdır</td></tr><tr><td><pre><code>DateTime
</code></pre></td><td>Toplu işlem son aksiyon tarihi</td></tr><tr><td><pre><code>FinishedAt
</code></pre></td><td>Toplu işlemin bitme tarihi</td></tr><tr><td><pre><code>CreatedAt
</code></pre></td><td>Toplu işlemin oluşturulma tarihi</td></tr><tr><td><pre><code>DurationTime
</code></pre></td><td>Toplu işlemin tamamlanana kadar sürdürü süre (saniye)</td></tr><tr><td><pre><code>Hash
</code></pre></td><td>İlgili isteğin Paywall'dan geldiğini doğrulamak için kullanılan Hash parametresi. İlgili hash Paywall'un 'Sistem Webhook Hash Anahtarı' kullanılarak oluşturulmaktadır. <br><br>Format;<br><br><code>{key}###{bulkPaymentId}###{merchantUniqueCode}</code></td></tr><tr><td><pre><code>IsCompressed
</code></pre></td><td>İlgili isteğin sıkıştırılıp sıkıştırılmadığını ifade eder. Sıkıştırılma işlemi, istek gönderilme anında sizin tarafınızdan belirtilirse yapılmaktadır</td></tr><tr><td><pre><code>PageNumber
</code></pre></td><td>Yüklü işlemleriniz için (10k, 20k, 50k) parçalı geri bildirim almak isteyebilirsiniz. Paywall'un parçalı geri bildirimi destekler ve bunu 1000'er 1000'er geri bildirim göndererek sağlar. Bu durumda ilgili <code>PageNumber</code> parametresi 1000'erli kaçıncı sayfayı gönderdiğini temsil eder.</td></tr><tr><td><pre><code>TotalPages
</code></pre></td><td><code>PageNumber</code>'da olduğu gibi <code>TotalPages</code> parametresi de, parçalı geri bildirimlerde kaç sayfa olduğunu ifade eder. Örnek 10 ise bu Paywall'un size toplam 10 geri bildirim göndereceği anlamına gelir</td></tr><tr><td><pre><code>HasMorePages
</code></pre></td><td>Parçalı geri bildirimlerde, iletilen geri bildirim içeriğindeki <code>HasMorePages</code> parametresi <code>true</code> ise bu işlem kapsamında gönderilmeyi bekleyen başka geri bildirimler olduğu anlamına gelir. Eğer ilgili parametre <code>false</code> ise toplu işlemin geri bildirim sürecinin bittiğini temsil eder </td></tr><tr><td><pre><code>Hash
</code></pre></td><td>Bildirimin Paywall'dan gönderildiğinin doğrulanması için kullanılan Hash değeridir. Paywall panelinden aktif edilen <code>Sistem Webhook Hash Anahtarı</code> ile oluşturulur<br><br>Yukarda belirtilen anahtar <code>HashKeyType</code> parametresinin değerine göre değişkenlik gösterebilir. Dinamik yapı kurgulanmalıdır</td></tr><tr><td><pre><code>HashFormat
</code></pre></td><td>Hash bilgisinin oluşturulduğu format tipi<br><br>Bkz: <a href="../hash-olusturma/formatlar">Hash Formatları</a></td></tr><tr><td><pre><code>HashKeyType
</code></pre></td><td>Hash bilgisinin oluşturulmasında kullanılan anahtar tipi<br><br>Bkz: <a href="../hash-olusturma/anahtar-tipleri">Anahtar Tipleri</a></td></tr></tbody></table>

**Örnek Json:**

```json
{
    "Type": 1,
    "BulkPaymentId": 3846,
    "Payments": [
        {
            "PaymentId": 9752770,
            "Amount": 11.96,
            "UniqueCode": "F637DCC6-6907-48DF-97CA-5F7DF23739F2",
            "MerchantUniqueCode": "b0d4f914-9c6b-423f-9358-ca2943c84554",
            "CurrencyId": 1,
            "Installment": 1,
            "ActivityTypeId": 1,
            "ActivityStatusId": 4,
            "TrackingCode": "",
            "CardNumber": null,
            "ProviderId": 1,
            "ProviderKey": "Iyzico",
            "PaywallErrorCode": null,
            "ProviderErrorCode": null,
            "ProviderErrorMessage": null,
            "BankErrorCode": null,
            "BankErrorMessage": null
        },
        {
            "PaymentId": 9752771,
            "Amount": 11.96,
            "UniqueCode": "541804A9-468B-4D18-B985-63CFB495A94B",
            "MerchantUniqueCode": "9151953d-8c34-4af2-bfc4-580c6a0b9e33",
            "CurrencyId": 1,
            "Installment": 1,
            "ActivityTypeId": 1,
            "ActivityStatusId": 4,
            "TrackingCode": "",
            "CardNumber": null,
            "ProviderId": 1,
            "ProviderKey": "Iyzico",
            "PaywallErrorCode": null,
            "ProviderErrorCode": null,
            "ProviderErrorMessage": null,
            "BankErrorCode": null,
            "BankErrorMessage": null
        },
        {
            "PaymentId": 9752772,
            "Amount": 11.96,
            "UniqueCode": "E9A9CD6C-ABBA-43D2-ADA1-CCDF0B8CBCF2",
            "MerchantUniqueCode": "951d487a-c79a-4b74-b79b-a8861bfa97bc",
            "CurrencyId": 1,
            "Installment": 1,
            "ActivityTypeId": 1,
            "ActivityStatusId": 4,
            "TrackingCode": "",
            "CardNumber": null,
            "ProviderId": 1,
            "ProviderKey": "Iyzico",
            "PaywallErrorCode": null,
            "ProviderErrorCode": null,
            "ProviderErrorMessage": null,
            "BankErrorCode": null,
            "BankErrorMessage": null
        },
        {
            "PaymentId": 9752773,
            "Amount": 11.96,
            "UniqueCode": "F50C9092-1FB2-4CD6-81D9-A3D807AB0AAE",
            "MerchantUniqueCode": "e99ac588-8c46-4d4e-a55b-db02a0ddea55",
            "CurrencyId": 1,
            "Installment": 1,
            "ActivityTypeId": 1,
            "ActivityStatusId": 4,
            "TrackingCode": "",
            "CardNumber": null,
            "ProviderId": 1,
            "ProviderKey": "Iyzico",
            "PaywallErrorCode": null,
            "ProviderErrorCode": null,
            "ProviderErrorMessage": null,
            "BankErrorCode": null,
            "BankErrorMessage": null
        },
        {
            "PaymentId": 9752774,
            "Amount": 11.96,
            "UniqueCode": "BD61936A-5E7D-4242-949A-7F25845E05F5",
            "MerchantUniqueCode": "15c48302-bde5-464b-819e-ce068d809c30",
            "CurrencyId": 1,
            "Installment": 1,
            "ActivityTypeId": 1,
            "ActivityStatusId": 4,
            "TrackingCode": "",
            "CardNumber": null,
            "ProviderId": 1,
            "ProviderKey": "Iyzico",
            "PaywallErrorCode": null,
            "ProviderErrorCode": null,
            "ProviderErrorMessage": null,
            "BankErrorCode": null,
            "BankErrorMessage": null
        },
        {
            "PaymentId": 9752775,
            "Amount": 11.96,
            "UniqueCode": "2702975F-02E6-4DED-BB10-6D1DF6744868",
            "MerchantUniqueCode": "d6037785-3911-42c0-a613-6fe9bf0701e9",
            "CurrencyId": 1,
            "Installment": 1,
            "ActivityTypeId": 1,
            "ActivityStatusId": 4,
            "TrackingCode": "",
            "CardNumber": null,
            "ProviderId": 1,
            "ProviderKey": "Iyzico",
            "PaywallErrorCode": null,
            "ProviderErrorCode": null,
            "ProviderErrorMessage": null,
            "BankErrorCode": null,
            "BankErrorMessage": null
        },
        {
            "PaymentId": 9752776,
            "Amount": 11.96,
            "UniqueCode": "D4076EA8-7A2E-4A29-8950-4EC5E14B0E4D",
            "MerchantUniqueCode": "814efbf5-fe66-487c-be8d-2f3e55ced0c4",
            "CurrencyId": 1,
            "Installment": 1,
            "ActivityTypeId": 1,
            "ActivityStatusId": 4,
            "TrackingCode": "",
            "CardNumber": null,
            "ProviderId": 1,
            "ProviderKey": "Iyzico",
            "PaywallErrorCode": null,
            "ProviderErrorCode": null,
            "ProviderErrorMessage": null,
            "BankErrorCode": null,
            "BankErrorMessage": null
        },
        {
            "PaymentId": 9752777,
            "Amount": 11.96,
            "UniqueCode": "4F2C3208-CA18-48C0-ABE6-A236824986BF",
            "MerchantUniqueCode": "41a0ce78-b3a7-4ef6-a25a-24f1949f54b3",
            "CurrencyId": 1,
            "Installment": 1,
            "ActivityTypeId": 1,
            "ActivityStatusId": 4,
            "TrackingCode": "",
            "CardNumber": null,
            "ProviderId": 1,
            "ProviderKey": "Iyzico",
            "PaywallErrorCode": null,
            "ProviderErrorCode": null,
            "ProviderErrorMessage": null,
            "BankErrorCode": null,
            "BankErrorMessage": null
        },
        {
            "PaymentId": 9752778,
            "Amount": 11.96,
            "UniqueCode": "F733EEA1-D788-4C32-ABBD-CDFBEB04CE0B",
            "MerchantUniqueCode": "9b3eedcb-a743-481a-b82c-6a8a6b176579",
            "CurrencyId": 1,
            "Installment": 1,
            "ActivityTypeId": 1,
            "ActivityStatusId": 4,
            "TrackingCode": "",
            "CardNumber": null,
            "ProviderId": 1,
            "ProviderKey": "Iyzico",
            "PaywallErrorCode": null,
            "ProviderErrorCode": null,
            "ProviderErrorMessage": null,
            "BankErrorCode": null,
            "BankErrorMessage": null
        },
        {
            "PaymentId": 9752779,
            "Amount": 11.96,
            "UniqueCode": "4C0A0021-DE63-420F-BB39-87FE56C51B27",
            "MerchantUniqueCode": "9a1cca36-b028-437c-921f-54ab27844971",
            "CurrencyId": 1,
            "Installment": 1,
            "ActivityTypeId": 1,
            "ActivityStatusId": 4,
            "TrackingCode": "",
            "CardNumber": null,
            "ProviderId": 1,
            "ProviderKey": "Iyzico",
            "PaywallErrorCode": null,
            "ProviderErrorCode": null,
            "ProviderErrorMessage": null,
            "BankErrorCode": null,
            "BankErrorMessage": null
        }
    ],
    "ErrorMessage": "",
    "DateTime": "2025-08-14T16:47:01.3363911+03:00",
    "CreatedAt": "2025-08-14T16:46:06.283",
    "FinishedAt": "2025-08-14T16:47:01.3364515+03:00",
    "DurationTime": 55.0534627,
    "Hash": "b3b0a9e8cd11c174e5822744b96dbff8a35179327d989dc088c1e647c4ab7d3f",
    "HashFormat": "BulkPayment",
    "HashKeyType": 4,
    "IsCompressed": false,
    "PageNumber": 1,
    "TotalPages": 1,
    "HasMorePages": false,
    "MerchantUniqueCode": "fe4acb15-5acc-48ba-9746-a2e72df3dec8"
}
```
