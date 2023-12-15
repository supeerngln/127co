/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{html,js,svelte,ts}', 'node_modules/preline/dist/*.js', './node_modules/flowbite-svelte/**/*.{html,js,svelte,ts}'],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        // flowbite-svelte
        primary: {"50":"#fefce8","100":"#fef9c3","200":"#fef08a","300":"#fde047","400":"#facc15","500":"#eab308","600":"#ca8a04","700":"#a16207","800":"#854d0e","900":"#713f12"},
        secondary: '#191919',
        phover: '#eaeaea', 
        outline: '#e5e5e5',
        // accent: '#0072ff',
        accent: '#9b5d00',
        active: '#e60017',
        hactive: '#a80313',
        tablebg: '#fcfcfc',
        tableh: '#f8f8f8',
        activeb:  '#e19d00',
        // afocus: '#c9e1ff',
        afocus: '#f9e4bb',
        buttonp: '#fbfbfb',
        buttonphover: '#f6f6f6',
        buttonpactive: '#f7f7f7',
        subtext: '#767676',
      }
    }
  },
  plugins: [require('preline/plugin'),require('flowbite/plugin'),],
}

// module.exports = config;