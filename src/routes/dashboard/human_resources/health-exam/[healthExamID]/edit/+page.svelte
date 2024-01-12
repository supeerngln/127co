<script>
  import EditHealthExamForm from "$lib/components/hr/edit/EditHealthExamForm.svelte";

  export let form;
  export let data;

  let exam = data.data[0];
</script>

<hr />
<EditHealthExamForm {form} {exam} />
<hr />
