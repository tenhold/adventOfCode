const fs = require('fs');

/**
 * each group is seperated by a new line
 * each person answers to yes are on one line
 * for each group count the total number of yes answers if
 * more than one person answers the same quesion yes only count it once.
 *
 * I:
 * O: number
 * C: if letter is more than one only count one
 * E:
 */

const lines = fs.readFileSync('day6/day6.txt', { encoding: 'utf-8' }).split('\n');

const group = (lines, line, arr) => {
  if (!lines.length) {
    return arr;
  }
  line += lines[0];
  if (lines[0] === '') {
    arr.push(line);
    line = '';
  }
  return group(lines.slice(1), line, arr)
};

const groups = group(lines, '', []);

const countObj = (str) => {
  const strCount = str.split('').reduce((obj, lett) => {
    if (obj[lett]) {
      obj[lett]++;
    } else {
      obj[lett] = 1;
    }
    return obj;
  }, {});
  return Object.keys(strCount).length
};

let total = 0;

groups.forEach(group => {
  total += countObj(group);
});

console.log(total);