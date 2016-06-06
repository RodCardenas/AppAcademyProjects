Array.prototype.subsets = function () {
  var subs = [[]];

  this.forEach(function(el){
    subs.forEach(function(sub){
      subs.push(sub.concat(el));
    })
  });

  return subs;
};


var a = [1,2,3]

a.subsets(); // [[],[1],[2],[1,2]]

Array.prototype.bSearch = function (target) {

  if (this.length < 1){
    return false;
  }

  var middle = Math.floor(this.length/2) + 1;
  var mid = this[middle];
  var left = this.slice(0,middle);
  var right = this.slice(middle);

  if (mid === target){
    return true;
  }else if (mid > target) {
    return left.bSearch(target);
  }else {
    return right.bSearch(target);
  }

};

var a = [1,2,3,4,5,6,7]

a.bSearch(1);
a.bSearch(7);
a.bSearch(3);
a.bSearch(8);
