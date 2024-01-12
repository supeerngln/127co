<script lang="ts">
    import Breadcrumb from "$lib/components/Breadcrumb.svelte";
    import type { PageServerData } from "./$types";
    export let data: PageServerData;
    let name = '';
    let course = '';
    let startDate = new Date().toISOString().split('T')[0];
    let schedule = '';

    // Fetch employee names from Employee Table
    let employeeNames = ['Employee_Last Name, Employee_FirstName'];

    // Fetch course options from Course_Offered
    let courseOptions = ['Default Course'];

    // Fetch schedule options based on selected course
    let scheduleOptions = ['Schedule Option 1', 'Schedule Option 2'];

</script>

<main>
    <label for="name">Name:</label>
    <select id="name" bind:value={name}>
        {#each employeeNames as employeeName}
            <option value={employeeName}>{employeeName}</option>
        {/each}
    </select>

    <label for="course">Course:</label>
    <select id="course" bind:value={course}>
        {#each courseOptions as courseOption}
            <option value={courseOption}>{courseOption}</option>
        {/each}
    </select>

    <label for="startDate">Start Date:</label>
    <input type="date" id="startDate" bind:value={startDate} />

    <label for="schedule">Schedule:</label>
    <select id="schedule" bind:value={schedule}>
        {#each scheduleOptions as scheduleOption}
            <option value={scheduleOption}>{scheduleOption}</option>
        {/each}
    </select>
</main>
