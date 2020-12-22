const fs = require('fs');
// const wholeLine = '2-7 p: pbhhzpmppb';

let validPasswords = 0;

const lines = fs.readFileSync('day2.txt', { encoding: 'utf-8' }).split('\n');

lines.forEach(line => {
  const matches = /^(\d+)-(\d+) (\w): (\w+)$/.exec(line);
  const [_, min, max, letter, password] = matches;
  console.log(password[min - 1])
  if ((password[min - 1] === letter && password[max - 1] !== letter)
    || (password[max - 1] === letter && password[min - 1] !== letter)) {
    validPasswords++;
  }

  // if (count >= min && count <= max) {
  //   validPasswords++;
  // }
});
console.log(validPasswords)