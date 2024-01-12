<script>
  import EditPDSForm from "$lib/components/hr/edit/EditPDSForm.svelte";

  export let form;
  export let data;

  let pds = data.data[0];
</script>

<hr />
<EditPDSForm {pds} {form} />
<hr />
