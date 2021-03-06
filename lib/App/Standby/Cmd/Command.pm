package App::Standby::Cmd::Command;
# ABSTRACT: Base class for any command

use 5.010_000;
use mro 'c3';
use feature ':5.10';

use Moose;
use namespace::autoclean;

# use IO::Handle;
# use autodie;
# use MooseX::Params::Validate;
# use Carp;
# use English qw( -no_match_vars );
# use Try::Tiny;
use DBI;
use Config::Yak;
use Log::Tree;
use App::Standby::DB;

# extends ...
extends 'MooseX::App::Cmd::Command';
# has ...
has '_config' => (
    'is'    => 'rw',
    'isa'   => 'Config::Yak',
    'lazy'  => 1,
    'builder' => '_init_config',
    'accessor' => 'config',
);

has '_logger' => (
    'is'    => 'rw',
    'isa'   => 'Log::Tree',
    'lazy'  => 1,
    'builder' => '_init_logger',
    'accessor' => 'logger',
);

has '_dbh' => (
    'is'    => 'rw',
    'isa'   => 'App::Standby::DB',
    'lazy'  => 1,
    'builder' => '_init_dbh',
    'accessor' => 'dbh',
);
# with ...
# initializers ...
sub _init_dbh {
    my $self = shift;

    my $DBH = App::Standby::DB::->new({
        'config'        => $self->config(),
        'logger'        => $self->logger(),
    });

    return $DBH;
}

sub _init_config {
    my $self = shift;

    my $Config = Config::Yak::->new({
        'locations'     => [qw(conf/standby-mgm.conf /etc/standby-mgm)],
    });

    return $Config;
}

sub _init_logger {
    my $self = shift;

    my $Logger = Log::Tree::->new('standby');

    return $Logger;
}

# your code here ...

no Moose;
__PACKAGE__->meta->make_immutable;

1;

__END__

=head1 NAME

App::Standby::Cmd::Command - Base class for any command

=cut
