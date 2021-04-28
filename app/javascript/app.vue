<template>
  <div id="app">
    <div class="form">
      <div class="form-group">
        <!--v-on ディレクティブを使うことで、イベントの発火時にJavaScriptの実行が可能 -->
        <!-- 今回の場合、クリックされたらaddMemoという関数を実行するというコード v-on: clickを@clickと省略できる -->
        <input v-model="title" placeholder="title" class="form-control">
      </div>
      <div class="form-group">
        <input v-model="description" placeholder="description" class="form-control">
      </div>
      <button @click="addMemo">メモを追加</button>
    </div>
    <div class="flex">
      <!-- v-for という書き方はVue.js特有の書き方で配列を1つずつ要素として取り出します。
      今回のコードでいうと、memosという配列を1つ1つ取り出し、その1つ1つを memoとして扱うというコードになります。 -->
      <div v-for="memo in memos" :key="memo.id" class="card">
        <div class="card-body">
          <div class="card-title">
            <!-- dataプロパティを表示するには、 {{}} で囲む-->
            {{ memo.title }}
          </div>
          {{ memo.description }}
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data: function () {
    return {
      memos: 'memos',
      title: '',
      desctiption: '',
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
    },
  addMemo: function() {
    axios.post('/api/memos', {
      title: this.title,
      desctiption: this.desctiption
    })
    .then(response => (
      this.setMemo()
    ));
    }
  }
}
</script>

<style lang="scss" scoped>
 .form {
   display: flex;
   flex-direction: column;
   justify-content: center;
   align-items: center;
   margin: 32px;
   &-group {
     margin-bottom: 1rem;
   }
   &-control {
     width: 600px;
     min-height: 24px;
     font-size: 1rem;
     border: 1px solid #ced4da;
     padding: 4px 8px;
   }
  }

  button {
    width: 200px;
  }

  .flex {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
  }

  .card {
    width: 238px;
    border: 1px solid rgba(0,0,0,.125);
    border-radius: .25rem;
    margin: 16px;
    &-body {
      padding: 1.25rem;
    }
    &-title {
      margin-bottom: .75rem;
      font-weight: 600;
    }
  }
</style>
