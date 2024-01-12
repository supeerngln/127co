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
  export let logs;
</script>

<Table striped={true} hoverable={true} shadow class="text-center">
  <TableHead>
    <TableBodyCell>Timesheet ID</TableBodyCell>
    <TableBodyCell>Employee ID</TableBodyCell>
    <TableBodyCell>Employee Name</TableBodyCell>
    <TableBodyCell>Time In</TableBodyCell>
    <TableBodyCell>Time Out</TableBodyCell>
    <TableHeadCell>
      <span class="sr-only">Edit</span>
      <span class="sr-only">Delete</span>
    </TableHeadCell>
  </TableHead>
  <TableBody class="divide-y">
    {#each logs as log}
      <TableBodyRow>
        <TableBodyCell>{log.Timesheet_ID}</TableBodyCell>
        <TableBodyCell>{log.Employee_ID}</TableBodyCell>
        <TableBodyCell
          >{log.Employee_FirstName + " " + log.Employee_LastName}</TableBodyCell
        >
        <TableBodyCell>{formatDateTime(log.Timesheet_TimeIn)}</TableBodyCell>
        <TableBodyCell>{formatDateTime(log.Timesheet_TimeOut)}</TableBodyCell>
        <TableBodyCell class="flex gap-3">
          <form
            method="POST"
            action="./timesheet/{log.Timesheet_ID}/edit?/edit"
          >
            <Button pill type="submit">Edit</Button>
          </form>
          <form method="POST" action="?/delete">
            <input type="hidden" name="id" hidden value={log.Timesheet_ID} />
            <Button pill type="submit">Delete</Button>
          </form>
        </TableBodyCell>
      </TableBodyRow>
    {/each}
  </TableBody>
</Table>