package Daje::Workflow::Database::Model::Workflow;
use Mojo::Base -base, -signatures;

has 'db';
has 'workflow_pkey';
has 'workflow';

sub load($self) {

    my $result = $self->_load();
    unless (defined $result) {
        my $data->{name} = $self->workflow();
        $data->{state} = 'INITIAL';
        $data->{workflow_pkey} = 0;
        $self->save($data)
    }
}

sub _load($self) {
    my $data = $self->db->select(
        'workflow',
        {
            workflow_pkey => $self->workflow_pkey
        }
    );

    my $hash;
    $hash = $data->hash if $data->rows > 0;

    return $hash;
}

sub save ($self, $data) {

    if ($data->{workflow_pkey} > 0) {
        $self->db->update(
            'workflow',
            {
                %$data
            },
            {
                workflow_pkey => $data->{workflow_pkey}
            }
        )
    } else {
        delete %$data{workflow_pkey};
        $data->{workflow_pkey} = $self->db->insert(
            'workflow',
                {
                    %$data
                },
                {
                    returning => 'workflow_pkey'
                }
        )->hash->{workflow_pkey}
    }

    return $data->{workflow_pkey};
}
1;