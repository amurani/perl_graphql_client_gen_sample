import { GraphQLClient } from 'graphql-request';
import { print } from 'graphql';
import { DocumentNode } from 'graphql';
export type Maybe<T> = T | null;
/** All built-in and custom scalars, mapped to their actual values */
export type Scalars = {
  ID: string;
  String: string;
  Boolean: boolean;
  Int: number;
  Float: number;
  Upload: any;
};


export enum CacheControlScope {
  Public = 'PUBLIC',
  Private = 'PRIVATE'
}

export type Character = {
  readonly __typename?: 'Character';
  readonly id?: Maybe<Scalars['ID']>;
  readonly name?: Maybe<Scalars['String']>;
  readonly status?: Maybe<Scalars['String']>;
  readonly species?: Maybe<Scalars['String']>;
  readonly type?: Maybe<Scalars['String']>;
  readonly gender?: Maybe<Scalars['String']>;
  readonly origin?: Maybe<Location>;
  readonly location?: Maybe<Location>;
  readonly image?: Maybe<Scalars['String']>;
  readonly episode?: Maybe<ReadonlyArray<Maybe<Episode>>>;
  readonly created?: Maybe<Scalars['String']>;
};

export type Characters = {
  readonly __typename?: 'Characters';
  readonly info?: Maybe<Info>;
  readonly results?: Maybe<ReadonlyArray<Maybe<Character>>>;
};

export type Episode = {
  readonly __typename?: 'Episode';
  readonly id?: Maybe<Scalars['ID']>;
  readonly name?: Maybe<Scalars['String']>;
  readonly air_date?: Maybe<Scalars['String']>;
  readonly episode?: Maybe<Scalars['String']>;
  readonly characters?: Maybe<ReadonlyArray<Maybe<Character>>>;
  readonly created?: Maybe<Scalars['String']>;
};

export type Episodes = {
  readonly __typename?: 'Episodes';
  readonly info?: Maybe<Info>;
  readonly results?: Maybe<ReadonlyArray<Maybe<Episode>>>;
};

export type FilterCharacter = {
  readonly name?: Maybe<Scalars['String']>;
  readonly status?: Maybe<Scalars['String']>;
  readonly species?: Maybe<Scalars['String']>;
  readonly type?: Maybe<Scalars['String']>;
  readonly gender?: Maybe<Scalars['String']>;
};

export type FilterEpisode = {
  readonly name?: Maybe<Scalars['String']>;
  readonly episode?: Maybe<Scalars['String']>;
};

export type FilterLocation = {
  readonly name?: Maybe<Scalars['String']>;
  readonly type?: Maybe<Scalars['String']>;
  readonly dimension?: Maybe<Scalars['String']>;
};

export type Info = {
  readonly __typename?: 'Info';
  readonly count?: Maybe<Scalars['Int']>;
  readonly pages?: Maybe<Scalars['Int']>;
  readonly next?: Maybe<Scalars['Int']>;
  readonly prev?: Maybe<Scalars['Int']>;
};

export type Location = {
  readonly __typename?: 'Location';
  readonly id?: Maybe<Scalars['ID']>;
  readonly name?: Maybe<Scalars['String']>;
  readonly type?: Maybe<Scalars['String']>;
  readonly dimension?: Maybe<Scalars['String']>;
  readonly residents?: Maybe<ReadonlyArray<Maybe<Character>>>;
  readonly created?: Maybe<Scalars['String']>;
};

export type Locations = {
  readonly __typename?: 'Locations';
  readonly info?: Maybe<Info>;
  readonly results?: Maybe<ReadonlyArray<Maybe<Location>>>;
};

export type Query = {
  readonly __typename?: 'Query';
  readonly character?: Maybe<Character>;
  readonly characters?: Maybe<Characters>;
  readonly location?: Maybe<Location>;
  readonly locations?: Maybe<Locations>;
  readonly episode?: Maybe<Episode>;
  readonly episodes?: Maybe<Episodes>;
};


export type QueryCharacterArgs = {
  id?: Maybe<Scalars['ID']>;
};


export type QueryCharactersArgs = {
  page?: Maybe<Scalars['Int']>;
  filter?: Maybe<FilterCharacter>;
};


export type QueryLocationArgs = {
  id?: Maybe<Scalars['ID']>;
};


export type QueryLocationsArgs = {
  page?: Maybe<Scalars['Int']>;
  filter?: Maybe<FilterLocation>;
};


export type QueryEpisodeArgs = {
  id?: Maybe<Scalars['ID']>;
};


export type QueryEpisodesArgs = {
  page?: Maybe<Scalars['Int']>;
  filter?: Maybe<FilterEpisode>;
};


export type GetCharacterQueryVariables = {
  id?: Maybe<Scalars['ID']>;
};


export type GetCharacterQuery = (
  { readonly __typename?: 'Query' }
  & { readonly character?: Maybe<(
    { readonly __typename?: 'Character' }
    & Pick<Character, 'id' | 'name'>
    & { readonly location?: Maybe<(
      { readonly __typename?: 'Location' }
      & Pick<Location, 'name' | 'dimension'>
    )> }
  )> }
);

export type GetCharactersQueryVariables = {
  page?: Maybe<Scalars['Int']>;
  filter?: Maybe<FilterCharacter>;
};


export type GetCharactersQuery = (
  { readonly __typename?: 'Query' }
  & { readonly characters?: Maybe<(
    { readonly __typename?: 'Characters' }
    & { readonly info?: Maybe<(
      { readonly __typename?: 'Info' }
      & Pick<Info, 'count'>
    )>, readonly results?: Maybe<ReadonlyArray<Maybe<(
      { readonly __typename?: 'Character' }
      & Pick<Character, 'name'>
    )>>> }
  )> }
);


export const GetCharacterDocument: DocumentNode = {"kind":"Document","definitions":[{"kind":"OperationDefinition","operation":"query","name":{"kind":"Name","value":"GetCharacter"},"variableDefinitions":[{"kind":"VariableDefinition","variable":{"kind":"Variable","name":{"kind":"Name","value":"id"}},"type":{"kind":"NamedType","name":{"kind":"Name","value":"ID"}},"directives":[]}],"directives":[],"selectionSet":{"kind":"SelectionSet","selections":[{"kind":"Field","name":{"kind":"Name","value":"character"},"arguments":[{"kind":"Argument","name":{"kind":"Name","value":"id"},"value":{"kind":"Variable","name":{"kind":"Name","value":"id"}}}],"directives":[],"selectionSet":{"kind":"SelectionSet","selections":[{"kind":"Field","name":{"kind":"Name","value":"id"},"arguments":[],"directives":[]},{"kind":"Field","name":{"kind":"Name","value":"name"},"arguments":[],"directives":[]},{"kind":"Field","name":{"kind":"Name","value":"location"},"arguments":[],"directives":[],"selectionSet":{"kind":"SelectionSet","selections":[{"kind":"Field","name":{"kind":"Name","value":"name"},"arguments":[],"directives":[]},{"kind":"Field","name":{"kind":"Name","value":"dimension"},"arguments":[],"directives":[]}]}}]}}]}}]};
export const GetCharactersDocument: DocumentNode = {"kind":"Document","definitions":[{"kind":"OperationDefinition","operation":"query","name":{"kind":"Name","value":"GetCharacters"},"variableDefinitions":[{"kind":"VariableDefinition","variable":{"kind":"Variable","name":{"kind":"Name","value":"page"}},"type":{"kind":"NamedType","name":{"kind":"Name","value":"Int"}},"directives":[]},{"kind":"VariableDefinition","variable":{"kind":"Variable","name":{"kind":"Name","value":"filter"}},"type":{"kind":"NamedType","name":{"kind":"Name","value":"FilterCharacter"}},"directives":[]}],"directives":[],"selectionSet":{"kind":"SelectionSet","selections":[{"kind":"Field","name":{"kind":"Name","value":"characters"},"arguments":[{"kind":"Argument","name":{"kind":"Name","value":"page"},"value":{"kind":"Variable","name":{"kind":"Name","value":"page"}}},{"kind":"Argument","name":{"kind":"Name","value":"filter"},"value":{"kind":"Variable","name":{"kind":"Name","value":"filter"}}}],"directives":[],"selectionSet":{"kind":"SelectionSet","selections":[{"kind":"Field","name":{"kind":"Name","value":"info"},"arguments":[],"directives":[],"selectionSet":{"kind":"SelectionSet","selections":[{"kind":"Field","name":{"kind":"Name","value":"count"},"arguments":[],"directives":[]}]}},{"kind":"Field","name":{"kind":"Name","value":"results"},"arguments":[],"directives":[],"selectionSet":{"kind":"SelectionSet","selections":[{"kind":"Field","name":{"kind":"Name","value":"name"},"arguments":[],"directives":[]}]}}]}}]}}]};

export type SdkFunctionWrapper = <T>(action: () => Promise<T>) => Promise<T>;


const defaultWrapper: SdkFunctionWrapper = sdkFunction => sdkFunction();
export function getSdk(client: GraphQLClient, withWrapper: SdkFunctionWrapper = defaultWrapper) {
  return {
    GetCharacter(variables?: GetCharacterQueryVariables): Promise<GetCharacterQuery> {
      return withWrapper(() => client.request<GetCharacterQuery>(print(GetCharacterDocument), variables));
    },
    GetCharacters(variables?: GetCharactersQueryVariables): Promise<GetCharactersQuery> {
      return withWrapper(() => client.request<GetCharactersQuery>(print(GetCharactersDocument), variables));
    }
  };
}
export type Sdk = ReturnType<typeof getSdk>;