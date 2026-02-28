# Paywall Cursor Docs Installer for Windows
# Modern .cursor/rules/ Structure

$ErrorActionPreference = "Stop"

$RepoUrl = "https://github.com/paywallone/cursor-config"
$DownloadUrl = "$RepoUrl/archive/main.zip"

Write-Host ""
Write-Host "==============================================================" -ForegroundColor Blue
Write-Host "         Paywall Cursor Docs Installer" -ForegroundColor Blue
Write-Host "         Modern .cursor/rules/ Yapisi" -ForegroundColor Blue
Write-Host "==============================================================" -ForegroundColor Blue
Write-Host ""

# Check if .cursor/rules already exists
if (Test-Path ".cursor\rules") {
    $response = Read-Host "⚠️  .cursor/rules klasoru zaten mevcut. Uzerine yazilsin mi? (y/n)"
    if ($response -ne "y" -and $response -ne "Y") {
        Write-Host "Iptal edildi."
        exit 1
    }
    Remove-Item -Recurse -Force ".cursor\rules"
}

# Check if paywall-docs already exists
if (Test-Path "paywall-docs") {
    $response = Read-Host "⚠️  paywall-docs klasoru zaten mevcut. Uzerine yazilsin mi? (y/n)"
    if ($response -ne "y" -and $response -ne "Y") {
        Write-Host "Iptal edildi."
        exit 1
    }
    Remove-Item -Recurse -Force "paywall-docs"
}

Write-Host "📥 Dosyalar indiriliyor..."

# Create temp directory
$TempDir = Join-Path $env:TEMP "paywall-cursor-$(Get-Random)"
New-Item -ItemType Directory -Path $TempDir | Out-Null

try {
    # Download zip
    $ZipPath = Join-Path $TempDir "repo.zip"
    Write-Host "📡 Indirme kaynagi: GitHub"
    Invoke-WebRequest -Uri $DownloadUrl -OutFile $ZipPath

    # Extract
    Expand-Archive -Path $ZipPath -DestinationPath $TempDir

    # Find extracted folder
    $ExtractedDir = Get-ChildItem -Path $TempDir -Directory | Where-Object { $_.Name -like "cursor-config-*" } | Select-Object -First 1

    # Create .cursor directory if not exists
    if (-not (Test-Path ".cursor")) {
        New-Item -ItemType Directory -Path ".cursor" | Out-Null
    }

    # Copy files
    Copy-Item -Path (Join-Path $ExtractedDir.FullName "templates\.cursor\rules") -Destination ".cursor\" -Recurse
    Copy-Item -Path (Join-Path $ExtractedDir.FullName "docs") -Destination "paywall-docs" -Recurse

    $RuleCount = (Get-ChildItem -Path ".cursor\rules" -Filter "*.mdc").Count
    $DocCount = (Get-ChildItem -Path "paywall-docs" -Recurse -Filter "*.md").Count

    Write-Host ""
    Write-Host "✓ .cursor/rules/ klasoru olusturuldu ($RuleCount kural dosyasi)" -ForegroundColor Green
    Write-Host "✓ paywall-docs/ klasoru olusturuldu ($DocCount dokuman)" -ForegroundColor Green
    Write-Host ""
    Write-Host "==============================================================" -ForegroundColor Blue
    Write-Host "  🎉 Kurulum tamamlandi!" -ForegroundColor Green
    Write-Host "==============================================================" -ForegroundColor Blue
    Write-Host ""
    Write-Host "📁 Olusturulan yapi:"
    Write-Host "   .cursor/"
    Write-Host "   └── rules/"
    Write-Host "       ├── paywall-core.mdc      (Her zaman aktif)"
    Write-Host "       ├── odeme-servisi.mdc     (Odeme konularinda aktif)"
    Write-Host "       ├── tekrarli-odeme.mdc    (Subscription konularinda aktif)"
    Write-Host "       ├── kart-saklama.mdc      (Kart konularinda aktif)"
    Write-Host "       ├── pazaryeri.mdc         (Marketplace konularinda aktif)"
    Write-Host "       ├── payout.mdc            (Para cekme konularinda aktif)"
    Write-Host "       ├── cuzdan.mdc            (Wallet konularinda aktif)"
    Write-Host "       ├── fiziksel-pos.mdc      (POS konularinda aktif)"
    Write-Host "       ├── apm.mdc               (APM konularinda aktif)"
    Write-Host "       ├── toplu-islem.mdc       (Batch konularinda aktif)"
    Write-Host "       ├── diger-servisler.mdc   (Masterpass, Link/QR vs.)"
    Write-Host "       └── webhook-hata.mdc      (Webhook/Hata konularinda aktif)"
    Write-Host "   paywall-docs/                 (443 dokuman)"
    Write-Host ""
    Write-Host "💬 Simdi Cursor'da sunlari sorabilirsin:"
    Write-Host "   • 3D odeme nasil yapilir?"
    Write-Host "   • Tekrarli odeme nasil olusturulur?"
    Write-Host "   • Iade islemi nasil yapilir?"
    Write-Host "   • Hata kodu 1001 ne demek?"
    Write-Host ""
}
finally {
    # Cleanup
    Remove-Item -Recurse -Force $TempDir -ErrorAction SilentlyContinue
}
