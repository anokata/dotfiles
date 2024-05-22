#!/usr/bin/node
const { exec } = require('child_process');

exec('clipboard-get', (err, stdout, stderr) => {
  if (err) { return }
  main(stdout);
});

function main(input) {
  // const input="錢	ㄑㄧㄢˊ	coin / money / CL:筆|笔[bi3] / unit of weight, one tenth of a tael 兩|两[liang3]";
  const parts = input.split("\t").map(item => item.split(" ")).flat();
  const hanzi = parts[0];
  const zhuyin = parts[1];
  const definition = parts.slice(2).join(" ");
  const purified = definition.replace(/\[[^\]\/]*\]|\([^\)]*\)/g, "");
  const result = [hanzi, zhuyin, purified].join(" ");

  // console.log(hanzi);
  // console.log(zhuyin);
  // console.log(purified);
  console.log(result);
}

