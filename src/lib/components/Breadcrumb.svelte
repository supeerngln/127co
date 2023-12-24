<script>
	export let items = [];
  </script>
  
  <nav class="flex font-bold text-2xl pb-6" aria-label="Breadcrumb">
	<ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
	  {#each items as item, index}
		<li class="inline-flex items-center">
		  {#if index === 0}
			<a href={item.href} class="inline-flex items-center text-gray-700 hover:text-accent dark:text-gray-400 dark:hover:text-white">
			  {item.text}
			</a>
		  {:else}
			<div class="flex items-center">
			  <svg class="rtl:rotate-180 w-3 h-3 text-gray-400 mx-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
				<path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
			  </svg>
			  <a href={item.href} class="ms-1  text-gray-700 hover:text-accent md:ms-2 dark:text-gray-400 dark:hover:text-white">{item.text}</a>
			</div>
		  {/if}
		</li>
	  {/each}
	</ol>
  </nav>
  