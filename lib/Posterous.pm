package Posterous;

use 5.010;
use strict;
use warnings;

use LWP::UserAgent;
use HTTP::Request;
use MIME::Base64;
use Data::Dumper;
use Rubyish::Attribute;


our $VERSION = '0.01';

our $DOMAIN = "posterous.com";

our $AUTH_PATH = "/api/getsites";
our $NEWPOST_PATH = "/api/newpost";
our $COMMMENT_PATH = "/api/newcomment";
our $READPOST_PATH = "/api/readposts";

our $UA = LWP::UserAgent->new();

attr_accessor "user", "pass";

sub new {
  my ($class, $user, $pass, $site_id) = @_;
  my $self = bless {}, $class;
  $self->user($user)->pass($pass);
  $self;
}

sub auth_key {
  my ($self) = @_;
  state $auth_key;
  $auth_key //= encode_base64($self->user.":".$self->pass);
  $auth_key;
}

sub account_info {
  my ($self) = @_;
}

1;
__END__

=head1 NAME

Posterous - API to posterous.com

=head1 SYNOPSIS

  use Posterous;

=head1 DESCRIPTION


=head2 EXPORT




=head1 SEE ALSO

Official API detail

  http://posterous.com/api

Posterous API Ruby version

  https://rubyforge.org/projects/posterous/

  http://github.com/jordandobson/Posterous/tree/master

=head1 AUTHOR

shelling, E<lt>shelling@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2009 by shelling

Release under MIT (X11) Lincence

=cut
