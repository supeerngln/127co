import db from "$lib/server/database";

export async function load() {
  const suppliers = await db.query("SELECT * FROM SUPPLIER");

  return {
    suppliers: suppliers[0],
  };
}
