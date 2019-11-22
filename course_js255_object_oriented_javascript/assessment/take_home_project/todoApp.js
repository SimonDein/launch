// todoManager wrapper function
function todoManager(todoList) {
  return {
    getTodos: function() {
      return todoList.getTodos();
    },

    getCompletedTodos: function() {
      return this.getTodos().filter((todo) => todo.completed === true);
    },

    getTodosWithin(month, year) {
      return this.getTodos().filter((todo) => todo.month === month && todo.year === year);
    },

    getCompletedTodosWithin(month, year) {
      return this.getTodos().filter((todo) => {
        todo.month === month &&
        todo.year === year &&
        todo.completed === true;
      })
    }
  }
}


// TodoList object (OLOO)
function TodoList(todoDataSet) {
  let todos = [];

  if (todoDataSet !== undefined) {
    todoDataSet.forEach((todoData) => todos.push(makeTodo(todoDataSet)));
  };

  this.getTodos = function() {
    return todos.slice();
  };

  this.addTodo = function(todoData) {
    todos.push(makeTodo(todoData));
  };

  this.deleteTodo = function(todo) {
    let index = todos.findIndex((t) => t.id === Number(todo.id));
    let deletedTodo = todos[index];
    todos.splice(index, 1);

    return deletedTodo;
  };

  this.updateTodo = function(updatedTodo) {
    let id = updatedTodo.id;
    let outdatedTodo = this.getTodoById(id);

    Object.keys(updatedTodo).forEach((key) => {
      Object.defineProperty(outdatedTodo, key, {
        value: updatedTodo[key],
        writable: false,
        configurable: true,
      })
    });
    //Object.defineProperties(outdatedTodo, updatedTodo);
  };

  this.getTodoById = function(id) {
    let index = todos.findIndex((todo) => todo.id === id)
    return todos[index];
  };
}


// makeTodo 'object factory' (based on OLOO)
let makeTodo = (function() {
  let id = 0;

  function getNextId() {
    return id += 1;
  };

  let todo = {
    isWithinMonthYear: function(month, year) {
      return this.month === month && this.year === year;
    },
  }

  return function(todoData) {
    let newTodo = Object.create(todo);

    Object.defineProperties(newTodo, {
      title: {
        value:  todoData.title || '',
        writable: false,
        configurable: true,
      },
      month: {
        value:  todoData.month || '',
        writable: false,
        configurable: true,
      },
      year: {
        value:  todoData.year || '',
        writable: false,
        configurable: true,
      },
      description: {
        value:  todoData.description || '',
        writable: false,
        configurable: true,
      },
      completed: {
        value:  false,
        writable: false,
        configurable: true,
      },
      id: {
        value:  getNextId(),
        writable: false,
        configurable: true,
      },
    });

    return newTodo;
  };
})();

module.exports = {
  makeTodo: makeTodo,
  TodoList: TodoList,
  todoManager: todoManager,
};
