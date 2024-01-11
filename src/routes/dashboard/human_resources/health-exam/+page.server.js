import * as db from "$lib/util/hr/db/mysql";

export async function load() {
    try {
        let q = {
            fields: ['health_exam.*', 'employee.Employee_FirstName', 'employee.Employee_LastName'],
            alias: null,
            from: 'health_exam left join employee on health_exam.Employee_ID = employee.Employee_ID',
            where: null,
            groupBy: null,
            having: null,
            orderBy: null
        }

        return db.get(q);
    } catch (error) {
        console.error('Got an Error!!!');
        console.log(error);
        return error;
    }
}

export const actions = {
    delete: async ({ request }) => {
        try {
            const formData = await request.formData();
            const id = formData.get('id');
            queryDelete(id);
        }  catch (e) {
            console.error("Error occured", e.message);
        }
    }
}

function queryDelete(id) {
    let q = {
        from: 'Health_Exam',
        where: `HE_ID = ${id}`,
    };
    db.del(q);
}