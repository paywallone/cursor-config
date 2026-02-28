# Paywall Cursor Docs

Cursor IDE için Paywall API dökümanları. Bu paket, Cursor AI'ın Paywall ödeme sistemi hakkında doğru ve güncel bilgi vermesini sağlar.

## Kurulum

### macOS / Linux

```bash
curl -sSL https://cursor.paywall.one/install.sh | bash
```

### Windows (PowerShell)

```powershell
iex (iwr https://cursor.paywall.one/install.ps1).Content
```

> **Not:** Alternatif olarak [GitHub](https://github.com/paywallone/cursor-config) üzerinden de kurulum yapabilirsiniz.

## Kurulum Sonrası

Kurulum tamamlandığında projenizde şu yapı oluşur:

```
projeniz/
├── .cursor/
│   └── rules/
│       ├── paywall-core.mdc
│       ├── odeme-servisi.mdc
│       ├── tekrarli-odeme.mdc
│       ├── kart-saklama.mdc
│       ├── pazaryeri.mdc
│       ├── payout.mdc
│       ├── cuzdan.mdc
│       ├── fiziksel-pos.mdc
│       ├── apm.mdc
│       ├── toplu-islem.mdc
│       ├── diger-servisler.mdc
│       └── webhook-hata.mdc
└── paywall-docs/
    └── (443 döküman)
```

## Nasıl Çalışır

Cursor IDE, `.cursor/rules/` dizinindeki `.mdc` dosyalarını okuyarak context oluşturur. Her kural dosyası belirli konularda aktif olur:

| Kural Dosyası | Kapsam | Aktivasyon |
|---------------|--------|------------|
| `paywall-core.mdc` | Temel bilgiler, auth, ortam | Her zaman |
| `odeme-servisi.mdc` | 3D, Non-Secure, iade, iptal | İlgili sorularda |
| `tekrarli-odeme.mdc` | Subscription yönetimi | İlgili sorularda |
| `kart-saklama.mdc` | Kart kaydetme/silme | İlgili sorularda |
| `pazaryeri.mdc` | Marketplace, kazanç, borç | İlgili sorularda |
| `payout.mdc` | Para çekme, IBAN | İlgili sorularda |
| `cuzdan.mdc` | Wallet servisleri | İlgili sorularda |
| `fiziksel-pos.mdc` | Terminal entegrasyonu | İlgili sorularda |
| `apm.mdc` | Alternatif ödeme yöntemleri | İlgili sorularda |
| `toplu-islem.mdc` | Batch işlemler | İlgili sorularda |
| `diger-servisler.mdc` | Masterpass, Link/QR, üye servisi | İlgili sorularda |
| `webhook-hata.mdc` | Callback, hata kodları | İlgili sorularda |

## Kullanım Örnekleri

Cursor'da aşağıdaki gibi sorular sorabilirsiniz:

```
- 3D ödeme nasıl yapılır?
- Tekrarlı ödeme oluşturmak istiyorum
- İade işlemi için gerekli parametreler neler?
- Hata kodu 1001 ne anlama geliyor?
- Test kartları listesi
- Marketplace kazanç yönetimi nasıl çalışır?
```

## API Ortamları

| Ortam | URL |
|-------|-----|
| Test Payment API | `https://test-payment-api.itspaywall.com` |
| Production Payment API | `https://payment-api.itspaywall.com` |
| Test Panel | `https://dev-panel.itspaywall.com` |
| Production Panel | `https://panel.itspaywall.com` |

## Authentication

### Public API

```
apikeypublic: {PUBLIC_KEY}
apiclientpublic: {PUBLIC_CLIENT}
```

### Private API

```
apikeyprivate: {PRIVATE_KEY}
apiclientprivate: {PRIVATE_CLIENT}
```

## Test Kartları

| Kart Numarası | SKT | CVV | Sağlayıcı |
|---------------|-----|-----|-----------|
| 5528790000000008 | 12/30 | 123 | Iyzico |
| 4546711234567894 | 12/26 | 000 | Param |
| 5401341234567891 | 12/26 | 000 | Param |

Tüm test kartları için: `paywall-docs/test-kartlari.md`

## Güncelleme

Dökümanları güncellemek için kurulum komutunu tekrar çalıştırın. Mevcut dosyalar üzerine yazılacaktır.

## Gereksinimler

- Cursor IDE
- curl (macOS/Linux) veya PowerShell (Windows)
- Internet bağlantısı (kurulum için)

## Lisans

Bu dökümanlar Paywall tarafından sağlanmaktadır.

---

Paywall API v5
