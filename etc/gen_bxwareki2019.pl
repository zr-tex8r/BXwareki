#!/usr/bin/env perl

use strict;
use utf8;
use Encode qw(encode decode);

my $gengo = '令和';
my $gengo_initial = 'R';
my $out_file = './bxwareki2019.def';

sub one_char {
  my ($ch) = @_;
  my $u8 = uc(unpack('H*', encode('utf8', $ch)));
  my $uc = sprintf("%04X", ord($ch));
  local $_ = encode('iso-2022-jp', $ch);
  s/^\x1b\x24.([\x21-\x7e]{2})\x1b\x28.$/$1/ or die "OOPS1";
  my $jc = uc(unpack('H*', encode('utf8', $_)));
  my ($jh, $jl) = map { ord($_) } (split(m//, $_));
  if (0x30 <= $jh && $jh <= 0x4F) {
    $_ = ($jh - 0x30) * 94 + ($jl - 0x21);
    ($jh, $jl) = (($_ >> 8) + ord('a'), $_ & 0xFF);
  } elsif (0x50 <= $jh && $jh <= 0x74) {
    $_ = ($jh - 0x50) * 94 + ($jl - 0x21);
    ($jh, $jl) = (($_ >> 8) + ord('m'), $_ & 0xFF);
  } else {
    die "Not a JISX0208 kanji (U+$uc)";
  }
  my $jt = sprintf("%c%02X", $jh, $jl);
  return "$u8:$uc:$jc:$jt";
}
{
  open(my $h, '>', $out_file)
    or die "Cannot open '$out_file' for output";
  binmode($h);
  foreach (split(m//, $gengo)) {
    print $h (one_char($_), "\n");
  }
  print $h ($gengo_initial, "\n");
  close($h);
}


