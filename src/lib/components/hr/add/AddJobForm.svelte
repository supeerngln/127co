<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import JobFields from "../form_fields/JobFields.svelte";
  import { Button } from "flowbite-svelte";

  export let form;
</script>

<main class="w-full">
  <Breadcrumb
    items={[
      { href: "/dashboard/human_resources", text: "Human Resources" },
      { href: "/dashboard/human_resources/job", text: "Jobs" },
      { href: "/dashboard/human_resources/job/add", text: "Add" },
    ]}
  />
  <form method="post" action="?/insert">
    <JobFields isNew={true} job={form?.job ?? null} error={form?.error ?? {}} />
    <Button pill type="submit">Add New Job</Button>
  </form>
</main>