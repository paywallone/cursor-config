# Tekrarlı Ödeme

**Üyelik Tipi (SubscriptionType)**

<table><thead><tr><th width="200">Tip</th><th>Açıklama</th></tr></thead><tbody><tr><td>1</td><td>"Sınırsız" tipidir ve siz üyeliği durdurana kadar belirlenen periyotlarda ödeme alımına devam eder</td></tr><tr><td>2</td><td>"Adet Bazlı" tipidir ve üyelik oluşturma anında belirtilen adet kadar ödeme periyodunda ödeme alınır. Adet bittiğinde ilgili ödeme devam etmez ve otomatik olarak durdurulur. Örnek aylık periyotta oluşturulan bir Adet Bazlı üyelik 10 adet olarak yapılandırılırsa, 10 defa 1 ay (belirlenen periyot) aralıklarla ödeme alınır.</td></tr></tbody></table>

**Ödeme Periyot Tipi (RecurringPeriodType)**

<table><thead><tr><th width="200">Tip</th><th>Açıklama</th></tr></thead><tbody><tr><td>1</td><td>Günlük</td></tr><tr><td>2</td><td>Haftalık</td></tr><tr><td>3</td><td>2 Haftalık</td></tr><tr><td>4</td><td>Aylık</td></tr><tr><td>5</td><td>3 Aylık</td></tr><tr><td>6</td><td>6 Aylık</td></tr><tr><td>7</td><td>9 Aylık</td></tr><tr><td>8</td><td>Yıllık</td></tr></tbody></table>

**Satış Öğe Tipi (Items:Type)**

<table><thead><tr><th width="200">Tip</th><th>Açıklama</th></tr></thead><tbody><tr><td>1</td><td>Üyelik Hesabı</td></tr><tr><td>2</td><td>Ürün</td></tr><tr><td>3</td><td>Hizmet</td></tr></tbody></table>

**Kanal Tipi (ChannelType)**

<table><thead><tr><th width="200">Tip</th><th>Açıklama</th></tr></thead><tbody><tr><td>1</td><td>API</td></tr><tr><td>2</td><td>Web</td></tr></tbody></table>

**Geri Bildirim (Callback) İçeriği**

<table><thead><tr><th width="269">Parametre</th><th width="190">Tip</th><th>Açıklama</th></tr></thead><tbody><tr><td>SubscriptionId</td><td>int</td><td>Tekrarlı ödeme kimliği (oluşturulma anında Paywall'dan döner)</td></tr><tr><td>SubscriptionType</td><td>int</td><td>Tekrarlı ödeme tipi</td></tr><tr><td>SubscriptionCode</td><td>string</td><td>Tekrarlı ödeme üyeliğine Paywall'dan atanan tekil kod</td></tr><tr><td>SubscriptionMerchantCode</td><td>string</td><td>Tekrarlı ödeme üyeliğine sizin tarafınızdan atanan tekil kod</td></tr><tr><td>Amount</td><td>decimal</td><td>Tekrarlı ödeme üyeliğine tutarı</td></tr><tr><td>Success</td><td>bool</td><td>Ödemenin başarılı/başarısız durumu</td></tr><tr><td>FailReason</td><td>string</td><td>Ödemenin başarısız olması durumunda, başarısızlık nedeni</td></tr><tr><td>PaymentId</td><td>int? - nullable</td><td>Ödeme kimliği (nullable)</td></tr><tr><td>Attempt</td><td>int</td><td>Ödemenin deneme adedi</td></tr><tr><td>AttemptFinished</td><td>bool</td><td>Denemenin bitip bitmediği</td></tr></tbody></table>
