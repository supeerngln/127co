<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import HealthExamFields from "../form_fields/HealthExamFields.svelte";
  import { Button } from "flowbite-svelte";

  export let form;
</script>

<main class="w-full">
  <Breadcrumb
    items={[
      { href: "/dashboard/human_resources", text: "Human Resources" },
      { href: "/dashboard/human_resources/health-exam", text: "Health Exams" },
      { href: "/dashboard/human_resources/health-exam/add", text: "Add" },
    ]}
  />
  <form method="post" action="?/insert">
    <HealthExamFields
      isNew={true}
      exam={form?.exam ?? null}
      error={form?.error ?? {}}
    />
    <Button pill type="submit">Add New Health Exam</Button>
  </form>
</main>