package Daje::Workflow::Database;
use Mojo::Base -base, -signatures;

use Mojo::Pg;

# NAME
# ====
#
# Daje::Workflow::Database - It's the database migrate plugin for Daje::Workflow
#
# SYNOPSIS
# ========
#
#    use Daje::Workflow::Database;
#    Daje::Workflow::Database->new(
#         pg            => $pg,
#     )->migrate();
#
# DESCRIPTION
# ===========
#
# Daje::Workflow::Database is the Database migrate plugin for Daje::Workflow
#
# LICENSE
# =======
#
# Copyright (C) janeskil1525.
#
# This library is free software; you can redistribute it and/or modify
# it under the same terms as Perl itself.
#
# AUTHOR
# ======
#
# janeskil1525 E<lt>janeskil1525@gmail.comE<gt>
#

our $VERSION = "0.07";

has 'pg';

sub migrate($self) {

    $self->pg->migrations->name('workflow')->from_data(
        'Daje::Workflow::Database', 'workflow'
    )->migrate(2);

    return 1;
}
1;

__DATA__

@@ workflow

-- 1 up

CREATE TABLE IF NOT EXISTS workflow
(
    workflow_pkey serial not null primary key,
    editnum bigint NOT NULL DEFAULT 1,
    insby varchar NOT NULL DEFAULT 'System',
    insdatetime timestamp without time zone NOT NULL DEFAULT NOW(),
    modby varchar NOT NULL DEFAULT 'System',
    moddatetime timestamp without time zone NOT NULL DEFAULT NOW(),
    name varchar not null,
    state varchar not null
);

CREATE TABLE IF NOT EXISTS context
(
    context_pkey serial not null primary key,
    editnum bigint NOT NULL DEFAULT 1,
    insby varchar NOT NULL DEFAULT 'System',
    insdatetime timestamp without time zone NOT NULL DEFAULT NOW(),
    modby varchar NOT NULL DEFAULT 'System',
    moddatetime timestamp without time zone NOT NULL DEFAULT NOW(),
    workflow_fkey bigint not null,
    context bytea,
    CONSTRAINT context_workflow_fkey FOREIGN KEY (workflow_fkey)
        REFERENCES workflow (workflow_pkey)
);

CREATE INDEX IF NOT EXISTS idx_context_workflow_fkey
    ON context(workflow_fkey);

CREATE TABLE IF NOT EXISTS history
(
    history_pkey serial not null primary key,
    editnum bigint NOT NULL DEFAULT 1,
    insby varchar NOT NULL DEFAULT 'System',
    insdatetime timestamp without time zone NOT NULL DEFAULT NOW(),
    modby varchar NOT NULL DEFAULT 'System',
    moddatetime timestamp without time zone NOT NULL DEFAULT NOW(),
    workflow_fkey bigint not null,
    history varchar,
    CONSTRAINT history_workflow_fkey FOREIGN KEY (workflow_fkey)
        REFERENCES workflow (workflow_pkey)
);

CREATE INDEX IF NOT EXISTS idx_history_workflow_fkey
    ON history(workflow_fkey);

-- 1 down

DROP TABLE workflow;
DROP TABLE context;
DROP TABLE history;

-- 2 up

DROP INDEX idx_context_workflow_fkey;

CREATE UNIQUE INDEX IF NOT EXISTS idx_unique_context_workflow_fkey
    ON context(workflow_fkey);

-- 2 down

DROP INDEX idx_unique_context_workflow_fkey;
CREATE INDEX IF NOT EXISTS idx_context_workflow_fkey
    ON context(workflow_fkey);

__END__


#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME


Daje::Workflow::Database - It's the database migrate plugin for Daje::Workflow



=head1 SYNOPSIS


   use Daje::Workflow::Database;
   Daje::Workflow::Database->new(
        pg            => $pg,
    )->migrate();



=head1 DESCRIPTION


Daje::Workflow::Database is the Database migrate plugin for Daje::Workflow



=head1 REQUIRES

L<Mojo::Pg> 

L<Mojo::Base> 


=head1 METHODS

=head2 migrate($self)

 migrate($self)();


=head1 AUTHOR


janeskil1525 E<lt>janeskil1525@gmail.comE<gt>



=head1 LICENSE


Copyright (C) janeskil1525.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.



=cut

