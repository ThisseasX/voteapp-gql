import mysql from 'mysql';
import { promisify } from 'util';
import { flow, map, join, overArgs, some, includes, __ } from 'lodash/fp';

const pool = mysql.createPool({
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_SCHEMA,
});

const query = overArgs(promisify(pool.query.bind(pool)), String);

const getJoin = (q, table, joinTable) => ({
  on(pk, fk) {
    return {
      toString() {
        return `${q} JOIN ${joinTable} ON ${pk} = ${fk}`;
      },
      join(joinTable) {
        return getJoin(this, table, joinTable);
      },
    };
  },
});

const getSelect = (table, fields, alias) =>
  flow(
    map(toAliasMaybe(table, alias)),
    join(', '),
    selection => `SELECT ${selection} FROM ${table}`,
  )(fields);

const toAliasMaybe = table => field =>
  some(includes(__, field))([' ', '.']) ? field : `${table}_${field} ${field}`;

const select = (...fields) => ({
  from: table => ({
    join(joinTable) {
      return getJoin(this, table, joinTable);
    },
    toString() {
      return getSelect(table, fields);
    },
  }),
});

export { query, select };
