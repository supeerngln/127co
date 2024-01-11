<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import TimeSheetDisplay from "$lib/components/hr/displays/TimeSheetsDisplay.svelte";
  import { searchKeywordsTS } from "$lib/util/hr/searchUtilHR";
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
  let selected;
  let searchFilters = [
    { value: true, name: "Keyword" },
    { value: false, name: "Date" },
  ];
  let searchByKeyword = true;
  let filterTimeIn = true;
  let dateSearch = null;
  const searchTS = data.data.map((ts) => ({
    ...ts,
    searchTerms: searchKeywordsTS(ts),
  }));

  $: filteredItems = searchTS.filter((ts) => {
    if (searchByKeyword) {
      return ts.searchTerms.toLowerCase().includes(searchTerm.toLowerCase());
    } else {
      if (filterTimeIn) {
        return (
          new Date(formatDate2(ts.Timesheet_TimeIn)) - new Date(dateSearch) ===
          0
        );
      } else {
        return (
          new Date(formatDate2(ts.Timesheet_TimeOut)) - new Date(dateSearch) ===
          0
        );
      }
    }
  });
</script>

<main>
  <Breadcrumb
    items={[
      { href: "/dashboard/human_resources", text: "Human Resources" },
      { href: "/dashboard/human_resources/timesheet", text: "Timesheets" },
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
          name="searchByKeyword"
          id="keyword"
          value={true}
          bind:group={searchByKeyword}
        >
          Keyword
        </Radio>
      </li>
      <li class="w-full">
        <Radio
          class="p-3"
          name="searchByKeyword"
          id="keyword"
          value={false}
          bind:group={searchByKeyword}
        >
          Date
        </Radio>
      </li>
    </ul>
    {#if searchByKeyword}
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
          <Button pill href="./timesheet/add" class="mt-2 mb-2">
            Add Timesheet</Button
          >
        </div>
        <TimeSheetDisplay logs={filteredItems} />
      </TableSearch>
    {:else}
      <div class="grid gap-3 md:grid-cols-2">
        <div>
          <Label for="date-search" class="mb-2">Date:</Label>
          <Input
            type="date"
            name="date-search"
            id="date-search"
            bind:value={dateSearch}
          />
        </div>
        <div>
          <Label for="filter" class="mb-2">Filter by:</Label>
          <Select name="filter" id="filter" bind:value={filterTimeIn}>
            <option value={true}>Time In</option>
            <option value={false}>Time Out</option>
          </Select>
        </div>
      </div>
      <div class="flex justify-between items-center mt-5">
        <p>
          Returned {filteredItems.length}
          {filteredItems.length <= 1 ? "result" : "results"}
        </p>
        <Button pill href="./timesheet/add" class="mt-2 mb-2"
          >Add Timesheet</Button
        >
      </div>
      <TimeSheetDisplay logs={filteredItems} />
    {/if}
  </Section>
</main>
