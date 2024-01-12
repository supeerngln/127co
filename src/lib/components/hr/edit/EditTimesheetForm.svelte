<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import TimesheetFields from "../form_fields/TimesheetFields.svelte";
  import { Input, Button } from "flowbite-svelte";

  export let form;
  export let log;
</script>

<main class="w-full">
  <Breadcrumb
    items={[
      { href: "/dashboard/human_resources", text: "Human Resources" },
      { href: "/dashboard/human_resources/timesheet", text: "Timesheets" },
      { text: "Edit" },
    ]}
  />
  <form method="post" action="?/update">
    <Input type="hidden" name="id" hidden value={log.Timesheet_ID} />
    <TimesheetFields
      isNew={false}
      log={form?.log ?? log}
      error={form?.error ?? {}}
    />
    <Button pill type="submit">Update Timesheet</Button>
  </form>
</main>