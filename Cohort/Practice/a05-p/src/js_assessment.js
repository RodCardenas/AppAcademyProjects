// if (typeof module === 'undefined'){
//   module = "Assessment";
// }

// write String.prototype.mySlice. It should take a start index and an
// (optional) end index.
String.prototype.mySlice = function(st, en){
  if ( typeof en === 'undefined'){
    en = this.length;
  }

  if ( en > this.length){
    en = this.length + 1;
  }

  if (st > en){
    return "";
  }

  var sliced = "";
  var arr = this.split("");
  var slicedArr = [];
  var j = 0;

  for (var i = st; i < en; i++) {
    slicedArr[j] = arr[i];
    j++;
  }

  return slicedArr.join("");
}

// write Array.prototype.myReduce (analogous to Ruby's Array#inject).
Array.prototype.myReduce = function(callback, accum){
  var arr = this;

  if (typeof accum === 'undefined'){
    accum = arr[0];
    arr.shift(1);
  }

  for (var i = 0; i < arr.length; i++) {
    accum = callback(accum, arr[i]);
  }

  return accum;
}

// write Array.prototype.quickSort(comparator). Here's a quick refresher if
// you've forgotten how quickSort works:
//   - choose a pivot element from the array (usually the first)
//   - for each remaining element of the array:
//     - if the element is less than the pivot, put it in the left half of the
//     array.
//     - otherwise, put it in the right half of the array.
//   - recursively call quickSort on the left and right halves, and return the
//   full sorted array.

Array.prototype.quickSort = function(callback){
  var pivot = this[0];
  var left = [];
  var right = [];

  if (this.length <= 1){
    return this;
  }

  if (typeof callback === 'undefined'){
    callback = function(a,b){
      if (a < b){
        return -1;
      } else if( a === b){
        return 0;
      } else{
        return 1;
      }
    }
  }


  for (var i = 1; i < this.length; i++) {
    if (typeof callback !== 'undefined'){
      if (callback(this[i], pivot) === -1 || callback(this[i], pivot) === 0){
        left.push(this[i]);
      }else{
        right.push(this[i]);
      }
    } else{
      if (this[i] <= pivot){
        left.push(this[i]);
      }else{
        right.push(this[i]);
      }
    }
  }

  return left.quickSort().concat([pivot], right.quickSort());
}

// write myFind(array, callback). It should return the first element for
// which callback returns true, or undefined if none is found.
function myFind(array, callback){
  for (var i = 0; i < array.length; i++) {
    if (callback(array[i])){
      return array[i];
    }
  }

  return undefined;
}

// write sumNPrimes(n)
function sumNPrimes(n){
  var sum = 0;
  var primes = [];
  var i = 2;

  while (primes.length !== n){
    if (isPrime(i)){
      primes.push(i);
      sum += i;
    }
    i++;
  }

  return sum;
}

function isPrime(num){
  for (var i = 2; i < num; i++) {
    if (num % i == 0){
      return false;
    }
  }

  return true;
}

// write Function.prototype.myBind.
Function.prototype.myBind = function (){
  var fn = this;
  var args = Array.prototype.slice.apply(arguments);
  console.log(args);
  return function(arg){
    return fn.apply(args[0], args.slice(1).concat(arg));
  };
}


// // write Function.prototype.inherits.
Function.prototype.inherits = function(baseClass){
  function Surrogate(){};

  Surrogate.prototype = baseClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = baseClass;
}

// // module.exports = Assessment;
