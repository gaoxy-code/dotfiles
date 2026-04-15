# dotfiles

初期セットアップ用のスクリプトと設定ファイル

## Install

### 1. Xcode Command Line Tools

```zsh
xcode-select --install
```

### 2. Homebrew

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 3. セットアップ実行

```zsh
./setup.sh
```

Homebrew パッケージのインストールと、設定ファイルのシンボリックリンク作成を自動で行います。

**トラブルシューティング**

既存ファイルがある場合、スクリプトは処理をスキップします。既存ファイルをバックアップしてから実行してください。

```zsh
# 例: 既存の .zshrc をバックアップ
mv ~/.zshrc ~/.zshrc.bak
./setup.sh
```

## Contents

### Brewfile

パッケージ管理ファイル。以下をまとめてインストール：

- **Formulae**: git, gh, lazygit, nodebrew, pnpm, pyenv, yarn, starship, zsh-autosuggestions, zsh-syntax-highlighting
- **Casks**: Android Studio, Ghostty, Google Chrome, IntelliJ IDEA CE, Notion, Raycast, Postman, Typora, Visual Studio Code, Warp, Hack Nerd Font
- **VS Code Extensions**: GitHub Copilot, GitHub Copilot Chat, GitHub Theme, GitHub Actions, VS Code Icons, Prettier, ESLint, GitLens, Git Graph

## 定期メンテ

```zsh
brew update
brew upgrade
brew cleanup
```

## Configuration

`setup.sh` を実行することで、以下のファイルがホームディレクトリの対応するパスにシンボリックリンクで配置されます。

| リポジトリ                      | ホームディレクトリ             |
| ------------------------------- | ------------------------------ |
| `.config/git/config`            | `~/.config/git/config`         |
| `.config/git/ignore`            | `~/.config/git/ignore`         |
| `.config/ghostty/config`        | `~/.config/ghostty/config`     |
| `.config/lazygit/config.yml`    | `~/.config/lazygit/config.yml` |
| `.config/starship.toml`         | `~/.config/starship.toml`      |
| `.config/zsh/.zshrc`            | `~/.zshrc`                     |
| `.config/.claude/CLAUDE.md`     | `~/.claude/CLAUDE.md`          |
| `.config/.claude/settings.json` | `~/.claude/settings.json`      |
