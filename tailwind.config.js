/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        navy: {
          900: '#101B35',
          800: '#162345',
          700: '#1e2f5e',
        },
        electric: {
          500: '#3867F5',
          600: '#2c53cb',
          700: '#213fa1',
        },
        bgLight: '#F6F8FC',
      },
    },
  },
  plugins: [],
}
