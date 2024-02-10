/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [ "./app/views/**/*.html.erb"],
  theme: {
    extend: {
      fontFamily: {
        inter: ["Inter"],
      },
      letterSpacing: {
        code: "2em"
      }
    },
  },
  plugins: [
    function ({ addVariant }) {
      addVariant('child', '& > *');
      addVariant('child-hover', '& > *:hover');
    }
  ],
  corePlugins: {
    backdropOpacity: false,
    backgroundOpacity: false,
    borderOpacity: false,
    divideOpacity: false,
    ringOpacity: false,
    textOpacity: false,
    // preflight: false
  }
}
