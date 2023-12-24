<script>
    import { Search, Button} from 'flowbite-svelte';
    import TableDB from '$lib/components/Table.svelte';
    import TableDB1 from '$lib/components/Table1.svelte';
    import TableDB2 from '$lib/components/Table2.svelte';
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
    },];
    let headers1 = [
        "Supplier_Id",
        "Supplier_Name",
        "Supplier_Address",
        "Supplier_ContactNumber",
        "Supplier_ContactEmail",
    ];
    let rows1 = [
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
    let headers2 = [
        "Transaction_Id",
        "Property_Id",
        "Transaction_Type",
        "Transaction_Datetime",
        "Inventory_Id",
    ];
    let rows2 = [
        { Transaction_Id: 1, Property_Id: 101, Transaction_Type: 'Purchase', Transaction_Datetime: '2023-01-15T08:30:00', Inventory_Id: 501 },
        { Transaction_Id: 2, Property_Id: 102, Transaction_Type: 'Sale', Transaction_Datetime: '2023-02-20T14:45:00', Inventory_Id: 502 },
        { Transaction_Id: 3, Property_Id: 103, Transaction_Type: 'Transfer', Transaction_Datetime: '2023-03-25T10:15:00', Inventory_Id: 503 },
        // Add more sample data as needed
    ];


</script>
<main class="w-full">
<Breadcrumb items={[{ href: '/supplies', text: 'Supplies and Inventory' },]} />
<Search class="mb-8">
    <Button class="bg-activeb">Search</Button>
</Search>
<div class="ml-9 mb-20">
    <span class="text-xl mb-40 text-center font-bold">No exact match found.</span>
</div>

<TableDB {headers} {rows} />
<TableDB1 {headers1} {rows1} />
<TableDB2 {headers2} {rows2} />
<!-- <TableDB {headers: headers2, rows: rows2} />
<TableDB {headers: headers3, rows: rows3} /> -->

<!-- <TableDB {headers2} {rows2} />
<TableDB {headers3} {rows3} /> -->
      <a
          href="/supplies/item"
          class="bg-buttonp rounded-lg z-4 mb-1 border-2 border-outline p-4 flex items-center hover:bg-buttonphover active:bg-buttonpactive"
      >
          <span class="text-3xl material-symbols-outlined mr-5"> devices </span>
          <div class="flex w-full flex-col h-full">
              <span>Items</span>
              <span class="text-subtext z-4">Assess current item information.</span>
          </div>
          <span class="relative z-4 right-100 bottom-0 material-symbols-outlined"> navigate_next </span>
      </a>
      <a
          href="/supplies/transactions"
          class="bg-buttonp rounded-lg z-4 mb-1 border-2 border-outline p-4 flex items-center hover:bg-buttonphover active:bg-buttonpactive"
      >
          <span class="text-3xl material-symbols-outlined mr-5"> contract </span>
          <div class="flex w-full flex-col h-full">
              <span>Transactions</span>
              <span class="text-subtext z-4">Track all transactions of all inventory items.</span>
          </div>
          <span class="relative z-4 right-100 bottom-0 material-symbols-outlined"> navigate_next </span>
      </a>
      <a
          href="/supplies/supplier"
          class="bg-buttonp rounded-lg z-4 border-2 mb-1  border-outline p-4 flex items-center hover:bg-buttonphover active:bg-buttonpactive"
      >
          <span class="text-3xl material-symbols-outlined mr-5"> warehouse </span>
          <div class="flex w-full flex-col h-full">
              <span>Supplier</span>
              <span class="text-subtext z-4">Know more about supplier contact information.</span>
          </div>
          <span class="relative z-4 right-100 bottom-0 material-symbols-outlined"> navigate_next </span>
        </a>
  </main>
  
  