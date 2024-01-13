<script lang="ts">
    import Breadcrumb from "$lib/components/Breadcrumb.svelte";
    import type { PageServerData } from "./$types";
    import Menu from "$lib/components/Menu.svelte";
    export let data: PageServerData;
    
    let courseName: string;
    
</script>


<main class="w-full">
    <Breadcrumb items={[
        { href: "/dashboard/bootcamp", text: "Bootcamp" },
        { href: "/dashboard/bootcamp/courses_offered", text: "Courses Offered" },
        { href: `/dashboard/bootcamp/courses_offered/add`, text: "Add Course"}
    ]}/>

    <h3>Add new course to the bootcamp</h3>
    <form>
        <label for="courseID">
            Course ID:
        </label>
        <br>
        <input 
            class="text-sm border-2 rounded-full border-gray-400 p-1 pl-2 pr-2"
            type="text" 
            name="courseID" 
            id="courseID" 
            placeholder="Enter course ID" 
            required 
            disabled
        >
        <br>
        <label for="courseName">
            Course Name:
        </label>
        <br>
        <input 
            class="text-sm border-2 rounded-full border-gray-400 p-1 pl-2 pr-2"
            type="text" 
            name="courseName" 
            id="courseName" 
            placeholder="Enter course name" 
            bind:value={courseName}
            required 
        >
        <br>
        <label for="courseCategory">
            Course Category:
        </label>
        <br>
        <input 
            class="text-sm border-2 rounded-full border-gray-400 p-1 pl-2 pr-2"
            type="text" 
            name="courseCategory" 
            id="courseCategory" 
            placeholder="Enter course category" 
            required 
        >
        <br>
        <label for="courseSchedule">
            Course Schedule:
        </label>
        <br>
        <input 
            class="text-sm border-2 rounded-full border-gray-400 p-1 pl-2 pr-2"
            type="text" 
            name="courseSchedule" 
            id="courseSchedule" 
            placeholder="Enter course schedule" 
            required 
        >
        <br>
        <label for="courseDescription">
            Course Description:
        </label>
        <br>
        <textarea 
            class="text-sm border-2 rounded-full border-gray-400 p-1 pl-2 pr-2"
            name="courseDescription" 
            id="courseDescription" 
            placeholder="Enter course description" 
            required 
        ></textarea>
        <br>
        <label for="courseInstructor">
            Course Instructor:
        </label>
        <br>
        <input 
            class="text-sm border-2 rounded-full border-gray-400 p-1 pl-2 pr-2"
            type="text" 
            name="courseInstructor" 
            id="courseInstructor" 
            placeholder="Enter course instructor" 
            required 
        >
        <br>
        <label for="courseSlots">
            Course Slots:
        </label>
        <br>
        <input 
            class="text-sm border-2 rounded-full border-gray-400 p-1 pl-2 pr-2"
            type="number" 
            name="courseSlots" 
            id="courseSlots" 
            placeholder="Enter course slots" 
            required 
        >
        <br>
        <label for="courseStatus">
            Course Status:
        </label>
        <br>
        <input 
            class="text-sm border-2 rounded-full border-gray-400 p-1 pl-2 pr-2"
            type="text" 
            name="courseStatus" 
            id="courseStatus" 
            placeholder="Enter course status" 
            required 
        >
        <br>
        <button type="submit">
            Add Course
        </button>
    </form>
</main>