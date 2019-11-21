let todoApp = require ('./todoApp');
let makeTodo = todoApp.makeTodo;
let TodoList = todoApp.TodoList;

// Todo Data Objects
let todoData1 = {
  title: 'Buy Milk',
  month: '1',
  year: '2017',
  description: 'Milk for baby',
};

let todoData2 = {
  title: 'Buy Apples',
  month: '',
  year: '2017',
  description: 'An apple a day keeps the doctor away',
};

let todoData3 = {
  title: 'Buy chocolate',
  month: '1',
  year: '',
  description: 'For the cheat day',
};

let todoData4 = {
  title: 'Buy Veggies',
  month: '',
  year: '',
  description: 'For the daily fiber needs',
};

let todoSet = [todoData1, todoData2, todoData3, todoData4];

// Tests
describe('makeTodo', () => {
  afterEach(() => {
    todoData1 = {
      title: 'Buy Milk',
      month: '1',
      year: '2017',
      description: 'Milk for baby',
    };

    todoData2 = {
      title: 'Buy Apples',
      month: '',
      year: '2017',
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
      year: '',
      description: 'For the daily fiber needs',
    };
  });

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

    // =================== TODO ===================
    test('with unique id', () => {
      todoSet.pop();
      let newTodo = {
          title: 'Blop',
          month: '1',
          year: '2017',
          description: 'Kill the Ice King',
      };
      todoSet.push(makeTodo(newTodo))
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
      test('returns false if year is incorrect', () => {
        let todo = makeTodo(todoData1)
        expect(todo.isWithinMonthYear('1', '2018')).toBe(false);
      })
    });
  });
});

let todoList1 = Object.create(TodoList);

describe('TodoList', () => {
  test('is an Object', () => {
    expect(typeof TodoList).toBe('object');
  });

  describe('instances', () => {
    describe('.getTodos', () => {
      test('is a getter', () => {
        expect(typeof todoList1.getTodos).toBe('function');
      });

      test('returns a (shallow) copy', () => {
        let copyTodos = todoList1.getTodos();
        copyTodos.push(1, 5);
        expect(todoList1.getTodos()).toEqual([]);
      });
    });

    describe('addTodo', () => {
      test('will add a single todo', () => {
        todoList1.addTodo(makeTodo(todoData1));
        expect(todoList1.getTodos().length).toBe(1);
        todoList1.addTodo(makeTodo(todoData2));
        expect(todoList1.getTodos().length).toBe(2);
      });

      test('returns a (shallow) copy', () => {
        let copyTodos = todoList1.getTodos();
        copyTodos.push(1, 5);
        expect(todoList1.getTodos()).toEqual([]);
      });
    });

  });
});

