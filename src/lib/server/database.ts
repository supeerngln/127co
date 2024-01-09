import mysql from "mysql2/promise";

const pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "",
  database: "cs127",
  multipleStatements: true,
});

export default pool;
