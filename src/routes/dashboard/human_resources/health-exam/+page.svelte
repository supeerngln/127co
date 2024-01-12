<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import HealthExamsDisplay from "$lib/components/hr/displays/HealthExamsDisplay.svelte";
  import { searchKeywordsHE } from "$lib/util/hr/searchUtilHR";
  import { formatDate2 } from "$lib/util/hr/utilsHR";
  import {
    P,
    Label,
    Input,
    Button,
    Radio,
    TableSearch,
    Select,
  } from "flowbite-svelte";
  import { Section } from "flowbite-svelte-blocks";

  export let data;
  let searchTerm = "";
  let searchByKeywords = true;
  let filter = "";
  let exactDate = true;
  let startDate = null;
  let endDate = null;
  const searchHE = data.data.map((he) => ({
    ...he,
    searchTerms: searchKeywordsHE(he),
  }));

  $: filteredItems = searchHE.filter((he) => {
    if (searchByKeywords) {
      return (
        he.searchTerms.toLowerCase().includes(searchTerm.toLowerCase()) &&
        he.HE_Assessment.toLowerCase().includes(filter)
      );
    } else {
      let he_date = new Date(formatDate2(he.HE_Date));
      let start = new Date(startDate);

      if (exactDate) {
        return (
          he.HE_Assessment.toLowerCase().includes(filter) &&
          he_date - start === 0
        );
      } else {
        let end = new Date(endDate);
        let startDiff = he_date - start;
        let endDiff = end - he_date;

        return (
          he.HE_Assessment.toLowerCase().includes(filter) &&
          startDiff >= 0 &&
          endDiff >= 0
        );
      }
    }
  });
</script>

<main class="w-full">
  <Breadcrumb
    items={[
      { href: "/dashboard/human_resources", text: "Human Resources" },
      { href: "/dashboard/human_resources/health-exam", text: "Health Exams" },
    ]}
  />
  <Section classSection="p-3 sm:p-5">
    <Label class="mb-2"><P size="lg">Search by:</P></Label>
    <ul
      class="mb-3 items-center rounded-lg border sm:flex divide-x divide-y sm:w-auto"
    >
      <li class="w-full">
        <Radio
          class="p-3"
          name="search-by-keywords"
          id="keywords"
          value={true}
          bind:group={searchByKeywords}
        >
          Keyword
        </Radio>
      </li>
      <li class="w-full">
        <Radio
          class="p-3"
          name="search-by-keywords"
          id="range"
          value={false}
          bind:group={searchByKeywords}
        >
          Date
        </Radio>
      </li>
    </ul>
    {#if searchByKeywords}
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
          <Button pill href="./health-exam/add" class="mt-2 mb-2">
            Add Health Exam
          </Button>
        </div>
        <HealthExamsDisplay exams={filteredItems} />
      </TableSearch>
    {:else}
      <div class="grid gap-3 md:grid-cols-3">
        <div>
          <Label for="filter" class="mb-2">Filter:</Label>
          <Select name="filter" id="filter" bind:value={exactDate}>
            <option value={true}>Exact Date</option>
            <option value={false}>Date Range</option>
          </Select>
        </div>
        <div>
          <Label for="start-date" class="mb-2"
            >{exactDate ? "Exact Date: " : "Start Date: "}</Label
          >
          <Input
            type="date"
            name="start-date"
            id="start-date"
            bind:value={startDate}
          />
        </div>
        {#if !exactDate}
          <div>
            <Label for="end-date" class="mb-2">End Date:</Label>
            <Input
              type="date"
              name="end-date"
              id="end-date"
              min={startDate}
              bind:value={endDate}
            />
          </div>
        {/if}
      </div>
      <div class="flex justify-between items-center mt-5">
        <p>
          Returned {filteredItems.length}
          {filteredItems.length <= 1 ? "result" : "results"}
        </p>
      </div>
      <HealthExamsDisplay exams={filteredItems} />
    {/if}
  </Section>
</main>
