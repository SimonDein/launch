function todoManager(todoList) {
  return {
    
  }
}

// TodoList object (OLOO)
let TodoList = (function() {
  let todos = []; // TODO: - does not work for private data

  return {
    init: function(todoDataSet) {
      if (todoDataSet !== undefined) { // Initialize with N todos if passed
        todoDataSet.forEach((todoData) => todos.push(makeTodo(todoDataSet)));
      };
    },

    getTodos: function() {
      return todos.splice();
    },

    addTodo: function(todoData) {
      todos.push(makeTodo(todoData));
    },

    deleteTodo: function(todo) {
      let index = todos.indexOf(todo);
      todos.splice(index, 1);
    },

    updateTodo: function(updatedTodo) {
      let id = updatedTodo.id;
      let outdatedTodo = this.getTodoById(id);
      Object.defineProperties(outdatedTodo, updatedTodo);
    },

    getTodoById: function(id) {
      let index = todos.findIndex((todo) => todo.id === id)
      return todos[index];
    },
  }
})();

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
      },
      month: {
        value:  todoData.month || '',
        writable: false,
      },
      year: {
        value:  todoData.year || '',
        writable: false,
      },
      description: {
        value:  todoData.description || '',
        writable: false,
      },
      completed: {
        value:  false,
        writable: false,
      },
      id: {
        value:  getNextId(),
        writable: false,
      },
    });

    return newTodo;
  };
})();



module.exports = {
  makeTodo: makeTodo,
  TodoList: TodoList,
};
