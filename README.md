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

## Git 管理しないファイルを dotfiles で管理する

`.netrc` のように認証情報を含むファイルは Git にコミットしたくないが、dotfiles ディレクトリで一元管理したい場合の手順。

### 手順

1. **dotfiles 配下にファイルを作成**

   ```zsh
   touch ~/works/dev/dotfiles/.netrc
   chmod 600 ~/works/dev/dotfiles/.netrc  # 機密ファイルは権限を絞る
   ```

2. **`.gitignore` に追加**

   リポジトリにコミットされないように `.gitignore` へ追記する。

   ```
   # Secrets
   .netrc
   ```

3. **ホームディレクトリにシンボリックリンクを作成**

   ```zsh
   ln -s ~/works/dev/dotfiles/.netrc ~/.netrc
   ```

4. **`setup.sh` への追記は不要**

   Git 管理しないファイルは他マシンに clone しても存在しないため、`setup.sh` には追加しない。新しいマシンでセットアップする際は手動で 1〜3 を再実行する。

### 現在 Git 管理外で扱っているファイル

| リポジトリ | ホームディレクトリ | 用途           |
| ---------- | ------------------ | -------------- |
| `.netrc`   | `~/.netrc`         | API 認証情報等 |
