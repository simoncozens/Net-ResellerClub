package Net::ResellerClub;
our $VERSION = "1.00";
use Carp qw/croak/;
use strict;
use warnings;
use Module::Pluggable::Object;
use Net::ResellerClub::DirectIXMLIO;
my $finder = Module::Pluggable::Object->new(search_path=> ["Net::ResellerClub"], require => 1);
my %methods;
for my $c (grep /Service$/, $finder->plugins) { 
    push @{$methods{$_}}, $c for keys %{$c->_methods};
}

=head1 NAME

Net::ResellerClub - Perlish interface to ResellerClub's SOAP API

=head1 VERSION

Version 1.00

=head1 SYNOPSIS

    use Net::ResellerClub;

    my $rc = Net::ResellerClub->new(
        environment => "test",
        username => $username,
        password => $password,
        parent   => '999999998');

    $rc->DomOrder_list(@args); # call DomOrder.list

    $rc->DomOrder_cancelTransfer(1234); 
    # If the method name is unambiguous across classes, you can call it
    # directly:
    $rc->cancelTransfer(1234); 

=head1 FUNCTIONS

Ah, you'll want to be looking at the ResellerClub API Documentation
(such as it is) for those.

=cut

sub new {
    my ($self, %args) = @_;
    exists $args{$_} || die "$_ argument not supplied" for qw/username password parent/;
    bless {
        auth => [ $args{username}, $args{password}, "reseller", "en", $args{parent} ],
        service_url => $args{environment} eq "live" ?
            'https://www.foundationapi.com/anacreon/servlet/APIv3-XML' : 
            'https://api.onlyfordemo.net/anacreon/servlet/APIv3-XML'
    }, $self;
}

our $AUTOLOAD;

sub AUTOLOAD {
    my $self = shift;
    my $c = ref $self;
    $AUTOLOAD =~ s/^${c}:://;
    return if $AUTOLOAD eq "DESTROY";
    if ($AUTOLOAD =~ /([A-Z][a-z]+)_(\w+)/ and exists $methods{$2}) { # Qualified method
        $self->_call("Net::ResellerClub::${1}Service", $2, @_);
    }
    if (exists $methods{$AUTOLOAD}) {
        if (@{$methods{$AUTOLOAD}} == 1) { # Unique method
            $self->_call($methods{$AUTOLOAD}[0], $AUTOLOAD, @_);
        } else {
            croak "Ambiguous method; please call one of the following methods instead: ".join("_$AUTOLOAD ", @{$methods{$AUTOLOAD}});
        }
    }
    croak "Can't locate object method \"$AUTOLOAD\" via package \"$c\"";
}
sub _call {
    my ($self, $class, $method, @args) = @_;
    eval "use $class"; die $@ if $@;
    my $o = $class->new;
    foreach (keys %{$o->_methods}) {
        $o->_methods->{$_}->{'endpoint'} = $self->{service_url};
    }

    $o->want_som(1);
    my $som = $o->$method(@{$self->{auth}}, @args);
    if ($som->fault) {
        die("SOAP call failed: ".$som->faultstring);    
    }
    if (!defined($som->result) || !length($som->result)) {
        require Data::Dumper;
        die("SOAP call failed: ".Data::Dumper::Dumper($som));
    }

    return DirectIXMLIO::ParseXML($som->result);
}

=head1 AUTHOR

Simon Cozens, C<< <simon at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to Github
L<http://github.com/simoncozens/Net-ResellerClub/issues>. I will be notified,
and then you'll automatically be notified of progress on your bug as I make
changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Net::DomainRegistration::Simple

=head1 ACKNOWLEDGEMENTS

Thanks to the UK Free Software Network (http://www.ukfsn.org/) for their
support of this module's development. For free-software-friendly hosting
and other Internet services, try UKFSN.

=head1 COPYRIGHT & LICENSE

Copyright 2010 Simon Cozens.

This program is released under the following license: Perl

=cut

1;
