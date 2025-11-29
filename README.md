# unit_conversion
![test](https://github.com/fTomo-robot/robosys2025/actions/workflows/test.yml/badge.svg)  
コンデンサや抵抗の接頭辞を変換するコマンド  
	- 入力された電子部品の値を基本単位やその他の主な接頭辞をつけた状態で出力します

# 動作確認環境
- Ubuntu-22.04.5
- Python-3.13
	- python-version: [3.7, 3.8, 3.9, 3.10, 3.11, 3.12, 3.13] をGitHub Actions のテストにて動作確認済み
- re モジュール（標準ライブラリ）

# セットアップ
```bash:クローン
$ git clone https://github.com/fTomo-robot/robosys2025
$ cd robosys2025
$ chmod +x unit_conversion
```

# 使用方法
```bash:入力方法
$ echo "値と単位" | ./unit_conversion

#例
$ echo "0.033nF" | ./unit_conversion
```




# ライセンス・コピーライト
- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
- このパッケージのコードは，下記のスライド（CC-BY-SA 4.0 by Ryuichi Ueda）のものを，本人の許可を得て自身の著作としたものです．
    	- [ryuichiueda/my_slides robosys_2022](https://github.com/ryuichiueda/slides_marp/tree/master/prob_robotics_2025)
- © 2025 Tomotaka Fujiwara
