# $File: //member/autrijus/Encode-HanExtra/HanExtra.pm $ $Author: autrijus $
# $Revision: #4 $ $Change: 5948 $ $DateTime: 2003/05/18 21:09:04 $

package Encode::HanExtra;
use 5.007003;

our $VERSION = '0.08';
use Encode;
use XSLoader;
XSLoader::load(__PACKAGE__, $VERSION);

Encode::define_alias( qr/\b(?:cmex-)?big5-?e(?:xt)?$/i	=> '"big5ext"' );
Encode::define_alias( qr/\b(?:cmex-)?big5-?p(?:lus)?$/i	=> '"big5plus"' );
Encode::define_alias( qr/\b(?:cmex-)?big5\+$/i		=> '"big5plus"' );
Encode::define_alias( qr/\b(?:ccag-)?cccii$/i		=> '"cccii"' );
Encode::define_alias( qr/\bunisys$/i		=> '"unisys"' );
Encode::define_alias( qr/\beuc.*tw$/i		=> '"euc-tw"' );
Encode::define_alias( qr/\btw.*euc$/i		=> '"euc-tw"' );
Encode::define_alias( qr/\bGB[-_ ]?18030/i	=> '"gb18030"' );
Encode::define_alias( qr/\bCNS[-_ ]?11643[-_]1/i	=> '"cns11643-1"' );
Encode::define_alias( qr/\bCNS[-_ ]?11643[-_]2/i	=> '"cns11643-2"' );
Encode::define_alias( qr/\bCNS[-_ ]?11643[-_]3/i	=> '"cns11643-3"' );
Encode::define_alias( qr/\bCNS[-_ ]?11643[-_]4/i	=> '"cns11643-4"' );
Encode::define_alias( qr/\bCNS[-_ ]?11643[-_]5/i	=> '"cns11643-5"' );
Encode::define_alias( qr/\bCNS[-_ ]?11643[-_]6/i	=> '"cns11643-6"' );
Encode::define_alias( qr/\bCNS[-_ ]?11643[-_]7/i	=> '"cns11643-7"' );
Encode::define_alias( qr/\bCNS[-_ ]?11643[-_]f/i	=> '"cns11643-f"' );

1;

__END__

=head1 NAME

Encode::HanExtra - Extra sets of Chinese encodings

=head1 VERSION

This document describes version 0.08 of Encode::HanExtra, released
May 19, 2002.

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

  Canonical   Alias				Description
  -----------------------------------------------------------------------------
  big5ext     /\b(cmex-)?big5-?e(xt)?$/i	CMEX's Big5e Extension
  big5plus    /\b(cmex-)?big5-?p(lus)?$/i	CMEX's Big5+ Extension
	      /\b(cmex-)?big5\+$/i
  cccii       /\b(ccag-)?cccii$/i		Chinese Character Code for
						Information Interchange
  cns11643-1  /\bCNS[-_ ]?11643[-_]1$/i		Taiwan's CNS map, plane 1
  cns11643-2  /\bCNS[-_ ]?11643[-_]2$/i		Taiwan's CNS map, plane 2
  cns11643-3  /\bCNS[-_ ]?11643[-_]3$/i		Taiwan's CNS map, plane 3
  cns11643-4  /\bCNS[-_ ]?11643[-_]4$/i		Taiwan's CNS map, plane 4
  cns11643-5  /\bCNS[-_ ]?11643[-_]5$/i		Taiwan's CNS map, plane 5
  cns11643-6  /\bCNS[-_ ]?11643[-_]6$/i		Taiwan's CNS map, plane 6
  cns11643-7  /\bCNS[-_ ]?11643[-_]7$/i		Taiwan's CNS map, plane 7
  cns11643-f  /\bCNS[-_ ]?11643[-_]f$/i		Taiwan's CNS map, plane F
  euc-tw      /\beuc.*tw$/i			EUC (Extended Unix Character)
	      /\btw.*euc$/i
  gb18030     /\bGB[-_ ]?18030$/i		GBK with Traditional Characters
  unisys      /\bunisys$/i			Unisys Traditional Chinese
  unisys-sosi1					Unisys SOSI1 transport encoding
  unisys-sosi2					Unisys SOSI2 transport encoding

Detailed descriptions are as follows:

=over 4

=item BIG5PLUS

This encoding, while not heavily used, is an attempt to bring all Taiwan's
conflicting internal-use encodings together, and fit it as an extension to
the widely-deployed Big5 range, by CMEX Taiwan.

=item BIG5EXT

The CMEX's second (and less ambitious try) at unifying the most commonly
used characters not covered by Big5, while not polluting out of the 94x94
arragement like BIG5PLUS did.

=item CCCII

The earliest (and most sophisticated) Traditional Chinese encoding, with a
three-byte raw character map, made in 1980 by the Chinese Character Analysis
Group (CCAG), used mostly in library systems.

=item EUC-TW

The EUC transport version of C<CNS11643> (planes 1-7), the comprehensive
character set used by the Taiwan government.

=item CNS11643-*

The raw character map extracted from the Unihan database, including the
plane F which wasn't included in C<EUC-TW>.

=item GB18030

An extension to GBK, this encoding lists most Han characters (both simplified
and traditional), as well as some other encodings used by other peoples in
China.

=item UNISYS

Unisys System's internal Chinese mapping.

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
courtesy of CMEX Taiwan (Chinese Microcomputer Extended Foundation,
L<http://www.cmex.org.tw/>).

=head1 AUTHORS

Autrijus Tang E<lt>autrijus@autrijus.orgE<gt>

=head1 COPYRIGHT

Copyright 2002, 2003 by Autrijus Tang E<lt>autrijus@autrijus.orgE<gt>.

This program is free software; you can redistribute it and/or 
modify it under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=cut
