package Net::ResellerClub::DigitalCertificateOrderService;
# Generated by SOAP::Lite (v0.710.10) for Perl -- soaplite.com
# Copyright (C) 2000-2006 Paul Kulchenko, Byrne Reese
# -- generated at [Wed May 26 15:19:21 2010]
# -- generated from file:../../APIKit/OtherProductsKIT/cgi-bin/lib/wsdl/DigitalCertificateOrder.wsdl
my %methods = (
renewCertificate => {
    endpoint => 'http://demo.myorderbox.com/anacreon/servlet/APIv3-XML',
    soapaction => '',
    namespace => 'com.logicboxes.foundation.sfnb.order.digicert.DigitalCertificateOrder',
    parameters => [
      SOAP::Data->new(name => 'userName', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'password', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'role', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'langpref', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'parentid', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'orderId', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'renewYears', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'additionalLicenses', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'existingEndTime', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'invoiceOption', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'renewHash', type => 'xsd:string', attr => {}),
    ], # end parameters
  }, # end renewCertificate
reissue => {
    endpoint => 'http://demo.myorderbox.com/anacreon/servlet/APIv3-XML',
    soapaction => '',
    namespace => 'com.logicboxes.foundation.sfnb.order.digicert.DigitalCertificateOrder',
    parameters => [
      SOAP::Data->new(name => 'userName', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'password', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'role', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'langpref', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'parentid', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'orderId', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'csrString', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'csrSoftware', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'approverEmail', type => 'xsd:string', attr => {}),
    ], # end parameters
  }, # end reissue
changeDigicertPassword => {
    endpoint => 'http://demo.myorderbox.com/anacreon/servlet/APIv3-XML',
    soapaction => '',
    namespace => 'com.logicboxes.foundation.sfnb.order.digicert.DigitalCertificateOrder',
    parameters => [
      SOAP::Data->new(name => 'userName', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'password', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'role', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'langpref', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'parentid', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'orderId', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'newPassword', type => 'xsd:string', attr => {}),
    ], # end parameters
  }, # end changeDigicertPassword
checkDigitalCertificateStatus => {
    endpoint => 'http://demo.myorderbox.com/anacreon/servlet/APIv3-XML',
    soapaction => '',
    namespace => 'com.logicboxes.foundation.sfnb.order.digicert.DigitalCertificateOrder',
    parameters => [
      SOAP::Data->new(name => 'userName', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'password', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'role', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'langpref', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'parentid', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'orderId', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'standardCertFormat', type => 'xsd:boolean', attr => {}),
    ], # end parameters
  }, # end checkDigitalCertificateStatus
enrollForThawteCertificate => {
    endpoint => 'http://demo.myorderbox.com/anacreon/servlet/APIv3-XML',
    soapaction => '',
    namespace => 'com.logicboxes.foundation.sfnb.order.digicert.DigitalCertificateOrder',
    parameters => [
      SOAP::Data->new(name => 'userName', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'password', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'role', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'langpref', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'parentid', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'orderId', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'enrollHash', type => 'xsd:string', attr => {}),
    ], # end parameters
  }, # end enrollForThawteCertificate
addCertificate => {
    endpoint => 'http://demo.myorderbox.com/anacreon/servlet/APIv3-XML',
    soapaction => '',
    namespace => 'com.logicboxes.foundation.sfnb.order.digicert.DigitalCertificateOrder',
    parameters => [
      SOAP::Data->new(name => 'userName', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'password', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'role', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'langpref', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'parentid', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'productKey', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'domainName', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'customerID', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'noOfYears', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'additionalLicenses', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'orderParams', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'invoiceOption', type => 'xsd:string', attr => {}),
    ], # end parameters
  }, # end addCertificate
add => {
    endpoint => 'http://demo.myorderbox.com/anacreon/servlet/APIv3-XML',
    soapaction => '',
    namespace => 'com.logicboxes.foundation.sfnb.order.digicert.DigitalCertificateOrder',
    parameters => [
      SOAP::Data->new(name => 'userName', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'password', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'role', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'langpref', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'parentid', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'productKey', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'domainName', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'customerID', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'noOfYears', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'orderParams', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'invoiceOption', type => 'xsd:string', attr => {}),
    ], # end parameters
  }, # end add
addAdditionalLicenses => {
    endpoint => 'http://demo.myorderbox.com/anacreon/servlet/APIv3-XML',
    soapaction => '',
    namespace => 'com.logicboxes.foundation.sfnb.order.digicert.DigitalCertificateOrder',
    parameters => [
      SOAP::Data->new(name => 'userName', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'password', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'role', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'langpref', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'parentid', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'orderId', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'noOfAdditionalLicenses', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'invoiceOption', type => 'xsd:string', attr => {}),
    ], # end parameters
  }, # end addAdditionalLicenses
del => {
    endpoint => 'http://demo.myorderbox.com/anacreon/servlet/APIv3-XML',
    soapaction => '',
    namespace => 'com.logicboxes.foundation.sfnb.order.digicert.DigitalCertificateOrder',
    parameters => [
      SOAP::Data->new(name => 'userName', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'password', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'role', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'langpref', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'parentid', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'orderID', type => 'xsd:int', attr => {}),
    ], # end parameters
  }, # end del
getOrderIdByDomain => {
    endpoint => 'http://demo.myorderbox.com/anacreon/servlet/APIv3-XML',
    soapaction => '',
    namespace => 'com.logicboxes.foundation.sfnb.order.digicert.DigitalCertificateOrder',
    parameters => [
      SOAP::Data->new(name => 'SERVICE_USERNAME', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'SERVICE_PASSWORD', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'SERVICE_ROLE', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'SERVICE_LANGPREF', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'SERVICE_PARENTID', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'domainName', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'productkey', type => 'xsd:string', attr => {}),
    ], # end parameters
  }, # end getOrderIdByDomain
getDetails => {
    endpoint => 'http://demo.myorderbox.com/anacreon/servlet/APIv3-XML',
    soapaction => '',
    namespace => 'com.logicboxes.foundation.sfnb.order.digicert.DigitalCertificateOrder',
    parameters => [
      SOAP::Data->new(name => 'SERVICE_USERNAME', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'SERVICE_PASSWORD', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'SERVICE_ROLE', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'SERVICE_LANGPREF', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'SERVICE_PARENTID', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'orderId', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'option', type => 'xsd:string', attr => {}),
    ], # end parameters
  }, # end getDetails
renew => {
    endpoint => 'http://demo.myorderbox.com/anacreon/servlet/APIv3-XML',
    soapaction => '',
    namespace => 'com.logicboxes.foundation.sfnb.order.digicert.DigitalCertificateOrder',
    parameters => [
      SOAP::Data->new(name => 'userName', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'password', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'role', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'langpref', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'parentid', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'entityId', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'renewYears', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'existingEndTime', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'csrString', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'invoiceOption', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'additionalLicenses', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'orgName', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'orgStreet', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'orgCity', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'orgRegion', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'orgZip', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'orgCountry', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'orgPhone', type => 'xsd:string', attr => {}),
    ], # end parameters
  }, # end renew
getCertPrice => {
    endpoint => 'http://demo.myorderbox.com/anacreon/servlet/APIv3-XML',
    soapaction => '',
    namespace => 'com.logicboxes.foundation.sfnb.order.digicert.DigitalCertificateOrder',
    parameters => [
      SOAP::Data->new(name => 'userName', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'password', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'role', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'langpref', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'parentid', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'productkey', type => 'xsd:string', attr => {}),
    ], # end parameters
  }, # end getCertPrice
getDetailsByDomain => {
    endpoint => 'http://demo.myorderbox.com/anacreon/servlet/APIv3-XML',
    soapaction => '',
    namespace => 'com.logicboxes.foundation.sfnb.order.digicert.DigitalCertificateOrder',
    parameters => [
      SOAP::Data->new(name => 'SERVICE_USERNAME', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'SERVICE_PASSWORD', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'SERVICE_ROLE', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'SERVICE_LANGPREF', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'SERVICE_PARENTID', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'domainName', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'option', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'productkey', type => 'xsd:string', attr => {}),
    ], # end parameters
  }, # end getDetailsByDomain
cancelDigicertOrder => {
    endpoint => 'http://demo.myorderbox.com/anacreon/servlet/APIv3-XML',
    soapaction => '',
    namespace => 'com.logicboxes.foundation.sfnb.order.digicert.DigitalCertificateOrder',
    parameters => [
      SOAP::Data->new(name => 'userName', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'password', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'role', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'langpref', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'parentid', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'orderId', type => 'xsd:int', attr => {}),
    ], # end parameters
  }, # end cancelDigicertOrder
); # end my %methods

use SOAP::Lite;
use Exporter;
use Carp ();

use vars qw(@ISA $AUTOLOAD @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter SOAP::Lite);
@EXPORT_OK = (keys %methods);
%EXPORT_TAGS = ('all' => [@EXPORT_OK]);

sub _call {
    my ($self, $method) = (shift, shift);
    my $name = UNIVERSAL::isa($method => 'SOAP::Data') ? $method->name : $method;
    my %method = %{$methods{$name}};
    $self->proxy($method{endpoint} || Carp::croak "No server address (proxy) specified")
        unless $self->proxy;
    my @templates = @{$method{parameters}};
    my @parameters = ();
    foreach my $param (@_) {
        if (@templates) {
            my $template = shift @templates;
            my ($prefix,$typename) = SOAP::Utils::splitqname($template->type);
            my $method = 'as_'.$typename;
            # TODO - if can('as_'.$typename) {...}
            my $result = $self->serializer->$method($param, $template->name, $template->type, $template->attr);
            push(@parameters, $template->value($result->[2]));
        }
        else {
            push(@parameters, $param);
        }
    }
    $self->endpoint($method{endpoint})
       ->ns($method{namespace})
       ->on_action(sub{qq!"$method{soapaction}"!});
  $self->serializer->register_ns("http://schemas.xmlsoap.org/wsdl/soap/","wsdlsoap");
  $self->serializer->register_ns("com.logicboxes.foundation.sfnb.order.digicert.DigitalCertificateOrder","intf");
  $self->serializer->register_ns("http://xml.apache.org/xml-soap","apachesoap");
  $self->serializer->register_ns("com.logicboxes.foundation.sfnb.order.digicert.DigitalCertificateOrder","impl");
  $self->serializer->register_ns("http://schemas.xmlsoap.org/wsdl/","wsdl");
  $self->serializer->register_ns("http://schemas.xmlsoap.org/soap/encoding/","soapenc");
  $self->serializer->register_ns("http://www.w3.org/2001/XMLSchema","xsd");
    my $som = $self->SUPER::call($method => @parameters);
    if ($self->want_som) {
        return $som;
    }
    UNIVERSAL::isa($som => 'SOAP::SOM') ? wantarray ? $som->paramsall : $som->result : $som;
}

sub BEGIN {
    no strict 'refs';
    for my $method (qw(want_som)) {
        my $field = '_' . $method;
        *$method = sub {
            my $self = shift->new;
            @_ ? ($self->{$field} = shift, return $self) : return $self->{$field};
        }
    }
}
no strict 'refs';
for my $method (@EXPORT_OK) {
    my %method = %{$methods{$method}};
    *$method = sub {
        my $self = UNIVERSAL::isa($_[0] => __PACKAGE__)
            ? ref $_[0]
                ? shift # OBJECT
                # CLASS, either get self or create new and assign to self
                : (shift->self || __PACKAGE__->self(__PACKAGE__->new))
            # function call, either get self or create new and assign to self
            : (__PACKAGE__->self || __PACKAGE__->self(__PACKAGE__->new));
        $self->_call($method, @_);
    }
}

sub AUTOLOAD {
    my $method = substr($AUTOLOAD, rindex($AUTOLOAD, '::') + 2);
    return if $method eq 'DESTROY' || $method eq 'want_som';
    die "Unrecognized method '$method'. List of available method(s): @EXPORT_OK\n";
}

1;
sub _methods { return \%methods; }; 1;