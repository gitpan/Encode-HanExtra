# $File: //member/autrijus/Encode-HanExtra/HanExtra.pm $ $Author: autrijus $
# $Revision: #6 $ $Change: 3935 $ $DateTime: 2002/04/21 06:53:00 $

package Encode::HanExtra;
use 5.007003;

our $VERSION = '0.05';
use Encode;
use XSLoader;
XSLoader::load(__PACKAGE__, $VERSION);

Encode::define_alias( qr/\bbig5-?e(xt)?$/i	=> '"big5ext"' );
Encode::define_alias( qr/\bbig5-?p(lus)?$/i	=> '"big5plus"' );
Encode::define_alias( qr/\bbig5\+$/i		=> '"big5plus"' );
Encode::define_alias( qr/\bcccii$/i		=> '"cccii"' );
Encode::define_alias( qr/\beuc.*tw$/i		=> '"euc-tw"' );
Encode::define_alias( qr/\btw.*euc$/i		=> '"euc-tw"' );
Encode::define_alias( qr/\bGB[-_ ]?18030/i	=> '"gb18030"' );

1;

__END__

=head1 NAME

Encode::HanExtra - Extra sets of Chinese encodings

=head1 VERSION

This document describes version 0.05 of Encode::HanExtra, released
April 21, 2002.

=head1 SYNOPSIS

    use Encode;

    # Traditional Chinese
    $euc_tw = encode("euc-tw", $utf8);   # loads Encode::HanExtra implicitly
    $utf8   = decode("euc-tw", $euc_tw); # ditto

    # Simplified Chinese
    $gb18030 = encode("gb18030", $utf8);    # loads Encode::HanExtra implicitly
    $utf8    = decode("gb18030", $gb18030); # ditto

=head1 DESCRIPTION

Perl 5.7.3 and later ships with an adequate set of Chinese encodings,
including the most used C<CP950>, C<CP936> (also known as C<GBK>),
C<Big5>, C<Big5-HKSCS>, C<EUC-CN>, C<HZ>, and C<ISO-IR-165>.

However, the numbers of Chinese encodings are staggering, and a complete
coverage will easily increase the size of perl distribution by several
megabytes; hence, this CPAN module tries to provide the rest of them.

If you are using perl 5.8 or better, L<Encode::CN> and L<Encode::TW> will
automatically load the extra encodings for you, so there's no need to
explicitly write C<use Encode::HanExtra> if you are using one of them
already.

=head1 ENCODINGS

This version includes the following encoding tables:

  Canonical   Alias			Description
  --------------------------------------------------------------------
  big5ext     /\bbig5-?e(xt)?$/i	CMEX's Big5e Extension
  big5plus    /\bbig5-?p(lus)?$/i	CMEX's Big5+ Extension
	      /\bbig5\+$/i	
  cccii       /\bcccii$/i		Chinese Character Code for
					Information Interchange
  euc-tw      /\beuc.*tw$/i		EUC (Extended Unix Character)
	      /\btw.*euc$/i
  gb18030     /\bGB[-_ ]?18030$/i	GBK with Traditional Characters

Detailed descriptions are as follows:

=over 4

=item BIG5PLUS

This encoding, while not heavily used, is an attempt to bring all Taiwan's
conflicting internal-use encodings together, and fit it as an extension to
the widely-deployed Big5 range.

=item CCCII

The earliest Traditional Chinese encoding, a three-byte raw character map
made in 1980, used mostly in library systems.

=item EUC-TW

The EUC transport version of C<CNS11643> (planes 1-7), the comprehensive
character set used by the Taiwan government.

=item GB18030

An extension to GBK, this encoding lists most Han characters (both simplified
and traditional), as well as some other encodings used by other peoples in
China.

=back

=head1 NOTES

If you are looking for ways to transliterate between Simplified and
Traditional Chinese, please take a look at L<Encode::HanConvert>. Note
that the direct mapping via Unicode is lossy, and usually doesn't work
at all.

Please send me suggestions if you want to see the following encodings added:
C<BIG5-1984> (superseded by C<BIG5-ETEN>), C<BIG5-GCCS> (superseded by
C<BIG5-HKSCS>). Other suggestions are welcome, too.

=head1 SEE ALSO

L<Encode>, L<Encode::HanConvert>

=head1 ACKNOWLEDGEMENTS

Some of the maps here are generated from GNU libiconv's test files,
with kind permission from Bruno Haible.

Map for C<BIG5PLUS> is generated from the F<BIG52UCS.TXT> file,
courtesy of CMEX Taiwan (L<http://wcmex.org.tw/>).

=head1 AUTHORS

Autrijus Tang E<lt>autrijus@autrijus.orgE<gt>

=head1 COPYRIGHT

Copyright 2002 by Autrijus Tang E<lt>autrijus@autrijus.orgE<gt>.

This program is free software; you can redistribute it and/or 
modify it under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=cut
