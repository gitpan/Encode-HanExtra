#!/usr/bin/perl -w

use strict;
use Test::More tests => 5;

use_ok('Encode');
use_ok('Encode::HanExtra');

my $char = v20154; # 'Human' in chinese

is(Encode::decode('euc-tw' => 'Ä©'), $char);
is(Encode::decode(gb18030 => 'ÈË'), $char);
is(Encode::decode(big5plus => '¤H'), $char);
