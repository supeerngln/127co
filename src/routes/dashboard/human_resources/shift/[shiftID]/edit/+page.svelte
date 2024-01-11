<script>
  import EditShiftForm from "$lib/components/hr/edit/EditShiftForm.svelte";
  export let data, form;

  let shift = data.data[0];
</script>

<div class="flex">
  <EditShiftForm {shift} {form} />
</div>
