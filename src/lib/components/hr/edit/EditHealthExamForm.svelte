<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import HealthExamFields from "../form_fields/HealthExamFields.svelte";
  import { Input, Button } from "flowbite-svelte";
  export let form;
  export let exam;
</script>

<main class="w-full">
  <Breadcrumb
    items={[
      { href: "/dashboard/human_resources", text: "Human Resources" },
      { href: "/dashboard/human_resources/health-exam", text: "Health Exams" },
      { text: "Edit" },
    ]}
  />
  <form method="post" action="?/update">
    <Input type="hidden" name="id" hidden value={exam.HE_ID} />
    <HealthExamFields
      isNew={false}
      exam={form?.exam ?? exam}
      error={form?.error ?? {}}
    />
    <Button pill type="submit">Update Health Exam</Button>
  </form>
</main>