
import { Database } from "$lib/server/database"

export async function load () {
  const db = await Database.get();
  console.log(db)
}
