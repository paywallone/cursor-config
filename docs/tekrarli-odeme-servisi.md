# Tekrarlı Ödeme Servisi

Sisteminize üye olan kullanıcılar, belirli periyodlarda ödemelerini yaparlar ve sisteminizdeki üyeliklerini aktif tutmaya devam ederler. Tabii ki bu sadece üyelik kapsamında size hizmet vermemektedir. Ürün/Hizmet satan bir işletmeyseniz ve bahse konu olan bu satışları kullanıcınızın verdiği ödeme emirleri kapsamında belirli periyotlarda almanız gerekiyorsa da PayWall tüm süreci sizin için yönetecektir.

Günlük, haftalık, 2 haftalık, aylık, 3 aylık, 6 aylık, 9 aylık ve 1 yıllık olmak üzere 8 farklı periyotta PayWall ödemelerinizi almanıza destek olur.

Alınan ödemeler, tekrarlı ödeme oluşturma içerisinde verdiğiniz CallbackUrl 'e POST mesaj olarak bildirilir. Bu bilgilendirme mesajları ödemelerin başarılı sonuçlanması ve başarısız sonuçlanması senaryolarında da yapılır.

Başarısız gerçekleşen ödemeler için sizin PayWall'a bildirdiğiniz tekrar deneme adedi kadar PayWall ödemeleri tekrar dener. Deneme adedi maksimum 5 olabilir.

Başarısız ödemelerin denemeleri arasındaki bekleme süresini yine siz yönetirsiniz ve saat bazında her bir deneme arasında ne kadar beklemesi gerektiğini PayWall'a bildirirsiniz.

PayWall burada :tada:
