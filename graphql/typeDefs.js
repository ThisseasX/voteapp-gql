const typeDefs = `
  type Query {
    getAllVoters: [Voter!]!
    getAllCandidates: [Candidate!]!
    getAllVotes: [Vote!]!
  }
  
  type Voter {
    id: Int!
    password: String!
    name: String!
    surname: String!
  }

  type Candidate {
    id: Int!
    name: String!
    surname: String!
  }

  type Vote {
    voter: Voter!
    candidate: Candidate!
    date: String!
    vote: Int!
  }
`;

export default typeDefs;
