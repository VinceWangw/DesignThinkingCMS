#!/bin/sh

# ���������ʧ�ܣ�ֹͣ����
set -e
printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"
hugo

# ����������blog�����
git add .
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"
git push origin master

# ����������<userName>.github.io�����
cd public
git add .
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"
git push origin master