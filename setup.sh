#!/bin/bash

# dotfiles ディレクトリのパス
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 色付き出力用
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# ロギング関数
log_info() {
    echo -e "${GREEN}✓${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}⚠${NC} $1"
}

log_error() {
    echo -e "${RED}✗${NC} $1"
}

# シンボリックリンクを作成する関数
create_symlink() {
    local src=$1
    local dest=$2
    local name=$3

    # 対象ディレクトリが存在しない場合は作成
    dest_dir=$(dirname "$dest")
    if [ ! -d "$dest_dir" ]; then
        mkdir -p "$dest_dir"
        log_info "ディレクトリ作成: $dest_dir"
    fi

    # 既存ファイルがある場合の処理
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        if [ -L "$dest" ]; then
            if [ "$(readlink "$dest")" = "$src" ]; then
                log_warn "$name は既にリンク済みです"
                return 0
            else
                log_error "$name はすでに存在し、別のリンク先を指しています"
                return 1
            fi
        else
            log_error "$name はすでにファイルとして存在します。バックアップを検討してください"
            return 1
        fi
    fi

    # シンボリックリンク作成
    ln -s "$src" "$dest"
    log_info "$name をリンク: $dest"
}

ERRORS=()

echo "dotfiles のセットアップを開始します..."
echo "dotfiles パス: $DOTFILES_DIR"
echo ""

# Homebrew パッケージのインストール
if command -v brew &>/dev/null; then
    log_info "Homebrew パッケージをインストール中..."
    brew bundle --file="$DOTFILES_DIR/Brewfile" || ERRORS+=("Homebrew パッケージのインストール失敗")
else
    log_warn "Homebrew が見つかりません。先にインストールしてください:"
    echo "  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    echo ""
fi

# 各ファイルのシンボリックリンク作成
echo ""
echo "シンボリックリンクを作成中..."
create_symlink "$DOTFILES_DIR/.config/git/config"             "$HOME/.config/git/config"             "Git設定"             || ERRORS+=("Git設定 のシンボリックリンク作成失敗")
create_symlink "$DOTFILES_DIR/.config/git/ignore"             "$HOME/.config/git/ignore"             "Git global ignore"  || ERRORS+=("Git global ignore のシンボリックリンク作成失敗")
create_symlink "$DOTFILES_DIR/.config/ghostty/config"         "$HOME/.config/ghostty/config"         "Ghostty設定"         || ERRORS+=("Ghostty設定 のシンボリックリンク作成失敗")
create_symlink "$DOTFILES_DIR/.config/lazygit/config.yml"     "$HOME/.config/lazygit/config.yml"     "Lazygit設定"         || ERRORS+=("Lazygit設定 のシンボリックリンク作成失敗")
create_symlink "$DOTFILES_DIR/.config/zsh/.zshrc"             "$HOME/.zshrc"                         "Zsh設定"             || ERRORS+=("Zsh設定 のシンボリックリンク作成失敗")
create_symlink "$DOTFILES_DIR/.config/starship.toml"          "$HOME/.config/starship.toml"          "Starship設定"        || ERRORS+=("Starship設定 のシンボリックリンク作成失敗")
create_symlink "$DOTFILES_DIR/.config/.claude/CLAUDE.md"      "$HOME/.claude/CLAUDE.md"              "Claude Code設定"     || ERRORS+=("Claude Code設定 のシンボリックリンク作成失敗")
create_symlink "$DOTFILES_DIR/.config/.claude/settings.json"  "$HOME/.claude/settings.json"          "Claude Codeセキュリティ設定" || ERRORS+=("Claude Codeセキュリティ設定 のシンボリックリンク作成失敗")

echo ""
if [ ${#ERRORS[@]} -gt 0 ]; then
    log_error "以下の処理が失敗しました:"
    for err in "${ERRORS[@]}"; do
        echo "  - $err"
    done
    exit 1
else
    log_info "セットアップが完了しました！"
    echo "シェルを再起動するか、以下を実行してください:"
    echo "  source ~/.zshrc"
fi
