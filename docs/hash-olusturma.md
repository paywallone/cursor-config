# Hash Oluşturma

🔑 **Özel Anahtar,** Paywall panelinizden ulaşabileceğiniz bir değerdir. Bu değer olası tüm senaryolar için farklı olacak şekilde desteklenmektedir. Örnek olarak 3D ödemeler ile APM ödemelerin anahtarları farklıdır. Her bir senaryo için farklı anahtar oluşturmalı ve kendi tarafınızda bu anahtarları güvenli bir şekilde saklamalısınız.

İlgili anahtarlar, hash değerinin oluşturulmasında kullanılan string değer bütünü içerisinde yer alacaktır.

**Hash Örnekleri:**

{% tabs %}
{% tab title="3D Hash" %}
***hashKey** bilgisini panelden temin edebilirsiniz*

<pre class="language-csharp"><code class="lang-csharp"><strong>var hashFormat = $"{hashKey}###{paymentId}###{merchantUniqueCode}###{amount}###{installment}"
</strong>
// Create a SHA256
using var sha256Hash = SHA256.Create();
// ComputeHash - returns byte array  
var bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(hashFormat));

// Convert byte array to a string   
var builder = new StringBuilder();
foreach (var t in bytes)
{
    builder.Append(t.ToString("x2"));
}
return builder.ToString();
</code></pre>

{% endtab %}

{% tab title="Ödeme" %}
***hashKey** bilgisini panelden temin edebilirsiniz*

```csharp
var hashFormat = $"{hashKey}###{paymentId}###{merchantUniqueCode}###{amount}###{installment}"

// Create a SHA256
using var sha256Hash = SHA256.Create();
// ComputeHash - returns byte array  
var bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(hashFormat));

// Convert byte array to a string   
var builder = new StringBuilder();
foreach (var t in bytes)
{
    builder.Append(t.ToString("x2"));
}
return builder.ToString();
```

{% endtab %}

{% tab title="Toplu Ödeme" %}
***hashKey** bilgisini panelden temin edebilirsiniz*

```csharp
var hashFormat = $"{hashKey}###{bulkPaymentId}###{merchantUniqueCode}"

// Create a SHA256
using var sha256Hash = SHA256.Create();
// ComputeHash - returns byte array  
var bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(hashFormat));

// Convert byte array to a string   
var builder = new StringBuilder();
foreach (var t in bytes)
{
    builder.Append(t.ToString("x2"));
}
return builder.ToString();
```

{% endtab %}

{% tab title="Parçalı Ödeme" %}
***hashKey** bilgisini panelden temin edebilirsiniz*

```csharp
var hashFormat = $"{hashKey}###{splitPaymentId}###{merchantUniqueCode}"

// Create a SHA256
using var sha256Hash = SHA256.Create();
// ComputeHash - returns byte array  
var bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(hashFormat));

// Convert byte array to a string   
var builder = new StringBuilder();
foreach (var t in bytes)
{
    builder.Append(t.ToString("x2"));
}
return builder.ToString();
```

{% endtab %}

{% tab title="PayOut" %}
***hashKey** bilgisini panelden temin edebilirsiniz*

```csharp
var hashFormat = $"{hashKey}###{payoutId}###{merchantGroupCode}###{merchantUniqueCode}###{amount}"

// Create a SHA256
using var sha256Hash = SHA256.Create();
// ComputeHash - returns byte array  
var bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(hashFormat));

// Convert byte array to a string   
var builder = new StringBuilder();
foreach (var t in bytes)
{
    builder.Append(t.ToString("x2"));
}
return builder.ToString();
```

{% endtab %}
{% endtabs %}

{% tabs %}
{% tab title="Ortak Ödeme Sayfası" %}
***hashKey** bilgisini panelden temin edebilirsiniz*

```csharp
var hashFormat = $"{hashKey}###{checkoutId}###{paymentId}###{uniqueCode}###{amount}"

// Create a SHA256
using var sha256Hash = SHA256.Create();
// ComputeHash - returns byte array  
var bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(hashFormat));

// Convert byte array to a string   
var builder = new StringBuilder();
foreach (var t in bytes)
{
    builder.Append(t.ToString("x2"));
}
return builder.ToString();
```

{% endtab %}

{% tab title="Link/Qr" %}
***hashKey** bilgisini panelden temin edebilirsiniz*

```csharp
var hashFormat = $"{hashKey}###{linkQrId}###{paymentId}###{trackId}###{orderId}###{amount}"

// Create a SHA256
using var sha256Hash = SHA256.Create();
// ComputeHash - returns byte array  
var bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(hashFormat));

// Convert byte array to a string   
var builder = new StringBuilder();
foreach (var t in bytes)
{
    builder.Append(t.ToString("x2"));
}
return builder.ToString();
```

{% endtab %}

{% tab title="APM" %}
***hashKey** bilgisini panelden temin edebilirsiniz*

```csharp
var hashFormat = $"{hashKey}###{apmId}###{merchantUniqueCode}###{amount}"

// Create a SHA256
using var sha256Hash = SHA256.Create();
// ComputeHash - returns byte array  
var bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(hashFormat));

// Convert byte array to a string   
var builder = new StringBuilder();
foreach (var t in bytes)
{
    builder.Append(t.ToString("x2"));
}
return builder.ToString();
```

{% endtab %}

{% tab title="Fiziksel Pos" %}
***hashKey** bilgisini panelden temin edebilirsiniz*

```csharp
var hashFormat = $"{key}###{paymentRequestId}###{merchantUniqueCode}###{amount}";

// Create a SHA256
using var sha256Hash = SHA256.Create();
// ComputeHash - returns byte array  
var bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(hashFormat));

// Convert byte array to a string   
var builder = new StringBuilder();
foreach (var t in bytes)
{
    builder.Append(t.ToString("x2"));
}
return builder.ToString();
```

{% endtab %}

{% tab title="Genel Sistem" %}
***hashKey** bilgisini panelden temin edebilirsiniz*

```csharp
var hashFormat = $"{hashKey}###{paymentId}###{merchantUniqueCode}###{amount.ToString()}###{installment}"

// Create a SHA256
using var sha256Hash = SHA256.Create();
// ComputeHash - returns byte array  
var bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(hashFormat));

// Convert byte array to a string   
var builder = new StringBuilder();
foreach (var t in bytes)
{
    builder.Append(t.ToString("x2"));
}
return builder.ToString();
```

{% endtab %}
{% endtabs %}

####
