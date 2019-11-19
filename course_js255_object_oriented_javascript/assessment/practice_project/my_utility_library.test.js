let _ = require('./my_utility_library.js');

test('_ library is defined', () => {
  expect(_).toEqual(expect.anything());
});

describe('_([]).first', () => {
  test('is defined', () => {
    expect(typeof _([]).first).toBe("function");
  });

  test('returns the first element of the array', () => {
    expect(_([5, 6, 7, undefined, null]).first()).toBe(5);
  });
});

describe('_([]).last', () => {
  test('is defined', () => {
    expect(typeof _([]).last).toBe("function");
  });

  test('returns the last element of the array', () => {
    expect(_([5, 6, 10, undefined, 8]).last()).toBe(8);
  });
});

describe('_([]).without', () => {
  test('is defined', () => {
    expect(typeof _([]).without).toBe("function");
  });

  test('without any elements returns empty array', () => {
    expect(_([]).without()).toEqual([]);
  });

  test('returns new object', () => {
    let a = [1, 2];
    expect(_(a).without()).not.toBe(a);
  });

  test('passed number, returns array without the number', () => {
    expect(_([1, 3, 4, 3, 4, 6, 2, 3]).without(3)).not.arrayContaing([3]);
  });
});
