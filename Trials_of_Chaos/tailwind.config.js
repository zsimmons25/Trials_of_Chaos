import containerQueries from '@tailwindcss/container-queries'

/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      fontFamily: {
        Insmallcaps: ['FontinSmallCaps'],
      },
      colors: {
        blood: 'oklch(0.15 0.03 25deg)',
        gold: 'oklch(0.82 0.14 90deg)',
      },
    },
  },
  plugins: [containerQueries],
}