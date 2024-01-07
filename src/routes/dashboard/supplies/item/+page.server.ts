import db from "$lib/server/database";

export async function load() {
  const items = await db.query("SELECT * FROM ITEM");

  return {
    items: items[0],
  };
}
