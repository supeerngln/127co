import db from "$lib/server/database";
import type { ResultSetHeader, RowDataPacket } from "mysql2";
import type { PageServerLoad, Actions } from "./$types";
import { redirect } from "@sveltejs/kit";

export const load: PageServerLoad = async ({ cookies, params }) => {
  const enrollmentID = params.id;


  // Fetch enrolled students data with names
  const [enrollmentResult] = await db.execute<RowDataPacket[]>(
    `SELECT
      ce.Enrollment_ID,
      ce.Employee_ID,
      ce.Start_Date,
      ce.End_Date,
      ce.Grade,
      co.Course_Name,
      co.Course_ID,
      e.Employee_LastName, 
      e.Employee_FirstName
     FROM Course_Enrolled ce
     INNER JOIN Course_Offered co ON ce.Course_ID = co.Course_ID
     INNER JOIN Employee e ON ce.Employee_ID = e.Employee_ID
     WHERE ce.Enrollment_ID  = "${enrollmentID}"`
  );

  // Employee name
  const enrollees = enrollmentResult[0];

  return {
    enrollees
  };
};

export const actions = { 
  default: async ({ request, params }) => {
    const data = await request.formData();

    const [enrollee_deleted] = await db.execute<ResultSetHeader[]>(
      `DELETE FROM Course_Enrolled WHERE Enrollment_ID = '${params.id}'`
       );
    
    console.log(enrollee_deleted);
    console.log(data.get("course_ID" + " " + data.get("course_ID")));
    throw redirect(302, `/dashboard/bootcamp/courses_offered/${data.get("course_ID")}`);  
  }

} satisfies Actions;


