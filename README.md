BXwareki Package
================

LaTeX: Support for Japanese calendar (和暦), including the new gengo

### System requirement

  * TeX format: LaTeX.
  * TeX engine: pTeX, upTeX, LuaTeX, XeTeX, pdfTeX, pTeX-ng, NTT-jTeX.

### Installation

  - `*.sty` → $TEXMF/tex/latex/BXwareki

### License

This package is distributed under the MIT License.


The bxwareki Package ― main
----------------------------

### Package Loading

    \usepackage{bxwareki}

日本語でおｋ
------------

文書クラス・パッケージ作製者用の機能：

  * `\WarekiGengo`：［一般］ 元号の文字列。ただし和暦が利用できない場合は
    空になる。
  * `\WarekiYear`：［数値レジスタ］ 和暦の年の数値。和暦が利用できない場合
    は西暦年となる。

ユーザ用の機能：

  * `\warekitoday`： ［一般］ 和暦で「平成30年8月8日」の形式で今日の日付を
    出力する。和暦が利用できない場合は西暦になる。

注意事項：

  * 和暦が利用できる範囲：
      * 1970 年以降に限られる。
      * 2019 年の“新元号”に対応するには、新元号の文字列の情報を記した
        ファイル bxwareki2019.def が存在する必要がある。
      * 新元号の公布後に bxwareki2019.def をダウンロードするコマンドを
        用意すればよい？
  * pTeX 系・XeTeX・LuaTeX においては `\WarekiGengo` と `\warekitoday` の
    内容は単なる文字列（文字トークンの列）である。それ以外では、これらの
    2 つのマクロは完全展開可能でない。
  * pdfTeX の場合は、CJK パッケージを前提とした定義になっている。
      * 和文文字は UTF-8 のバイト列（アクティブ化文字トークンの列）で表現
        される。
      * 和欧文間空白として `~` を入れている。


Revision History
----------------

  * Version 0.2 ‹2018/04/08›
      - The first public version.

--------------------
Takayuki YATO (aka. "ZR")  
http://zrbabbler.sp.land.to/
