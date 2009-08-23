use 5.010;
use lib qw(lib);

use Posterous;
use Test::More 'no_plan';

use YAML qw(LoadFile);

$config = LoadFile("$ENV{HOME}/.posterous");

$posterous = Posterous->new($config->{core}->{user}, $config->{core}->{pass});

is $posterous->account_info->{stat}, "ok", "read account info failed";
is $posterous->read_posts->{stat}, "ok", "read posts failed";

my $primary_site_id;
while(my ($key, $value) = each %{$posterous->account_info->{site}}) {
  if ($value->{primary} eq "true") {
    $primary_site_id = $value->{id};
  }
}

is $posterous->primary_site, $primary_site_id, $posterous->primary_site . " not eq $primary_site_id";

is $posterous->add_post(title => "posterous.pm test", body => "posterous.pm test body")->{stat}, "ok", "add_post() failed";

my $post_id = $posterous->add_post(title => "test add_comment()", body => "test body")->{post}->{id};

is $posterous->add_comment(post_id => $post_id, comment => "posterous.pm comment test")->{stat}, "ok", "add_comment() failed";
