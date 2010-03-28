#!/usr/bin/perl
# colortest-256-ng 
# prints table of available colors for terminals supporting 256 colors
# trapd00r 2010
use strict;

my %colors;
for(my $i=0;$i<256;++$i) {
  $i = sprintf("%03s", $i);
  my $escaped_escape = "\\033[38;5;$i".'m';
  $colors{$escaped_escape} = "\033[38;5;$i".'m';
}
foreach my $str(sort(keys(%colors))) {
  print "$str $colors{$str}\n";
}
