let _ = require('./my_utility_library.js');

describe('_()', () => {
  test('_ library is defined', () => {
    expect(_).toEqual(expect.anything());
  });

  describe('.first', () => {
    test('is defined', () => {
      expect(typeof _([]).first).toBe("function");
    });

    test('returns the first element of the array', () => {
      expect(_([5, 6, 7, undefined, null]).first()).toBe(5);
    });
  });

  describe('.last', () => {
    test('is defined', () => {
      expect(typeof _([]).last).toBe("function");
    });

    test('returns the last element of the array', () => {
      expect(_([5, 6, 10, undefined, 8]).last()).toBe(8);
    });
  });

  describe('.without', () => {
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
      expect(_([1, 3, 4, 3, 4, 6, 2, 3]).without(3)).toEqual(expect.not.arrayContaining([3]));
    });

    test('passed string, returns array without the string', () => {
      expect(_(['yo', 'hello', 'yo', 'hi', 'y']).without('yo')).toEqual(expect.not.arrayContaining(['yo']));
    });

    test('passed NaN , returns array without NaN', () => {
      expect(_([1, 2, NaN, 34]).without(NaN)).toEqual(expect.not.arrayContaining([NaN]));
    });

    test('returns an array with the length shortened by the number of elements removed', () => {
      expect(_([1, 3, 4, 3, 4, 6, 2, 3]).without(3).length).toBe(5);
    });
  });

  describe('.range', () => {
    test('is defined', () => {
      expect(_).toEqual(expect.anything());
    });

    test('will return values from index 0 up to passed index, when passed single argument', () => {
      expect(_([0, 1, 2, 3, 4]).range(3)).toEqual([0, 1, 2]);
    });

    test('will return values from start index up end index, when passed two arguments', () => {
      expect(_([0, 1, 2, 3, 4]).range(2, 5)).toEqual([2, 3, 4]);
    });

    test('will start at index 0 given negative start index', () => {
      expect(_([1, 2, 3, 4]).range(-1, 2)).toEqual([1, 2]);
    });

    test('will end at end of index given an index greater than arrays length', () => {
      expect(_([1, 2, 3, 4]).range(10)).toEqual([1, 2, 3, 4]);
    });
  });

  describe('.lastIndexOf', () => {
    test('returns last index of passed string', () => {
      expect(_(['hello', 'yo', 'hello', 'hi']).lastIndexOf('hello')).toBe(2);
    });

    test('returns last index of passed number', () => {
      expect(_([1, 2, 3, 3, 2, 5]).lastIndexOf(2)).toBe(4);
    });

    test('returns last index of NaN', () => {
      expect(_([NaN, 2, NaN, 'NaN']).lastIndexOf(NaN)).toBe(2);
    });

    test('returns -1 when no match', () => {
      expect(_([11, 4, 3, 'hello', true, false, NaN, undefined, null]).lastIndexOf(1)).toBe(-1);
    });
  });
});
