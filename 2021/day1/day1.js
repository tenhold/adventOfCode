const fs = require('fs');
const { parse } = require('path');

const file = fs.readFileSync('inputs.csv', 'utf-8').split("\n").map(depth => parseInt(depth));

const getDepthPt1 = (file) => {
  let prev = null;
  return file.reduce((depth, current) => {
    if (prev === null) {
      prev = current;
      return depth;
    }

    if (current > prev) {
      depth++;
    }
    prev = current;
    return depth;
  }, 0);
};

const getDepthPt2 = (file) => {
  const depths = [];
  let prev = null;
  for (let i = 0; i <= file.length - 3; i++) {
    depths.push(file[i] + file[i + 1] + file[i + 2]);
  }

  return depths.reduce((depth, current) => {
    if (prev === null) {
      prev = current;
      return depth;
    }

    if (current > prev) {
      depth++;
    }
    prev = current;
    return depth;
  }, 0);
};

console.log(`Part 1: ${getDepthPt1(file)}`);
console.log(`Part 2: ${getDepthPt2(file)}`);