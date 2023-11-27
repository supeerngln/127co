<script>
    import { createEventDispatcher } from 'svelte';
  
    const dispatch = createEventDispatcher();
  
    const handleTransactionsClick  = () => {
      // Dispatch an event to notify the parent component to open Transactions.svelte
      dispatch('linkClicked', 'Transactions');
    };
  
    
  </script>
  
  <main class="w-full">
      <nav class="flex font-bold w-full mb-5 text-2xl" aria-label="Breadcrumb">
          <ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
              <li class="inline-flex items-center">
                  <a
                      href="Supplies_and_Inventory"
                      on:click={handleTransactionsClick}
                      class="inline-flex items-center text-gray-700 hover:text-blue-600 dark:text-gray-400 dark:hover:text-white"
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
  