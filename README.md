[![Actions Status](https://github.com/janeskil1525/Daje-Workflow-Database/actions/workflows/test.yml/badge.svg)](https://github.com/janeskil1525/Daje-Workflow-Database/actions)
# NAME

Daje::Workflow::Database - It's the database plugin for Daje::Workflow

# SYNOPSIS

    use Daje::Workflow::Database;
    my $database = Daje::Workflow::Database->new(
         pg            => $pg,
         db            => $db,
         workflow      => $workflowname,
         workflow_pkey => 0,
         context       => $context,
         wfl_data      => $wfl_data,
     );

# DESCRIPTION

Daje::Workflow::Database is the Database plugin for Daje::Workflow

# REQUIRES

[Daje::Workflow::Database::Connector](https://metacpan.org/pod/Daje%3A%3AWorkflow%3A%3ADatabase%3A%3AConnector) 

[Mojo::Pg](https://metacpan.org/pod/Mojo%3A%3APg) 

[Mojo::Base](https://metacpan.org/pod/Mojo%3A%3ABase) 

# METHODS

## start($self)

    start($self)();

## stop($self,

    stop($self,();

# AUTHOR

janeskil1525 <janeskil1525@gmail.com>

# LICENSE

Copyright (C) janeskil1525.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
