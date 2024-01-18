# robosys2023_ReverseString
[![test](https://github.com/Orbital-G/robosys2023_ReverseString/actions/workflows/test.yml/badge.svg)](https://github.com/Orbital-G/robosys2023_ReverseString/actions/workflows/test.yml)
## 本パッケージについて
このパッケージは2023年度ロボットシステム学の課題2に提出するパッケージです。  
標準入力に打ち込んだ文字列を逆にして返します(例: neko→oken)

## インストール方法
使っているROS 2のワークスペース内のsrc下にこのリポジトリをクローンしてください。
```
$ git clone https://github.com/Orbital-G/robosys2023_ReverseString.git
```

## 使用方法
reverse_stringとenter_stringをそれぞれ別の端末で実行します。  

入力を待機しているenter_stringに文字列を打ち込み、Enterキーを押すと
文字列がトピックとして送信(パブリッシュ)され、reverse_stringで文字列のトピックを受信(サブスクライブ)して逆に変換し、それを表示します
- 端末1
```
$ ros2 run ReverseString enter_string

~~~~~~~~~~~~~~~

Enter: neko
[INFO] [1705601243.154367433] [original_string]: Published: neko
```

- 端末2
```
$ ros2 run ReverseString reverse_string

~~~~~~~~~~~~~~~

[INFO] [1705601243.156678376] [reversed_string]: Reversed String: oken
reverce: oken
```
## enter_string
実行すると標準入力を待機するので、"Enter : "に続いて文字列を打ち込み、Enterキーを押して入力します。  
標準入力に打ち込まれた文字列をString型のトピック'/original_string'として送信(パブリッシュ)します。
```
$ ros2 run ReverseString enter_string
Enter:neko
[INFO] [1705603362.880706091] [original_string]: Published: neko
Enter:ねこ
[INFO] [1705603365.489288068] [original_string]: Published: ねこ
Enter:

~~~~~~~~~~~~~~~~

(別の端末で)
$ ros2 topic list | grep original_string
/original_string

```

## reverse_string
トピック'/original_string'を受信(サブスクライブ)し、それを逆にした文字列に変換し、それを標準出力します。
```
$ ros2 run ReverseString reverse_string
[INFO] [1705603362.916692664] [reversed_string]: Reversed String: oken
reverce: oken
[INFO] [1705603365.492888568] [reversed_string]: Reversed String: こね
reverce: こね
```

## 動作環境
- OS: Ubuntu 20.04/Ubuntu22.04
- ROS 2 Distribution: ROS 2 foxy/ROS 2 humble

## ライセンス情報
- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます。
- © 2024 Kadono Kodai