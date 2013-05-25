package App::Standby;
# ABSTRACT: Managing on-call rotation and notification queues

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

use Log::Tree;

# extends ...
# has ...
has 'dbh' => (
    'is'    => 'rw',
    'isa'   => 'App::Standby::DB',
    'required' => 1,
);

has 'logger' => (
    'is'    => 'rw',
    'isa'   => 'Log::Tree',
    'lazy'  => 1,
    'builder' => '_init_logger',
);

# with ...
# initializers ...
sub _init_logger {
    my $self = shift;

    my $Logger = Log::Tree::->new('standby-mgm');

    return $Logger;
}

# your code here ...
sub _config_values {
    my $self = shift;
    my $key = shift;
    my $group_id = shift;

    my @args = ();
    my $sql = 'SELECT `value` FROM config WHERE `key` = ?';
    push(@args,$key);
    if($group_id) {
        $sql .= ' AND group_id = ?';
        push(@args,$group_id);
    }
    my $sth = $self->dbh()->prepare($sql);
    $sth->execute(@args);

    my @values = ();

    while(my $value = $sth->fetchrow_array()) {
        push(@values,$value);
    }

    $sth->finish();

    return \@values;
}

sub _load_class {
    my $self = shift;
    my $classname  = shift;

    # String eval is bad. Always. Except for require ;)
    ## no critic (ProhibitStringyEval)
    my $ok = eval "require $classname;";
    ## use critic
    if ($@) {
        return $@;
    } else {
        return $classname;
    }
}

=method get_groups

Returns a list of all groups.

=cut

sub get_groups {
    my $self = shift;

    my $sql = 'SELECT id,name FROM groups';
    my $sth = $self->dbh()->prepare($sql);

    my %grps = ();
    $sth->execute();
    while(my ($id,$name) = $sth->fetchrow_array()) {
        $grps{$id} = $name;
    }

    $sth->finish();

    return \%grps;
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;

__END__

=head1 NAME

App::Standby - Managing on-call rotation and notification queues

=head1 DESCRIPTION

This distribution provides a small Plack webapp which helps with managing on-call rotations
and notification queues. It allows you to manage several different queues from
on place. It is easily extendible by plugins which can talk to virtually API
endpoint to update a queue or a contact.

Most organizations have at least one big monitoring system (like Nagios or Zabbix) and
at least one external service level monitoring and other means of notification,
If you don't want to pass around a shared on-call mobile you have to remember to update all
those services when the one on duty changes. This app will help you with that.

It allows you to manage several groups with their own queues and update each
groups external services with just one click.

=head1 SETUP

This app can be run as CGI or from within an PSGI runtime like Starman.

=head1 CONFIGURATION

This app doesn't need any configuration, unless you want to change the
path to the SQLite database.

=head1 PLUGINS

Have a look at the examples directory for some example plugins.

=cut
