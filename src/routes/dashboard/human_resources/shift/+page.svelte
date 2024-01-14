<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import ShiftsDisplay from "$lib/components/hr/displays/ShiftsDisplay.svelte";
  import { Section } from "flowbite-svelte-blocks";

  export let data;
</script>

<main>
  <Breadcrumb
    items={[
      { href: "/dashboard/human_resources", text: "Human Resources" },
      { href: "/dashboard/human_resources/shift", text: "Shifts" },
    ]}
  />
  <Section classSection="p-3 sm:p-5">
    <ShiftsDisplay schedules={data.data} />
  </Section>
</main>
