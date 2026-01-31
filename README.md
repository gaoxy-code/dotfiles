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

- **Formulae**: git, gh, lazygit, nodebrew, pnpm, pyenv, yarn
- **Casks**: Android Studio, Docker Desktop, Ghostty, Google Chrome, IntelliJ IDEA CE, LINE, Notion, Postman, Raycast, Run Cat, Slack, Typora, Visual Studio Code, Warp, Hack Nerd Font
- **VS Code Extensions**: Dart, Flutter, ESLint, GitLens, Prettier等

## 定期メンテ

```zsh
brew update
brew upgrade
brew cleanup
```

## Configuration

- **ghostty/config**: Ghostty設定
- **zsh/**: Zsh設定
