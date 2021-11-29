const fs = require('fs');

/**
 * I: passports with key value pairs each pass port is sperated by a new line
 * O:
 * C: must contain
 *    byr, iyr, eyr, hgt, hcl, ecl, pid, cid
 *    can be missing cid.
 * E:
 */

const lines = fs.readFileSync('day4/day4.txt', { encoding: 'utf-8' }).split('\n\n');

class Passport {
  static mandantory = ['byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid'];

  constructor(input) {
    this.map = new Map();

    const list = input.split(/\s+/g);
    list.forEach(keyVal => {
      const [key, value] = keyVal.split(':');
      this.map.set(key, value);
    });
  }

  isValid() {
    return Passport.mandantory.every(key => this.map.has(key));
  }
};

let valid = 0;

for (let line of lines) {
  let p = new Passport(line)
  if (p.isValid()) {
    valid++;
  }
}

console.log(valid)

