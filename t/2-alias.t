#!/usr/bin/perl -w
# $File: //member/autrijus/Encode-HanExtra/t/2-alias.t $ $Author: autrijus $
# $Revision: #1 $ $Change: 3489 $ $DateTime: 2002/03/20 00:36:57 $

use strict;
use Test::More tests => 4;
use Encode;
use Encode::HanExtra;

print "# alias test\n";

my %a2c = qw(
	     big5p      big5plus
	     big5-plus  big5plus
	     zh_TW.euc	euc-tw
	     x-euc-tw   euc-tw
	     );

foreach my $a (keys %a2c){	     
    my $e = Encode::find_encoding($a);
    my $n =  $e->name || $e->{name};
    is($n, $a2c{$a});
}

