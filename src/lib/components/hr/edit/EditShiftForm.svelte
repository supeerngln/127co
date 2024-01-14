<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import ShiftFields from "../form_fields/ShiftFields.svelte";
  import { Input, Button } from "flowbite-svelte";
  export let shift, form;
</script>

<main class="w-full">
  <Breadcrumb
    items={[
      { href: "/dashboard/human_resources", text: "Human Resources" },
      { href: "/dashboard/human_resources/shift", text: "Shifts" },
      { text: "Edit" },
    ]}
  />
  <form method="post" action="?/update">
    <Input type="hidden" name="id" hidden value={shift.Shift_ID} />
    <ShiftFields shift={form?.shift ?? shift} error={form?.error ?? {}} />
    <Button pill type="submit">Update Shift</Button>
  </form>
</main>
