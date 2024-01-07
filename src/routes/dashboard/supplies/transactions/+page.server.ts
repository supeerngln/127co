import db from "$lib/server/database";

export async function load() {
  const transactions = await db.query("SELECT * FROM TRANSACTION_HISTORY");

  return {
    transactions: transactions[0],
  };
}
