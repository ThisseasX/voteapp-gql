# voteapp-gql

Experimenting with GraphQL.

## Usage

Clone the repo locally:

```
$> git clone https://github.com/ThisseasX/voteapp-gql.git
```

Navigate to the repo:

```
$> cd ./voteapp-gql
```

Install the node modules:

```
$> npm install
```

Import the SQL schema:

```
$> mysql -u {user} -p < ./db/db.sql
```

Start the dev server:

```
$> npm start
```

Open [http://localhost:4000/](http://localhost:4000/) in the browser, and enjoy querying in the GraphQL playground!

Example Query:

```
query {
  getAllVotes {
    voter {
      id
      password
      name
      surname
    }
    candidate {
      id
      name
      surname
    }
    date
    vote
  }
}
```
