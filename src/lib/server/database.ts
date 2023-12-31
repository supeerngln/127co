import type { Connection } from "mysql2";
import mysql from "mysql2/promise"


let sqlconn: Connection | null = null;

export class Database {
  static async get() {
    if (sqlconn) return sqlconn;
    // @ts-ignore
    sqlconn = await mysql.createConnection({
                host: 'localhost',
                user: 'root',
                password: '',
                database: 'cs127'
              });
    return sqlconn!;
  }
}
