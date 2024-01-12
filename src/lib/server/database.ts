import mysql from "mysql2/promise";

const pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "password",
  database: "CS127",
  multipleStatements: true,
});

export default pool;
