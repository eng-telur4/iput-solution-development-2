# iput-solution-development-2

## 動作環境

- ハードウェアモデル：NEC PC-VRT16FBGS3R6
- メモリ 7.4 GiB
- プロセッサー：Intel Core i5-8265U CPU @ 1.60Hz × 8
- グラフィック：Mesa Intel UHD Graphics 620 (WH GT2)
- ディスク容量：500.1 GB
- OS名：AlmaLinux 9.6 (Sage Margay)
- OSの種類：64ビット
- GNOMEのバージョン：40.4.0
- ウィンドウシステム：Wayland

```sh
[skamijo@localhost ~]$ cat /etc/os-release 
NAME="AlmaLinux"
VERSION="9.6 (Sage Margay)"
ID="almalinux"
ID_LIKE="rhel centos fedora"
VERSION_ID="9.6"
PLATFORM_ID="platform:el9"
PRETTY_NAME="AlmaLinux 9.6 (Sage Margay)"
ANSI_COLOR="0;34"
LOGO="fedora-logo-icon"
CPE_NAME="cpe:/o:almalinux:almalinux:9::baseos"
HOME_URL="https://almalinux.org/"
DOCUMENTATION_URL="https://wiki.almalinux.org/"
BUG_REPORT_URL="https://bugs.almalinux.org/"

ALMALINUX_MANTISBT_PROJECT="AlmaLinux-9"
ALMALINUX_MANTISBT_PROJECT_VERSION="9.6"
REDHAT_SUPPORT_PRODUCT="AlmaLinux"
REDHAT_SUPPORT_PRODUCT_VERSION="9.6"
SUPPORT_END=2032-06-01
```

## AlmaLinux初期設定

### 1. パッケージのアップデート

```sh
sudo dnf update -y
```

### 2. 主要ファイル名の英語設定

```sh
LANG=C xdg-user-dirs-gtk-update
```

- その後に出るダイアログで、Do not ask this questionにチェックを入れて、Updateを選択する

### 3. vimの設定

- すでにvimはインストール済み。ホームディレクトリに「.vimrc」を作成して、設定を記述。[参考サイト](https://qiita.com/iwaseasahi/items/0b2da68269397906c14c "初心者向け vimrcの設定方法")

- rootのvimにも反映させるため、```sudo cp ~/.vimrc /root/```を実行

### 4. 日本語入力

- コマンド実行

```sh
sudo dnf install epel-release
sudo dnf install ibus ibus-anthy ibus-gtk2 ibus-gtk3
ibus-daemon -rd
```

- 以下を```~/.bashrc```に記述

```sh
export GTK_IM_MODULE=ibus
export GT_IN_MODULE=ibus
export XMODIFIERS="@im=ibus"
```

- コマンド実行

```sh
source ~/.bashrc
```

- 設定を開き、「キーボード」->「入力ソース」->「+」をクリックし「日本語」->「Anthy」を追加。この入力ソース以外の物を削除する

### 5. SSH接続設定

- ```ip a```と```hostname -I```をつかって、AlmaLinuxのPCのTK-AP-371でのIPアドレスを確認する

- ```sudo vim /etc/ssh/sshd_config```を編集し、以下を追加で記述

```sh
PermitRootLogin no
AllowUsers skamijo
PasswordAuthentication yes
```

- 手元のPCもTK-AP-371に接続詞、コマンドプロンプトからssh skamijo@<確認したAlmaLinuxのIPアドレス>でアクセスできることを確認する

### 6. SSH接続用ファイアウォールの設定

- WindowPCをSSIDがTK-AP-371のWi-Fiに接続し、コマンドプロンプトで```ipconfig```を実行し、```Connection-specific DNS Suffix```の部分が```tokyo-net.nkz.ac.jp```になっている```IPv4 Address```のIPアドレス
を確認する

```sh
sudo firewall-cmd --zone=public --add-rich-rule='rule family="ipv4" source address="<WindowsPCのIPアドレス>" service name="ssh" accept' --permanent
```
```sh
sudo firewall-cmd --reload
```
```sh
sudo firewall-cmd --list-all
```

- WindowsPCのIPアドレスを更新するとき

```sh
sudo firewall-cmd --zone=public --remove-rich-rule='rule family="ipv4" source address="<WindowsPCのIPアドレス>" service name="ssh" accept' --permanent
```
```sh
sudo firewall-cmd --zone=public --add-rich-rule='rule family="ipv4" source address="<WindowsPCのIPアドレス>" service name="ssh" accept' --permanent
```
```sh
sudo firewall-cmd --reload
```
```sh
sudo firewall-cmd --list-all
```

-- SSH接続全体の許可をなくす

```sh
sudo firewall-cmd --zone=public --remove-service=ssh --permanent
```
```sh
sudo firewall-cmd --reload
```
```sh
sudo firewall-cmd --list-all
```

- (補足)firewallのゾーン(適用範囲)を確認する：```public:```の下にwifiのIDがあれば良い(例：wlp0s20f3のように、wlから始まる文字列)

```
sudo firewall-cmd --get-active-zones
```

## 毎回のPC接続時

### 1. SSH接続用のIPアドレスの設定

```sh
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

```

### 2. 有線LANのIPアドレス

- 以下のコマンドをクライアント側（送信側）で実行し、プライベートIP「192.168.1.10/24」にする

```sh
sudo nmcli con mod enp0s31f6 ipv4.method manual ipv4.addresses 192.168.1.10/24
sudo nmcli con mod enp0s31f6 ipv4.dns ""
sudo nmcli con up enp0s31f6
```

- 以下のコマンドをサーバ側（受信側）で実行し、プライベートIP「192.168.1.20/24」にする

```sh
sudo nmcli con mod enp0s31f6 ipv4.method manual ipv4.addresses 192.168.1.20/24
sudo nmcli con mod enp0s31f6 ipv4.dns ""
sudo nmcli con up enp0s31f6
```

- 以下のコマンドをクライアント・サーバ側両方で実行し、有線LANのIPアドレスがしっかりと設定をされていることを確認する

```sh
ip a
hostname -I
```
