<script>
  import { onMount } from 'svelte';
  import TableDB from '$lib/components/Table.svelte';
  import Breadcrumb from '$lib/components/Breadcrumb.svelte';

  let headers = [
    "Supplier_Id",
    "Supplier_Name",
    "Supplier_Address",
    "Supplier_ContactNumber",
    "Supplier_ContactEmail",
  ];
  let rows = [
    {
      Supplier_Id: 1,
      Supplier_Name: "ABC Corporation",
      Supplier_Address: "123 Main Street, Cityville",
      Supplier_ContactNumber: "555-1234",
      Supplier_ContactEmail: "abc@example.com",
    },
    {
      Supplier_Id: 2,
      Supplier_Name: "XYZ Enterprises",
      Supplier_Address: "456 Oak Avenue, Townsville",
      Supplier_ContactNumber: "555-5678",
      Supplier_ContactEmail: "xyz@example.com",
    },
    // Add more sample data as needed
  ];

  </script>
  <main class="w-full">
    <Breadcrumb items={[
      { href: '/supplies', text: 'Supplies and Inventory' },
      { href: '/supplies/supplier', text: 'Supplier' },
    ]} />
      <a href="/supplies/supplier/add"
          class="bg-buttonp rounded-lg z-4 border-2 w-40 border-outline p-3 mb-4 flex items-center hover:bg-buttonphover active:bg-buttonpactive">
          <span class="text-3xl material-symbols-outlined mr-2"> add </span>
          <div class="flex flex-col h-full">
              <span>Add an Entry</span>
          </div>
        </a>
        <TableDB {headers} {rows} />
  </main>
  