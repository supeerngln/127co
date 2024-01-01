import type { RequestHandler } from "./$types";
import { json, error } from "@sveltejs/kit";
import { itemHeaders, transactionHeaders, supplierHeaders } from "$lib/headers";

import { Database } from "$lib/server/database";

const isDataValid = (data: JSON, headers: string[]) => {
  for (const key in headers) {
    if (!(key in data)) {
      return { success: false, missingKey: key };
    }
  }
  return { success: true, missingKey: "" };
};

const commaSeparate = (data: string[]) => {
  return data.reduce((total, key, index) => {
    if (index == itemHeaders.length - 1) {
      return (total += key);
    }
    return (total += key + " ,");
  }, "");
};

export const POST: RequestHandler = async ({ request }) => {
  const { table, data } = await request.json();

  if (!table) {
    return error(401, "The field table does not exist");
  }
  if (!data) {
    return error(401, "The field data does not exist");
  }

  const db = await Database.get();

  const headers =
    table === "Item"
      ? itemHeaders
      : table === "Transaction_History"
        ? transactionHeaders
        : table === "Supplier"
          ? supplierHeaders
          : undefined;

  if (!headers) {
    return error(401, `Invalid table ${table}`);
  }

  const { success, missingKey } = isDataValid(data, headers);
  if (!success) {
    return error(401, `Missing key ${missingKey}`);
  }
  const headersSeparated = commaSeparate(headers);
  const values = commaSeparate(headers.map((key) => data[key]));

  await db.query(`INSERT INTO ITEM (${headersSeparated}) (${values});`);

  return json({ success: true });
};
