<script lang="ts">
  import type { PageData } from "./$types";

  export let data: PageData;
</script>

<div class="container">
  <h1>{data.project.Project_Name}</h1>
  <p>{data.project.Project_Description}</p>
  <p>{data.project.Project_Type}</p>
  <p>{data.project.Project_Budget}</p>
  <p>{data.project.Project_Status}</p>
</div>
