package Encode::TW::Unisys::SOSI1;

use strict;

use vars qw($VERSION);
$VERSION = do { my @r = (q$Revision: #1 $ =~ /\d+/g); sprintf "%d."."%02d" x $#r, @r };

use Encode ();

use base qw(Encode::Encoding);
__PACKAGE__->Define('unisys-sosi1');

sub needs_lines  { 1 }

sub perlio_ok { 
    return 0; # for the time being
}

sub decode
{
    my ($obj,$str,$chk) = @_;
    my $unisys = Encode::find_encoding('unisys');

    $str =~ s/\x2b([^\x2c]*)\x2c/' ' . $unisys->decode($1, $chk) . ' '/eg;
    return $str;
}

sub encode
{
    my ($obj,$str,$chk) = @_;
    my $unisys = Encode::find_encoding('unisys');

    $str =~ s/\x20?([^\x00-\x7f]+)\x20?/"\x2b" . $unisys->encode($1, $chk) . "\x2c"/eg;
    return $str;
}

1;
__END__


=head1 NAME

Encode::Unisys::SOSI1

=cut
