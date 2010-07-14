#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Net::ResellerClub' );
}

diag( "Testing Net::ResellerClub $Net::ResellerClub::VERSION, Perl $], $^X" );
