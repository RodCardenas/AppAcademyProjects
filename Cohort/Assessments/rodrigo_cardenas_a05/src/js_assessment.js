// Write a method, `uniqueSubstrings(string)`, that returns an array
// containing the unique substrings of `string`.

function uniqueSubstrings(string){
  var chars = string.split("");
  var substrings = [];

  for (var i = 0; i < string.length; i++) {
    for (var j = i + 1; j <= string.length; j++) {
      var sub = string.slice(i , j);
      if (substrings.indexOf(sub) === -1){
        substrings.push(sub);
      }
    }
  }

  return substrings;
}

// Write an Array function, myEach(callback), that passes each element to
// `callback` before returning the original array. Do NOT call the built-in
// Array#forEach method in your implementation.

Array.prototype.myEach = function (callback) {
  for (var i = 0; i < this.length; i++) {
    callback(this[i]);
  }

  return this;
};


// Write a an Array method, myMap, that takes a callback and returns a new array
// containing the result of the callback for each element in the array. Use the
// Array#myEach method you defined above. Do NOT call the built-in Array#forEach
// or Array#map methods in your implementation.

Array.prototype.myMap = function (callback) {
  var mappedArr = [];

  this.myEach(function(el){
    mappedArr.push(callback(el));
  });

  // for (var i = 0; i < this.length; i++) {
  //   mappedArr.push(callback(this[i]));
  // }

  return mappedArr;
};

// Write a function `pairMatch(array, callback)`. It should return all pairs
// of indices ([i, j]) for which `callback(array[i], array[j])` returns true.

// NB: Keep in mind that the order of the arguments to the callback may matter.
// e.g., callback = function(a, b) { return a < b }

function pairMatch(array, callback){
  var pairs = [];

  for (var i = 0; i < array.length; i++) {
    for (var j = 0; j < array.length; j++) {

      if (i === j){
        continue;
      }

      if ( callback( array[i], array[j] ) ) {
        var pair = [i,j];

        pairs.push(pair);

        // if (!pairs.contains(pair)){
        //   pairs.push(pair);
        // }
      }

    }
  }

  return pairs;
}

Array.prototype.contains = function (pair) {
  for (var i = 0; i < this.length; i++) {
    if (this[0][0] === pair[0] && this[0][1] === pair[1]){
      return true;
    }
  }

  return false;
};

// Write an Array method that merge sorts an array. It should take an optional
// callback that compares two elements, returning -1 if the first element should
// appear before the second, 0 if they are equal, and 1 if the first element
// should appear after the second. Define and use a helper method,
// merge(left, right, comparator), to merge the halves. Do NOT call the
// built-in Array#sort method in your implementation.
//
// Here's a summary of the merge sort algorithm:
//
// Split the array into left and right halves, then merge sort them recursively
// until a base case is reached. Use a helper method, merge, to combine the
// halves in sorted order, and return the merged array.

Array.prototype.mergeSort = function (callback) {
  if (this.length <=1 ){
    return this;
  }

  callback = callback || function(a,b){
    if (a < b){
      return -1;
    }else if (a === b) {
      return 0;
    }else {
      return 1;
    }
  }
  var mid = Math.floor(this.length/2);
  var left = this.slice(0, mid);
  var right = this.slice(mid);

  return merge(left.mergeSort(callback), right.mergeSort(callback), callback);
};

function merge (left, right, comparator){
  var mergedArr = [];

  while( left.length > 0 && right.length > 0 ){
    var result = comparator(left[0], right[0]);

    if (result === -1){
      mergedArr.push(left[0])
      left.shift();
    }else if (result === 0) {
      mergedArr.push(left[0])
      left.shift();
    }else {
      mergedArr.push(right[0])
      right.shift();
    }
  }

  return mergedArr.concat(left,right)
}

// write a Function method, myBind(context). It should return a copy of the
// original function, where `this` is set to `context`.

Function.prototype.myBind = function (context) {
  var fn = this;
  var bindArgs = [].splice.call(arguments, 1);

  return function(args){
    var callArgs = [].splice.call(arguments, 0);
    return fn.apply(context, bindArgs.concat(callArgs));
  }
};


// write a method, `inherits(ChildClass, ParentClass)`. It should extend the
// methods of `ParentClass.prototype` to `ChildClass.prototype`.

function inherits(childClass, parentClass){
  var Surrogate = function(){};

  Surrogate.prototype = parentClass.prototype;
  childClass.prototype = new Surrogate();
}

// write a method, `myCurry(function, object, numArgs)`, that curries the
// function. Remember that a curried function is invoked with one argument at a
// time. For example, the curried form of `sum(1, 2, 3)` would be written as
// `curriedSum(1)(2)(3)`. After `numArgs` have been passed in, invoke the
// original `function` with the accumulated arguments, using `object` as the
// context.

function myCurry(callback, object, numArgs) {
  var fn = callback;
  var args = [];

  return function _curried(arg){
    args.push(arg);

    if (args.length === numArgs){
      return callback.apply(object,args);
    }else {
      return _curried;
    }
  }
}
