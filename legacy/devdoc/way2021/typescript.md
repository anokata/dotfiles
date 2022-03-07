https://metanit.com/web/typescript/
https://metanit.com/web/typescript/4.1.php
https://metanit.com/web/typescript/6.1.php
https://scriptdev.ru/ts/058/
https://github.com/DefinitelyTyped/DefinitelyTyped/
npm install --save-dev @types/node
https://marcobotto.com/blog/compiling-and-bundling-typescript-libraries-with-webpack/
https://webpack.js.org/guides/typescript/

https://habr.com/ru/company/tinkoff/blog/521262/
https://medium.com/@sergey.bakaev/%D1%82%D0%B8%D0%BF%D1%8B-%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85-%D0%B2-typescript-8aa1a0030610
# web
https://www.w3schools.com/js/js_2018.asp
https://metanit.com/web/html5/14.3.php

# ts
Все типы в TypeScript являются подтипами главного типа, которым является тип Any. Данный тип обозначается ключевым словом any. Тип Any — единственный, который может представлять любое значение JavaScript без всяких ограничений.
Тип Any является средством, которое позволяет работать с существующими JavaScript библиотеками и не приводить к ошибкам компиляции.
https://medium.com/swlh/how-strict-is-typescripts-strict-mode-f36a4d1a948a
https://habr.com/ru/company/tinkoff/blog/505488/
https://habr.com/ru/company/tinkoff/blog/521262/

"compilerOptions": {
    // a set of cool rules
    "noImplicitAny": true,
    "noImplicitThis": true,
    "strictNullChecks": true,
    "strictPropertyInitialization": true,
    "strictBindCallApply": true,
    "strictFunctionTypes": true,
    // a shortcut enabling 6 rules above
    "strict": true,
    // ...
}
везде писать readonly.


Номинативная и структурная типизация.
В отличие от номинативной, которая следит за названиями типов, структурная типизация принимает решение о совместимости типов на основе их содержимого. 
в ts - структурная ,похожа на утиную
