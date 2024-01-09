<script lang="ts">
  import type { PageData } from "./$types";

  export let data: PageData;
</script>

<div class="container">
  <div class="project grid grid-cols-3 gap-5">
    {#each data.projects as project}
      <a
        href="/dashboard/projects/{project.Project_ID}"
        class="block max-w-sm p-6 bg-white border border-gray-200 rounded-lg shadow hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700"
      >
        <div class="flex items-center mb-2">
          <p
            class="text-lg font-bold tracking-tight text-gray-900 dark:text-white"
          >
            {project.Project_Name}
          </p>
          <p
            class="ml-2 text-xs border-2 rounded-full border-gray-400 text-gray-400 p-1 pl-2 pr-2"
          >
            {project.Project_Type}
          </p>
        </div>
        <span class="flex items-center">
          <span
            class="h-3 w-3 rounded-full mr-2 {project.Project_Status === 'Done'
              ? 'bg-green-500'
              : project.Project_Status === 'Cancelled'
                ? 'bg-red-500'
                : 'bg-yellow-500'}"
          ></span>
          <span class="text-sm text-gray-700 dark:text-gray-400"
            >{project.Project_Status}</span
          >
        </span>
        <p class="font-normal text-gray-700 dark:text-gray-400">
          {project.Project_Description}
        </p>
      </a>
    {/each}
  </div>
</div>
