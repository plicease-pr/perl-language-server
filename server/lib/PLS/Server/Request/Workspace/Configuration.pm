package PLS::Server::Request::Workspace::Configuration;

use strict;
use warnings;

use parent 'PLS::Server::Request';

use PLS::Server::State;

sub new
{
    my ($class) = @_;

    return bless {
        id     => undef,                       # assigned by the server
        method => 'workspace/configuration',
        params => {
                   items => [{section => 'perl'}]
                  }
                 }, $class;
} ## end sub new

sub handle_response
{
    my ($self, $response) = @_;

    return unless (ref $response eq 'HASH' and ref $response->{result} eq 'ARRAY');
    my $config = $response->{result}[0];
    return unless (ref $config eq 'HASH');
    $PLS::Server::State::CONFIG = $config;
    return;
}

1;
