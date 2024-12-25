package Daje::Workflow::Database::Model::Context;
use Mojo::Base -base, -signatures;

has 'db';
has 'context_pkey';


sub load($self) {
    my $data = $self->db->select(
        'context',
        {
            context_pkey => $self->context_pkey
        }
    );

    my $hash;
    $hash = $data->hash if $data->rows > 0;

    return $hash;
}

sub _load($self) {

}

sub save($self, $data) {

    if ($data->{context_pkey} > 0) {
        $self->db->update(
            'context',
            {
                %$data
            },
            {
                context_pkey => $data->{context_pkey}
            }
        )
    } else {
        $data->{context_pkey} = $self->db->insert(
            'context',
            {
                %$data
            },
            {
                returning => 'context_pkey'
            }
        )->hash->{context_pkey}
    }

    return $data->{context_pkey};
}

1;