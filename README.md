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
enter_string内に文字列を打ち込み、Enterキーを押すとreverse_stringが逆になった文字列を表示します
- 端末1
```
ros2 run ReverseString enter_string

~~~~~~~~~~~~~~~

Enter:neko
[INFO] [1705601243.154367433] [original_string]: Published: neko
```

- 端末2
```
ros2 run ReverseString reverse_string

~~~~~~~~~~~~~~~

[INFO] [1705601243.156678376] [reversed_string]: Reversed String: oken
reverce: oken

```

## 動作環境
- OS: Ubuntu 20.04/Ubuntu22.04
- ROS 2 Distribution: ROS 2 foxy/ROS 2 humble

## ライセンス情報
- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます。
- © 2024 Kadono Kodai