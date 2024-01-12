<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import JobFields from "../form_fields/JobFields.svelte";
  import { Input, Button } from "flowbite-svelte";

  export let form;
  export let job;
</script>

<main class="w-full">
  <Breadcrumb
    items={[
      { href: "/dashboard/human_resources", text: "Human Resources" },
      { href: "/dashboard/human_resources/job", text: "Jobs" },
      { text: "Edit" },
    ]}
  />
  <form method="post" action="?/update">
    <Input type="hidden" name="id" hidden value={job.Job_Id} />
    <JobFields isNew={false} job={form?.job ?? job} error={form?.error ?? {}} />
    <Button pill type="submit">Update Job</Button>
  </form>
</main>
