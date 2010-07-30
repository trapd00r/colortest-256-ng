#!/usr/bin/perl
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME => 'colortest-256-ng',
    ABSTRACT => 'Print a table of available 256 colors',
    AUTHOR => 'Magnus Woldrich <trapd00r@trapd00r.se',
    EXE_FILES => ['c256'],
    LICENSE => "GPLv2",
    MIN_PERL_VERSION => 5.000,
);


