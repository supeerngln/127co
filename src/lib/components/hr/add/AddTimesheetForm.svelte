<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import TimesheetFields from "../form_fields/TimesheetFields.svelte";
  import { Button } from "flowbite-svelte";

  export let form;
</script>

<main class="w-full">
  <Breadcrumb
    items={[
      { href: "/dashboard/human_resources", text: "Human Resources" },
      { href: "/dashboard/human_resources/timesheet", text: "Timesheets" },
      { href: "/dashboard/human_resources/timesheet/add", text: "Add" },
    ]}
  />
  <form method="post" action="?/insert">
    <TimesheetFields
      isNew="{true},"
      log={form?.log ?? null}
      error={form?.error ?? {}}
    />
    <Button pill type="submit">Add New Timesheet</Button>
  </form>
</main>