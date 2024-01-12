<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import PDSFields from "../form_fields/PDSFields.svelte";
  import { Input, Button } from "flowbite-svelte";
  export let pds;
  export let form;
</script>

<main class="w-full">
  <Breadcrumb
    items={[
      { href: "/dashboard/human_resources", text: "Human Resources" },
      { href: "/dashboard/human_resources/employee", text: "Employees" },
      { text: "Edit" },
    ]}
  />
  <form method="post" action="?/update">
    <Input
      type="hidden"
      name="id"
      hidden
      value={pds != null ? pds.Employee_Id : ""}
    />
    <PDSFields pds={form?.pds ?? pds} error={form?.error ?? {}} />
    <Button pill type="submit">Update Information</Button>
  </form>
</main>