#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

use Mojo::Pg;
use Daje::Workflow::Database;;

sub load() {
    my $pg = Mojo::Pg->new()->dsn(
        "dbi:Pg:dbname=Workflowtest;host=database;port=54321;user=test;password=test"
    );
    my $context->{path};
    my $data->{action} = "GenerateSQL";
    $data->{context} = $context;
    my $db = $pg->db;
    my $tx = $db->begin();
    my $database = Daje::Workflow::Database->new(
        pg            => $pg,
        db            => $db,
        workflow      => 'testflow',
        workflow_pkey => 0,
        data          => $data,
    );

    $database->start();
    $tx->commit();

 return 1;
}

ok(load() ==1);

done_testing();

