<script lang="ts">
    import type { PageData } from './$types';

    export let data: PageData;
</script>

<div class="container">
    <div class="projects">
        {#each data.projects as project}
            <a href="/dashboard/projects/{project.Project_ID}">
                <div class="project">
                    <h2>{project.Project_Name}</h2>
                    <p>{project.Project_Description}</p>
                </div>
            </a>
        {/each}
    </div>
</div>