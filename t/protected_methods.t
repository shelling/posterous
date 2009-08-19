use lib qw(lib);
use Posterous;
use Data::Dumper;

package Posterous;

use Test::More tests => 1;

is( options2query(hello => "world"), "?hello=world" );

1;
