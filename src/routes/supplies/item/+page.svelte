<script>
  import { onMount } from 'svelte';
  import TableDB from '$lib/components/Table.svelte';
  import Breadcrumb from '$lib/components/Breadcrumb.svelte';

  let headers = [
    "Property_Id",
    "Employee_Id",
    "Item_Type",
    "Item_Status",
    "Item_LastUpdated",
    "Supplier_Id",
    "Location",
  ];
  let rows = [
  {
    "Property_Id": 1,
    "Employee_Id": 101,
    "Item_Type": "Laptop",
    "Item_Status": "In Use",
    "Item_LastUpdated": "2023-12-22 12:30:00",
    "Supplier_Id": 201,
    "Location": "Office Room 1",
  },
  {
    "Property_Id": 2,
    "Employee_Id": 102,
    "Item_Type": "Monitor",
    "Item_Status": "Available",
    "Item_LastUpdated": "2023-12-22 13:45:00",
    "Supplier_Id": 202,
    "Location": "Office Room 2",
  },
  // Add more rows as needed
];
  </script>
  <main class="w-full">
    <Breadcrumb items={[
      { href: '/supplies', text: 'Supplies and Inventory' },
      { href: '/supplies/item', text: 'Items' },
    ]} />
      <a href="/supplies/item/add"
          class="bg-buttonp rounded-lg z-4 border-2 w-40 border-outline p-3 mb-4 flex items-center hover:bg-buttonphover active:bg-buttonpactive">
          <span class="text-3xl material-symbols-outlined mr-2"> add </span>
          <div class="flex flex-col h-full">
              <span>Add an Entry</span>
          </div>
        </a>
        <TableDB {headers} {rows} />
  </main>
  
