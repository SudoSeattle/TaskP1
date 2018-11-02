<template>
<div id="app">
  <h2>Tasks</h2>
  <div class="container">
    <ul class="collection">
      <h3>Todo</h3>
      <!-- タスクの移動　ドラッグ&ドロップ -->
      <draggable class="dd" :list="unfinishedTasks"
                 :options="{group:'tasks'}">

        <li v-for="task in tasks" class="collection-item">
          {{task.name}}

          <!-- <button v-on:click="deleteItemTodo(evt)" class="delete" type="button">Delete</button> -->

        </li>
      </draggable>
      <!-- タスクの追加 -->
      <form v-on:submit.prevent>
        <input type="text" placeholder="Todo..." v-model="newTodo">
        <button v-on:click="addTodo">
          Add
        </button>
      </form>
    </ul>
    <ul class="collection">
      <h3>Done</h3>
      <draggable class="dd" :list="finishedTasks"
                 :options="{group:'tasks'}">
        <li v-for="task in finishedTasks" class="collection-item">
          {{task.name}}

          <button v-on:click="deleteItemDone(evt)" class="delete" type="button">Delete</button>

        </li>
      </draggable>
      <!-- タスクの追加 -->
      <form v-on:submit.prevent>
        <input type="text" placeholder="Done..." v-model="newDone">
        <button v-on:click="addDone">
          Add
        </button>
      </form>
    </ul>
  </div>
</div>
</template>


<script>
import draggable from 'vuedraggable';
import { getCard } from './query/getCard'

export default{
  components:{
    draggable,
  },
  apollo: {
      // tasksにimportしたgetCardsクエリに対する回答を格納
      tasks: {
        query: getCard
      }
    },

  methods:{
  	// Todoタスクの追加
  	addTodo: function(evt) {
    	// フォームが空ならタスクを追加しない
      if(this.newTodo == "") return;
      var unfinishedTask = {
      	name: this.newTodo
      };
      // 配列unfinishedTasksに追加
      this.unfinishedTasks.push(unfinishedTask);
      // フォームを空にする
      this.newTodo = "";
    },
    //Doneタスクの追加
    addDone: function(evt) {
      if(this.newDone == "") return;
      var finishedTask = {
      	name: this.newDone
      };
      this.finishedTasks.push(finishedTask);
      this.newDone = "";
    },

    deleteItemTodo: function(evt) {
      this.newTodo(evt, 1);
    },

    deleteItemDone: function(evt) {
      this.newDone(evt, 1);
    }

  }
}
</script>

<style scoped>
ul.collection{
  float: left;
}

li.collection-item{
  width: 200px;
  list-style: none;
  border: solid 1px;
  margin: 5px 0;
}

.dd {
  margin-bottom: 50px;
  min-height: 50px;
}

</style>
