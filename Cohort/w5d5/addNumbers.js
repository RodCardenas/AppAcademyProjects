var readline = require('readline');
var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback){
  this.sum = 0;
  if (numsLeft > 0){
    reader.question("Please input a number:", function (answer) {
      var n = parseInt(answer);
      sum += n;
      numsLeft -= 1;
      console.log(sum);
      addNumbers(sum, numsLeft, completionCallback);
    });
  }else {
    reader.close();
    completionCallback(sum);
  }
}

addNumbers(0, 3, function (sum) {
  console.log("Total Sum: " + sum);
});
