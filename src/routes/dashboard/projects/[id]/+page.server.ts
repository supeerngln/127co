import db from "$lib/server/database";
import type { PageServerLoad } from "./$types";
import { redirect } from "@sveltejs/kit";

export const load: PageServerLoad = async ({ cookies, params }) => {
    const id = cookies.get("auth-token") || null;
    if (!id)
        throw redirect(302, "/login");

    const role = cookies.get("role");
    if (!["CEO", "Project Manager", "Application Developer"].includes(role!))
        throw redirect(302, "/dashboard");

    const [projects] = await db.Project.select({
        where: {
            Project_ID: params.id,
        },
    });

    if (projects.length === 0)
        throw redirect(302, "/dashboard/projects");

    const project = projects[0];

    const [timelines] = await db.Timeline.select({
        where: {
            Timeline_ID: project["Project_Timeline_ID"],
        },
    });

    const [teams] = await db.Team.select({
        where: {
            Team_ID: project["Project_Team_ID"],
        },
    });

    const [contracts] = await db.Contract.select({
        where: {
            Contract_ID: project["Project_Contract_ID"],
        },
    });

    return {
        project,
        timeline: timelines[0],
        team: teams[0],
        contract: contracts[0],
    };
}