<script lang="ts">
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import type { PageData } from "./$types";
  export let data: PageData;
  
  // Extract course and employee data from the page data
  const { course, Enrollments } = data;
  
  // Function to format date to display only date part
  const formatDate = (dateString: string) => {
    const options = { year: "numeric", month: "numeric", day: "numeric" };
    return new Date(dateString).toLocaleDateString(undefined, options);
  };

  // Function to handle clicking on the edit button
  const handleEdit = (enrollmentID) => {
    window.location.href = `/dashboard/bootcamp/courses_offered/${course.Course_ID}/edit/${enrollmentID}`;
    // You can add further functionality here, such as navigation or displaying details
  };

  // Function to handle clicking on the delete button
  const handleDelete = (enrollmentID) => { 
    window.location.href = `/dashboard/bootcamp/courses_offered/${course.Course_ID}/delete/${enrollmentID}`;
    // You can add further functionality here, such as navigation or displaying details

  };
</script>

<main class="w-full">
  <!-- Display breadcrumb -->
  <Breadcrumb
    items={[
      { href: "/dashboard/bootcamp", text: "Bootcamp" },
      { href: "/dashboard/bootcamp/courses_offered", text: "Courses Offered" },
      {
        href: `/dashboard/bootcamp/courses_offered/${course.Course_ID}`,
        text: course.Course_Name,
      },
    ]}
  />

  <!-- Display course details -->
  <h1 class="text-3xl font-bold mb-4">{course.Course_Name}</h1>
  <div class="grid grid-cols-2 gap-4">
    <div>
      <p><strong>Course ID:</strong> {course.Course_ID}</p>
      <p><strong>Instructor:</strong> {course.Employee_FirstName} {course.Employee_LastName}</p>
      <p><strong>Course Category:</strong> {course.Course_Category}</p>
      <!-- Add more course details as needed -->
    </div>
    <!-- Add more course details columns if needed -->
  </div>

  <!-- Display enrolled students data in a table -->
  {#if Enrollments && Enrollments.length > 0}
    <h2 class="text-2xl font-bold mt-6 mb-4">Enrolled Students</h2>
    <div class="overflow-x-auto">
      <table class="min-w-full divide-y divide-gray-200 text-center">
        <thead class="bg-gray-100">
          <tr>
            <th class="py-2">Enrollment ID</th>
            <th class="py-2">Name</th>
            <th class="py-2">Start Date</th>
            <th class="py-2">End Date</th>
            <th class="py-2">Grade</th>
            <th class="py-2">Actions</th>
            <!-- Add more columns as needed -->
          </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
          {#each Enrollments as enrollment (enrollment.Enrollment_ID)}
            <tr>
              <td class="py-2">{enrollment.Enrollment_ID}</td>
              <td class="py-2">{enrollment.Name}</td>
              <td class="py-2">{formatDate(enrollment.Start_Date)}</td>
              <td class="py-2">{enrollment.End_Date ? formatDate(enrollment.End_Date) : "Not Yet Finished"}</td>
              <td class="py-2">{enrollment.Grade}</td>
              <td class="py-2">
                <!-- Add edit and delete buttons -->  
                  <button class="px-4 py-2 mr-2 bg-blue-500 text-white rounded" on:click={() => handleEdit(enrollment.Enrollment_ID)}>Edit</button>
                  <button class="px-4 py-2 bg-red-500 text-white rounded" on:click={() => handleDelete(enrollment.Enrollment_ID)}>Delete</button>
              </td>
            </tr>
          {/each}
        </tbody>
      </table>
    </div>
  {:else}
    <p class="mt-6">No enrolled students found for this course.</p>
  {/if}
</main>
