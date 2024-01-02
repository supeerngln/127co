<script lang="ts">
  import "./sideBar.css";
  import { writable } from "svelte/store";
  import { onMount } from "svelte";
  import type { LayoutData } from "./$types";

  export let data: LayoutData;

  // Create a writable store to manage the active link
  const activeLink = writable<string | null>(null);

  // Function to handle link clicks
  const handleLinkClick = (href: string) => {
    // Update the active link store
    activeLink.set(href);
  };

  // Define your navigation links
  let links = data.links;

  // Subscribe to the active link store
  $: activeLink.subscribe((value) => {
    $activeLink = value;
  });

  // Set the initial active link based on the current route or page
  onMount(() => {
    const currentRoute = window.location.pathname; // Adjust this based on your routing setup
    activeLink.set(currentRoute);
  });
</script>

<div class="relative min-h-screen md:flex" data-dev-hint="container">
  <input type="checkbox" id="menu-open" class="hidden" />
  <label
    for="menu-open"
    class="absolute right-2 bottom-2 shadow-lg rounded-full p-2 bg-primary text-secondary md:hidden"
    data-dev-hint="floating action button"
  >
    <svg
      class="h-5 w-5"
      xmlns="http://www.w3.org/2000/svg"
      fill="none"
      viewBox="0 0 24 24"
      stroke="currentColor"
    >
      <path
        stroke-linecap="round"
        stroke-linejoin="round"
        stroke-width="2"
        d="M4 6h16M4 12h16M4 18h16"
      />
    </svg>
  </label>
  <header
    class="bg-primary w-screen text-secondary flex justify-between md:hidden"
    data-dev-hint="mobile menu bar"
  >
    <a
      href="home"
      class="block p-4 jost text-accent font-bold text-3xl whitespace-nowrap truncate"
    >
      ONE TWENTY SEVEN CO.
    </a>

    <label
      for="menu-open"
      id="mobile-menu-button"
      class="m-2 p-2 focus:outline-none hover:text-secondary hover:bg-phover rounded-md"
    >
      <svg
        id="menu-open-icon"
        class="h-6 w-6 transition duration-200 ease-in-out"
        xmlns="http://www.w3.org/2000/svg"
        fill="none"
        viewBox="0 0 24 24"
        stroke="currentColor"
      >
        <path
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="2"
          d="M4 6h16M4 12h16M4 18h16"
        />
      </svg>
      <svg
        id="menu-close-icon"
        class="h-6 w-6 transition duration-200 ease-in-out"
        xmlns="http://www.w3.org/2000/svg"
        fill="none"
        viewBox="0 0 24 24"
        stroke="currentColor"
      >
        <path
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="2"
          d="M6 18L18 6M6 6l12 12"
        />
      </svg>
    </label>
  </header>

  <aside
    id="sidebar"
    class="bg-primary z-10000 text-secondary md:w-80 w-3/4 space-y-6 pt-6 px-0 absolute inset-y-0 left-0 transform md:relative md:translate-x-0 transition duration-200 ease-in-out md:flex md:flex-col md:justify-between overflow-y-auto"
    data-dev-hint="sidebar; px-0 for frameless; px-2 for visually inset the navigation"
  >
    <div
      class="flex flex-col space-y-6"
      data-dev-hint="optional div for having an extra footer navigation"
    >
      <button
        class="text-secondary mb-5 flex items-center space-x-2 px-4"
        title="Your App is cool"
        on:click={() => {window.location.href = "/" }}
      >
        <img
          src="/Logo.png"
          alt="ONE TWENTY SEVEN CO. logo"
          class="ml-3 h-20 w-30 flex-0"
        />
        <span class="text-2xl font-extrabold whitespace-nowrap truncate"></span>
      </button>

      <form
        class="flex items-center space-x-2 px-4"
        method="POST"
        action="/logout">
        <button
          type="submit"
          class="flex items-center space-x-2 px-4 text-secondary hover:text-accent focus:text-accent focus:bg-afocus"
          title="Logout"
        >
          <span class="material-symbols-outlined">logout</span>
          <span class="text-base">Logout</span>
        </button>
      </form>

      <nav data-dev-hint="main navigation">
        {#each links as { href, label, icon }}
          <a
            {href}
            class={`flex font-medium my-0.5 mx-4 rounded-md items-center space-x-3 py-2 px-4 transition duration-200
								hover:bg-phover hover:text-secondary focus:text-accent focus:bg-afocus
								${$activeLink === href ? "active:bg-accent active:text-secondary" : ""}`}
            on:click={() => handleLinkClick(href)}
          >
            <span class="material-symbols-outlined">{icon}</span>
            <span class="text-base">{label}</span>
          </a>
        {/each}
      </nav>
    </div>
  </aside>
  <main id="content" class="bg-primary flex-1 p-6 lg:px-8">
    <div class="max-w-5xl mx-auto w-full">
      <div class="flex w-full">
        <slot />
      </div>
    </div>
  </main>
</div>

<style>
  button {
    background-color: transparent;
    border: none;
    cursor: pointer;
  }

  button:hover {
    background-color: transparent;
  }

  a:hover {
    text-decoration: none;
  }
</style>
