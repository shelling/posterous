use Test::More "no_plan";
use lib qw(lib);

use Posterous;
use Data::Dumper;

my $posterous = Posterous->new(q{hello@world.com}, "pass");

is ($posterous->auth_key, "aGVsbG9Ad29ybGQuY29tOnBhc3M=\n");


