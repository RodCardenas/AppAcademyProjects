describe('uniqueSubstrings(string)', function () {
  function uniq (array) {
    var elements = {};
    var result = [];

    for (var i = 0; i < array.length; i++) {
      if (!elements[array[i]]) {
        result.push(array[i]);
      }
      elements[array[i]] = true;
    }

    return result;
  }

  it("returns an array", function () {
    expect(uniqueSubstrings("substring") instanceof Array).toBe(true);
  });

  it("does not return any duplicate substrings", function () {
    expect(uniq(uniqueSubstrings("stringstring"))).toEqual(uniqueSubstrings("stringstring"))
  });

  it("returns all unique substrings", function () {
    expect(uniqueSubstrings("str")).toEqual(["s", "st", "str", "t", "tr", "r"]);
  });

  it("returns all unique substrings II", function () {
    expect(uniqueSubstrings("abab")).toEqual([
      "a",
      "ab",
      "aba",
      "abab",
      "b",
      "ba",
      "bab"
      ]);
  });
});

describe("Array#myEach", function () {
  var originalArray = null;
  var spy = {
    callback: function (el) { return el; }
  };

  // it does not call forEach (setup)
  beforeEach(function () {
    spyOn(Array.prototype, 'forEach').and.callThrough();
  });

  // it does not call forEach (verification)
  afterEach(function () {
    expect(Array.prototype.forEach).not.toHaveBeenCalled();
  });

  it("calls the callback passed to it", function () {
    spyOn(spy, "callback");
    [1, 2, 3].myEach(spy.callback);
    expect(spy.callback).toHaveBeenCalled();
  });

  it("yields each element to the callback", function () {
    spyOn(spy, "callback");
    [1, 2].myEach(spy.callback);
    expect(spy.callback).toHaveBeenCalledWith(1);
    expect(spy.callback).toHaveBeenCalledWith(2);
  });

  it("is chainable and returns the original array", function () {
    originalArray = ["original array"];
    expect(originalArray.myEach(spy.callback)).toBe(originalArray);
  });
});

describe("Array#myMap", function() {
  var originalArray, spy;

  beforeEach(function () {
    originalArray = null;
    spy = {
      callback: function (el) {
        return el * el;
      }
    };
  });

  // it does not call forEach or map (setup)
  beforeEach(function () {
    spyOn(Array.prototype, 'forEach').and.callThrough();
    spyOn(Array.prototype, 'map').and.callThrough();
  });

  // it does not call forEach or map (verification)
  afterEach(function () {
    expect(Array.prototype.forEach).not.toHaveBeenCalled();
    expect(Array.prototype.map).not.toHaveBeenCalled();
  });

  it("calls the callback passed to it", function () {
    spyOn(spy, "callback");
    [1, 2, 3].myMap(spy.callback);
    expect(spy.callback).toHaveBeenCalled();
  });

  it("yields each element to the callback", function () {
    spyOn(spy, "callback");
    [1, 2].myMap(spy.callback);
    expect(spy.callback).toHaveBeenCalledWith(1);
    expect(spy.callback).toHaveBeenCalledWith(2);
  });

  it("calls the Array#myEach method", function () {
    originalArray = [1, 2, 3];
    spyOn(originalArray, "myEach");
    originalArray.myMap(spy.callback);
    expect(originalArray.myEach).toHaveBeenCalled();
  });

  it("returns a mapped array", function () {
    originalArray = [1, 2, 3];
    expect(originalArray.myMap(spy.callback)).toEqual([1, 4, 9]);
  });

  it("does not modify the original array", function () {
    originalArray = [1, 2, 3];
    originalArray.myMap(spy.callback);
    expect(originalArray).toEqual([1, 2, 3]);
  });
});

describe("pairMatch", function() {
  var array;

  var sumToZero = function (x, y) { return x + y === 0; };

  var sumToEven = function (x, y) { return (x + y) % 2 === 0; };

  var isGreater = function (x, y) { return x > y; };

  it("returns [] when no match is found", function () {
    array = [1, 2, 3];
    expect(pairMatch(array, sumToZero)).toEqual([]);
  });

  it("doesn't return pairs containing the same element", function () {
    array = [0, 1, 2];
    expect(pairMatch(array, sumToZero)).toEqual([]);
  });

  it("returns positions of pairs that sum to zero", function () {
    array = [1, 0, -1];
    expect(pairMatch(array, sumToZero)).toEqual([
      [0, 2], [2, 0]
    ]);
  });

  it("returns positions of pairs that sum to an even number", function () {
    array = [1, 1, 3, 2];
    expect(pairMatch(array, sumToEven)).toEqual([
      [0, 1], [0, 2], [1, 0], [1, 2], [2, 0], [2, 1]
    ]);
  });

  it("returns positions of pairs where x > y", function () {
    array = [3, 2, 1];
    expect(pairMatch(array, isGreater)).toEqual([
      [0, 1], [0, 2], [1, 2]
    ]);
  });
});

describe("mergeSort", function () {
  var array = [1, 5, 2, 4, 3];
  var sortedArray = array.slice().sort();

  // it does not call sort (setup)
  beforeEach(function () {
    spyOn(Array.prototype, 'sort').and.callThrough();
  });

  // it does not call sort (verification)
  afterEach(function () {
    expect(Array.prototype.sort).not.toHaveBeenCalled();
  });

  it("works with an empty array", function () {
    expect([].mergeSort()).toEqual([]);
  });

  it("works with an array of one item", function () {
    expect([1].mergeSort()).toEqual([1]);
  });

  it("sorts numbers", function () {
    expect(array.mergeSort()).toEqual(sortedArray);
  });

  it("sorts arrays with duplicates", function () {
    expect([5, 4, 3, 3, 2, 1].mergeSort()).toEqual([1, 2, 3, 3, 4, 5]);
  });

  it("uses a comparator function if passed in", function () {
    var reversed = array.mergeSort(function (x, y) {
      if (x == y) {
        return 0;
      } else if (x < y) {
        return 1;
      } else {
        return -1;
      }
    });
    expect(reversed).toEqual([5, 4, 3, 2, 1]);
  });

  it("does not modify original", function (){
    dupedArray = [1, 5, 2, 4, 3];
    dupedArray.mergeSort();
    expect(dupedArray).toEqual(array);
  });
});

describe("Function.prototype.myBind", function () {
  var Cat;
  var sally, markov, curie;

  beforeEach(function () {

    Cat = function Cat (name) {
      this.name = name;
    };

    Cat.prototype.sayHello = function () {
      return this.name + " says hello!";
    };

    Cat.prototype.greetOne = function (otherCat) {
      return this.name + " says hello to " + otherCat.name;
    };

    Cat.prototype.greetTwo = function (otherCat1, otherCat2) {
      return this.name + " says hello to " + otherCat1.name + " and " +
      otherCat2.name;
    };

    sally = new Cat("Sally");
    markov = new Cat("Markov");
    curie = new Cat("Curie");
  });

  it("sets the context and returns a function which can be called function style", function () {
    spyOn(Cat.prototype.sayHello, 'bind');
    expect(sally.sayHello.myBind(sally)()).toEqual("Sally says hello!");
    expect(Cat.prototype.sayHello.bind).not.toHaveBeenCalled();
  });

  it("should pass in bind-time argument to the method", function () {
    spyOn(Cat.prototype.greetOne, 'bind');
    expect(sally.greetOne.myBind(sally, markov)())
    .toEqual("Sally says hello to Markov");
    expect(Cat.prototype.greetOne.bind).not.toHaveBeenCalled();
  });

  it("should pass in two bind-time arguments to the method", function () {
    spyOn(Cat.prototype.greetTwo, 'bind');
    expect(sally.greetTwo.myBind(sally, markov, curie)())
    .toEqual("Sally says hello to Markov and Curie");
    expect(Cat.prototype.greetTwo.bind).not.toHaveBeenCalled();
  });

  it("takes multiple call-time arguments", function () {
    spyOn(Cat.prototype.greetTwo, 'bind');
    expect(sally.greetTwo.myBind(sally)(markov, curie))
    .toEqual("Sally says hello to Markov and Curie");
    expect(Cat.prototype.greetTwo.bind).not.toHaveBeenCalled();
  });

  it("should combine bind-time and call-time arguments", function () {
    spyOn(Cat.prototype.greetTwo, 'bind');
    expect(sally.greetTwo.myBind(sally, markov)(curie))
    .toEqual("Sally says hello to Markov and Curie");
    expect(Cat.prototype.greetTwo.bind).not.toHaveBeenCalled();
  });

  it("doesn't pass the call-time arguments to future calls", function () {
    spyOn(Cat.prototype.greetOne, 'bind');
    var boundFn = sally.greetOne.myBind(sally);
    expect(boundFn(markov)).toEqual("Sally says hello to Markov");
    expect(boundFn(curie)).toEqual("Sally says hello to Curie");
    expect(Cat.prototype.greetOne.bind).not.toHaveBeenCalled();
  });
});

describe("inherits", function() {
  var Animal, Dog, dog;

  beforeEach(function() {
    Animal = function() {
      this.name = "Yogi";
    };

    Animal.prototype.makeNoise = function() { return "Hi!"; };

    Dog = function() {
      this.age = 7;
    };

    inherits(Dog, Animal);

    Dog.prototype.bark = function() { return "Woof!"; };

    dog = new Dog();
  });

  it("should properly set up the prototype chain between a child and parent", function() {
    expect(dog.bark()).toBe("Woof!");
    expect(dog.makeNoise()).toBe("Hi!");
  });

  it("should not call the parent's constructor function", function() {
    expect(dog.name).toBeUndefined();
  });

  it("should maintain separation of parent and child prototypes", function() {
    Dog.prototype.someProperty = 42;
    var animal = new Animal();
    expect(animal.someProperty).toBeUndefined();
    expect(animal.makeNoise()).toBe("Hi!");
  });

  it("should properly work for longer inheritance chains", function() {
    var Poodle = function() { this.name = "Bill"; };

    inherits(Poodle, Dog);

    Poodle.prototype.shave = function() { return "Brrr."; };

    var poodle = new Poodle();
    expect(poodle.name).toBe("Bill");
    expect(poodle.shave()).toBe("Brrr.");
    expect(poodle.makeNoise()).toBe("Hi!");
    expect(poodle.bark()).toBe("Woof!");
  });
});

describe("myCurry", function () {
  beforeEach(function () {
    this.myObj = {
      count: 10
    };
  });

  it("should take a function, object, and curry if 1 is passed", function () {
    var echo = function (arg) {
      return arg;
    };

    var first = myCurry(echo, this.myObj, 1);
    expect(first("one")).toMatch(/one/);
  });

  it("binds to obj if passed in", function () {
    var count = function () {
      return this.count;
    };

    var first = myCurry(count, this.myObj, 1);
    expect(first("")).toEqual(10);
  });

  it("currys arguments and calls function after called with total num args", function () {
    var sum = function(a, b, c) {
      return this.count + a + b + c;
    };
    var curriedSum = myCurry(sum, this.myObj, 3);
    var result = curriedSum(1)(2)(3);
    expect(result).toEqual(16);
  });
});

