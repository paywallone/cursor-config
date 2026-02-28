#!/bin/bash

set -e

REPO_URL="https://github.com/paywallone/cursor-config"
DOWNLOAD_URL="${REPO_URL}/archive/dev.tar.gz"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}"
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║         Paywall Cursor Docs Installer                     ║"
echo "║         Modern .cursor/rules/ Yapısı                      ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Check if .cursor/rules already exists
if [ -d ".cursor/rules" ]; then
    echo -e "${YELLOW}⚠️  .cursor/rules klasörü zaten mevcut.${NC}"
    read -p "Üzerine yazılsın mı? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "İptal edildi."
        exit 1
    fi
    rm -rf .cursor/rules
fi

# Check if paywall-docs already exists
if [ -d "paywall-docs" ]; then
    echo -e "${YELLOW}⚠️  paywall-docs klasörü zaten mevcut.${NC}"
    read -p "Üzerine yazılsın mı? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "İptal edildi."
        exit 1
    fi
    rm -rf paywall-docs
fi

echo "📥 Dosyalar indiriliyor..."

# Create temp directory
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

# Download and extract
echo "📡 İndirme kaynağı: GitHub"
curl -sL "$DOWNLOAD_URL" | tar -xz -C "$TEMP_DIR"

# Find extracted folder name
EXTRACTED_DIR=$(ls "$TEMP_DIR")

# Create .cursor directory if not exists
mkdir -p .cursor

# Copy files
cp -r "$TEMP_DIR/$EXTRACTED_DIR/templates/.cursor/rules" .cursor/
cp -r "$TEMP_DIR/$EXTRACTED_DIR/docs" paywall-docs

# Count files
RULE_COUNT=$(find .cursor/rules -name "*.mdc" | wc -l | tr -d ' ')
DOC_COUNT=$(find paywall-docs -name "*.md" | wc -l | tr -d ' ')

echo ""
echo -e "${GREEN}✓ .cursor/rules/ klasörü oluşturuldu (${RULE_COUNT} kural dosyası)${NC}"
echo -e "${GREEN}✓ paywall-docs/ klasörü oluşturuldu (${DOC_COUNT} döküman)${NC}"
echo ""
echo -e "${BLUE}╔═══════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  🎉 Kurulum tamamlandı!                                   ║${NC}"
echo -e "${BLUE}╚═══════════════════════════════════════════════════════════╝${NC}"
echo ""
echo "📁 Oluşturulan yapı:"
echo "   .cursor/"
echo "   └── rules/"
echo "       ├── paywall-core.mdc      (Her zaman aktif)"
echo "       ├── odeme-servisi.mdc     (Ödeme konularında aktif)"
echo "       ├── tekrarli-odeme.mdc    (Subscription konularında aktif)"
echo "       ├── kart-saklama.mdc      (Kart konularında aktif)"
echo "       ├── pazaryeri.mdc         (Marketplace konularında aktif)"
echo "       ├── payout.mdc            (Para çekme konularında aktif)"
echo "       ├── cuzdan.mdc            (Wallet konularında aktif)"
echo "       ├── fiziksel-pos.mdc      (POS konularında aktif)"
echo "       ├── apm.mdc               (APM konularında aktif)"
echo "       ├── toplu-islem.mdc       (Batch konularında aktif)"
echo "       ├── diger-servisler.mdc   (Masterpass, Link/QR vs.)"
echo "       └── webhook-hata.mdc      (Webhook/Hata konularında aktif)"
echo "   paywall-docs/                 (443 döküman)"
echo ""
echo "💬 Şimdi Cursor'da şunları sorabilirsin:"
echo "   • 3D ödeme nasıl yapılır?"
echo "   • Tekrarlı ödeme nasıl oluşturulur?"
echo "   • İade işlemi nasıl yapılır?"
echo "   • Hata kodu 1001 ne demek?"
echo ""
