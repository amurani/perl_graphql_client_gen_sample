

package GrapghQL::Client::RickAndMorty;

use Moose;
use Moose::Util::TypeConstraints;


enum CacheControlScope => [qw/ PUBLIC PRIVATE /];

class_type 'Upload', { class => 'Object' };

no Moose::Util::TypeConstraints;
no Moose;

1;
  
package GrapghQL::Client::RickAndMorty::Types::Roles;

use Moose::Role;
 
sub as_hash {
    my $self = shift;
    my @attributes = $self->meta->get_all_attributes;
    my %hash = map {
        my $value  = $self->meta->get_attribute($_->name)->get_value($self);
        $value ? ($_->name => $value) : ()
    } @attributes;
    return \%hash;
}

no Moose::Role;

1;


package GrapghQL::Client::RickAndMorty::Types::Character;

use Moose;
use Moose::Util::TypeConstraints;
with 'GrapghQL::Client::RickAndMorty::Types::Roles';


has 'id' => (
    is => 'ro',
    isa => 'Int|Str',
    required => 0
);
  
has 'name' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  
has 'status' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  
has 'species' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  
has 'type' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  
has 'gender' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  
has 'origin' => (
    is => 'ro',
    isa => 'GrapghQL::Client::RickAndMorty::Types::Location',
    required => 0
);
  
has 'location' => (
    is => 'ro',
    isa => 'GrapghQL::Client::RickAndMorty::Types::Location',
    required => 0
);
  
has 'image' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  
has 'episode' => (
    is => 'ro',
    isa => 'ArrayRef[GrapghQL::Client::RickAndMorty::Types::Episode]',
    required => 0
);
  
has 'created' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  

no Moose;
no Moose::Util::TypeConstraints;

1;
  

package GrapghQL::Client::RickAndMorty::Types::Characters;

use Moose;
use Moose::Util::TypeConstraints;
with 'GrapghQL::Client::RickAndMorty::Types::Roles';


has 'info' => (
    is => 'ro',
    isa => 'GrapghQL::Client::RickAndMorty::Types::Info',
    required => 0
);
  
has 'results' => (
    is => 'ro',
    isa => 'ArrayRef[GrapghQL::Client::RickAndMorty::Types::Character]',
    required => 0
);
  

no Moose;
no Moose::Util::TypeConstraints;

1;
  

package GrapghQL::Client::RickAndMorty::Types::Episode;

use Moose;
use Moose::Util::TypeConstraints;
with 'GrapghQL::Client::RickAndMorty::Types::Roles';


has 'id' => (
    is => 'ro',
    isa => 'Int|Str',
    required => 0
);
  
has 'name' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  
has 'air_date' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  
has 'episode' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  
has 'characters' => (
    is => 'ro',
    isa => 'ArrayRef[GrapghQL::Client::RickAndMorty::Types::Character]',
    required => 0
);
  
has 'created' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  

no Moose;
no Moose::Util::TypeConstraints;

1;
  

package GrapghQL::Client::RickAndMorty::Types::Episodes;

use Moose;
use Moose::Util::TypeConstraints;
with 'GrapghQL::Client::RickAndMorty::Types::Roles';


has 'info' => (
    is => 'ro',
    isa => 'GrapghQL::Client::RickAndMorty::Types::Info',
    required => 0
);
  
has 'results' => (
    is => 'ro',
    isa => 'ArrayRef[GrapghQL::Client::RickAndMorty::Types::Episode]',
    required => 0
);
  

no Moose;
no Moose::Util::TypeConstraints;

1;
  

package GrapghQL::Client::RickAndMorty::Types::FilterCharacter;

use Moose;
use Moose::Util::TypeConstraints;
with 'GrapghQL::Client::RickAndMorty::Types::Roles';


has 'name' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  
has 'status' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  
has 'species' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  
has 'type' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  
has 'gender' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  

no Moose;
no Moose::Util::TypeConstraints;

1;
  

package GrapghQL::Client::RickAndMorty::Types::FilterEpisode;

use Moose;
use Moose::Util::TypeConstraints;
with 'GrapghQL::Client::RickAndMorty::Types::Roles';


has 'name' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  
has 'episode' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  

no Moose;
no Moose::Util::TypeConstraints;

1;
  

package GrapghQL::Client::RickAndMorty::Types::FilterLocation;

use Moose;
use Moose::Util::TypeConstraints;
with 'GrapghQL::Client::RickAndMorty::Types::Roles';


has 'name' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  
has 'type' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  
has 'dimension' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  

no Moose;
no Moose::Util::TypeConstraints;

1;
  

package GrapghQL::Client::RickAndMorty::Types::Info;

use Moose;
use Moose::Util::TypeConstraints;
with 'GrapghQL::Client::RickAndMorty::Types::Roles';


has 'count' => (
    is => 'ro',
    isa => 'Int',
    required => 0
);
  
has 'pages' => (
    is => 'ro',
    isa => 'Int',
    required => 0
);
  
has 'next' => (
    is => 'ro',
    isa => 'Int',
    required => 0
);
  
has 'prev' => (
    is => 'ro',
    isa => 'Int',
    required => 0
);
  

no Moose;
no Moose::Util::TypeConstraints;

1;
  

package GrapghQL::Client::RickAndMorty::Types::Location;

use Moose;
use Moose::Util::TypeConstraints;
with 'GrapghQL::Client::RickAndMorty::Types::Roles';


has 'id' => (
    is => 'ro',
    isa => 'Int|Str',
    required => 0
);
  
has 'name' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  
has 'type' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  
has 'dimension' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  
has 'residents' => (
    is => 'ro',
    isa => 'ArrayRef[GrapghQL::Client::RickAndMorty::Types::Character]',
    required => 0
);
  
has 'created' => (
    is => 'ro',
    isa => 'Str',
    required => 0
);
  

no Moose;
no Moose::Util::TypeConstraints;

1;
  

package GrapghQL::Client::RickAndMorty::Types::Locations;

use Moose;
use Moose::Util::TypeConstraints;
with 'GrapghQL::Client::RickAndMorty::Types::Roles';


has 'info' => (
    is => 'ro',
    isa => 'GrapghQL::Client::RickAndMorty::Types::Info',
    required => 0
);
  
has 'results' => (
    is => 'ro',
    isa => 'ArrayRef[GrapghQL::Client::RickAndMorty::Types::Location]',
    required => 0
);
  

no Moose;
no Moose::Util::TypeConstraints;

1;
  

package GrapghQL::Client::RickAndMorty::Types::Query;

use Moose;
use Moose::Util::TypeConstraints;
with 'GrapghQL::Client::RickAndMorty::Types::Roles';


has 'character' => (
    is => 'ro',
    isa => 'GrapghQL::Client::RickAndMorty::Types::Character',
    required => 0
);
  
has 'characters' => (
    is => 'ro',
    isa => 'GrapghQL::Client::RickAndMorty::Types::Characters',
    required => 0
);
  
has 'location' => (
    is => 'ro',
    isa => 'GrapghQL::Client::RickAndMorty::Types::Location',
    required => 0
);
  
has 'locations' => (
    is => 'ro',
    isa => 'GrapghQL::Client::RickAndMorty::Types::Locations',
    required => 0
);
  
has 'episode' => (
    is => 'ro',
    isa => 'GrapghQL::Client::RickAndMorty::Types::Episode',
    required => 0
);
  
has 'episodes' => (
    is => 'ro',
    isa => 'GrapghQL::Client::RickAndMorty::Types::Episodes',
    required => 0
);
  

no Moose;
no Moose::Util::TypeConstraints;

1;
  


package GrapghQL::Client::RickAndMorty::Operations;

use Moose;
use Moose::Util::TypeConstraints;


sub GetCharacter {
    my ($self, $id) = @_;
    
    return {
      query => qq[
query GetCharacter(\$id: ID) {
  character(id: \$id) {
    id
    name
    location {
      name
      dimension
    }
  }
}
      ],
      operationName => 'GetCharacter',
      variables => { id => $id->can('as_hash') ? $id->as_hash : $id },
    };
}

sub GetCharacters {
    my ($self, $page, $filter) = @_;
    
    return {
      query => qq[
query GetCharacters(\$page: Int, \$filter: FilterCharacter) {
  characters(page: \$page, filter: \$filter) {
    info {
      count
    }
    results {
      name
    }
  }
}
      ],
      operationName => 'GetCharacters',
      variables => { page => $page->can('as_hash') ? $page->as_hash : $page,
filter => $filter->can('as_hash') ? $filter->as_hash : $filter },
    };
}

no Moose::Util::TypeConstraints;
no Moose;

1;
  

package GrapghQL::Client::RickAndMorty::Client;

use Moose;

use LWP::UserAgent; 
use HTTP::Request ();
use JSON::MaybeXS qw(encode_json decode_json);

use Data::Printer;

has 'url' => (
    is => 'ro',
    isa => 'Str',
    required => 1,
);

has 'headers' => (
    is => 'ro',
    isa => 'HashRef',
    required => 0,
    default => sub { {} },
);

my $class_type_maps;
sub BUILD {
    my $self = shift;
    $class_type_maps = {
        %{ $self->_retrieve_class_type_maps('GrapghQL::Client::RickAndMorty::Types::Query') || {} },
        %{ $self->_retrieve_class_type_maps('GrapghQL::Client::RickAndMorty::Types::Mutation') || {} },
    };
}

sub send {
    my ($self, $query) = @_;
    
    my $headers = [
        'Content-Type' => 'application/json; charset=UTF-8',
        %{ $self->headers },
    ];
    my $request = HTTP::Request->new(
        'POST',
        $self->url,
        $headers,
        encode_json($query)
    );
    my $user_agent = LWP::UserAgent->new();
    my $response = $user_agent->request($request);

    unless ($response->is_success) {
        die "It failed";
    }

    my $content = $response->decoded_content;
    my $data = decode_json $content;
    my $result = $self->_parse_data($data->{data});
    return $result;
}

sub _parse_data {
    my ($self, $data, $parent_type) = @_;
    my $parsed_data = {};

    for my $key (keys %$data) {
        my $value = $data->{ $key };
        my $type;
        if ($class_type_maps->{$key}) {;
            $type = $class_type_maps->{$key};
        } else {
            my $_class_type_map = $self->_retrieve_class_type_maps($parent_type); 
            $type = $_class_type_map->{$key};
        }
        
        if (ref($value) eq 'ARRAY') {
            ($type) = $type =~ /^ArrayRef\[(.*)\]$/g;
            my @values = map { $self->_resolve_value($type, $_) } @$value;
            $parsed_data->{ $key } = [@values];
        } elsif (ref($value) eq 'HASH') {
            my %values;
            for my $_key (keys %$value) {
                my $_value = $value->{$_key};
                if ( ref($_value) eq 'HASH' ) {
                    %values = (
                        %values,
                        %{ $self->_parse_data({ $_key => $_value }, $type) },
                    );
                } else {
                    if (ref($_value) eq 'ARRAY') {
                        %values = (
                            %values,
                            %{ $self->_parse_data({ $_key => $_value }, $type) },
                        );
                    } else {
                        $values{$_key} = $_value;
                    }
                }
            }
            
            $parsed_data->{ $key } = $self->_resolve_value($type, \%values);
        } else {
            $parsed_data->{ $key } = $self->_resolve_value($type, $value);
        }
    }
    return $parsed_data;
}

sub _resolve_value {
    my ($self, $type, $value) = @_;

    my @attributes = map { $_ => $value->{$_} } keys %{ $value };
    return $type->new(@attributes);
}

sub _retrieve_class_type_maps {
    my ($self, $class) = @_;
    
    return {} unless $class;
    return {} unless $class->can('meta');

    my @attributes = $class->meta->get_all_attributes;
    my %class_type_maps = map {
        $class->can('meta') ? (
            $_->name => $class->meta->get_attribute($_->name)->type_constraint->name
        ) : ()
    } @attributes;

    return \%class_type_maps;
}

no Moose;

1;

