const fs = require('fs');

const lines = fs.readFileSync('day5/day5.txt', { encoding: 'utf-8' }).split('\n');

/**
 * I: array of strings
 * O:
 * C:
 * E:
 * if F then it is lower half
 * if B then it is upper half
 */


const getRow = (line, low, high) => {
  if (!line.length) {
    return low;
  }
  let mid = (low + high) / 2;

  if (line[0] === 'F' || line[0] === 'L') {
    high = mid;
  }
  if (line[0] === 'B' || line[0] === 'R') {
    low = mid;
  }
  return getRow(line.slice(1), low, high);
};

const totals = [];

lines.forEach(line => {
  const row = getRow(line.slice(0, 7), 0, 128);
  const seat = getRow(line.slice(7), 0, 8);
  const seatNum = (row * 8) + seat;
  totals.push(seatNum)
});

console.log(totals.sort((a, b) => b - a)[0]);
