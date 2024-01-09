import db from "$lib/server/database";
import type { RowDataPacket } from "mysql2";
import type { PageServerLoad } from "./$types";
import { redirect } from "@sveltejs/kit";

export const load: PageServerLoad = async ({ cookies }) => {
  const id = cookies.get("auth-token") || null;
  if (!id) throw redirect(302, "/login");

  const role = cookies.get("role");

  const [employees] = await db.execute<RowDataPacket[]>(
    `SELECT * FROM Employee WHERE Employee_ID = ${id}`,
  );
  const employee = employees[0];

  let team_leader = null;
  switch (role) {
    case "CEO":
      break;
    case "Project Manager":
      team_leader = id;
      break;
    case "Application Developer":
      team_leader = employee["Employee_ReportsTo"];
      break;
    default:
      throw redirect(302, "/dashboard");
  }

  const [teams] = await db.execute<RowDataPacket[]>(
    `SELECT * FROM Team ${
      team_leader ? `WHERE Team_Leader = ${team_leader}` : ""
    }`,
  );

  let all_projects: any = [];
  for (const team of teams) {
    const [projects] = await db.execute<RowDataPacket[]>(
      `SELECT * FROM Project WHERE Project_Team_ID = ${[team["Team_ID"]]}`,
    );
    all_projects.push(...projects);
  }

  return {
    projects: all_projects,
  };
};
