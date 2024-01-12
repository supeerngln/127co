<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import EmployeeFields from "$lib/components/hr/form_fields/EmployeeFields.svelte";
  import { Input, Button } from "flowbite-svelte";
  export let employee, form;
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
    <Input type="hidden" name="id" hidden value={employee.Employee_Id} />
    <EmployeeFields
      employee={form?.employee ?? employee}
      error={form?.error ?? {}}
    />
    <Button pill type="submit">Update Employee</Button>
  </form>
</main>
