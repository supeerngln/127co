<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import { Card, Input, Label, Avatar, Hr, Button } from "flowbite-svelte";
  export let employee;
</script>

<main class="w-full">
  <Breadcrumb
    items={[
      { href: "/dashboard/human_resources", text: "Human Resources" },
      { href: "/dashboard/human_resources/employee", text: "Employees" },
      { text: "PDS" },
    ]}
  />

  <div class="flex flex-col items-center">
    <div class="pb-3">
      <Avatar border size="lg" />
    </div>
    <Label class="text-lg">
      {employee.Employee_FirstName}
      {employee.Employee_LastName}
    </Label>
  </div>
  <Hr classHr="my-1" />
  <div class="p-5 grid gap-3 mb-5 md:grid-cols-3">
    <div>
      <Label class="pt-2 text-black">Address:</Label>
      <Input
        type="text"
        value={employee.Employee_Address}
        class="disabled:opacity-100 disabled:cursor-auto"
        disabled
      />
    </div>
    <div>
      <Label class="pt-2 text-black">Contact Number:</Label>
      <Input
        type="text"
        value={employee.Employee_ContactNumber}
        class="disabled:opacity-100 disabled:cursor-auto"
        disabled
      />
    </div>
    <div>
      <Label class="pt-2 text-black">Email:</Label>
      <Input
        type="text"
        value={employee.Employee_Email}
        class="disabled:opacity-100 disabled:cursor-auto"
        disabled
      />
    </div>
    <div>
      <Label class="pt-2 text-black">Date of Birth:</Label>
      <Input
        type="text"
        value={employee.Employee_DateOfBirth.toLocaleString("default", {
          day: "2-digit",
          month: "long",
          year: "numeric",
        })}
        class="disabled:opacity-100 disabled:cursor-auto"
        disabled
      />
    </div>
    <div>
      <Label class="pt-2 text-black">Place of Birth:</Label>
      <Input
        type="text"
        value={employee.Employee_PlaceOfBirth}
        class="disabled:opacity-100 disabled:cursor-auto"
        disabled
      />
    </div>
    <div>
      <Label class="pt-2 text-black">Sex:</Label>
      <Input
        type="text"
        value={employee.Employee_Sex}
        class="disabled:opacity-100 disabled:cursor-auto"
        disabled
      />
    </div>
    <div>
      <Label class="pt-2 text-black">Civil Status:</Label>
      <Input
        type="text"
        value={employee.Employee_CivilStatus}
        class="disabled:opacity-100 disabled:cursor-auto"
        disabled
      />
    </div>
    <div>
      <Label class="pt-2 text-black">Citizenship:</Label>
      <Input
        type="text"
        value={employee.Employee_Citizenship}
        class="disabled:opacity-100 disabled:cursor-auto"
        disabled
      />
    </div>
    <div>
      <Label class="pt-2 text-black">Highest Level of Education:</Label>
      <Input
        type="text"
        value={employee.Employee_HighestLevelOfEducation}
        class="disabled:opacity-100 disabled:cursor-auto"
        disabled
      />
    </div>
    <div>
      <Label class="pt-2 text-black">School:</Label>
      <Input
        type="text"
        value={employee.Employee_School}
        class="disabled:opacity-100 disabled:cursor-auto"
        disabled
      />
    </div>
    <div>
      <Label class="pt-2 text-black">Year Graduated:</Label>
      <Input
        type="text"
        value={employee.Employee_YearGraduated}
        class="disabled:opacity-100 disabled:cursor-auto"
        disabled
      />
    </div>
    <div>
      <Label class="pt-2 text-black">PhilHealth ID:</Label>
      <Input
        type="text"
        value={employee.Employee_PhilHealthID}
        class="disabled:opacity-100 disabled:cursor-auto"
        disabled
      />
    </div>
    <div>
      <Label class="pt-2 text-black">SSS ID:</Label>
      <Input
        type="text"
        value={employee.Employee_SSSID}
        class="disabled:opacity-100 disabled:cursor-auto"
        disabled
      />
    </div>
    <div>
      <Label class="pt-2 text-black">PagIBIG ID:</Label>
      <Input
        type="text"
        value={employee.Employee_PagIBIGID}
        class="disabled:opacity-100 disabled:cursor-auto"
        disabled
      />
    </div>
    <div>
      <Label class="pt-2 text-black">Emergency Contact Person:</Label>
      <Input
        type="text"
        value={employee.Emergency_ContactName}
        class="disabled:opacity-100 disabled:cursor-auto"
        disabled
      />
    </div>
    <div>
      <Label class="pt-2 text-black">Emergency Contact Relationship:</Label>
      <Input
        type="text"
        value={employee.Emergency_ContactRelationship}
        class="disabled:opacity-100 disabled:cursor-auto"
        disabled
      />
    </div>
    <div>
      <Label class="pt-2 text-black">Emergency Contact Number:</Label>
      <Input
        type="text"
        value={employee.Emergency_ContactNumber}
        class="disabled:opacity-100 disabled:cursor-auto"
        disabled
      />
    </div>
  </div>
  <div class="flex flex-col items-center">
    <form
      method="POST"
      action="../employee/{employee.Employee_ID}/editPDS?/edit"
    >
      <Button pill type="submit">Edit</Button>
    </form>
  </div>
</main>
