#!/usr/bin/perl
# colortest-256-ng 
# prints table of available colors for terminals supporting 256 colors
# trapd00r 2010
use strict;
use Getopt::Long;

my %colors;
for(my $i=0;$i<256;++$i) {
  $i = sprintf("%03s", $i);
  my $escaped_escape = "\\033[38;5;$i".'m';
  $colors{$escaped_escape} = "\033[38;5;$i".'m';
}

if(!@ARGV) {
  foreach my $str(sort(keys(%colors))) {
    print "$str $colors{$str}\n";
  }
  print << "USAGE";

 USAGE: $0 [-c <cmd|text>]
USAGE
exit 0;
}

our (@opt_cmd, $opt_reverse);
GetOptions('cmd=s'   =>  \@opt_cmd,
           'reverse' =>  \$opt_reverse,
         );
if(@opt_cmd) {
  &cmd(@opt_cmd);
}

sub cmd {
  my @str = (@_); # "$(uptime)"
  if(!$opt_reverse) {
    foreach my $color(sort(values(%colors))) {
      print $color, "$_\n" for @str;
    }
    exit 0;
  }
  if($opt_reverse) {
    foreach my $color(reverse(sort(values(%colors)))) {
      print $color, "$_\n" for @str;
    }
    exit 0;
  }
}

&cmd;
