import db from "$lib/server/database";

export async function load() {
  const transactions = await db.execute("SELECT * FROM TRANSACTION_HISTORY");
  const suppliers = await db.execute("SELECT * FROM SUPPLIER");
  const items = await db.execute("SELECT * FROM ITEM");

  return {
    transactions: transactions[0],
    suppliers: suppliers[0],
    items: items[0],
  };
}
