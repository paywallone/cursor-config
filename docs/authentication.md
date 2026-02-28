# Authentication

Tüm entegrasyon kimlik bilgileri Paywall API'lerine HTTP isteğin içerisinde Header alanında gönderilmelidir

{% hint style="info" %}
Entegrasyon kimlik bilgileri Paywall sistemlerinde **Public** ve **Private** olarak 2'ye ayırılır. Her iki kategorideki entegrasyon kimlikleri de client-side tarafında saklanmamalıdır. Public ve Private ayrımları Paywall'un güvenlik prosedürlerinde (istek adedi, ip limitleri vb) farklılık göstermektedir.
{% endhint %}

{% hint style="danger" %}
Entegrasyon kimlik bilgileri okunabilir olarak client-side'da saklanmamalıdır
{% endhint %}

<details>

<summary>Public</summary>

* apiclientpublic
* apikeypublic

Yukardaki entegrasyon kimlik bilgilerine PayWall panelinden ulaşabilirsiniz

</details>

<details>

<summary>Private</summary>

* apiclientprivate
* apikeyprivate

Yukardaki entegrasyon kimlik bilgilerine Paywall panelinden ulaşabilirsiniz

</details>

### Nereden temin edebilirim?

<table><thead><tr><th width="220.5">Ortam</th><th>Adres</th></tr></thead><tbody><tr><td><strong>Test Ortam</strong></td><td><a href="https://panel.itspaywall.com">https://dev-panel.itspaywall.com</a></td></tr><tr><td><strong>Prod Ortam</strong>:</td><td><a href="https://panel.itspaywall.com">https://panel.itspaywall.com</a></td></tr></tbody></table>

Panel'e giriş yaptıktan sonra **Geliştirici > Entegrasyon** sayfası altından ilgili bilgilere ulaşabilirsiniz
