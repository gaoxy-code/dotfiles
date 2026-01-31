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

- **Formulae**: gh, lazygit, nodebrew, pyenv, tcl-tk, yarn
- **Casks**: Android Studio, Docker Desktop, Ghostty, Google Chrome, IntelliJ IDEA CE, LINE, Notion, Raycast, Run Cat, Slack, Typora, Visual Studio Code, Warp
- **VS Code Extensions**: Dart, Flutter, ESLint, GitLens, Prettier等

### Configuration

- **ghostty/config**: Ghostty設定
- **zsh/**: Zsh設定
