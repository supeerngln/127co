<script lang="ts">
    import Breadcrumb from "$lib/components/Breadcrumb.svelte";
    import type { PageServerData } from "./$types";
    import Menu from "$lib/components/Menu.svelte";
    export let data: PageServerData;
    const { course, employeeNames, courseIDs } = data;
    let courseIDMap = courseIDs.map((courseIDs) => courseIDs.Course_ID)
    let names = employeeNames.map((employeeNames) => employeeNames.names)
   
    let courseName = course.Course_Name;
    let courseDur = course.Course_Duration.trim(" months")[0];
    let courseCapacity = course.Course_Capacity;
    let courseCategory = course.Course_Category;
    let courseSched1 = course.Course_Schedule.substring(0, 6);
    let courseSched2 = course.Course_Schedule.substring(7, 14);
    let courseSched3 = course.Course_Schedule.substring(17, 24);
    let selectedName = employeeNames.find((employeeNames) => employeeNames.Employee_ID === course.Employee_ID).names;
    let newcourseID: string;
    let courseSchedule: string;

    console.log(courseSched3);
    function getEmployeeID(selectedName: string): string {
        const employee = employeeNames.find((employeeNames) => employeeNames.names === selectedName);
        return employee ? employee.Employee_ID : '';
    }

    function generateCourseID(courseName: string): string {
        let newCourseID = '';
        if (courseName) {
            let baseID = courseName.substring(0, 3).toUpperCase();
            let num = 100;
            newCourseID = `${baseID}${num}`;
            while (courseIDMap.includes(newCourseID)) {
                num++;
                newCourseID = `${baseID}${num}`;
            }
        }
        return newCourseID;
    }

    function convertTo24Hour(timeStr) {
        const [time, period] = timeStr.split(' ');
        let [hours, minutes] = time.split(':');

        if (period.toLowerCase() === 'pm' && hours !== '12') {
            hours = Number(hours) + 12;
        } else if (period.toLowerCase() === 'am' && hours === '12') {
            hours = '00';
        }

        return `${hours}:${minutes}`;
    }

    $: courseSched2Formatted = new Date(`1970-01-01T${courseSched2}:00`).toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit' });
    $: courseSched3Formatted = new Date(`1970-01-01T${courseSched3}:00`).toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit' });
    $: courseSchedule = courseSched1 + " " + courseSched2Formatted + " - " + courseSched3Formatted;
    
</script>


<main class="w-full">
    <Breadcrumb items={[
        { href: "/dashboard/bootcamp", text: "Bootcamp" },
        { href: "/dashboard/bootcamp/courses_offered", text: "Courses Offered" },
        { href: `/dashboard/bootcamp/courses_offered/${course.Course_ID}/enroll`,
          text: "Edit " + course.Course_Name
        }
    ]}/>

    <h3>Edit {course.Course_Name}</h3>
    <form method="POST" class="mt-6">
        <label for="newcourseID">
            Course ID:
        </label>
        <br>
        <input 
            class="text-sm border-2 rounded-full border-gray-400 p-1 pl-2 pr-2"
            type="text" 
            name="newcourseID" 
            id="newcourseID"
            value={generateCourseID(courseName)}
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
            minlength="4"
            required 
            
        >
        <br>
        <label for="courseCategory">
            Course Category:
        </label>
        <br>
        <select 
            class="text-sm border-2 rounded-full border-gray-400 p-1 pl-2 pr-2"
            name="courseCategory" 
            id="courseCategory" 
            value={courseCategory}
            required 
        >
            <option value="">Select a category</option>
            <option value="Soft Skills">Soft Skills</option>
            <option value="Technical Skills">Technical Skills</option>
        </select>
        <br>
        <label for="courseSchedule">
            Course Schedule (Weekly Schedule and Time slot):
        </label>
        <br>
        <select 
            class="text-sm border-2 rounded-full border-gray-400 p-1 pl-2 pr-2"
            name="courseSched1" 
            id="courseSched1" 
            bind:value={courseSched1}
            required 
        >
            <option value="">Select a weekly schedule</option>
            <option value="TThSat">TThSat</option>
            <option value="MWF">MWF</option>
        </select>
        from
        <input 
            class="text-sm border-2 rounded-full border-gray-400 p-1 pl-2 pr-2"
            type="time" 
            name="courseSched2" 
            id="courseSched2" 
            value={convertTo24Hour(courseSched2)}
            required 
        />
        to
        <input 
            class="text-sm border-2 rounded-full border-gray-400 p-1 pl-2 pr-2"
            type="time" 
            name="courseSched3" 
            id="courseSched3" 
            value={convertTo24Hour(courseSched3)}
            required 
        />
        <input type="hidden" name="courseSchedule" id="courseSchedule" value={courseSchedule}>

        <br>
        <label for="courseInstructor">
            Course Instructor:
        </label>
        <br>
        <select
            class="text-sm border-2 rounded-full border-gray-400 p-1 pl-2 pr-2 w-1/2"
            id="courseInstructor"
            name="courseInstructor"
            value={selectedName}
            
            style="margin-bottom: 10px;"
        >
            <option value="">Select an employee</option>
            {#each names as name}
            <option value={name}>{name}</option>
            {/each}
         </select>
         <input id="employeeID" name="employeeID"
         class="hidden"
         value={getEmployeeID(selectedName)}> 
        <br>
        <label for="courseDuration">
            Course Duration (months): 
            <br>
            <input 
            class="text-sm border-2 rounded-full border-gray-400 p-1 pl-2 pr-2"
            type="number" 
            name="courseDuration" 
            id="courseDuration" 
            value={courseDur}
            min="1"
            
            placeholder="Enter how many months" 
            required 
        >
        <br>
        <label for="courseSlots">
            Course Capacity:
        </label>
        <br>
        <input 
            class="text-sm border-2 rounded-full border-gray-400 p-1 pl-2 pr-2"
            type="number" 
            name="courseCapacity" 
            id="courseCapacity" 
            min="1"
            value={courseCapacity}
            placeholder="Enter course slots" 
            required 
        >
        <br>
        <button type="submit">
            Save Changes
        </button>
    </form>
</main>