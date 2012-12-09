#!/usr/bin/perl
# ABSTRACT: App::Standby CLI
# PODNAME: standby-mgm.pl
use strict;
use warnings;

use App::Standby::Cmd;

# All the magic is done using MooseX::App::Cmd, App::Cmd and MooseX::Getopt
my $Standby = App::Standby::Cmd::->new();
$Standby->run();
