<script>
  import EditTimesheetForm from "$lib/components/hr/edit/EditTimesheetForm.svelte";

  export let data;
  export let form;

  let log = data.data[0];
</script>

<hr />
<EditTimesheetForm {log} {form} />
<hr />
