async function getAllVoters(_, __, { select, query }) {
  try {
    const q = select('id', 'password', 'name', 'surname').from('voter');
    return await query(q);
  } catch (err) {
    console.error(err);
  }
}

async function getAllCandidates(_, __, { select, query }) {
  try {
    const q = select('id', 'name', 'surname').from('candidate');
    return await query(q);
  } catch (err) {
    console.error(err);
  }
}

async function getAllVotes(_, __, { select, query }) {
  try {
    const q = select(
      'vv.voter_id',
      'vv.voter_password',
      'vv.voter_name',
      'vv.voter_surname',
      'c.candidate_id',
      'c.candidate_name',
      'c.candidate_surname',
      'v.date',
      'v.vote',
    )
      .from('vote v')
      .join('voter vv')
      .on('vv.voter_id', 'v.voter_id')
      .join('candidate c')
      .on('c.candidate_id', 'v.candidate_id');

    const data = await query(q);

    return data.map(row => ({
      voter: {
        id: row.voter_id,
        password: row.voter_password,
        name: row.voter_name,
        surname: row.voter_surname,
      },
      candidate: {
        id: row.candidate_id,
        name: row.candidate_name,
        surname: row.candidate_surname,
      },
      date: row.date,
      vote: row.vote,
    }));
  } catch (err) {
    console.error(err);
  }
}

export const Query = {
  getAllVoters,
  getAllCandidates,
  getAllVotes,
};
