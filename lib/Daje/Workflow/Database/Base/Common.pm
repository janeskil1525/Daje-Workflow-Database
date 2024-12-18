package Daje::Workflow::Database::Base::Common;
use Mojo::Base -base, -signatures;


our $VERSION = "0.01";

has 'workflow_pkey' => 0;
has 'workfow_name';
has 'data';
has 'dsn';



1;