package Posterous;

use 5.010;
use strict;
use warnings;

our $VERSION = '0.01';

use LWP::UserAgent;
use HTTP::Request;
use MIME::Base64;
use Rubyish::Attribute;
use Data::Dumper;
use Attribute::Protected;
use XML::Simple;


our $DOMAIN = "http://posterous.com";

our $AUTH_PATH = $DOMAIN."/api/getsites";
our $NEWPOST_PATH = $DOMAIN."/api/newpost";
our $COMMMENT_PATH = $DOMAIN."/api/newcomment";
our $READPOST_PATH = $DOMAIN."/api/readposts";

our $UA = LWP::UserAgent->new();

attr_accessor "user", "pass";

sub new {
  my ($class, $user, $pass, $site_id) = @_;
  die "didn\'t give user\' email or password" unless defined($user) && defined($pass);
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
  my $request = HTTP::Request->new( GET => $AUTH_PATH );
  $request->header( Authorization => "Basic ". $self->auth_key );
  my $content = $UA->request($request)->content;
  XMLin($content);
}


1;
__END__

=head1 NAME

Posterous - API to posterous.com

=head1 SYNOPSIS

  use Posterous;

=head1 DESCRIPTION

Posterous.pm just implement interface to posterous.com in Perl

=head1 Class Method

=head2 new($user_mail, $pass, $site_id)

constructor, $user_mail and $pass are required.

=head1 Instance Method

=head2 auth_key()

return Base64 encoded "$user_mail:$pass" for Basic HTTP Authentication

=head2 account_info()

GET /api/getsites, return a list of all sites owned by specified user


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
