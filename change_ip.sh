#!/bin/bash

# 第1引数をIPアドレスとして受け取る
IP="$1"

if [ -z "$IP" ]; then
    echo "使い方: $0 <IPアドレス>"
    exit 1
fi

# すべてのリッチルールを削除
sudo firewall-cmd --zone=public --list-rich-rules | while read -r rule; do
    echo "Removing: $rule"
    sudo firewall-cmd --zone=public --remove-rich-rule="$rule" --permanent
done

# 指定されたIPのルールを個別に削除（念のため）
sudo firewall-cmd --zone=public --add-rich-rule="rule family='ipv4' source address='$IP' service name='ssh' accept" --permanent

# 設定反映
sudo firewall-cmd --reload

# 設定確認
sudo firewall-cmd --list-all