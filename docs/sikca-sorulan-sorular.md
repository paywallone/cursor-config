# Sıkça Sorulan Sorular

<details>

<summary>Paywall ile Başarı Hikayemiz</summary>

Paywall Türkiye merkezli 2022 yılında kurulmuş olan Türkiye’nin ilk ödeme orkestrası kimliğini oluşturmuş finansal teknolojiler alanında hizmet veren girişimdir. Müşterilerinin dijital finansal süreçlerinin tamamını yönetmelerini, geliştirmelerini ve genişletmelerini sağlayan Paywall, PCI DSS Level-1 sertifikalı kart saklama, pazaryeri yeri modülü, tekrarlı ödeme servisleri ve daha nice algoritmalarıyla öne çıkmaktadır.

Online ödeme süreçlerinizin tamamında Paywall servislerini kullanabilir. Entegrasyon maliyetlerinizi sıfıra inceleyebilir ve yönetim anında destek hizmet alamadığınız kurumlarla ilgili tüm süreçlerinizi çözmesini sağlayabilirsiniz.

Paywall SanalPos ve benzeri hizmetleri direkt olarak vermez. Paywall üzerinden (orchestration) tüm hizmet aldığınız kurum kuruluşlara tek API’yle erişebilir, hepsini tek bir çatı altında ileri seviye algoritmalarla yönetebilirsiniz

</details>

<details>

<summary>Paywall ile entegrasyon süreci nasıl ilerliyor?</summary>

Paywall ile test ortamları üzerinden entegrasyonlarınızın tamamını gerçekleştirebilir ve canlı ortama geçmeden tüm testlerinizi tamamlayabilirsiniz. İhtiyaç duyduğunuz test ortamı için  [info@paywall.one](mailto:saleshelp@paywall.one) adresi üzerinden ekiplerimizle iletişime geçebilirsiniz

</details>

<details>

<summary>Teknik Destek</summary>

Paywall teknik destek ekiplerine ve operasyon ekibine 7/24 erişebilirsiniz. [help@paywall.one](mailto:devhelp@paywall.one) adresine göndereceğiniz mail sonrasında ekiplerimiz sizinle kısa süre içerisinde iletişime geçecektir.

</details>

<details>

<summary>API Desteği</summary>

Paywall servisleri RestFul tabanlı teknolojiye sahiptir ve kullandığınız tüm programlama dillerinden erişim sağlayabilirsiniz

</details>

<details>

<summary>Public ve Private anahtarların farkı nedir?</summary>

Public ve Private anahtarların hiç biri client ortamda saklanmamalıdır. Client ortamda kullanılabilecek tek bilgi TempToken’dır. TempToken’lar da server-side taraftan Paywall API’lerinden alınmalıdır.

Public olan anahtarlarla Private olan anahtarlar arasında güvenlik farkı yoktur. Paywall’un segmentasyon kuralları gereği bazı servisler Public, bazı servisler ise Private anahtarlar ile iletişim kurmanızı ister.

</details>

<details>

<summary>Kaç API var ve hangilerini kullanmalıyım?</summary>

Paywall altında şimdilik 4 ana API bulunmaktadır. Görevleri gereğince birbirlerinden izole çalışan bu servisler aşağıdaki gibidir.

**1.⁠ ⁠PaymentAPI:** Ödeme süreçleri yönetilir&#x20;

**2.⁠ ⁠⁠PaymentPrivateAPI:** Ödeme iade, iptal, kısmi iade ve sorgulama işlemleri gerçekleştirilir&#x20;

**3.⁠ ⁠CardAPI:** Kredi kartı saklama işlemleri bu API üzerinden gerçekleştirilir&#x20;

**4.⁠ ⁠⁠MemberAPI:** Pazaryeri kapsamında kullanılan alt şirketler ve bu şirket üzerindeki yönetimlerin yapılmasını sağlayan servisler bu API altındadır

</details>

<details>

<summary>Ön Provizyon Nedir?</summary>

Ön provizyon, ödeme anında kullanılan kartın doğruluğunu ve bakiyenin kontrolünü yapan, her şeyin normal gitmesi durumunda ödemeyi kart içerisinde kitleyen ama çekmeyen bir mekanizmadır. Örnek: John adında bir kullanıcı sisteminizden 10.000TL ‘lik bir alışveriş yapıyor. Siz ödeme adımı sonrasında kendi iç akışlarınızı tamamlayacaksınız ve kendi akışlarınızda sorun olma ihtimali var (oda rezervasyonu vb). John’un ödeme emrini ön provizyon olarak koşabilir, ödeme başarılı olduğunda kendi iç süreçlerinizi yapabilir ve her şeyin olumlu gitmesi durumunda “Ön Provizyon Kapatma” emri verebilirsiniz. Son ”Ön Provizyon Kapatma” emrine kadar John’a ait kartta para çekilmez, içerisindeki limitten ilgili tutar kadar kitlenir

</details>
