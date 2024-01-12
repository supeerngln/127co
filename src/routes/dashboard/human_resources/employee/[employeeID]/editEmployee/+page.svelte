<script>
  import EditEmployeeForm from "$lib/components/hr/edit/EditEmployeeForm.svelte";

  export let form;
  export let data;

  let employee = data.data[0];
</script>

<hr />
<EditEmployeeForm {employee} {form}/>
<hr />
