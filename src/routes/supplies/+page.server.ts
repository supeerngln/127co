import { Database } from "$lib/server/database";

export async function load() {
  const db = await Database.get();

  const transactions = await db.query("SELECT * FROM TRANSACTION_HISTORY");
  const suppliers = await db.query("SELECT * FROM SUPPLIER");
  const items = await db.query("SELECT * FROM ITEM");

  return {
    transactions: transactions[0],
    suppliers: suppliers[0],
    items: items[0],
  };
}
