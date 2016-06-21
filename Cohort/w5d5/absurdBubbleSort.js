var readline = require('readline');
var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var arra = [5,4,3,2,1];

function absurdBubbleSort(arr, sortCompletionCallback){
  function outerBubbleSortLoop(madeAnySwaps){
    if (madeAnySwaps === true){
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    }else {
      sortCompletionCallback(arr);
    }
  }
  outerBubbleSortLoop(true);
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, callback) {
  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i], arr[i + 1], function(ans) {
      if (ans === true) {
        var dummy = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = dummy;
        madeAnySwaps = true;
      }

      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, callback);
    });
  }
  if (i === arr.length - 1) {
    console.log(arr);
    callback(madeAnySwaps);
  }
}


function askIfGreaterThan(el1, el2, callback) {
  reader.question("Is " + el1 + " > " + el2 +" ? (y/n)", function(ans) {
    if (ans === 'y') {
      callback(true);
    }
    else {
      callback(false);
    }
  });
}

// askIfGreaterThan(1,2,function(ans) {
//   console.log(ans);
//   reader.close();
// });

// innerBubbleSortLoop(arra, 0, false, outerBubbleSortLoop);

absurdBubbleSort(arra, function(ar){
  console.log(ar);
  reader.close();
});
