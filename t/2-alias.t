#!/usr/bin/perl -w
# $File: //member/autrijus/Encode-HanExtra/t/2-alias.t $ $Author: autrijus $
# $Revision: #1 $ $Change: 1 $ $DateTime: 2002/06/11 08:35:12 $

use strict;
use Test::More tests => 10;
use Encode;
use Encode::HanExtra;

print "# alias test\n";

my %a2c = qw(
	     big5-ext	big5ext
	     big5e	big5ext
	     big5+      big5plus
	     big5p      big5plus
	     big5-plus  big5plus
	     cmex-big5e	big5ext
	     ccag-cccii	cccii
	     zh_TW.euc	euc-tw
	     x-euc-tw   euc-tw
	     gb-18030	gb18030
	     );

foreach my $a (keys %a2c){	     
    my $e = Encode::find_encoding($a);
    my $n =  $e->name || $e->{name};
    is($n, $a2c{$a});
}

