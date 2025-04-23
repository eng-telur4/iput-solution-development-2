#!/bin/bash

# IPアドレスが指定されていない場合は終了
if [ "$#" -eq 0 ]; then
    echo "使い方: $0 <IPアドレス1> [<IPアドレス2> ...]"
    exit 1
fi

# "ssh" サービスを対象にした rich rule だけを削除
sudo firewall-cmd --zone=public --list-rich-rules | while read -r rule; do
    if echo "$rule" | grep -q "service name=\"ssh\""; then
        echo "Removing SSH rule: $rule"
        sudo firewall-cmd --zone=public --remove-rich-rule="$rule" --permanent
    else
        echo "Keeping non-SSH rule: $rule"
    fi
done

# 引数で指定されたすべてのIPに対して SSH のルールを追加
for IP in "$@"; do
    echo "Adding SSH rule for $IP"
    sudo firewall-cmd --zone=public --add-rich-rule="rule family='ipv4' source address='$IP' service name='ssh' accept" --permanent
done

# 設定を反映
sudo firewall-cmd --reload

# 最終的な設定を確認
sudo firewall-cmd --list-all
