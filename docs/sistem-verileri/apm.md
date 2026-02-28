# APM

**Sağlayıcı Keyleri**

<table><thead><tr><th width="248">Key</th><th>Sağlayıcı</th></tr></thead><tbody><tr><td>Papara</td><td>Papara</td></tr><tr><td>MetropolCard</td><td>MetropolCard</td></tr><tr><td>Edenred</td><td>Edenred</td></tr><tr><td>Paye</td><td>Paye</td></tr><tr><td>WeChat</td><td>PW_WeChat</td></tr><tr><td>HepsiPay</td><td>HepsiPay</td></tr><tr><td>YKBWorldPay</td><td>YKBWorldPay</td></tr><tr><td>GarantiPay</td><td>GarantiPay</td></tr><tr><td>Stripe</td><td>Stripe</td></tr><tr><td>GiroPay</td><td>PW_GiroPay</td></tr><tr><td>Ideal</td><td>PW_Ideal</td></tr><tr><td>AliPay</td><td>PW_AliPay</td></tr><tr><td>MyBank</td><td>PW_MyBank</td></tr><tr><td>Bancontact</td><td>PW_Bancontact</td></tr><tr><td>Sofort</td><td>PW_Sofort</td></tr><tr><td>Multibanco</td><td>PW_Multibanco</td></tr><tr><td>SafetyPay</td><td>PW_SafetyPay</td></tr><tr><td>Przelewy24</td><td>PW_Przelewy24</td></tr><tr><td>Boleto</td><td>PW_Boleto</td></tr><tr><td>Enterfinland</td><td>PW_Enterfinland</td></tr><tr><td>Sepa</td><td>PW_Sepa</td></tr><tr><td>DragonPay</td><td>PW_DragonPay</td></tr><tr><td>Enets</td><td>PW_Enets</td></tr><tr><td>PayU</td><td>PW_PayU</td></tr><tr><td>Poli</td><td>PW_Poli</td></tr><tr><td>Trustly</td><td>PW_Trustly</td></tr><tr><td>AstroPayCard</td><td>PW_AstroPayCard</td></tr><tr><td>AstroPayDirect</td><td>PW_AstroPayDirect</td></tr><tr><td>Zimpler</td><td>PW_Zimpler</td></tr><tr><td>Krungthaibank</td><td>PW_Krungthaibank</td></tr><tr><td>Krungsribank</td><td>PW_Krungsribank</td></tr><tr><td>Singpost</td><td>PW_Singpost</td></tr><tr><td>EPS</td><td>PW_EPS</td></tr><tr><td>Siamcommercialbank</td><td>PW_Siamcommercialbank</td></tr><tr><td>Masterpass</td><td>Masterpass_IFrame</td></tr></tbody></table>

**Ödeme Kanal Tipleri**

<table><thead><tr><th width="200">ChannelType</th><th>Anlamı</th></tr></thead><tbody><tr><td>1</td><td>Api Bağlantısı (ApiConnection)</td></tr><tr><td>2</td><td>Ortak Ödeme Sayfası (CommonPage)</td></tr></tbody></table>

**Ödeme Durumları**

<table><thead><tr><th width="200">Id</th><th>Durum</th></tr></thead><tbody><tr><td>1</td><td>Oluşturuldu</td></tr><tr><td>2</td><td>Başladı (Paywall Link)</td></tr><tr><td>3</td><td>Başladı (Sağlayıcı Link)</td></tr><tr><td>4</td><td>Başarılı</td></tr><tr><td>5</td><td>Başarısız</td></tr><tr><td>6</td><td>Başarısız (Sorgulama)</td></tr><tr><td>7</td><td>Otp İsteği Başladı</td></tr><tr><td>8</td><td>Otp İsteği Başarılı</td></tr><tr><td>9</td><td>Otp İsteği Başarısız</td></tr><tr><td>10</td><td>Otp Onay Başladı</td></tr><tr><td>11</td><td>Otp Onay Başarısız</td></tr><tr><td>12</td><td>İade Başladı</td></tr><tr><td>13</td><td>QR Oluşturuldu</td></tr><tr><td>14</td><td>Ödeme Başladı</td></tr></tbody></table>

**Ödeme Tipleri**

<table><thead><tr><th width="200">Id</th><th>Tip</th></tr></thead><tbody><tr><td>1</td><td>Satış</td></tr><tr><td>2</td><td>İade</td></tr></tbody></table>

**Ödeme Sektörleri**

<table><thead><tr><th width="200">Id</th><th>Tip</th></tr></thead><tbody><tr><td>1</td><td>Yemek</td></tr><tr><td>2</td><td>Tekstil</td></tr></tbody></table>

APM Listesi > Özellik Anahtarları (FocusedFeature)

<table><thead><tr><th width="200">Anahtar</th><th>Özellik</th></tr></thead><tbody><tr><td>otp</td><td>OTP'li ödeme alma</td></tr><tr><td>qr</td><td>QR koduyla ödeme alma</td></tr><tr><td>checkout</td><td>Sağlayıcı ödeme ekranında ödeme alma</td></tr><tr><td>directpay</td><td>Ödemenin direkt olarak gerçekleşmesi, 2. adım olmaması</td></tr></tbody></table>

**Dinamik Param - MetropolCard**

{% tabs %}
{% tab title="JSON" %}
{% code lineNumbers="true" %}

```json5
{
    // MarketPlace tipindeki sağlayıcılar için
    "Provider": {
        // Dynamic
        "Parameters": {
            "MerchantCode": "**********",
            "TerminalCode": "**********"
        }
    }
}
```

{% endcode %}
{% endtab %}
{% endtabs %}

**Dinamik Param - Edenred**

{% tabs %}
{% tab title="JSON" %}
{% code lineNumbers="true" %}

```json5
{
    // MarketPlace tipindeki sağlayıcılar için
    "Provider": {
        // Dynamic
        "Parameters": {
            "MerchantCode": "**********",
            "TerminalCode": "**********"

```

{% endcode %}
{% endtab %}
{% endtabs %}
