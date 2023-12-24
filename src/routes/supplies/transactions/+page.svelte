<script>
  import { onMount } from 'svelte';
  import TableDB from '$lib/components/Table.svelte';
  import Breadcrumb from '$lib/components/Breadcrumb.svelte';

  let headers = [
    "Transaction_Id",
    "Property_Id",
    "Transaction_Type",
    "Transaction_Datetime",
    "Inventory_Id",
  ];
  let rows = [
      { Transaction_Id: 1, Property_Id: 101, Transaction_Type: 'Purchase', Transaction_Datetime: '2023-01-15T08:30:00', Inventory_Id: 501 },
      { Transaction_Id: 2, Property_Id: 102, Transaction_Type: 'Sale', Transaction_Datetime: '2023-02-20T14:45:00', Inventory_Id: 502 },
      { Transaction_Id: 3, Property_Id: 103, Transaction_Type: 'Transfer', Transaction_Datetime: '2023-03-25T10:15:00', Inventory_Id: 503 },
      // Add more sample data as needed
    ];
  </script>
  <main class="w-full">
    <Breadcrumb items={[
      { href: '/supplies', text: 'Supplies and Inventory' },
      { href: '/supplies/transactions', text: 'Transactions' },
    ]} />
      <a href="/supplies/transactions/add"
          class="bg-buttonp rounded-lg z-4 border-2 w-40 border-outline p-3 mb-4 flex items-center hover:bg-buttonphover active:bg-buttonpactive">
          <span class="text-3xl material-symbols-outlined mr-2"> add </span>
          <div class="flex flex-col h-full">
              <span>Add an Entry</span>
          </div>
        </a>
        <TableDB {headers} {rows} />
  </main>
  