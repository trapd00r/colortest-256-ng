#!/usr/bin/perl
# colortest-256-ng 
# prints table of available colors for terminals supporting 256 colors
# trapd00r 2010
use strict;
use Getopt::Long;
use List::Util qw(shuffle);

my %colors;
for(my $i=0;$i<256;$i++) {
  $i = sprintf("%03s", $i);
  my $escaped_escape = "\\033[38;5;$i".'m';
  $colors{$escaped_escape} = "\033[38;5;$i".'m';
}

if(!@ARGV) {
  foreach my $str(sort(keys(%colors))) {
    print "$str $colors{$str}\n";
  }
  print "\033[0m\n";
  print << "USAGE";

 USAGE: $0 [-c <cmd>]

  EXAMPLES
    ls|./$0 -c
    ./$0 -c file
    dmesg|./$0

USAGE
exit 0;
}

GetOptions('cmd'   =>  \&cmd,
         );

sub cmd {
  while(<>) {
    my @colors = values %colors;
    @colors = shuffle(@colors);
    my @seen;
    my $i = 0;
    push(@seen, $colors[$i]);
    if($colors[0] ~~ @seen) {
      $i++;
      print $colors[0], $_;
    }
  }
}

