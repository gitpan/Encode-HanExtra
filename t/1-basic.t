#!/usr/bin/perl -w
# $File: //member/autrijus/Encode-HanExtra/t/1-basic.t $ $Author: autrijus $
# $Revision: #4 $ $Change: 3933 $ $DateTime: 2002/04/21 06:51:52 $

use strict;
use Test::More tests => 8;

use_ok('Encode');
use_ok('Encode::HanExtra');

my $char = v20154; # 'Human' in chinese

is(Encode::decode(big5ext => '¤H'), $char);
is(Encode::decode(big5plus => '¤H'), $char);
is(Encode::decode(cccii => "\x21\x30\x64"), $char);
is(Encode::decode('cns11643-1' => "D)"), $char);
is(Encode::decode('euc-tw' => "\x8E\xA1\xC4\xA9"), $char);
is(Encode::decode(gb18030 => 'ÈË'), $char);
