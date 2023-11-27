<script>
    import "../app.css"
    import '../sideBar.css';
</script>

<div class="relative min-h-screen md:flex" data-dev-hint="container">
	<input type="checkbox" id="menu-open" class="hidden" />
	<!-- <label for="menu-open" class="absolute right-2 bottom-2 shadow-lg rounded-full p-2 bg-primary text-secondary md:hidden" data-dev-hint="floating action button">
       <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
           <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
       </svg>
   </label> -->
	<header
		class="bg-primary w-screen text-secondary flex justify-between md:hidden"
		data-dev-hint="mobile menu bar"
	>
		<a
			href="home" 
			class="block p-4 vina-sans text-accent font-bold text-3xl whitespace-nowrap truncate"
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
			<a
				href="/"
				class="text-secondary mb-5 flex items-center space-x-2 px-4"
				title="Your App is cool"
			>
				<img src="./127co.png" alt="ONE TWENTY SEVEN CO. logo" class="ml-3 h-20 w-20 flex-0" />
				<span class="text-2xl font-extrabold whitespace-nowrap truncate"></span>
			</a>

			<nav data-dev-hint="main navigation">
				<a
					href="home" 
					class="flex font-medium my-0.5 mx-4 rounded-md items-center space-x-3 py-2 px-4 transition duration-200 hover:bg-phover hover:text-secondary focus:text-accent focus:bg-afocus"
				>
					<span class="material-symbols-outlined"> home </span><span class="text-base">Home</span>
				</a>
				<a
					href="Human_Resources" 
					class="flex my-0.5 font-medium mx-4 rounded-md items-center space-x-3 py-2 px-4 transition duration-200 hover:bg-phover hover:text-secondary focus:text-accent focus:bg-afocus"
				>
					<span class="material-symbols-outlined"> groups </span>
					<span class="text-base">Human Resources</span>
				</a>
				<a
					href="Finance" 
					class="flex font-medium my-0.5 mx-4 rounded-md items-center space-x-3 py-2 px-4 transition duration-200 hover:bg-phover hover:text-secondary focus:text-accent focus:bg-afocus"
				>
					<span class="material-symbols-outlined"> payments </span><span class="text-base"
						>Finance</span
					>
				</a>
				<a
					href="Project_Management" 
					class="flex font-medium my-0.5 mx-4 rounded-md items-center space-x-3 py-2 px-4 transition duration-200 hover:bg-phover hover:text-secondary focus:text-accent focus:bg-afocus"
				>
					<span class="material-symbols-outlined"> bookmark_manager </span><span class="text-base"
						>Project Management</span
					>
				</a>
				<a
					href="Marketing_and_Customer_Acquisition" 
					class="flex font-medium my-0.5 mx-4 rounded-md items-center space-x-3 py-2 px-4 transition duration-200 hover:bg-phover hover:text-secondary focus:text-accent focus:bg-afocus"
				>
					<span class="material-symbols-outlined"> campaign </span><span class="text-base"
						>Marketing</span
					>
				</a>
				<a
					href="Cooperative" 
					class="flex font-medium my-0.5 mx-4 rounded-md items-center space-x-3 py-2 px-4 transition duration-200 hover:bg-phover hover:text-secondary focus:text-accent focus:bg-afocus"
				>
					<span class="material-symbols-outlined"> account_balance </span><span class="text-base"
						>Cooperative</span
					>
				</a>
				<a
					href="/supplies"
					class="flex font-medium my-0.5 mx-4 rounded-md items-center space-x-3 py-2 px-4 transition duration-200 hover:bg-phover hover:text-secondary focus:text-accent focus:bg-afocus"
				>
					<span class="material-symbols-outlined"> inventory_2 </span><span class="text-base"
						>Supplies and Inventory</span
					>
				</a>
				<a
					href="Bootcamp" 
					class="flex font-medium my-0.5 mx-4 rounded-md items-center space-x-3 py-2 px-4 transition duration-200 hover:bg-phover hover:text-secondary focus:text-accent focus:bg-afocus"
				>
					<span class="material-symbols-outlined"> school </span><span class="text-base"
						>Bootcamp</span
					>
				</a>
			</nav>
		</div>
	</aside>
	<main id="content" class="bg-primary flex-1 p-6 lg:px-8">
		<div class="max-w-5xl mx-auto w-full">
			<div class="flex w-full">
			<slot/>
			</div>
		</div>
	</main>
</div>