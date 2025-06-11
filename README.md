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

- /etc/os-release

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

- uname -a

```sh
[skamijo@localhost ~]$ uname -a
Linux localhost.localdomain 5.14.0-570.18.1.el9_6.x86_64 #1 SMP PREEMPT_DYNAMIC Tue May 27 21:47:45 EDT 2025 x86_64 x86_64 x86_64 GNU/Linux
```

- /proc/cpuinfo

```sh
[skamijo@localhost ~]$ cat /proc/cpuinfo 
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i5-8265U CPU @ 1.60GHz
stepping	: 12
microcode	: 0xfc
cpu MHz		: 600.031
cache size	: 6144 KB
physical id	: 0
siblings	: 8
core id		: 0
cpu cores	: 4
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp vnmi md_clear flush_l1d arch_capabilities
vmx flags	: vnmi preemption_timer invvpid ept_x_only ept_ad ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid unrestricted_guest ple pml ept_violation_ve ept_mode_based_exec
bugs		: spectre_v1 spectre_v2 spec_store_bypass swapgs itlb_multihit srbds mmio_stale_data retbleed eibrs_pbrsb gds bhi
bogomips	: 3600.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 1
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i5-8265U CPU @ 1.60GHz
stepping	: 12
microcode	: 0xfc
cpu MHz		: 600.154
cache size	: 6144 KB
physical id	: 0
siblings	: 8
core id		: 1
cpu cores	: 4
apicid		: 2
initial apicid	: 2
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp vnmi md_clear flush_l1d arch_capabilities
vmx flags	: vnmi preemption_timer invvpid ept_x_only ept_ad ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid unrestricted_guest ple pml ept_violation_ve ept_mode_based_exec
bugs		: spectre_v1 spectre_v2 spec_store_bypass swapgs itlb_multihit srbds mmio_stale_data retbleed eibrs_pbrsb gds bhi
bogomips	: 3600.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 2
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i5-8265U CPU @ 1.60GHz
stepping	: 12
microcode	: 0xfc
cpu MHz		: 600.020
cache size	: 6144 KB
physical id	: 0
siblings	: 8
core id		: 2
cpu cores	: 4
apicid		: 4
initial apicid	: 4
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp vnmi md_clear flush_l1d arch_capabilities
vmx flags	: vnmi preemption_timer invvpid ept_x_only ept_ad ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid unrestricted_guest ple pml ept_violation_ve ept_mode_based_exec
bugs		: spectre_v1 spectre_v2 spec_store_bypass swapgs itlb_multihit srbds mmio_stale_data retbleed eibrs_pbrsb gds bhi
bogomips	: 3600.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 3
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i5-8265U CPU @ 1.60GHz
stepping	: 12
microcode	: 0xfc
cpu MHz		: 599.998
cache size	: 6144 KB
physical id	: 0
siblings	: 8
core id		: 3
cpu cores	: 4
apicid		: 6
initial apicid	: 6
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp vnmi md_clear flush_l1d arch_capabilities
vmx flags	: vnmi preemption_timer invvpid ept_x_only ept_ad ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid unrestricted_guest ple pml ept_violation_ve ept_mode_based_exec
bugs		: spectre_v1 spectre_v2 spec_store_bypass swapgs itlb_multihit srbds mmio_stale_data retbleed eibrs_pbrsb gds bhi
bogomips	: 3600.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 4
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i5-8265U CPU @ 1.60GHz
stepping	: 12
microcode	: 0xfc
cpu MHz		: 400.000
cache size	: 6144 KB
physical id	: 0
siblings	: 8
core id		: 0
cpu cores	: 4
apicid		: 1
initial apicid	: 1
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp vnmi md_clear flush_l1d arch_capabilities
vmx flags	: vnmi preemption_timer invvpid ept_x_only ept_ad ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid unrestricted_guest ple pml ept_violation_ve ept_mode_based_exec
bugs		: spectre_v1 spectre_v2 spec_store_bypass swapgs itlb_multihit srbds mmio_stale_data retbleed eibrs_pbrsb gds bhi
bogomips	: 3600.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 5
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i5-8265U CPU @ 1.60GHz
stepping	: 12
microcode	: 0xfc
cpu MHz		: 588.333
cache size	: 6144 KB
physical id	: 0
siblings	: 8
core id		: 1
cpu cores	: 4
apicid		: 3
initial apicid	: 3
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp vnmi md_clear flush_l1d arch_capabilities
vmx flags	: vnmi preemption_timer invvpid ept_x_only ept_ad ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid unrestricted_guest ple pml ept_violation_ve ept_mode_based_exec
bugs		: spectre_v1 spectre_v2 spec_store_bypass swapgs itlb_multihit srbds mmio_stale_data retbleed eibrs_pbrsb gds bhi
bogomips	: 3600.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 6
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i5-8265U CPU @ 1.60GHz
stepping	: 12
microcode	: 0xfc
cpu MHz		: 599.606
cache size	: 6144 KB
physical id	: 0
siblings	: 8
core id		: 2
cpu cores	: 4
apicid		: 5
initial apicid	: 5
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp vnmi md_clear flush_l1d arch_capabilities
vmx flags	: vnmi preemption_timer invvpid ept_x_only ept_ad ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid unrestricted_guest ple pml ept_violation_ve ept_mode_based_exec
bugs		: spectre_v1 spectre_v2 spec_store_bypass swapgs itlb_multihit srbds mmio_stale_data retbleed eibrs_pbrsb gds bhi
bogomips	: 3600.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 7
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i5-8265U CPU @ 1.60GHz
stepping	: 12
microcode	: 0xfc
cpu MHz		: 400.000
cache size	: 6144 KB
physical id	: 0
siblings	: 8
core id		: 3
cpu cores	: 4
apicid		: 7
initial apicid	: 7
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp vnmi md_clear flush_l1d arch_capabilities
vmx flags	: vnmi preemption_timer invvpid ept_x_only ept_ad ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid unrestricted_guest ple pml ept_violation_ve ept_mode_based_exec
bugs		: spectre_v1 spectre_v2 spec_store_bypass swapgs itlb_multihit srbds mmio_stale_data retbleed eibrs_pbrsb gds bhi
bogomips	: 3600.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:
```

- free -m

```sh
[skamijo@localhost ~]$ free -m
               total        used        free      shared  buff/cache   available
Mem:            7558        2358        4206         372        1630        5199
Swap:           7947           0        7947
```

- df -BM --total

```sh
[skamijo@localhost ~]$ df -BM --total
ファイルシス                 1M-ブロック  使用  使用可 使用% マウント位置
devtmpfs                              4M    0M      4M    0% /dev
tmpfs                              3780M    0M   3780M    0% /dev/shm
tmpfs                              1512M   12M   1501M    1% /run
/dev/mapper/almalinux00-root      71600M 5373M  66228M    8% /
/dev/sda3                           960M  608M    353M   64% /boot
/dev/mapper/almalinux00-home     274047M 3172M 270875M    2% /home
tmpfs                               756M    1M    756M    1% /run/user/1000
total                            352657M 9164M 343494M    3% -
```

- vmstat 1 2

```sh
[skamijo@localhost ~]$ vmstat 1 2
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 0  0      0 4358712   3008 1609160    0    0   106    41  334  368  4  2 92  2  0
 0  0      0 4360224   3008 1609356    0    0     0     0 1014  900  1  1 99  0  0
```

- lsblk

```sh
[skamijo@localhost ~]$ lsblk
NAME                                          MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINTS
sda                                             8:0    0 465.8G  0 disk  
├─sda1                                          8:1    0     1G  0 part  
├─sda2                                          8:2    0 118.2G  0 part  
│ ├─almalinux-swap                            253:0    0   7.8G  0 lvm   
│ ├─almalinux-home                            253:5    0  40.5G  0 lvm   
│ └─almalinux-root                            253:6    0    70G  0 lvm   
├─sda3                                          8:3    0     1G  0 part  /boot
├─sda4                                          8:4    0     1K  0 part  
└─sda5                                          8:5    0 345.5G  0 part  
  └─luks-0c2f6ca8-a837-4311-9648-adfa76f1f12e 253:1    0 345.5G  0 crypt 
    ├─almalinux00-root                        253:2    0    70G  0 lvm   /
    ├─almalinux00-swap                        253:3    0   7.8G  0 lvm   [SWAP]
    └─almalinux00-home                        253:4    0 267.8G  0 lvm   /home
sr0                                            11:0    1  1024M  0 rom  
```

- ss -ta

```sh
[skamijo@localhost ~]$ ss -ta
State           Recv-Q          Send-Q                    Local Address:Port                       Peer Address:Port           
LISTEN          0               4096                          127.0.0.1:ipp                             0.0.0.0:*              
LISTEN          0               128                             0.0.0.0:ssh                             0.0.0.0:*              
ESTAB           0               0                         10.205.104.10:34728                     34.107.243.93:https          
ESTAB           0               0                         10.205.104.10:45802                     140.82.113.25:https          
LISTEN          0               4096                              [::1]:ipp                                [::]:*              
LISTEN          0               128                                [::]:ssh  
```

- ip addr

```sh
[skamijo@localhost ~]$ ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s31f6: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN group default qlen 1000
    link/ether f4:6e:24:19:39:72 brd ff:ff:ff:ff:ff:ff
3: wlp0s20f3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether c8:b2:9b:ee:70:cd brd ff:ff:ff:ff:ff:ff
    inet 10.205.104.10/19 brd 10.205.127.255 scope global dynamic noprefixroute wlp0s20f3
       valid_lft 2424sec preferred_lft 2424sec
    inet6 fe80::ab0b:b690:fe85:1f12/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
```

- journalctl -q _COMM=sudo

```sh
[skamijo@localhost ~]$ journalctl -q _COMM=sudo
 6月 11 12:39:22 localhost.localdomain sudo[4560]:  skamijo : TTY=pts/0 ; PWD=/home/skamijo ; USER=root ; COMMAND=/bin/firewal>
 6月 11 12:39:22 localhost.localdomain sudo[4560]: pam_unix(sudo:session): session opened for user root(uid=0) by skamijo(uid=>
 6月 11 12:39:22 localhost.localdomain sudo[4560]: pam_unix(sudo:session): session closed for user root
 6月 11 12:41:08 localhost.localdomain sudo[4674]:  skamijo : TTY=pts/0 ; PWD=/home/skamijo ; USER=root ; COMMAND=/bin/nmcli ->
 6月 11 12:41:08 localhost.localdomain sudo[4674]: pam_unix(sudo:session): session opened for user root(uid=0) by skamijo(uid=>
 6月 11 12:41:08 localhost.localdomain sudo[4674]: pam_unix(sudo:session): session closed for user root
```

- others

```
[skamijo@localhost ~]$ python -V
Python 3.9.21
[skamijo@localhost ~]$ python3 -V
Python 3.9.21
[skamijo@localhost ~]$ sudo firewall-cmd --version
1.3.4
[skamijo@localhost ~]$ ibus version
IBus 1.5.25
[skamijo@localhost ~]$ vim --version
VIM - Vi IMproved 8.2 (2019 Dec 12, compiled Feb 25 2025 00:00:00)
[skamijo@localhost ~]$ bash --version
GNU bash, バージョン 5.1.8(1)-release (x86_64-redhat-linux-gnu)
Copyright (C) 2020 Free Software Foundation, Inc.
ライセンス GPLv3+: GNU GPL バージョン 3 またはそれ以降 <http://gnu.org/licenses/gpl.html>

This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
[skamijo@localhost ~]$ sudo nmcli --version
nmcli ツール、バージョン 1.52.0-3.el9_6
[skamijo@localhost ~]$ ip -Version
ip utility, iproute2-6.11.0, libbpf 1.5.0
[skamijo@localhost ~]$ hostname --version
hostname 3.23
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
