/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{html,js,svelte,ts}', './node_modules/flowbite-svelte/**/*.{html,js,svelte,ts}'],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        // flowbite-svelte
        primary: '#f3f3f3',
        secondary: '#191919',
        phover: '#eaeaea', 
        outline: '#e5e5e5',
        // accent: '#0072ff',
        accent: '#f16c00',
        // afocus: '#c9e1ff',
        afocus: '#ffe3cd',
        buttonp: '#fbfbfb',
        buttonphover: '#f6f6f6',
        buttonpactive: '#f7f7f7',
        subtext: '#767676',
      }
    }
  },
  plugins: [require('flowbite/plugin')],
}

