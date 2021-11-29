const fs = require('fs');

const lines = fs.readFileSync('day7/day7.txt', { encoding: 'utf-8' })
  .split('\n')
  .map(line => {
    line += ' false';
    return line.split(' ');
  });

for (let i = 0; i < lines.length; i++) {
  const [instuct, val, seen] = lines[i];
  if (instuct === 'jmp') {
    lines[val.slice(1)]
  }
  if (instuct === 'acc' && seen === 'true') {
    return val;
  }

}