import type { RequestHandler } from "./$types";

import { json, error } from "@sveltejs/kit";
import { Database } from "$lib/server/database";

export const POST: RequestHandler = async ({ request }) => {
  const { table, id } = await request.json();

  console.log(`DELETED ${id} from ${table}`);
  const db = await Database.get();

  const primaryKey =
    table == "Transaction_History"
      ? "Transaction_Id"
      : table == "Item"
        ? "Property_Id"
        : table == "Supplier"
          ? "Supplier_Id"
          : undefined;

  if (!primaryKey) {
    return error(401, `Invalid ${table} passed`);
  }

  await db.query(`DELETE FROM ${table} WHERE ${primaryKey}=${id};`);
  return json({ success: true });
};
