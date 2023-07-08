BXwareki Package
================

LaTeX: Support for Japanese calendar

This package provides commands to convert from the Gregorian calendar
(2018/8/28) to the Japanese rendering of the Japanese calendar (Heisei
30 nen 8 gatsu 28 nichi; actually with kanji characters). You can choose
whether the numbers are written in Western numerals or kanji numerals.

Note that the package only deals with dates in the year 1873 or later,
where the Japanese calendar is really a Gregorian calendar with the
different notation of years.

### System requirement

  * TeX format: LaTeX.
  * TeX engine: pdfTeX, LuaTeX, XeTeX, pTeX, upTeX, ApTeX (pTeX-ng),
    and NTT-jTeX. (The e-TeX extension is not needed.)

### Installation

  - `*.sty`, `*.def` → $TEXMF/tex/latex/BXwareki

### License

This package is distributed under the MIT License.


The bxwareki Package ― main
----------------------------

See the manual `bxwareki.pdf` for detail.


Revision History
----------------

  * Version 0.7  ‹2023/07/07›
      - Support for the fallback mode.
      - Add `\WarekiUseNoInterGlue`.
      - Add `\WarekiKansuji` and `\WarekiJKansuji`.
  * Version 0.6  ‹2019/06/01›
      - The file `bxwareki2019.def` is no longer required.
  * Version 0.5  ‹2019/04/01›
      - Support for the new gengo “令和”.
  * Version 0.4  ‹2018/10/01›
      - Add `\warekigengoinitial`.
      - Add option `download2019`.
  * Version 0.3  ‹2018/09/24›
      - The total rewrite.
  * Version 0.2  ‹2018/04/08›
      - The first public version.

--------------------
Takayuki YATO (aka. "ZR")  
https://github.com/zr-tex8r
