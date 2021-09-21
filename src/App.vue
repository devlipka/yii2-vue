<template>
  <div>
    <h1>{{ text }}</h1>
  </div>
</template>

<script>
export default {
  name: "App",
  data: function () {
    return {
      text: 'This part of application is rendered in Vue.'
    }
  }
}
</script>
