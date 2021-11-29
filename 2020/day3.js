const fs = require('fs');

/**
 * Right 1, down 1.
 * Right 3, down 1. (This is the slope you already checked.)
 * Right 5, down 1.
 * Right 7, down 1.
 * Right 1, down 2.
 */

const lines = fs.readFileSync('day3.txt', { encoding: 'utf-8' }).split('\n').filter(x => x);

const linesArr = lines.map(line => [...line]);

class Map {
  constructor(map) {
    this.map = map;
  }

  getPosition(x, y) {
    return this.map[y][x % this.map[0].length];
  }

  getHeight() {
    return this.map.length;
  }

  getTrees(a, b) {
    let x = 0;
    let y = 0;
    let trees = 0;

    while (y < map.getHeight()) {
      const current = map.getPosition(x, y);
      if (current === '#') {
        trees++;
      }
      x += a;
      y += b;
    }
    return trees;
  }
};

const map = new Map(linesArr);

const slopes = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]];

const totalTrees = slopes.reduce((total, slope) => {
  const [x, y] = slope;
  return total *= map.getTrees(x, y);
}, 1);

console.log(totalTrees)