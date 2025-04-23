#!/bin/bash

# IPアドレスが指定されていない場合は終了
if [ "$#" -eq 0 ]; then
    echo "使い方: $0 <IPアドレス1> [<IPアドレス2> ...]"
    exit 1
fi

# すべての既存リッチルールを削除
sudo firewall-cmd --zone=public --list-rich-rules | while read -r rule; do
    echo "Removing: $rule"
    sudo firewall-cmd --zone=public --remove-rich-rule="$rule" --permanent
done

# 引数で指定されたすべてのIPに対してルールを追加
for IP in "$@"; do
    echo "Adding rule for $IP"
    sudo firewall-cmd --zone=public --add-rich-rule="rule family='ipv4' source address='$IP' service name='ssh' accept" --permanent
done

# 設定を反映
sudo firewall-cmd --reload

# 最終的な設定を確認
sudo firewall-cmd --list-all
