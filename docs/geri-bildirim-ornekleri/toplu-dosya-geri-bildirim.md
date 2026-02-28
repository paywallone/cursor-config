# Toplu (Dosya) Geri Bildirim

Gerçekleştirilen toplu işlemler, Paywall tarafından tamamlandığında toplu işlem emri içerisinde iletilen geri bildirim (CallbackAddress) adresine dosya olarak gönderilir

{% tabs %}
{% tab title="Normal" %}
**Dosya Deseni:** `$"{patternNo},{lineNumber},{dateTime},{merchantUniqueCode},{trackingCode},{cardOwner},{cardNumber},{expiryDate},{amount},{gatewayId},{gatewayName},{providerId},{providerKey},{paywallErrorCode},{providerErrorCode},{providerErrorMessage},{bankErrorCode},{bankErrorMessage},{PaymentActivityTypeId},{PaymentStatusId}”;`

**Dosya&#x20;**<mark style="color:$success;">**Başarılı**</mark>**:**

{% file src="<https://3562800815-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FCUps4KjQvHbASZDpZfvq%2Fuploads%2FVDWtoNQnfpHwaAmx4j5M%2Fnormal_success_response_file.txt?alt=media&token=aab5a8f2-d796-4024-86ba-0da3cb534438>" %}

Dosya <mark style="color:$danger;">**Başarısız**</mark>:

{% file src="<https://3562800815-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FCUps4KjQvHbASZDpZfvq%2Fuploads%2F4z9RxnHQq57uXB7YrhKt%2Fnormal_unsuccessful_response_file.txt?alt=media&token=f423d704-4248-4595-9231-113f430c222e>" %}
{% endtab %}

{% tab title="Sigortacılık" %}
**Dosya Deseni:** `$"{patternNo},{lineNumber},{dateTime},{merchantUniqueCode},{trackingCode},{cardOwner},{cardNumber},{identityNumber},{amount},{gatewayId},{gatewayName},{providerId},{providerKey},{paywallErrorCode},{providerErrorCode},{providerErrorMessage},{bankErrorCode},{bankErrorMessage},{PaymentActivityTypeId},{PaymentStatusId}”;`

**Dosya&#x20;**<mark style="color:$success;">**Başarılı**</mark>**:**

{% file src="<https://3562800815-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FCUps4KjQvHbASZDpZfvq%2Fuploads%2FfEXkbLUEg0DGUxlcc7tk%2Finsurance_success_response_file.txt?alt=media&token=cf72971f-671d-457c-a9be-aaf9015875ca>" %}

Dosya <mark style="color:$danger;">Başarısız</mark>:

{% file src="<https://3562800815-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FCUps4KjQvHbASZDpZfvq%2Fuploads%2FeQZh1DgcrDdJ7DC5hy1q%2Finsurance_unsuccessful_response_file.txt?alt=media&token=168a815a-3e55-4467-95a0-657ac53e6c8e>" %}
{% endtab %}
{% endtabs %}
