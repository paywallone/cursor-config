# Toplu Ödeme Sonuç Dosya

{% hint style="warning" %}
Sadece **TXT** dosya desteklemektedir
{% endhint %}

📁 **Dosya Kolonları**

{% tabs %}
{% tab title="TXT" %}
**Açık Kart Ödemeleri:**

**`PatterNo: 1`**

```csharp
$"{patternNo},{lineNumber},{dateTime},{merchantUniqueCode},{trackingCode},{cardOwner},{cardNumber},{expiryDate},{amount},{gatewayId},{gatewayName},{providerId},{providerKey},{paywallErrorCode},{providerErrorCode},{providerErrorMessage},{bankErrorCode},{bankErrorMessage}";
```

**Sigortacılık Ödemeleri:**

**`PatterNo: 2`**

```csharp
$"{patternNo},{lineNumber},{dateTime},{merchantUniqueCode},{trackingCode},{cardOwner},{cardNumber},{identityNumber},{amount},{gatewayId},{gatewayName},{providerId},{providerKey},{paywallErrorCode},{providerErrorCode},{providerErrorMessage},{bankErrorCode},{bankErrorMessage}";
```

{% endtab %}

{% tab title="XLSX" %}
{% hint style="info" %}
Yakında
{% endhint %}
{% endtab %}

{% tab title="CSV" %}
{% hint style="info" %}
Yakında
{% endhint %}
{% endtab %}

{% tab title="JSON" %}
{% hint style="info" %}
Yakında
{% endhint %}
{% endtab %}

{% tab title="XML" %}
{% hint style="info" %}
Yakında
{% endhint %}
{% endtab %}
{% endtabs %}

📁 **Dosya Örnekleri**

{% tabs %}
{% tab title="TXT" %}
{% file src="<https://3562800815-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FCUps4KjQvHbASZDpZfvq%2Fuploads%2FGfBjsBGtIayBQ7gdyWfm%2Facikkart_sonuc.txt?alt=media&token=80d67f71-9a9b-441d-bcf2-4f4618636dfd>" %}

{% file src="<https://3562800815-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FCUps4KjQvHbASZDpZfvq%2Fuploads%2FmA1eIjA7ibxIZdhRX0D9%2Fsigortacilik_sonuc.txt?alt=media&token=833cdea2-2094-4072-9592-b37211cc4191>" %}
{% endtab %}

{% tab title="XLSX" %}
{% hint style="info" %}
Yakında
{% endhint %}
{% endtab %}

{% tab title="CSV" %}
{% hint style="info" %}
Yakında
{% endhint %}
{% endtab %}

{% tab title="JSON" %}
{% hint style="info" %}
Yakında
{% endhint %}
{% endtab %}

{% tab title="XML" %}
{% hint style="info" %}
Yakında
{% endhint %}
{% endtab %}
{% endtabs %}
