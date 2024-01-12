<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import JobsDisplay from "$lib/components/hr/displays/JobsDisplay.svelte";
  import { searchKeywordsJob } from "$lib/util/hr/searchUtilHR";
  import { Button, TableSearch } from "flowbite-svelte";
  import { Section } from "flowbite-svelte-blocks";

  export let data;

  let searchTerm = "";

  const searchJobs = data.data.map((job) => ({
    ...job,
    searchTerms: searchKeywordsJob(job),
  }));

  $: filteredItems = searchJobs.filter((job) => {
    return job.searchTerms.toLowerCase().includes(searchTerm.toLowerCase());
  });
</script>

<main class="w-full">
  <Breadcrumb
    items={[
      { href: "/dashboard/human_resources", text: "Human Resources" },
      { href: "/dashboard/human_resources/job", text: "Jobs" },
    ]}
  />
  <Section classSection="p-3 sm:p-5">
    <TableSearch
      placeholder="Search Keywords"
      hoverable={true}
      bind:inputValue={searchTerm}
    >
      <div slot="header" class="flex justify-between items-center">
        <p>
          Returned {filteredItems.length}
          {filteredItems.length <= 1 ? "result" : "results"}
        </p>
        <Button pill href="./job/add" class="mt-2 mb-2">Add Job</Button>
      </div>
      <JobsDisplay jobs={filteredItems} />
    </TableSearch>
  </Section>
</main>
