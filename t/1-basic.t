#!/usr/bin/perl -w
# $File: //member/autrijus/Encode-HanExtra/t/1-basic.t $ $Author: autrijus $
# $Revision: #2 $ $Change: 3489 $ $DateTime: 2002/03/20 00:36:57 $

use strict;
use Test::More tests => 5;

use_ok('Encode');
use_ok('Encode::HanExtra');

my $char = v20154; # 'Human' in chinese

is(Encode::decode('euc-tw' => 'Ä©'), $char);
is(Encode::decode(gb18030 => 'ÈË'), $char);
is(Encode::decode(big5plus => '¤H'), $char);
