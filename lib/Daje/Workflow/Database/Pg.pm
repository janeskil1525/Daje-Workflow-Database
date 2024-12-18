package Daje::Workflow::Database::Pg;
use Mojo::Base 'Daje::Workflow::Database::Base::Common', -base, -signatures;

use Mojo::Pg;
use Daje::Workflow::Database::Pg::Workflow;

our $VERSION = "0.01";

has 'dsn';
has 'pg' => sub {state $pg = Mojo::Pg->new->dsn(shift->dsn())};

sub load($self, $workflow_pkey) {
    my $data->{workflow} = $self->load_workflow($workflow_pkey);
    $data->{context} = $self->load_context($workflow_pkey);
    return $data;
}

sub save($self, $workflow_data, $context_data) {
    my $workflow_pkey = $self->save_workflow($workflow_data);
    $self->save_context($workflow_pkey, $context_data);

}

sub load_workflow($self, $workflow_pkey) {
    my $data = Daje::Workflow::Database::Pg::Workflow->new(
        db => $self->pg
    )->load(
        $workflow_pkey
    );
    return $data;
}

sub load_context($self) {

}

sub save_context($self, $workflow_pkey, $data) {

}

sub save_workflow($self, $data) {
    my $workflow_pkey = Daje::Workflow::Database::Pg::Workflow->new(
        db => $self->pg
    )->save(
        $data
    );
    return $workflow_pkey;
}


1;