#!/bin/sh

# 如果命令行失败，停止部署
set -e
printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"
hugo

# 更新上述中blog代码仓
git add .
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"
git push origin master

# 更新上述中<userName>.github.io代码仓
cd public
git add .
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"
git push origin master