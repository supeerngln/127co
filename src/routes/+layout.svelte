<script lang="ts">
  import Navigation from '$lib/components/Navigation.svelte';
  import Breadcrumb from '$lib/components/Breadcrumb.svelte';

  const modules = import.meta.glob('./**/+page.svelte');
</script>

<div class="app">
  <header>
    <Navigation { modules } />
    <Breadcrumb />
  </header>

  <main>
   <slot/>
  </main>
</div>
