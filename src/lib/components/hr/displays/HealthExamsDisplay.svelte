<script>
  import { formatDateTime } from "$lib/util/hr/utilsHR.js";
  import {
    Table,
    TableBody,
    TableBodyCell,
    TableBodyRow,
    TableHead,
    TableHeadCell,
    Button,
  } from "flowbite-svelte";
  export let exams;
</script>

<Table striped={true} hoverable={true} shadow class="text-center">
  <TableHead>
    <TableHeadCell>Heath Exam ID</TableHeadCell>
    <TableHeadCell>Employee ID</TableHeadCell>
    <TableHeadCell>Employee Name</TableHeadCell>
    <TableHeadCell>Date and Time</TableHeadCell>
    <TableHeadCell>Height</TableHeadCell>
    <TableHeadCell>Weight</TableHeadCell>
    <TableHeadCell>Blood Type</TableHeadCell>
    <TableHeadCell>Eye Color</TableHeadCell>
    <TableHeadCell>Doctor Name</TableHeadCell>
    <TableHeadCell>Assessment</TableHeadCell>
    <TableHeadCell>
      <span class="sr-only">Edit</span>
      <span class="sr-only">Delete</span>
    </TableHeadCell>
  </TableHead>
  <TableBody class="divide-y">
    {#each exams as exam}
      <TableBodyRow>
        <TableBodyCell>{exam.HE_ID}</TableBodyCell>
        <TableBodyCell>{exam.Employee_ID}</TableBodyCell>
        <TableBodyCell
          >{exam.Employee_FirstName +
            " " +
            exam.Employee_LastName}</TableBodyCell
        >
        <TableBodyCell>{formatDateTime(exam.HE_Date)}</TableBodyCell>
        <TableBodyCell>{exam.HE_Height}</TableBodyCell>
        <TableBodyCell>{exam.HE_Weight}</TableBodyCell>
        <TableBodyCell>{exam.HE_BloodType}</TableBodyCell>
        <TableBodyCell>{exam.HE_EyeColor}</TableBodyCell>
        <TableBodyCell>{exam.HE_DoctorName}</TableBodyCell>
        <TableBodyCell>{exam.HE_Assessment}</TableBodyCell>
        <TableBodyCell class="flex gap-3">
          <form method="POST" action="./health-exam/{exam.HE_ID}/edit?/edit">
            <Button pill type="submit">Edit</Button>
          </form>
          <form method="POST" action="?/delete">
            <input type="hidden" name="id" hidden value={exam.HE_ID} />
            <Button pill type="submit">Delete</Button>
          </form>
        </TableBodyCell>
      </TableBodyRow>
    {/each}
  </TableBody>
</Table>

<style>
</style>
