'use strict';
// Questions
// - getTodos in todoManager?
// - deep copy with access to isWithinMonthYear

// todoManager wrapper function

function todoManager(todoList) {
  return {
    getTodos: function() {
      return todoList.getTodos();
    },

    getCompletedTodos: function() {
      return this.getTodos().filter((todo) => todo.completed);
    },

    getTodosWithin(month, year) {
      return this.getTodos().filter((todo) => todo.isWithinMonthYear(month, year));
    },

    getCompletedTodosWithin(month, year) {
      return this.getTodos().filter((todo) => {
        return todo.isWithinMonthYear(month, year) &&
               todo.completed;
      });
    }
  };
}

let Todo = (function() {
  let id = 0;

  function getNextId() {
    return id += 1;
  }

  return function(todoData) {
    this.title = todoData.title || '';
    this.month = todoData.month || '';
    this.year = todoData.year || '';
    this.description = todoData.description || '';
    this.id = getNextId();
    this.completed = false;
  };
})();

Todo.prototype.isWithinMonthYear = function(month, year) {
  return this.month === month && this.year === year;
};


// TODO
// - only return copies of todos!
function TodoList(todoDataSet) {
  const todos = [];

  function copyTodo(todo) {
    let copy = Object.assign({}, todo);
    Object.setPrototypeOf(copy, Object.getPrototypeOf(todo));
    return copy;
  }

  if (todoDataSet !== undefined) {
    todoDataSet.forEach((todoData) => todos.push(new Todo(todoData)));
  }

  this.getTodos = function() {
    return todos.reduce((todosCopy, todo) => {
      todosCopy.push(copyTodo(todo));
      return todosCopy;
    }, []);
  };

  this.addTodo = function(todoData) {
    todos.push(new Todo(todoData));
  };

  this.deleteTodoById = function(id) {
    let index = todos.findIndex((todo) => todo.id === id);

    if (index < 0) return undefined;

    let deletedTodo = todos[index];
    todos.splice(index, 1);

    return deletedTodo;
  };

  this.updateTodo = function(updatedTodo) {
    let id = updatedTodo.id;
    let index = todos.findIndex((todo) => todo.id === id);
    let outdatedTodo = todos[index];

    Object.assign(outdatedTodo, updatedTodo);
  };

  this.getTodoById = function(id) {
    let index = todos.findIndex((todo) => todo.id === id);
    if (index < 0) return undefined;
    return copyTodo(todos[index]);
  };
}

module.exports = {
  Todo: Todo,
  TodoList: TodoList,
  todoManager: todoManager,
};
