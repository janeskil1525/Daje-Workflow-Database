package Daje::Workflow::Database;
use Mojo::Base -base, -signatures;


# NAME
# ====
#
# Daje::Workflow::Database - It's new $module
#
# SYNOPSIS
# ========
#
#    use Daje::Workflow::Database;
#
# DESCRIPTION
# ===========
#
# Daje::Workflow::Database is ...
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

use Mojo::Pg;
use Daje::Workflow::Database::Connector;

our $VERSION = "0.01";

has 'pg';
has 'db';
has 'workflow_pkey';
has 'workflow';
has 'connector';

sub start($self) {
    my $connector = Daje::Workflow::Database::Connector->new(
        workflow_pkey => $self->workflow_pkey(),
        workflow      => $self->workflow(),
        pg            => $self->pg,
        db            => $self->db,
    );
    $self->connector($connector);
    return $self->connector->start();
}

sub stop($self, $workflow_data, $context_data) {
    $self->connector->stop($workflow_data, $context_data);
}






1;
__END__






#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME


Daje::Workflow::Database - It's new $module



=head1 SYNOPSIS


   use Daje::Workflow::Database;



=head1 DESCRIPTION


Daje::Workflow::Database is ...



=head1 REQUIRES

L<Mojo::Base> 


=head1 METHODS


=head1 AUTHOR


janeskil1525 E<lt>janeskil1525@gmail.comE<gt>



=head1 LICENSE


Copyright (C) janeskil1525.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.



=cut

