import { GraphQLServer } from 'graphql-yoga';
import typeDefs from './typeDefs';
import { Query } from './resolvers';
import { dbUtils } from '../utils';

const resolvers = {
  Query,
};

const context = {
  ...dbUtils,
};

export function start() {
  new GraphQLServer({ typeDefs, resolvers, context }).start(({ port }) => {
    console.log(`GraphQL server started at port: ${port}`);
  });
}
