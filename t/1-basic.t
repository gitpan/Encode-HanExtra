#!/usr/bin/perl -w
# $File: //member/autrijus/Encode-HanExtra/t/1-basic.t $ $Author: autrijus $
# $Revision: #3 $ $Change: 3889 $ $DateTime: 2002/04/18 07:10:01 $

use strict;
use Test::More tests => 6;

use_ok('Encode');
use_ok('Encode::HanExtra');

my $char = v20154; # 'Human' in chinese

is(Encode::decode(big5plus => '¤H'), $char);
is(Encode::decode(cccii => "\x21\x30\x64"), $char);
is(Encode::decode('euc-tw' => 'Ä©'), $char);
is(Encode::decode(gb18030 => 'ÈË'), $char);
