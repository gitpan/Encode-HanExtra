# $File: //member/autrijus/Encode-HanConvert/HanConvert.pm $ $Author: autrijus $
# $Revision: #2 $ $Change: 3341 $ $DateTime: 2002/03/03 21:43:55 $

package Encode::HanExtra;
use 5.007002;

our $VERSION = '0.01';
use XSLoader;

XSLoader::load('Encode::HanExtra',$VERSION);

1;

__END__

=head1 NAME

Encode::HanExtra - Extra sets of Chinese encodings

=head1 VERSION

This document describes version 0.02 of Encode::HanExtra, released
March 4, 2002.

=head1 SYNOPSIS

    use Encode::HanExtra; # needs perl 5.7.2 or better

    use encoding 'euc-tw'; # or gb18030, or big5plus...

=head1 DESCRIPTION

Perl 5.7.3 and later ships with an adequate set of Chinese encodings,
including the most used C<CP950>, C<CP936>, C<Big5>, C<Big5-HKSCS>,
C<EUC-CN>, C<GBK> and C<ISO-IR-165>.

However, the numbers of Chinese encodings are staggering, and a complete
coverage will easily increase the size of perl distribution by several
megabytes; hence, this CPAN module tries to provide the rest of them.

=head1 ENCODINGS

This version includes the following encoding tables:

=over 4

=item EUC-TW

The EUC transport version of C<CNS11643> (planes 1-7), the comprehensive
character set used by the Taiwan government.

=item GB18030

An extension to GBK, this encoding lists most Han characters (both simplified
and traditional), as well as some other encodings used by other peoples in
China.

=item BIG5PLUS

This encoding, while not heavily used, is an attempt to bring all Taiwan's
conflicting internal-use encodings together, and fit it as an extension to
the widely-deployed Big5 range.

=head1 NOTES

If you are looking for ways to transliterate between Simplified and
Traditional Chinese (instead of mapping them lossily via unicode), 
please take a look at L<Encode::HanConvert>.

Please send me suggestions if you want to see the following encodings added:
C<BIG5E>, C<BIG5-GCCS>, C<GB-GCCS>, C<CCCII>. Other suggestions are welcome,
too.

=head1 SEE ALSO

L<Encode>

=head1 ACKNOWLEDGEMENTS

Thanks to the
Some of the maps here are generated from GNU libiconv's test files,
with kind permission from Bruno Haible. The F<compile> and F<encode.h>
are lifted from the B<Encode> distribution, which is part of the
standard perl distribution.

=head1 AUTHORS

Autrijus Tang E<lt>autrijus@autrijus.orgE<gt>

=head1 COPYRIGHT

Copyright 2002 by Autrijus Tang E<lt>autrijus@autrijus.orgE<gt>.

This program is free software; you can redistribute it and/or 
modify it under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=cut
