'use strict';
let todoApp = require ('./todoApp');
let Todo = todoApp.Todo;
let TodoList = todoApp.TodoList;
let todoManager = todoApp.todoManager;

// Todo Data Objects
let todoData1;
let todoData2;
let todoData3;
let todoData4;
let todoData5;
let todoData6;

let todoSet;
let emptyList;
let listWithTodos;

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
    year: '22017',
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
// ===================== Todo =======================
describe('Todo', () => {
  test('is a function', () => {
    expect(typeof Todo).toBe('function');
  });

  describe('creates an object', () => {
    test("with the properties: title, month, year, description, completed and id", () => {
      let t = new Todo(todoData1);

      expect(t).toEqual(expect.objectContaining({
        title: expect.any(String),
        month: expect.any(String),
        year: expect.any(String),
        description: expect.any(String),
        completed: expect.any(Boolean),
        id: expect.any(Number),
      }));
    });

    describe('with unique id', () => {
      test('that will be different from object to object', () => {
        let todo1Id = new Todo(todoData1).id;
        let todo2Id = new Todo(todoData2).id;
        let todo3Id = new Todo(todoData3).id;

        expect([todo1Id, todo2Id]).toEqual(expect.not.arrayContaining([todo3Id]));
        expect([todo2Id, todo3Id]).toEqual(expect.not.arrayContaining([todo1Id]));
        expect([todo1Id, todo3Id]).toEqual(expect.not.arrayContaining([todo2Id]));
      })

      test('that will increase with each new instance', () => {
        let todo1 = new Todo(todoData1);
        let todo2 = new Todo(todoData2);
        let todo3 = new Todo(todoData3);

        let todo1Id = todo1.id;
        let todo2Id = todo2.id;
        let todo3Id = todo3.id;

        expect(todo2Id).toBeGreaterThan(todo1Id);
        expect(todo3Id).toBeGreaterThan(todo2Id);

        todo1 = null;
        todo2 = null;
        todo3 = null;

        let todo4 = new Todo(todoData4);

        expect(todo4.id).toBeGreaterThan(todo3Id);
      })
    });

    describe('isWithinMonthYear', () => {
      test('is a function', () => {
        let todo = new Todo(todoData1);
        expect(typeof todo.isWithinMonthYear).toBe('function');
      });

      test('returns true if year and month is correct', () => {
        let todo = new Todo(todoData1)
        expect(todo.isWithinMonthYear('1', '2017')).toBe(true);
      })

      test('returns false if year is incorrect', () => {
        let todo = new Todo(todoData1)
        expect(todo.isWithinMonthYear('1', '2018')).toBe(false);
      })

      test('returns false if month is incorrect', () => {
        let todo = new Todo(todoData1)
        expect(todo.isWithinMonthYear('2', '2017')).toBe(false);
      });
    });
  });
});


// ======================================================
// ===================== TodoList =======================

// TODO
// - test that TodoList returns a deep copy anytime it returns all or a part of todos


describe('TodoList', () => {
  test('is a function', () => {
    expect(typeof TodoList).toBe('function');
  });

  describe('creates an object', () => {
    test('given a todoDataSet will create a todo for each todoData', () => {
      let list = new TodoList(todoSet);
      expect(list.getTodos()).toHaveLength(6);
    })

    describe('.getTodos', () => {
      test('is a function', () => {
        expect(typeof emptyList.getTodos).toBe('function');
      });

      test('returns a deep copy copy', () => {
        emptyList.getTodos().push(1, 5);
        expect(emptyList.getTodos()).toHaveLength(0);

        let todoBeforeModification = listWithTodos.getTodos()[0];

        let modification = {
          title: 'Something Else',
          month: '4',
          year: '1332',
          description: 'Something else completly',
          id: todoBeforeModification.id,
          completed: true,
        };


        Object.assign(listWithTodos.getTodos()[0], modification);

        let todoAfterModification = listWithTodos.getTodos()[0];

        expect(todoAfterModification.title).not.toBe(modification.title)
        expect(todoAfterModification.month).not.toBe(modification.month)
        expect(todoAfterModification.year).not.toBe(modification.year)
        expect(todoAfterModification.description).not.toBe(modification.description)
        expect(todoAfterModification.completed).not.toBe(modification.completed)

        let todo = listWithTodos.getTodos()[3];
        let idBeforeModification = todo.id;

        let newId = 12345; // this is would not work if we had so many tests that this would be a valid id
        todo.id = newId;

        expect(listWithTodos.getTodos()[3].id).toBe(newId);
      });
    });

    describe('addTodo', () => {
      test('is a function', () => {
        expect(typeof emptyList.addTodo).not.toBe('function');
      });

      test('will add a single todo', () => {
        emptyList.addTodo(new Todo(todoData1));
        expect(emptyList.getTodos().length).toBe(1);
        emptyList.addTodo(new Todo(todoData2));
        expect(emptyList.getTodos().length).toBe(2);
      });
    });

    describe('deleteTodoById', () => {
      test('is a function', () => {
        expect(typeof emptyList.deleteTodoById).toBe('function');
      });

      test('will delete a single todo', () => {
        let orgTodoLength = listWithTodos.getTodos().length;
        let todo = listWithTodos.getTodos()[0];
        listWithTodos.deleteTodoById(todo.id);
        let newTodoLength = listWithTodos.getTodos().length;
        let lengthDifference = orgTodoLength - newTodoLength;

        expect(lengthDifference).toBe(1);
      });

      test('will not delete a todo when given non-existing id', () => {
        let todosLengthBeforeDeletion = listWithTodos.getTodos().length;
        let ids = listWithTodos.getTodos().map((todo) => todo.id);
        let biggestId = Math.max.apply(Math, ids);
        listWithTodos.deleteTodoById(0);
        listWithTodos.deleteTodoById(biggestId + 1);
        let todosLengthAfterDeletion = listWithTodos.getTodos().length;

        expect(todosLengthBeforeDeletion).toEqual(todosLengthAfterDeletion);
      });

      test('will delete todo with the passed id', () => {
        let todo = listWithTodos.getTodos()[2];

        listWithTodos.deleteTodoById(todo.id);

        let todos = listWithTodos.getTodos();

        expect(todos).toEqual(
          expect.not.arrayContaining([
            expect.objectContaining(todo)
          ])
        );
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
      expect(completedTodos).toHaveLength(2);
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
