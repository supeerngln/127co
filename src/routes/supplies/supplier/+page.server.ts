
import { Database } from "$lib/server/database";

export async function load() {
  const db = await Database.get();
  const suppliers = await db.query("SELECT * FROM SUPPLIER");
  
  return {
    suppliers: suppliers[0],
  }
}
