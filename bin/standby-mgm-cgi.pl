#!/usr/bin/perl
# ABSTRACT: CGI-to-PSGI bridge
# PODNAME: standby-mgm-cgi.pl
use strict;
use warnings;

use Plack::Loader;

my $app = Plack::Util::load_psgi('standby-mgm.psgi');
Plack::Loader::->auto->run($app);
