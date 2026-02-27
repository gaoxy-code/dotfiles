# dotfiles

初期セットアップ用のスクリプトと設定ファイル

## Install

### Xcode Command Line Tools

```zsh
xcode-select --install
```

### Homebrew

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

```zsh
brew bundle
```

## Contents

### Brewfile

パッケージ管理ファイル。以下をまとめてインストール：

- **Formulae**: git, gh, lazygit, nodebrew, pnpm, pyenv, yarn, starship, zsh-autosuggestions, zsh-syntax-highlightling
- **Casks**: Android Studio, Docker, Ghostty, Google Chrome, IntelliJ IDEA CE, LINE, Notion, Raycast, Run Cat, Postman, Slack, Typora, Visual Studio Code, Warp, Hack Nerd Font
- **VS Code Extensions**: GitHub Copilot, GitHub Copilot Chat, GitHub Theme, GitHub Actions, VS Code Icons, Prettier, ESLint, GitLens, Git Graph

## 定期メンテ

```zsh
brew update
brew upgrade
brew cleanup
```

## Configuration

- **ghostty/config**: Ghostty設定
- **zsh/**: Zsh設定
