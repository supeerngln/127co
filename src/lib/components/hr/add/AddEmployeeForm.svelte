<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import EmployeeFields from "../form_fields/EmployeeFields.svelte";
  import PDSFields from "../form_fields/PDSFields.svelte";
  import { Button } from "flowbite-svelte";

  export let form;
</script>

<main class="w-full">
  <Breadcrumb
    items={[
      { href: "/dashboard/human_resources", text: "Human Resources" },
      { href: "/dashboard/human_resources/employee", text: "Employees" },
      { href: "/dashboard/human_resources/employee/add", text: "Add" },
    ]}
  />
  <form method="post" action="?/insert">
    <EmployeeFields
      employee={form?.employee ?? null}
      error={form?.error ?? {}}
    />
    <PDSFields pds={form?.pds ?? null} error={form?.error ?? {}} />
    <Button pill type="submit">Add New Employee</Button>
  </form>
</main>