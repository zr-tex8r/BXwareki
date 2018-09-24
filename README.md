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

Note: The modern (post-1873) Japanese calendar (*wareki*; 和暦) can be
regarded as a variant of Gregorian calendar where only the notation of
years differs from the original. To avoid confusion, this document refers
to the original Gregorian calendar as the *Western calendar*, which
corresponds to the Japanese term *seireki* (西暦).

### Package Loading

    \usepackage{bxwareki}

### Usage

#### Conversion from the given date

  * `\warekisetdate{<year>}{<month>}{<day>}`: Converts from the specified
    Western date. The result will be rendered by the commands described
    at the following items, where the result for the invocation
    `\warekisetdate{2018}{8}{28}` will be shown as example.

    Note: Although the Japanese calendar differs from the Western calendar
    only in the notation of years, the value of months and days are still
    required, since the notation of the year in which *kaigen* (改元;
    change of gengo) occurs depends on months and days.

  * `\warekisettoday`: Does `\warekisetdate` with the current date.

  * Counter `warekiyear`: The year number (within the gengo); e.g. 30.

    Note: Unlike ordinary counters, the assignment to `warekiyear` by
    `\warekisetdate` is *local*. Moreover, manual assignment to this
    counter is not supported.

  * `\warekigengo`: The gengo in kanji, e.g. “平成”.

  * `\warekiyear`: The full notation of the year (without ‘年’),
    e.g. “平成30”.

    Note: When the year number is one, the kanji ‘元’ is used instead
    of the numeral ‘1’.

  * `\warekidate`: The date string, e.g. “平成30年8月28日”.

  * `\warekikanjidate`: The date string using kansuji (kanji numerals),
    e.g. “平成三〇年八月二八日”.

  * `\warekijkanjidate`: The date string using “kansuji-by-reading”
    (that is, kanji rendering of numbers in the Japanese language),
    e.g. “平成三十年八月二十八日”.

  * `\warekicustomdate{<option>}`: The date string in the form specified
    with the option. The option is a string of letters such as `wk` and
    each letter means a specific setting. When the option is empty, the
    date is rendered in the form “2018年8月28日” (using the Western
    calendar). The available option letters are:

      - `w`: uses Japanese calendar (2018年 → 平成30年)
      - `k`: uses kansuji (28 → 二八)
      - `j`: uses kansuji-by-reading (28 → 二十八)  
        Note: Western years does not support kansuji-by-reading and thus
        `k` will be applied instead (二〇一八, not 二千十八)
      - `J`: variant of `j` where “ten’s multiple” kanji characters
        (廿 and 卅) are employed (28 → 廿八)
      - `o`: uses *imyo* (異名) for months (8月 → 葉月)  
        (Don’t ask me if this form is ever used in LaTeX document!)

    Note: This command is supported only on pdfLaTeX, XeLaTeX, LuaLaTeX,
    upLaTeX, ApLaTeX and recent versions of pLaTeX. On other engines it
    simply falls back to `\warekidate`.

  * `\WarekiIfCustomDateAvailable{<true>}{<false>}`: Tests if the command
    `\warekicustomdate` is supported on the engine in use.

#### Current date

These commands always represent the current date, and are not affected
by `\warekisetdate` (or `\warekisettoday`).

  * `\warekitoday`: The `\warekidate` form of the current date.
  * `\warekikanjitoday`: The `\warekikanjidate` form.
  * `\warekijkanjitoday`: The `\warekijkanjidate` form.

#### Inter-alphabet-kanji glues

In quality Japanese typesetting, a thin space (*shibuaki*; 四分空き)
must be inserted between an alphabet letter and a kanji letter. This
package by default inserts a command suitable for the most prevalent
Japanese-typesetting environment for the engine in use.

  * On pLaTeX, upLaTeX and ApLaTeX: Nothing is inserted, since the engine
    can automatically insert shibuaki spaces.
  * On LuaLaTeX and XeLaTeX: Nothing is inserted, on the assumption that
    the package for Japanese typesetting (such as LuaTeXja and xeCJK)
    will automatically insert shibuaki spaces.
  * On LaTeX and pdfLaTeX: `~` is inserted, on the assumption that the
    CJK package is employed and `\CJKtilde` is in effect.

On the engines with e-TeX extension, the command for shibuaki can be
changed with the following commands:

  * `\WarekiUseCustomInterGlue{<text>}`: Uses `<text>` for making shibuaki
    spaces.
  * `\WarekiUseNormalInterGlue`: Reverts `\WarekiUseCustomInterGlue` and
    uses the normal setting.

### Support for the kaigen planned in 2019

In Japan a kaigen (due to the abdication of the Emperor) is planned on
2019/05/01, but the new gengo is not yet announced. Thus in the current
version of the package, the date of the day or later is not supported
(the Western year will be printed instead).
.
This package will be updated to support the new gengo and uploaded to
CTAN, as soon as the new gengo is announced.

### Notices for TeX programmers

  * On the engines with support for native kanji/Unicode characters
    (i.e. LuaLaTeX, XeLaTeX, pLaTeX, upLaTeX, and ApLaTeX), the content
    (one-level expansion) of `\wareki…date` (except `\warekicustomdate`)
    and `\wareki…today` is a simple string of character tokens, unless
    `\WarekiUseCustomInterGlue` is in effect. The same holds for LaTeX
    and pdfLaTeX, except that each kanji character is represented by the
    sequence of activated byte tokens and `~` is inserted as shibuaki
    spaces.
  * On the engines with native kanji/Unicode support, `\warekicustomdate`
    fully expands to a simple string of character tokens (again without
    `\WarekiUseCustomInterGlue`), and the situation on LaTeX and pdfLaTeX
    is parallel to that described at the item above.
  * The use of `\WarekiUseCustomInterGlue` does not break the full
    expandability of `\wareki…date` and `\wareki…today` on the engines
    with native kanji/Unicode support.


Revision History
----------------

  * Version 0.3  ‹2018/09/24›
      - The total rewrite.
  * Version 0.2  ‹2018/04/08›
      - The first public version.

--------------------
Takayuki YATO (aka. "ZR")  
http://zrbabbler.sp.land.to/
