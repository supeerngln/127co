import mysql, { type Pool, type RowDataPacket } from "mysql2/promise";

let pool: Pool = mysql.createPool({
	host: "localhost",
	user: "root",
	password: "",
	database: "cs127",
});

export class Database {
  static async get() {
    return await pool.getConnection();
  }
}

class ORM {
	[key: string]: any;
	constructor() {
		return (async () => {
			const [rows] = await pool.execute<mysql.RowDataPacket[]>('SHOW TABLES');
			Object.values(rows).map((row: RowDataPacket) => {
				const table = row[`Tables_in_cs127`];
				this[table] = {
					select: async (options: any = {}) => {
						const attributes = options.attributes || ['*'];
						const where = options.where
							? `WHERE ${Object.keys(options.where)
									.map((attribute: any) => `${attribute} = '${options.where[attribute]}'`)
									.join(' AND ')}`
							: '';
						const query = `SELECT ${attributes.join(', ')} FROM ${table} ${where};`;
						return await pool.execute<mysql.RowDataPacket[]>(query);
					},
					insert: async (data: any) => {
						const attributes = Object.keys(data);
						const values = attributes.map((attribute: any) => `'${data[attribute]}'`);
						const query = `INSERT INTO ${table} (${attributes.join(', ')}) VALUES (${values.join(
							', '
						)});`;
						return await pool.execute<mysql.ResultSetHeader>(query);
					},
					update: async (data: any, options: any = {}) => {
						const attributes = Object.keys(data);
						const values = attributes.map(
							(attribute: any) => `${attribute} = '${data[attribute]}'`
						);
						const where = options.where
							? `WHERE ${Object.keys(options.where)
									.map((attribute: any) => `${attribute} = '${options.where[attribute]}'`)
									.join(' AND ')}`
							: '';
						const query = `UPDATE ${table} SET ${values.join(', ')} ${where};`;
						return await pool.execute<mysql.ResultSetHeader>(query);
					},
					delete: async (options: any = {}) => {
						const where = options.where
							? `WHERE ${Object.keys(options.where)
									.map((attribute: any) => `${attribute} = '${options.where[attribute]}'`)
									.join(' AND ')}`
							: '';
						const query = `DELETE FROM ${table} ${where};`;
						return await pool.execute<mysql.ResultSetHeader>(query);
					}
				};
			});
			return this;
		})();
	}
}

export default await new ORM();