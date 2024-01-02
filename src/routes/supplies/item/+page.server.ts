import { Database } from "$lib/server/database";

export async function load() {
  const db = await Database.get();
  const items = await db.query("SELECT * FROM ITEM");

  return {
    items: items[0],
  };
}
