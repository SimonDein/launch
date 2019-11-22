let todoApp = require ('./todoApp');
let makeTodo = todoApp.makeTodo;
let TodoList = todoApp.TodoList;
let todoManager = todoApp.todoManager;

// Todo Data Objects
let todoData1
let todoData2
let todoData3
let todoData4
let todoData5
let todoData6

let todoSet
let emptyList
let listWithTodos

// =============== Setup ===============
beforeEach(() => {
  todoData1 = {
    title: 'Buy Milk',
    month: '1',
    year: '2017',
    description: 'Milk for baby',
  };

  todoData2 = {
    title: 'Buy Apples',
    month: '',
    year: '20170',
    description: 'An apple a day keeps the doctor away',
  };

  todoData3 = {
    title: 'Buy chocolate',
    month: '1',
    year: '',
    description: 'For the cheat day',
  };

  todoData4 = {
    title: 'Buy Veggies',
    month: '',
    year: '2017',
    description: 'For the daily fiber needs',
  };

  todoData5 = {
    title: 'Pizza',
    month: '11',
    year: '2017',
    description: 'For the daily fiber needs',
  };

  todoData6 = {
    title: 'Buy lamp',
    month: '1',
    year: '2017',
    description: 'For the shelve',
  };

  todoSet = [todoData1, todoData2, todoData3, todoData4, todoData5, todoData6];
  emptyList = new TodoList();
  listWithTodos = new TodoList(todoSet);
});

// ======================================================
// ===================== makeTodo =======================
describe('makeTodo', () => {
  test('is a function', () => {
    expect(typeof makeTodo).toBe('function');
  });

  describe('creates an object', () => {
    test("with the properties: title, month, year, description, completed and id", () => {
      let t = makeTodo(todoData1);

      expect(t).toEqual(expect.objectContaining({
        title: expect.anything(),
        month: expect.anything(),
        year: expect.anything(),
        description: expect.anything(),
        completed: expect.anything(),
        id: expect.anything(),
      }));
    });

    test('with unique id', () => {
      let t1 = makeTodo(todoData1);
      let t2 = makeTodo(todoData2);
      let t3 = makeTodo(todoData3);

      expect(t2.id).toBeGreaterThan(t1.id)
      expect(t3.id).toBeGreaterThan(t2.id)
    });

    test("with properties that can't be directly manipulated", () => {
      let newTodo = makeTodo(todoData1);
      newTodo.title = 'Something new';
      newTodo.month = 'Something new';
      newTodo.year = 'Something new';
      newTodo.description = 'Something new';
      newTodo.completed = 'Something new';
      newTodo.id = 'Something new';

      expect(newTodo.title).toBe('Buy Milk');
      expect(newTodo.month).toBe('1');
      expect(newTodo.year).toBe('2017');
      expect(newTodo.description).toBe('Milk for baby');
      expect(newTodo.completed).toBe(false);
    });

    describe('with isWithinMonthYear', () => {
      test('is a function', () => {
        let todo = makeTodo(todoData1);
        expect(typeof todo.isWithinMonthYear).toBe('function');
      });

      test('returns true if year and month is correct', () => {
        let todo = makeTodo(todoData1)
        expect(todo.isWithinMonthYear('1', '2017')).toBe(true);
      })

      test('returns false if year is incorrect', () => {
        let todo = makeTodo(todoData1)
        expect(todo.isWithinMonthYear('1', '2018')).toBe(false);
      })

      test('returns false if month is incorrect', () => {
        let todo = makeTodo(todoData1)
        expect(todo.isWithinMonthYear('2', '2017')).toBe(false);
      });
    });
  });
});


// ======================================================
// ===================== TodoList =======================
describe('TodoList', () => {
  test('is a function', () => {
    expect(typeof TodoList).toBe('function');
  });

  describe('creates an object', () => {
    test('given a todoDataSet will create a todo for each todoData', () => {
      let list = new TodoList(todoSet);
      expect(list.getTodos().length).toBe(6);
    })

    describe('.getTodos', () => {
      test('is a function', () => {
        expect(typeof emptyList.getTodos).toBe('function');
      });

      test('returns a (shallow) copy', () => {
        let copyTodos = emptyList.getTodos();
        copyTodos.push(1, 5);
        expect(emptyList.getTodos()).toEqual([]);
      });
    });

    describe('addTodo', () => {
      test('is a function', () => {
        expect(typeof emptyList.addTodo).toBe('function');
      });

      test('will add a single todo', () => {
        emptyList.addTodo(makeTodo(todoData1));
        expect(emptyList.getTodos().length).toBe(1);
        emptyList.addTodo(makeTodo(todoData2));
        expect(emptyList.getTodos().length).toBe(2);
      });
    });

    describe('deleteTodo', () => {
      test('is a function', () => {
        expect(typeof emptyList.deleteTodo).toBe('function');
      });

      test('will delete a single todo', () => {
        let orgTodoLength = listWithTodos.getTodos().length;
        let todo = listWithTodos.getTodos()[0];
        listWithTodos.deleteTodo(todo)
        let newTodoLength = listWithTodos.getTodos().length;
        let lengthDifference = orgTodoLength - newTodoLength;

        expect(lengthDifference).toBe(1);
      })

      test('will delete the todo by id', () => {
        listWithTodos.deleteTodo({id: 1});
        let todos = listWithTodos.getTodos;

        expect(todos).toEqual(
          expect.not.arrayContaining([
            expect.objectContaining({
              id: 1,
            })
          ])
        )
      });
    });

    describe('updateTodo', () => {
      test('is a function', () => {
        expect(typeof emptyList.updateTodo).toBe('function');
      });

      test('will overwrite a todo with any new values', () => {
        let id = listWithTodos.getTodos()[0].id; // get id of a known todo;

        let newTodoState = {
            title: 'tests',
            month: '1',
            year: '2019',
            description: 'write more tests',
            id: id,
            completed: true,
        };

        listWithTodos.updateTodo(newTodoState);
        let updatedTodo = listWithTodos.getTodoById(id);

        expect(updatedTodo.title).toBe(newTodoState.title);
        expect(updatedTodo.month).toBe(newTodoState.month);
        expect(updatedTodo.year).toBe(newTodoState.year);
        expect(updatedTodo.description).toBe(newTodoState.description);
        expect(updatedTodo.completed).toBe(newTodoState.completed);
      });
    });
  });
});


// ======================================================
// ===================== todoManager ====================
describe('todoManager', () => {
  test('is a function', () => {
    expect(typeof todoManager).toBe('function');
  });

  describe('getTodos', () => {

    test('is a function', () => {
      expect(typeof todoManager().getTodos).toBe('function');
    });

    test('will return all todos', () => {
      let listTodos = listWithTodos.getTodos();
      let todoManagerTodos = todoManager(listWithTodos).getTodos();
      expect(listTodos).toEqual(todoManagerTodos);
    });
  })

  describe('getCompletedTodos', () => {
    test('is a function', () => {
      expect(typeof todoManager().getCompletedTodos).toBe('function');
    });

    test('will return all completed todos', () => {
      let id1 = listWithTodos.getTodos()[0].id;
      let id2 = listWithTodos.getTodos()[4].id;

      let todo1Update = {
          completed: true,
          id: id1,
      };

      let todo2Update = {
          completed: true,
          id: id2,
      };

      listWithTodos.updateTodo(todo1Update);
      listWithTodos.updateTodo(todo2Update);

      let completedTodos = todoManager(listWithTodos).getCompletedTodos();
      expect(completedTodos.length).toBe(2);
      expect(completedTodos[0].completed).toBe(true);
      expect(completedTodos[1].completed).toBe(true);
    });
  })

  describe('getTodosWithin', () => {
    test('is a function', () => {
      expect(typeof todoManager().getTodosWithin).toBe('function');
    });

    test('will return todos with month and year properties equal to month and year arguments', () => {
      let todosWithinJan2017 = todoManager(listWithTodos).getTodosWithin('1', '2017');
      expect(todosWithinJan2017.length).toBe(2);
    });

  describe('getCompletedTodosWithin', () => {
    test('is a function', () => {
      expect(typeof todoManager().getTodosWithin).toBe('function');
    });

    test('will return todos with month and year properites equal to motnh and year arguments and are completed', () => {
      let id1 = listWithTodos.getTodos()[0].id;
      let id2 = listWithTodos.getTodos()[4].id;

      let todo1Update = {
          completed: true,
          id: id1,
      };

      let todo2Update = {
          completed: true,
          id: id2,
      }

      listWithTodos.updateTodo(todo1Update);
      listWithTodos.updateTodo(todo2Update);

      let todosCompletedWithinJan2017 = todoManager(listWithTodos).getCompletedTodosWithin('1', '2017');
      expect(todosCompletedWithinJan2017.length).toBe(1);
    });
  })
});
