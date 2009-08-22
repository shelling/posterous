use 5.010;
use lib qw(lib);

use Posterous;
use Test::More 'no_plan';

use YAML qw(LoadFile);

$config = LoadFile("$ENV{HOME}/.posterous");

$posterous = Posterous->new($config->{core}->{user}, $config->{core}->{pass});

is $posterous->account_info->{stat}, "ok", "read account info failed";
is $posterous->read_posts->{stat}, "ok", "read posts failed";
