<script>
    import { Search, Button} from 'flowbite-svelte';
    // import { SearchOutline, ChevronDownSolid } from 'flowbite-svelte-icons';
    import { SearchOutline } from 'flowbite-svelte-icons';

    // const items = [
    //   {
    //     label: 'All categories'
    //   },
    //   {
    //     label: 'Items'
    //   },
    //   {
    //     label: 'Transactions'
    //   },
    //   {
    //     label: 'Suppliers'
    //   }
    // ]
  
    // let selectCategory = 'All categories'
  
  </script>
  
<main class="w-full">
   

<nav class="flex font-bold text-2xl pb-6" aria-label="Breadcrumb">
    <ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
      <li class="inline-flex items-center">
        <a href="/supplies" class="inline-flex items-center text-gray-700 hover:text-accent dark:text-gray-400 dark:hover:text-white">
        
          Supplies and Inventory
        </a>
      </li>
    </ol>
</nav>
<Search class="mb-20">
    <Button class="bg-activeb">Search</Button>

    
</Search>

  
  <!-- <form class="flex gap-2">
    <Search size="md" />
    <Button class="!p-2.5">
      <SearchOutline class="w-5 h-5" />
    </Button>
  </form> -->
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
          href="/supplies/transactions"
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
  
  