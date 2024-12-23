package Daje::Workflow::Database::Connector;
use Mojo::Base -base, -signatures;



1;

__DATA__

@@ workflow

-- 1 up

IF NOT EXISTS CREATE TABLE workflow
(
    workflow_pkey serial not null primary key,
    editnum bigint NOT NULL DEFAULT 1,
    insby varchar NOT NULL DEFAULT 'System',
    insdatetime timestamp without time zone NOT NULL DEFAULT NOW(),
    modby varchar NOT NULL DEFAULT 'System',
    moddatetime timestamp without time zone NOT NULL DEFAULT NOW(),
    name varchar not null,
    state varchar not null,

);

IF NOT EXISTS CREATE TABLE context
(
    context_pkey serial not null primary key,
    editnum bigint NOT NULL DEFAULT 1,
    insby varchar NOT NULL DEFAULT 'System',
    insdatetime timestamp without time zone NOT NULL DEFAULT NOW(),
    modby varchar NOT NULL DEFAULT 'System',
    moddatetime timestamp without time zone NOT NULL DEFAULT NOW(),
    workflow_fkey bigint not null,
    context JSON

);

IF NOT EXISTS CREATE TABLE history
(
    history_pkey serial not null primary key,
    editnum bigint NOT NULL DEFAULT 1,
    insby varchar NOT NULL DEFAULT 'System',
    insdatetime timestamp without time zone NOT NULL DEFAULT NOW(),
    modby varchar NOT NULL DEFAULT 'System',
    moddatetime timestamp without time zone NOT NULL DEFAULT NOW(),
    workflow_fkey bigint not null,
    history varchar
);

-- 1 down