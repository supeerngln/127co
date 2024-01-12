<script lang="ts">
    import Breadcrumb from "$lib/components/Breadcrumb.svelte";
    import { Hr } from "flowbite-svelte";
    import type { PageData } from "./$types";
    export let data: PageData;
    const { enrollees, employeeNames } = data;
  
    let editedEnrollmentID: any;
    let employeeID: any;
    let selectedName: any = '';
    let currentDate: string = new Date().toISOString().split("T")[0];
    let editedDateStarted = currentDate;
    let names = employeeNames.map((employeeNames) => employeeNames.names)

 

    function getEmployeeID(selectedName: string): string {
        const employee = employeeNames.find((employeeNames) => employeeNames.names === selectedName);
        return employee ? employee.Employee_ID : '';
    }


</script>
  
  <main class="w-full">  
    <Breadcrumb items={[
        { href: "/dashboard/bootcamp", text: "Bootcamp" },
        { href: "/dashboard/bootcamp/courses_offered", text: "Courses Offered" },
        { href: `/dashboard/bootcamp/courses_offered/${enrollees.Course_ID}/enroll`,
          text: "Enroll " + enrollees.Course_Name
        }
      ]}/>
    
    <h1 class="text-3xl font-semibold">Enroll {enrollees.Course_Name}</h1>
    <h3 class="text-subtext">Enroll an employee to this course.</h3>

    <form method="POST" >
      <label for="enrollmentID">Enrollment ID:</label>
      <br>
      <input 
        class="text-sm border-2 rounded-full border-gray-400 text-gray-700 p-1 pl-2 pr-2"
        type="text" 
        id="enrollmentID" 
        name="enrollmentID"
        value={editedEnrollmentID}
        style="margin-bottom: 10px;" 
        disabled>

      <br>
      <label for="Name">Name:</label>
      <br>
    

      <select
        class="text-sm border-2 rounded-full border-gray-400 p-1 pl-2 pr-2 w-1/3"
        id="Name"
        name="Name"
        bind:value={selectedName}
        
        style="margin-bottom: 10px;"
      >
        <option value="">Select an employee</option>
        {#each names as name}
          <option value={name}>{name}</option>
        {/each}
      </select>

      <label for="Employee_ID">{getEmployeeID(selectedName)}</label>

      <br>
      <label for="dateStarted">Date Started:</label>
      <br>
      <input 
        class="text-sm border-2 rounded-full border-gray-400 p-1 pl-2 pr-2"
        type="date" 
        id="dateStarted" 
        name="dateStarted"
        placeholder={currentDate}
        value={editedDateStarted}
        style="margin-bottom: 10px;">

      <br>
      <button type="submit">Enroll</button>
      <a href="/dashboard/bootcamp/courses_offered">Cancel</a>
      </form>
  </main>