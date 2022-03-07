Поток — это массив данных, отсортированных по времени, который может сообщать о том, что данные изменились.
реактивный подход строится на push стратегии распространения изменений. Push стратегия подразумевает, что в случае изменения данных эти самые изменения будут “проталкиваться”, и зависимые от них данные будут автоматически обновляться. 
В RxJS потоки представлены классом Observable
observer - Сам наблюдатель представляет собой объект, у которого есть три метода:
    next — выбрасывает новое значение в поток
    error — выбрасывает в поток ошибку, после чего поток завершается
    complete — завершает поток
“слушать” поток вызвав метод subscribe у объекта observable.
сколько бы раз мы не подписывались на поток, наши наблюдатели получат одни и те же данные.

Большинство методов для создания потоков уже есть в RxJS. Чтобы создать поток, испускающий значения 1 и 2, достаточно лишь использовать метод of
Метод from в качестве аргумента ожидает любой итерируемый объект(массив, строка и т.д.) или promise, и проецирует этот объект на поток.
const observable = fromEvent(domElementRef, 'keyup'); // из событий keyup элемента dom

npm install rxjs
npm install --save-dev @reactivex/rxjs

https://luukgruijs.medium.com/understanding-rxjs-behaviorsubject-replaysubject-and-asyncsubject-8cc061f1cfc0
!! 
https://www.learnrxjs.io/learn-rxjs/recipes/alphabet-invasion-game

https://rxmarbles.com/
https://rxviz.com/
https://stackblitz.com/edit/rxjs-82slmx?devtoolsheight=60&file=index.ts
https://habr.com/ru/company/ruvds/blog/428081/
https://react-rxjs.org/
~!!
https://react-rxjs.org/docs/getting-started
