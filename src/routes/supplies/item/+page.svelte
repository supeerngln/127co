<!-- <script>
  
    
  </script>
  
  <main class="w-full">
      <nav class="flex font-bold w-full mb-5 text-2xl" aria-label="Breadcrumb">
          <ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
              <li class="inline-flex items-center">
                  <a
                      href="Supplies_and_Inventory"
                      on:click={handleTransactionsClick}
                      class="inline-flex items-center text-gray-700 hover:text-accent dark:text-gray-400 dark:hover:text-white"
                  >
                      Supplies and Inventory
                  </a>
              </li>
          </ol>
      </nav>
  
      <a
          href="Transactions"
          on:click={handleTransactionsClick}
          class="bg-buttonp rounded-lg z-4 border-2 border-outline p-4 flex items-center hover:bg-buttonphover active:bg-buttonpactive"
      >
          <span class="text-3xl material-symbols-outlined mr-5"> school </span>
          <div class="flex w-full flex-col h-full">
              <span>Installed apps</span>
              <span class="text-subtext z-4">apps on yout pc</span>
          </div>
          <span class="relative z-4 right-100 bottom-0 material-symbols-outlined"> navigate_next </span>
      </a>
  </main>
   -->
   
   <script>
    import { Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell } from 'flowbite-svelte';
    import { createEventDispatcher } from 'svelte';
  
    const dispatch = createEventDispatcher();
  
    const handleTransactionsClick  = () => {
      // Dispatch an event to notify the parent component to open Transactions.svelte
      dispatch('linkClicked', 'Transactions');
    };
  </script>
  <main class="w-full">
    <nav class="flex font-bold text-2xl pb-6" aria-label="Breadcrumb">
        <ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
          <li class="inline-flex items-center">
            <a href="/supplies" class="inline-flex items-center text-gray-700 hover:text-accent dark:text-gray-400 dark:hover:text-white">
            
              Supplies and Inventory
            </a>
          </li>
          <li>
            <div class="flex items-center">
              <svg class="rtl:rotate-180 w-3 h-3 text-gray-400 mx-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
              </svg>
              <a href="/supplies/item" class="ms-1  text-gray-700 hover:text-accent md:ms-2 dark:text-gray-400 dark:hover:text-white">Items</a>
            </div>
          </li>
        </ol>
      </nav>
      <button
          class="bg-buttonp rounded-lg z-4 border-2 border-outline p-3 mb-4 flex items-center hover:bg-buttonphover active:bg-buttonpactive">
          <span class="text-3xl material-symbols-outlined mr-2"> add </span>
          <div class="flex w-full flex-col h-full">
              <span>Add an Entry</span>
          </div>
        </button>
      <div class="flex flex-col">
        <div class="-m-1.5 overflow-x-auto">
          <div class="p-1.5 min-w-full inline-block align-middle">
            <div class="overflow-hidden border-outline">
              <table class="min-w-full divide-y bg-tablebg dark:divide-gray-700 border-outline">
                <thead>
                  <tr>
                    <th scope="col" class="px-6 py-3 text-start text-xs font-medium text-gray-500 uppercase">Name</th>
                    <th scope="col" class="px-6 py-3 text-start text-xs font-medium text-gray-500 uppercase">Age</th>
                    <th scope="col" class="px-6 py-3 text-start text-xs font-medium text-gray-500 uppercase">Address</th>
                    <th scope="col" class="px-6 py-3 text-end text-xs font-medium text-gray-500 uppercase">Actions</th>
                  </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 dark:divide-gray-700">

      
                  <tr class="hover:bg-tableh dark:hover:bg-gray-700">
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-800 dark:text-gray-200">Jim Green</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-800 dark:text-gray-200">27</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-800 dark:text-gray-200">London No. 1 Lake Park</td>
                    <td class="px-6 py-4 whitespace-nowrap text-end text-sm font-medium">
                      <button type="button" class="inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent text-blue-600 hover:text-blue-800 disabled:opacity-50 disabled:pointer-events-none dark:text-blue-500 dark:hover:text-blue-400 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600">Edit</button>&nbsp&nbsp&nbsp<button type="button" class="inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent text-active hover:text-hactive disabled:opacity-50 disabled:pointer-events-none dark:text-blue-500 dark:hover:text-blue-400 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600">Delete</button>
                    </td>
                  </tr>
                  <tr class="hover:bg-tableh dark:hover:bg-gray-700">
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-800 dark:text-gray-200">Jim Green</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-800 dark:text-gray-200">27</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-800 dark:text-gray-200">London No. 1 Lake Park</td>
                    <td class="px-6 py-4 whitespace-nowrap text-end text-sm font-medium">
                      <button type="button" class="inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent text-blue-600 hover:text-blue-800 disabled:opacity-50 disabled:pointer-events-none dark:text-blue-500 dark:hover:text-blue-400 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600">Edit</button>&nbsp&nbsp&nbsp<button type="button" class="inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent text-active hover:text-hactive disabled:opacity-50 disabled:pointer-events-none dark:text-blue-500 dark:hover:text-blue-400 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600">Delete</button>
                    </td>
                  </tr>
                  <tr class="hover:bg-tableh dark:hover:bg-gray-700">
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-800 dark:text-gray-200">Jim Green</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-800 dark:text-gray-200">27</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-800 dark:text-gray-200">London No. 1 Lake Park</td>
                    <td class="px-6 py-4 whitespace-nowrap text-end text-sm font-medium">
                      <button type="button" class="inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent text-blue-600 hover:text-blue-800 disabled:opacity-50 disabled:pointer-events-none dark:text-blue-500 dark:hover:text-blue-400 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600">Edit</button>&nbsp&nbsp&nbsp<button type="button" class="inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent text-active hover:text-hactive disabled:opacity-50 disabled:pointer-events-none dark:text-blue-500 dark:hover:text-blue-400 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600">Delete</button>
                    </td>
                  </tr>
    
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
  </main>
  