package Net::ResellerClub;
our $VERSION = "1.00";
use Carp qw/croak/;
use strict;
use warnings;
use Data::Dumper;
use Module::Pluggable::Object;
use Net::ResellerClub::DirectIXMLIO;
my $finder = Module::Pluggable::Object->new(search_path=> ["Net::ResellerClub"], require => 1);
my %methods;
for my $c (grep /Service$/, $finder->plugins) { 
    push @{$methods{$_}}, $c for keys %{$c->_methods};
}
#die Dumper\%methods;

sub new {
    my ($self, %args) = @_;
    warn Dumper \%args;
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
        die("SOAP call failed: ".Dumper($som));
    }

    return DirectIXMLIO::ParseXML($som->result);
}

1;
