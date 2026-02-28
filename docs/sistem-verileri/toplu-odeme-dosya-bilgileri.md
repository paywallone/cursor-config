# Toplu Ödeme Dosya Bilgileri

📁 **Dosya Tipleri**

<table><thead><tr><th width="160.5">Id</th><th>Durum</th></tr></thead><tbody><tr><td>1</td><td>XLSX <mark style="color:blue;"><code>Yakında</code></mark></td></tr><tr><td>2</td><td>CSV <mark style="color:blue;"><code>Yakında</code></mark></td></tr><tr><td>3</td><td>JSON <mark style="color:blue;"><code>Yakında</code></mark></td></tr><tr><td>4</td><td>XML  <mark style="color:blue;"><code>Yakında</code></mark></td></tr><tr><td>5</td><td>TXT</td></tr></tbody></table>

📁 **Dosya Desenleri**

<table><thead><tr><th width="160.5">Id</th><th>Durum</th></tr></thead><tbody><tr><td>1</td><td>Açık Kart - Basit</td></tr><tr><td>2</td><td>Açık Kart - Gelişmiş</td></tr><tr><td>3</td><td>Sigortacılık - Basit</td></tr><tr><td>4</td><td>Sigortacılık - Gelişmiş</td></tr></tbody></table>

📁 **Dosya Kolonları**

{% tabs %}
{% tab title="TXT" %}
**Açık Kart Basit:**

```csharp
{cardNumber},{expiryDate},{amount},{lineNumber},{cardOwnerName},{trackingCode},{customerId},{productCategory},{productId},{merchantUniqueCode},{providerBased},{providerKey},{routeGroupKey},{payRouteByPass},{payRouteType},{posBased},{posId}
```

<details>

<summary><strong>Açık Kart Basit - Kolon Açıklamaları</strong></summary>

<table><thead><tr><th>Parametre</th><th>Açıklama</th></tr></thead><tbody><tr><td><pre><code>cardNumber
</code></pre></td><td>Ödeme alınacak kart numarası</td></tr><tr><td><pre><code>expiryDate
</code></pre></td><td>Kartın son kullanma tarihi</td></tr><tr><td><pre><code>amount
</code></pre></td><td>Ödeme sepet tutarı</td></tr><tr><td><pre><code>lineNumber
</code></pre></td><td>İşlemin satır numarası</td></tr><tr><td><pre><code>cardOwnerName
</code></pre></td><td>Kart sahibinin adı</td></tr><tr><td><pre><code>trackingCode
</code></pre></td><td>Takip Numarası<br><br><strong>Not: Tekil değildir</strong></td></tr><tr><td><pre><code>customerId
</code></pre></td><td>Müşterinin sisteminizdeki kimlik numarası<br><br><mark style="color:blue;"><strong>* Boş geçilebilir</strong></mark></td></tr><tr><td><pre><code>productCategory
</code></pre></td><td>Ürün kategorisi<br><br><mark style="color:blue;"><strong>* Boş geçilebilir</strong></mark></td></tr><tr><td><pre><code>productId
</code></pre></td><td>Ürün kimliği<br><br><mark style="color:blue;"><strong>* Boş geçilebilir</strong></mark></td></tr><tr><td><pre><code>merchantUniqueCode
</code></pre></td><td>Ödeme başlatma için gönderilen istek içerisindeki MerchantUniqueCode ile aynı değer olmalıdır. Bu kod sizin tarafınızdan işleme ait verilen tekil değerdir. İptal/İade/Ödeme Sorgulama işlemlerinin hepsinde bir ödemeyi tekilleştirmeniz ve takip etmeniz için kullanılmaktadır.<br><br><mark style="color:blue;"><strong>* 250 karakter</strong></mark><br><mark style="color:$danger;"><strong>* Tekil olmalıdır</strong></mark></td></tr><tr><td><pre><code>providerBased
</code></pre></td><td>Ödemenizin hangi sağlayıcıdan geçmesi gerektiğine kendi tarafınızda karar verdiğinizde kullanılır</td></tr><tr><td><pre><code>providerKey
</code></pre></td><td>Ödemenizin geçmesini istediğiniz sağlayıcı anahtarı</td></tr><tr><td><pre><code>routeGroupKey
</code></pre></td><td>Ödemenizin yapılandırılmış özel sağlayıcı kümesinden geçmesini istediğinizde. İlgili sağlayıcı kümesinin anahtarı iletilmelidir</td></tr><tr><td><pre><code>payRouteByPass
</code></pre></td><td>Paywall panelinde yapılandırılan PayRoute ayarını ilgili ödeme özelinde bypass etmek istediğinizde <code>true</code> gönderilmelidir</td></tr><tr><td><pre><code>payRouteType
</code></pre></td><td>PayRoute bypass işleminde, ayarların hangi PayRoute tipine zorlanacağı buradan belirtilir<br><br>Bkz: <a href="payroute-tipleri">PayRoute Tipleri</a></td></tr><tr><td><pre><code>posBased
</code></pre></td><td>Ödemenizin hangi sağlayıcıdan geçmesi gerektiğine kendi tarafınızda karar verdiğinizde kullanılır</td></tr><tr><td><pre><code>posId
</code></pre></td><td>Ödemenizin geçmesini istediğiniz sağlayıcının bağlantı kimlik numarasıdır. Paywall panelinden temin bağlı sağlayıcılar listesinde yer almaktadır</td></tr></tbody></table>

</details>

**Sigortacılık Basit:**

```csharp
{cardNoFirst},{cardNoLast},{identityNumber},{amount},{lineNumber},{cardOwnerName},{trackingCode},{customerId},{productCategory},{productId},{merchantUniqueCode},{providerBased},{providerKey},{routeGroupKey},{payRouteByPass},{payRouteType},{posBased},{posId}
```

<details>

<summary><strong>Sigortacılık Basit - Kolon Açıklamaları</strong></summary>

<table><thead><tr><th>Parametre</th><th>Açıklama</th></tr></thead><tbody><tr><td><pre><code>cardNoFirst    
</code></pre></td><td>Kart'ın ilk 8 hanesi</td></tr><tr><td><pre><code>cardNoLast
</code></pre></td><td>Kart'ın son 4 hanesi</td></tr><tr><td><pre><code>identityNumber
</code></pre></td><td>Kart sahibinin TCKN/VKN numarası</td></tr><tr><td><pre><code>amount
</code></pre></td><td>Ödeme sepet tutarı</td></tr><tr><td><pre><code>lineNumber
</code></pre></td><td>İşlemin satır numarası</td></tr><tr><td><pre><code>cardOwnerName
</code></pre></td><td>Kart sahibinin adı</td></tr><tr><td><pre><code>trackingCode
</code></pre></td><td>Takip Numarası<br><br><strong>Not: Tekil değildir</strong></td></tr><tr><td><pre><code>customerId
</code></pre></td><td>Müşterinin sisteminizdeki kimlik numarası<br><br><mark style="color:blue;"><strong>* Boş geçilebilir</strong></mark></td></tr><tr><td><pre><code>productCategory
</code></pre></td><td>Ürün kategorisi<br><br><mark style="color:blue;"><strong>* Boş geçilebilir</strong></mark></td></tr><tr><td><pre><code>productId
</code></pre></td><td>Ürün kimliği<br><br><mark style="color:blue;"><strong>* Boş geçilebilir</strong></mark></td></tr><tr><td><pre><code>merchantUniqueCode
</code></pre></td><td>Ödeme başlatma için gönderilen istek içerisindeki MerchantUniqueCode ile aynı değer olmalıdır. Bu kod sizin tarafınızdan işleme ait verilen tekil değerdir. İptal/İade/Ödeme Sorgulama işlemlerinin hepsinde bir ödemeyi tekilleştirmeniz ve takip etmeniz için kullanılmaktadır.<br><br><mark style="color:blue;"><strong>* 250 karakter</strong></mark><br><mark style="color:$danger;"><strong>* Tekil olmalıdır</strong></mark></td></tr><tr><td><pre><code>providerBased
</code></pre></td><td>Ödemenizin hangi sağlayıcıdan geçmesi gerektiğine kendi tarafınızda karar verdiğinizde kullanılır</td></tr><tr><td><pre><code>providerKey
</code></pre></td><td>Ödemenizin geçmesini istediğiniz sağlayıcı anahtarı</td></tr><tr><td><pre><code>routeGroupKey
</code></pre></td><td>Ödemenizin yapılandırılmış özel sağlayıcı kümesinden geçmesini istediğinizde. İlgili sağlayıcı kümesinin anahtarı iletilmelidir</td></tr><tr><td><pre><code>payRouteByPass
</code></pre></td><td>Paywall panelinde yapılandırılan PayRoute ayarını ilgili ödeme özelinde bypass etmek istediğinizde <code>true</code> gönderilmelidir</td></tr><tr><td><pre><code>payRouteType
</code></pre></td><td>PayRoute bypass işleminde, ayarların hangi PayRoute tipine zorlanacağı buradan belirtilir<br><br>Bkz: <a href="payroute-tipleri">PayRoute Tipleri</a></td></tr><tr><td><pre><code>posBased
</code></pre></td><td>Ödemenizin hangi sağlayıcıdan geçmesi gerektiğine kendi tarafınızda karar verdiğinizde kullanılır</td></tr><tr><td><pre><code>posId
</code></pre></td><td>Ödemenizin geçmesini istediğiniz sağlayıcının bağlantı kimlik numarasıdır. Paywall panelinden temin bağlı sağlayıcılar listesinde yer almaktadır</td></tr></tbody></table>

</details>
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
{% file src="<https://3562800815-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FCUps4KjQvHbASZDpZfvq%2Fuploads%2Fb6OAYthmpE3LPcrp2b7t%2Facikkart_basic.txt?alt=media&token=93c214dc-bfbb-486a-a2b8-1257087f1d44>" %}

{% file src="<https://3562800815-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FCUps4KjQvHbASZDpZfvq%2Fuploads%2F23ypPY5sL0X4Famrklf2%2Fsigortacilik_basic.txt?alt=media&token=e0d2664c-07e5-4fc8-83c9-2f4f90708292>" %}
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
