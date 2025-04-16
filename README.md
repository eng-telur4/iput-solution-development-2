# iput-solution-development-2

## AlmaLinux初期設定

### 1. パッケージのアップデート

```
sudo dnf update -y
```

### 2. 主要ファイル名の英語設定

```
LANG=C xdg-user-dirs-gtk-update
```

- その後に出るダイアログで、Do not ask this questionにチェックを入れて、Updateを選択する

### 3. vimの設定

- すでにvimはインストール済み。ホームディレクトリに「.vimrc」を作成して、設定を記述。[参考サイト](https://qiita.com/iwaseasahi/items/0b2da68269397906c14c "初心者向け vimrcの設定方法")

- rootのvimにも反映させるため、```sudo cp ~/.vimrc /root/```を実行

### 4. 日本語入力

- コマンド実行

```
sudo dnf install epel-release
sudo dnf install ibus ibus-anthy ibus-gtk2 ibus-gtk3
ibus-daemon -rd
```

- 以下を```~/.bashrc```に記述

```
export GTK_IM_MODULE=ibus
export GT_IN_MODULE=ibus
export XMODIFIERS="@im=ibus"
```

- コマンド実行

```
source ~/.bashrc
```

- 設定を開き、「キーボード」->「入力ソース」->「+」をクリックし「日本語」->「Anthy」を追加。この入力ソース以外の物を削除する

### 5. SSH接続設定

- ```ip a```と```hostname -I```をつかって、AlmaLinuxのPCのTK-AP-371でのIPアドレスを確認する

- ```sudo vim /etc/ssh/sshd_config```を編集し、以下を追加で記述

```
PermitRootLogin no
AllowUsers skamijo
PasswordAuthentication yes
```

- 手元のPCもTK-AP-371に接続詞、コマンドプロンプトからssh skamijo@<確認したAlmaLinuxのIPアドレス>でアクセスできることを確認する

### 6. SSH接続用ファイアウォールの設定

- WindowPCをSSIDがTK-AP-371のWi-Fiに接続し、コマンドプロンプトで```ipconfig```を実行し、```Connection-specific DNS Suffix```の部分が```tokyo-net.nkz.ac.jp```になっている```IPv4 Address```のIPアドレス
を確認する

```
sudo firewall-cmd --zone=public --add-rich-rule='rule family="ipv4" source address="<WindowsPCのIPアドレス>" service name="ssh" accept' --permanent
```
```
sudo firewall-cmd --zone=public --reload
```
```
sudo firewall-cmd --zone=public --list-all
```

- WindowsPCのIPアドレスを更新するとき

```
sudo firewall-cmd --zone=public --remove-rich-rule='rule family="ipv4" source address="<WindowsPCのIPアドレス>" service name="ssh" accept' --permanent
```
```
sudo firewall-cmd --zone=public --add-rich-rule='rule family="ipv4" source address="<WindowsPCのIPアドレス>" service name="ssh" accept' --permanent
```
```
sudo firewall-cmd --zone=public --reload
```
```
sudo firewall-cmd --zone=public --list-all
```
