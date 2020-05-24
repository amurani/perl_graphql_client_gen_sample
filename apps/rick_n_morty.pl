# package GrapghQL::Client::RickAndMorty::Client;

# use Moose;

# use LWP::UserAgent; 
# use HTTP::Request ();
# use JSON::MaybeXS qw(encode_json decode_json);

# use Data::Printer;

# has 'url' => (
#     is => 'ro',
#     isa => 'Str',
#     required => 1,
# );

# has 'headers' => (
#     is => 'ro',
#     isa => 'HashRef',
#     required => 0,
#     default => sub { {} },
# );

# my $class_type_maps;
# sub BUILD {
#     my $self = shift;
#     $class_type_maps = {
#         %{ $self->_retrieve_class_type_maps('GrapghQL::Client::RickAndMorty::Types::Query') || {} },
#         %{ $self->_retrieve_class_type_maps('GrapghQL::Client::RickAndMorty::Types::Mutation') || {} },
#     };
# }

# sub send {
#     my ($self, $query) = @_;
    
#     my $headers = [
#         'Content-Type' => 'application/json; charset=UTF-8',
#         %{ $self->headers },
#     ];
#     my $request = HTTP::Request->new(
#         'POST',
#         $self->url,
#         $headers,
#         encode_json($query)
#     );
#     my $user_agent = LWP::UserAgent->new();
#     my $response = $user_agent->request($request);

#     unless ($response->is_success) {
#         die "It failed";
#     }

#     my $content = $response->decoded_content;
#     my $data = decode_json $content;
#     my $result = $self->_parse_data($data->{data});
#     return $result;
# }

# sub _parse_data {
#     my ($self, $data, $parent_type) = @_;
#     my $parsed_data = {};

#     for my $key (keys %$data) {
#         my $value = $data->{ $key };
#         my $type;
#         if ($class_type_maps->{$key}) {;
#             $type = $class_type_maps->{$key};
#         } else {
#             my $_class_type_map = $self->_retrieve_class_type_maps($parent_type); 
#             $type = $_class_type_map->{$key};
#         }
        
#         if (ref($value) eq 'ARRAY') {
#             ($type) = $type =~ /^ArrayRef\[(.*)\]$/g;
#             my @values = map { $self->_resolve_value($type, $_) } @$value;
#             $parsed_data->{ $key } = [@values];
#         } elsif (ref($value) eq 'HASH') {
#             my %values;
#             for my $_key (keys %$value) {
#                 my $_value = $value->{$_key};
#                 if ( ref($_value) eq 'HASH' ) {
#                     %values = (
#                         %values,
#                         %{ $self->_parse_data({ $_key => $_value }, $type) },
#                     );
#                 } else {
#                     if (ref($_value) eq 'ARRAY') {
#                         %values = (
#                             %values,
#                             %{ $self->_parse_data({ $_key => $_value }, $type) },
#                         );
#                     } else {
#                         $values{$_key} = $_value;
#                     }
#                 }
#             }
            
#             $parsed_data->{ $key } = $self->_resolve_value($type, \%values);
#         } else {
#             $parsed_data->{ $key } = $self->_resolve_value($type, $value);
#         }
#     }
#     return $parsed_data;
# }

# sub _resolve_value {
#     my ($self, $type, $value) = @_;

#     my @attributes = map { $_ => $value->{$_} } keys %{ $value };
#     return $type->new(@attributes);
# }

# sub _retrieve_class_type_maps {
#     my ($self, $class) = @_;
    
#     return {} unless $class;
#     return {} unless $class->can('meta');

#     my @attributes = $class->meta->get_all_attributes;
#     my %class_type_maps = map {
#         $class->can('meta') ? (
#             $_->name => $class->meta->get_attribute($_->name)->type_constraint->name
#         ) : ()
#     } @attributes;

#     return \%class_type_maps;
# }

# no Moose;

# 1;

#!/usr/bin/env perl

use strict;
use warnings;
use feature qw(say);

use Data::Printer;

use GrapghQL::Client::RickAndMorty;

my $client = GrapghQL::Client::RickAndMorty::Client->new(
    url => 'https://rickandmortyapi.com/graphql/',
    headers => {},
);

my $character_result = $client->send(
    GrapghQL::Client::RickAndMorty::Operations->new->GetCharacter(my $id = 2),
);
p $character_result;

my $characters_result = $client->send(
    GrapghQL::Client::RickAndMorty::Operations->new->GetCharacters(
        my $page = 1,
        my $filter = GrapghQL::Client::RickAndMorty::Types::FilterCharacter->new(name => "jerry"),
    )
);
p $characters_result;

