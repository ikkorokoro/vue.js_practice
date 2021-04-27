<template>
  <div id="app">
    <p>{{ message }}</p>
    <ul>
      <li v-for= 'memo in memos' :key= 'memo.id'>
        {{memo.title}}: {{memo.desctiption}}
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data: function () {
    return {
      memos: 'memos'
    }
  },
  /* mounted()はアプリが立ち上がった最初のタイミング(app.vueファイルが読み込まれた時点)で実行される関数を定義 */
  mounted () {
    this.setMemo();
  },
  methods: {
    setMemo: function () {
      axios.get('/api/memos')
      .then(response => (
        this.memos = response.data
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
