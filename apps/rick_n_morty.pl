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

my $id = 2;
my $query = GrapghQL::Client::RickAndMorty::Operations->new->GetCharacter($id);
# p $query;

my $character_result = $client->send(
    GrapghQL::Client::RickAndMorty::Operations->new->GetCharacter($id),
);
p $character_result;

my $characters_result = $client->send(
    GrapghQL::Client::RickAndMorty::Operations->new->GetCharacters(
        my $page = 1,
        my $filter = GrapghQL::Client::RickAndMorty::Types::FilterCharacter->new(name => "summer"),
    )
);
p $characters_result;

