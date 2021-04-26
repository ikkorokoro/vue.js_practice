<template>
  <div id="app">
    <p>{{ message }}</p>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  },
  methods: {
    setMemo: function () {
      axios.get('/api/memos')
      .then(response => (
        this.memos = response
      ))
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
