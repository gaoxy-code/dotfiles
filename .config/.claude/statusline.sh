#!/bin/bash
# 標準入力からJSON形式のデータを読み込む
input=$(cat)

# --- 各種情報を取得 ---
model=$(echo "$input" | jq -r '.model.display_name // "Claude"')
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# ホームディレクトリを ~ に短縮
home="$HOME"
dir="${cwd/#$home/~}"

# パスを最大2セグメントに短縮（starship の truncation_length=6 に近い挙動）
short_dir=$(echo "$dir" | awk -F'/' '{
  n = NF
  if (n <= 3) { print $0 }
  else { print "..." "/" $(n-1) "/" $n }
}')

# git ブランチ取得（オプション、失敗しても無視）
git_branch=""
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
  branch=$(git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    # git ステータス簡易チェック
    git_flags=""
    if ! git -C "$cwd" diff --quiet 2>/dev/null; then git_flags="${git_flags}!"; fi
    if ! git -C "$cwd" diff --cached --quiet 2>/dev/null; then git_flags="${git_flags}+"; fi
    if [ -n "$(git -C "$cwd" ls-files --others --exclude-standard 2>/dev/null)" ]; then git_flags="${git_flags}?"; fi
    if [ -n "$git_flags" ]; then
      git_branch=" [$branch ${git_flags}]"
    else
      git_branch=" [$branch]"
    fi
  fi
fi

# コンテキスト使用率
ctx_str=""
if [ -n "$used" ]; then
  ctx_str=" | ctx:$(printf '%.0f' "$used")%"
fi

# 時刻
time_str=$(date +%H:%M)

# ステータスライン表示
printf "%s%s | %s%s | %s\n" "$short_dir" "$git_branch" "$model" "$ctx_str" "$time_str"
