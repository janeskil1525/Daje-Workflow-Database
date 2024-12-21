#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

use Mojo::Pg;

sub load() {
    my $pg = Mojo::Pg->new()->dsn(
        "dbi:Pg:dbname=Venditabant;host=DATABASE;port=5432;user=test;password=test"
    );
}

done_testing();

