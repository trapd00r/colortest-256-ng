use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
  NAME                => 'c256',
  AUTHOR              => q{Magnus Woldrich <trapd00r@trapd00r.se>},
  VERSION_FROM        => './c256',
  ABSTRACT_FROM       => './c256',

  ($ExtUtils::MakeMaker::VERSION >= 6.3002
    ? ('LICENSE'=> 'perl')
    : ()),

  PL_FILES            => {},

  PREREQ_PM           => {
  },

  EXE_FILES           => ['./c256'],

  MAN1PODS            => {
    './c256'          => 'blib/man1/c256.1',
  },

  MIN_PERL_VERSION => '5.10.0',

  dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
);
