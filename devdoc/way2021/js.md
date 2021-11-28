# ! 
https://karmazzin.gitbook.io/eloquentjavascript_ru/

# text
https://learn.javascript.ru/settimeout-setinterval#settimeout-s-nulevoy-zaderzhkoy
    имеет смысл чтобы например событие генерируемое в событии было обработано после полной обработки текущего события.
    Чтобы добавить в очередь новую макрозадачу setTimeout 0
    Этот способ можно использовать для разбиения больших вычислительных задач на части, чтобы браузер мог реагировать на пользовательские события и показывать прогресс выполнения этих частей.
    Также это используется в обработчиках событий для отложенного выполнения действия после того, как событие полностью обработано (всплытие завершено).
    События пользовательского интерфейса и сетевые события в промежутках между микрозадачами не обрабатываются: микрозадачи исполняются непрерывно одна за другой.
асинхронны: promise, events, setTimeout, ajax/fetch
::foo.bar is equivalent to foo.bar.bind(foo)

Микротаски (MicroTasks) — задачи, которые выполняются сразу после завершения итерации лупа JavaScript-машины. Эти задачи нельзя отменить.
Макротаски (MacroTasks) — задачи, которые выполняются на раньше наступления определенного времени (setTimeout). Эти задачи отменяемы.
События (EventTasks) — задачи, которые выполняются по много раз, после наступления события, время задержки неизвестно.
Также есть специальная функция queueMicrotask(func), которая помещает func в очередь микрозадач.
Сразу после каждой макрозадачи движок исполняет все задачи из очереди микрозадач перед тем, как выполнить следующую макрозадачу или отобразить изменения на странице, или сделать что-то ещё.
Все микрозадачи завершаются до обработки каких-либо событий или рендеринга, или перехода к другой макрозадаче.
Если нам нужно гарантировать выполнение какого-то кода после .then/catch/finally, то лучше всего добавить его вызов в цепочку .then.
https://learn.javascript.ru/microtask-queue

fun.bind({}) = copy function
скрипты будут анализироваться и исполняться сразу же, как только анализатор обнаружит тег <script>. Синтаксический анализ документа откладывается до завершения выполнения скрипта. 

При создании промис находится в ожидании (pending), а затем может стать исполненным  (fulfilled), вернув полученный результат (значение), или отклонённым (rejected), вернув причину отказа. В любом из этих случаев вызывается обработчик, прикреплённый к промису методом then
Так как методы Promise.prototype.then() и Promise.prototype.catch() сами возвращают промис, их можно вызывать цепочкой, создавая соединения.
Метод then() возвращает Promise. Метод может принимать два аргумента: колбэк-функции для случаев выполнения и отклонения промиса.  Если для Promise, который переходит в состояние выполнен или отклонён вызван метод then, и у данного метода нет нужного обработчика, то в таком случае then просто возвращает промис с состоянием начального Promise, для которого then был вызван.
Значения возвращаемые из колбэков onFulfilled или onRejected будут автоматически обёрнуты в промис.
finally не получает аргументов. Но пробрасывает значение дальше.
https://developer.mozilla.org/ru/docs/Web/JavaScript/Reference/Global_Objects/Promise/catch


js def fun:
  function a() {}
  const a = function () {}
  new Function("a", "return 0")

Замыкания — паттерн для приватизации переменной.
Замыкание — это комбинация функции и лексического окружения, в котором эта функция была определена
Замыкание – это функция, которая запоминает свои внешние переменные и может получить к ним доступ
Объект, создаваемый при помощи Object.create(null) не имеет прототипа, а значит в нём нет лишних свойств.
 глобально доступный массив arguments
Object.assign() // for part cloning OR ={...tom}
Оператор instanceof позволяет проверить, с помощью какого конструктора создан объект.
Функция конструктор имеет свойство-объект prototype
    Поля в прототипе - статичные (классовые)
Bind = carring
Флаги и дескрипторы свойств
Итерируемые объекты – это объекты, которые реализуют метод Symbol.iterator, как было описано выше.
Псевдомассивы – это объекты, у которых есть индексы и свойство length, то есть, они выглядят как массивы.
 метод Array.from, который принимает итерируемый объект или псевдомассив и делает из него «настоящий» Array
Контекст вызова для функций полученных с помощью Function.prototype.bind с использованием call и apply — нельзя!
В конструкторе this ={} контекст заданный при помощи bind, просто игнорируется.
<script >
  Скрипты не видят DOM-элементы ниже себя, поэтому к ним нельзя добавить обработчики.  должен сначала выполнить скрипт.  Если вверху страницы объёмный скрипт, он «блокирует» страницу.
  Атрибут defer сообщает браузеру, что он должен продолжать обрабатывать страницу и загружать скрипт в фоновом режиме, а затем запустить этот скрипт, когда он загрузится.  Событие DOMContentLoaded подождёт отложенный скрипт. Отложенные с помощью defer скрипты сохраняют порядок относительно друг друга, как и обычные скрипты.
  async Страница не ждёт асинхронных скриптов, содержимое обрабатывается и отображается.  Событие DOMContentLoaded и асинхронные скрипты не ждут друг друга
Динамически загружаемые скрипты по умолчанию ведут себя как «async».
На практике defer используется для скриптов, которым требуется доступ ко всему DOM и/или важен их относительный порядок выполнения.

А async хорош для независимых скриптов, например счётчиков и рекламы, относительный порядок выполнения которых не играет роли.
</script>
Мы должны манипулировать свойством style только в том случае, если классы «не могут справиться». описываем это в CSS и добавляем класс in js
Если мы присваиваем что-то elem.className, то это заменяет всю строку с классами. elem.classList.toggle
Сброс - присвоить ему пустую строку: elem.style.display = ""
Свойство style оперирует только значением атрибута "style", без учёта CSS-каскада.
getComputedStyle
getComputedStyle требует полное свойство!
JavaScript не видит стили, применяемые с помощью :visited. 
Намного полезнее возможность записывать текст в textContent, т.к. позволяет писать текст «безопасным способом».
когда у элемента есть id или другой стандартный атрибут, создаётся соответствующее свойство. 
У HTML-атрибутов есть следующие особенности:
    Их имена регистронезависимы (id то же самое, что и ID).
    Их значения всегда являются строками.
  Атрибуты – это то, что написано в HTML.
  Свойства – это то, что находится в DOM-объектах.
В большинстве ситуаций предпочтительнее использовать DOM-свойства. 
Координаты и размеры в JavaScript устанавливаются только для видимых элементов.
Если нет внутренних отступов padding, то clientWidth/Height в точности равны размеру области содержимого внутри рамок и полосы прокрутки (если она есть).
// распахнуть элемент на всю высоту
element.style.height = `${element.scrollHeight}px`;

events:
  Обработчик всегда хранится в свойстве DOM-объекта, а атрибут – лишь один из способов его инициализации.
  Так как у элемента DOM может быть только одно свойство с именем onclick, то назначить более одного обработчика так нельзя.
  Внутри обработчика события this ссылается на текущий элемент, то есть на тот, на котором, как говорят, «висит» (т.е. назначен) обработчик.
  Не используйте setAttribute для обработчиков.
Когда на элементе происходит событие, обработчики сначала срабатывают на нём, потом на его родителе, затем выше и так далее, вверх по цепочке предков.
  событие focus не всплывает
Самый глубокий элемент, который вызывает событие, называется целевым элементом, и он доступен через event.target.
this – это «текущий» элемент, до которого дошло всплытие, на нём сейчас выполняется обработчик.
stopPropagation - stop bubling
stopImmediatePropagation - прекратить даже остальны обработчики
Не прекращайте всплытие без необходимости!
Чтобы поймать событие на стадии погружения, нужно использовать третий аргумент capture
Чтобы убрать обработчик removeEventListener, нужна та же фаза
есть много элементов, события на которых нужно обрабатывать похожим образом, то вместо того, чтобы назначать обработчик каждому, мы ставим один обработчик на их общего предка.
Для отмены действия браузера существует стандартный метод event.preventDefault().
Если же обработчик назначен через on<событие> (не через addEventListener), то также можно вернуть false из обработчика.
elem.dispatchEvent(new Event("click", {}));
Для некоторых конкретных типов событий есть свои специфические конструкторы
Вложенные события обрабатываются синхронно
event.which == 1 – левая кнопка
Если указатель «официально» зашёл на элемент, то есть было событие mouseover, то при выходе с него обязательно будет mouseout.
mouseenter и mouseleave
можно предотвратить прокрутку, используя event.preventDefault() на событии, которое вызывает прокрутку, например, на событии keydown для клавиш pageUp и pageDown.
Предотвращайте действие браузера по умолчанию, чтобы избежать pointercancel.
  touch-action: none
  ondragstart = () => false
  drag - setPointerCapture 

Координаты относительно окна: getBoundingClientRect
Чтобы запретить прокрутку страницы, достаточно установить document.body.style.overflow = "hidden".
DOM* props
document.elementFromPoint(x, y)
    pageY = clientY + высота вертикально прокрученной части документа.
    pageX = clientX + ширина горизонтально прокрученной части документа.
    Относительно окна браузера – elem.getBoundingClientRect().
    Относительно документа – elem.getBoundingClientRect() плюс текущая прокрутка страницы.

Object.getOwnPropertyDescriptor
Object.defineProperty.
Object.hasOwnProperty
js zip
Object.is(a, b) почти идентичен a === b.
если ловушка Proxy хочет перенаправить вызов на объект, то достаточно вызвать Reflect.
Когда мы хотим прочитать свойство из object, а оно отсутствует, JavaScript автоматически берёт его из прототипа.
Операция записи не использует прототип
Неважно, где находится метод: в объекте или его прототипе. При вызове метода this — всегда объект перед точкой.
Если в F.prototype содержится объект, оператор new устанавливает его в качестве [[Prototype]] для нового объекта. Это просто свойство функции.
F.prototype по умолчанию, свойство constructor - Мы можем использовать свойство constructor существующего объекта для создания нового. 
Поэтому лучше не заменять прототип а расширять.
Object - конструктор. Object.prototype - хранит объект - его прототип со всем фун. У объекта есть свойство __proto__ - пртотип его.
SomeConstructor.protype ~=~ class obj
Object.create(null) создаёт пустой объект без прототипа ([[Prototype]] будет null):

Также существуют модули с более гибкой промисификацией, например, es6-promisify или встроенная функция util.promisify в Node.js.
У слова async один простой смысл: эта функция всегда возвращает промис. Значения других типов оборачиваются в завершившийся успешно промис автоматически.
await можно использовать только внутри async-функций. : let value = await promise;
Когда выполняется обычный конструктор, он создаёт пустой объект и присваивает его this .
Когда запускается конструктор унаследованного класса, он этого не делает. Вместо этого он ждёт, что это сделает конструктор родительского класса.
Переменная – это свойство специального внутреннего объекта, связанного с текущим выполняющимся блоком/функцией/скриптом.

настройка view engine, которая устанавливает используемый движок предствлений, и views, которая устанавливает путь к папке с представлениями внутри проекта
 в браузере есть минимальная задержка в 4 миллисекунды при множестве вложенных вызовов setTimeout. Даже если мы указываем задержку 0, на самом деле она будет равна 4 мс (или чуть больше). Поэтому чем раньше мы запланируем выполнение – тем быстрее выполнится код.
Микрозадачи приходят только из кода. Обычно они создаются промисами: выполнение обработчика .then/catch/finally становится микрозадачей. Микрозадачи также используются «под капотом» await, т.к. это форма обработки промиса.
Также есть специальная функция queueMicrotask(func), которая помещает func в очередь микрозадач.
Сразу после каждой макрозадачи движок исполняет все задачи из очереди микрозадач перед тем, как выполнить следующую макрозадачу или отобразить изменения на странице, или сделать что-то ещё.
Все микрозадачи завершаются до обработки каких-либо событий или рендеринга, или перехода к другой макрозадаче.
Чтобы добавить в очередь новую макрозадачу: Используйте setTimeout(f) с нулевой задержкой.
Для добавления в очередь новой микрозадачи: Используйте queueMicrotask(f).  Также обработчики промисов выполняются в рамках очереди микрозадач.

# all
https://pnpm.io/installation

!https://github.com/h5bp/Front-end-Developer-Interview-Questions/tree/main/src/translations/russian
https://habr.com/ru/post/231071/

https://github.com/Hexlet/ru-test-assignments
[nginx.conf](D:\dev\nginx-1.21.1\conf\nginx.conf)
https://raw.githubusercontent.com/kamranahmedse/developer-roadmap/master/translations/russian/img/frontend-map.png
https://github.com/grab/front-end-guide
#webpack
https://webpack.js.org/guides/tree-shaking/
https://webpack.js.org/guides/development/
https://webpack.js.org/guides/production/#setup

# test work
https://github.com/some-yummy-nick/frontend-task
https://www.notion.so/Frontend-API-75cc5ecc28cd42f4a6f963e2dad88680
https://github.com/KosyanMedia/test-tasks/tree/master/aviasales_frontend
https://github.com/avito-tech/safedeal-frontend-trainee
https://github.com/avito-tech/sx-frontend-trainee-assignment
https://github.com/tutu-ru/fe-homework
https://github.com/appbooster/test-assignments/blob/master/tasks/frontend-graphql.md
https://github.com/appbooster/test-assignments/blob/master/tasks/frontend.md
  https://drive.google.com/file/d/17i3HWkCW8OdvmczEcE2p3q-ljU-2sAWz/view

## todo
npm install @mui/material @emotion/react @emotion/styled
npm install --save @mui/icons-material
npm install --save @fortawesome/react-fontawesome
https://mui.com/components/material-icons/
https://jestjs.io/

https://materializecss.com/getting-started.html

https://material.io/design
https://material.io/
https://material.io/develop/web/getting-started
https://codelabs.developers.google.com/codelabs/mdc-101-web/#0

npm install materialize-css@next 
npm install react-materialize
npm install --save @types/materialize-css
https://stackoverflow.com/questions/35499842/how-to-use-materialize-css-with-react
import M from 'materialize-css';
https://www.npmjs.com/package/react-materialize
http://react-materialize.github.io/react-materialize/?path=/story/react-materialize--welcome
https://github.com/react-materialize/webpack-boilplate


# learn main
https://www.npmjs.com/package/esm
https://metanit.com/web/nodejs/2.8.php
https://metanit.com/web/javascript/4.12.php
https://refactoring.guru/ru/design-patterns/prototype/typescript/example
https://learn.javascript.ru/websocket
https://metanit.com/web/javascript/4.12.php
https://nodejs.org/api/
https://learn.javascript.ru/quiz
https://metanit.com/web/react/
https://html5css.ru/html/default.php
http://htmlbook.ru/samcss
https://html5css.ru/css/default.php
https://learn.javascript.ru/
https://metanit.com/web/
https://html5book.ru/
https://practicum.yandex.ru/middle-frontend/
https://practicum.yandex.ru/web-plus/
https://practicum.yandex.ru/react/
https://practicum.yandex.ru/graphic-designer/
https://developer.mozilla.org/ru/docs/Web/JavaScript
https://developer.mozilla.org/ru/docs/Learn/JavaScript
https://developer.mozilla.org/ru/docs/Web/JavaScript/Guide
https://developer.mozilla.org/ru/docs/Web/API
https://developer.mozilla.org/ru/docs/Learn/JavaScript/Objects
https://developer.mozilla.org/ru/docs/Learn/JavaScript/Client-side_web_APIs
http://crockford.com/javascript/
http://perfectionkills.com/
https://developer.mozilla.org/ru/docs/Web/JavaScript/Guide/Details_of_the_Object_Model#%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%80_%D1%81%D0%BE%D1%82%D1%80%D1%83%D0%B4%D0%BD%D0%B8%D0%BA
https://learn.javascript.ru/symbol#skrytye-svoystva
https://learn.javascript.ru/prototype-inheritance
https://learn.javascript.ru/testing-mocha
https://tproger.ru/translations/javascript-important-concepts/
https://expressjs.com/en/starter/basic-routing.html

https://lodash.com/docs/4.17.11#isEqual
Promises
https://www.typescriptlang.org/docs/handbook/module-resolution.html

Для поиска чего-либо обычно удобно использовать интернет-поиск со словами «WHATWG [термин]» или «MDN [термин]», например https://google.com?q=whatwg+localstorage, https://google.com?q=mdn+localstorage.
# do
Web Worker https://habr.com/ru/company/ruvds/blog/348424/
Idler
Server js, nginx
https://flow.org/
https://www.typescriptlang.org/docs/bootstrap
Free: https://habr.com/ru/post/250621/
Figma на уровне нарезки ассетов из макетов
Кнопки с шершавой текстурой еле видной, помехами, анимацией помех и фон тож + мерцание света

# node
arguments.callee.name
Вообще объект module представляет ссылку на текущий модуль, а его свойство exports определяет все свойства и методы модуля, которые могут быть экспортированы и использованы в других модулях. 
Несмотря на то, что нет такого файла как welcome.js, но если в проекте есть каталог, который содержит файл с именем index.js, то мы можем обращаться к модулю по имени каталога
Node.js предоставляет специальный объект global(like window obj)
Для получения параметров в коде приложения применяется массив process.argv
https://docs.npmjs.com/creating-a-package-json-file
npm install --no-progress
require: by package.json:main:
package.json:script:start  npm start, npm run dev

nodemon для авто перезапуска сервера
https://www.npmjs.com/package/ts-node
https://www.npmjs.com/package/@babel/register
https://www.npmjs.com/package/esm

Node's module resolution allows you to replace your gulpfile.js file with a directory named gulpfile.js that contains an index.js file which is treated as a gulpfile.js
https://www.npmjs.com/package/gulp-watch
https://gulpjs.com/docs/en/getting-started/async-completion

# stack tech
0: 
https://learn.javascript.ru/web-components
https://metanit.com/web/vuejs/8.4.php
https://metanit.com/web/javascript/
https://metanit.com/web/typescript/
SCSS
typescript(vue3 angular)
https://v3.ru.vuejs.org/ru/guide/introduction.html
https://v3.ru.vuejs.org/ru/guide/migration/introduction.html#%D0%B1%D1%8B%D1%81%D1%82%D1%80%D1%8B%D0%B8-%D1%81%D1%82%D0%B0%D1%80%D1%82
https://metanit.com/web/vue/1.1.php
https://metanit.com/web/angular2/
https://habr.com/ru/company/ruvds/blog/436886/
https://babeljs.io/docs/en/
https://babeljs.io/docs/en/learn
ESLint webpack gulp yarn babel
https://webpack.js.org/guides/getting-started/
https://webpack.js.org/concepts/loaders/
https://webpack.js.org/configuration/watch/#root

1:
https://metanit.com/web/react/
https://ru.reactjs.org/docs/hello-world.html
https://ru.reactjs.org/docs/static-type-checking.html
https://metanit.com/web/nodejs/
https://metanit.com/web/html5/
prototype-based OO
use strict

2:
Express.js https://metanit.com/web/nodejs/4.1.php
React https://ru.reactjs.org/docs/introducing-jsx.html
WebSockets socket.io
https://metanit.com/nosql/mongodb/1.1.php
https://github.com/vuejs/vuex
https://vuex.vuejs.org/ru/guide/state.html#%D0%B5%D0%B4%D0%B8%D0%BD%D0%BE%D0%B5-%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE-%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D1%8F
https://ru.nuxtjs.org/
https://www.typescriptlang.org/docs/handbook/react.html
https://ru.reactjs.org/docs/static-type-checking.html
https://www.chaijs.com/

3:
https://ru.wikipedia.org/wiki/Haml
шаблонизатора Pug
WebGL 
Babylon.js
Blend4Web
Verge3D
https://ru.bem.info/methodology/naming-convention/
Svelte, Tailwind
## othstack
GraphQL https://habr.com/ru/post/326986/
rxjs, typeorm, nestjs, docker, gRPC. rx.js
Angular Material, grpc-web.
Node.js: Nest.js, Koa.js Express.js
React.js Vue.js
yarn
Webpack
WebSockets socket.io
CSS Grid
шаблонизатора blade
CSS
ES6 https://babeljs.io/docs/en/learn/
https://github.com/lukehoban/es6features#readme
Swagger
Nuxt, Quasar, Vuetify
js ORM
https://brunch.io/
https://standardjs.com/

#lint typing vim ide workspace
https://ternjs.net/
https://flow.org/en/docs/install/
https://github.com/ternjs/tern_for_vim
https://daqo.medium.com/vim-and-eslint-16fa08cc580f
https://helgeklein.com/blog/javascript-linting-static-code-analysis-in-vs-code/
ESLint 
JSHint
JavaScript Linting (Static Code Analysis) Vim

# UX UI
Figma
Adobe XD
Sketch 
Zeplin
UX - как работает интрефейс(пошагам), UI - как выглядит
Добавить небольшую текстурность, вариацию цвета, теплохолодность
https://practicum.yandex.ru/trainer/interface-designer/lesson/a24caec2-d62b-405d-91a1-f64463a9520f/

# css
https://webref.ru/layout/bootstrap/install

# ui lib js
canvas https://pixijs.com/
https://github.com/kamens/jQuery-menu-aim
https://github.com/briancherne/jquery-hoverIntent
https://animejs.com/
https://github.com/zloirock/core-js
https://github.com/webpack/webpack
https://github.com/pugjs/pug-loader
https://pugjs.org/api/getting-started.html
https://lodash.com/
https://www.electronjs.org/

# mind
Браузер это как ОС среда типа smalltalk(sqeek)/oberon
На фронте - чисто - не надо сильно погружаться в предметку, только в визуаль и чуток смысл
И интерефейсы мне интересно придумывать вроде бы. И с детства легко с ними разбирался. Мне нравится делать абстрактные вложенные иерархические структуры. И теперь интересно как выглядит. Но не вдохновляют.
UX - всеравно предметка, И бесит делать то что и так должно просто работать
Нет,всё же у меня своё отношение к UI которое надо ломать для других а я хочу по своему. И настраивать визуал кодом css вообще чувствуется неправильным,излишним.
Но на python почти всё - fullstack +js
Но на беке куча сложных технологий, баз данных, алгоритмов, взаимодействий - уж лучше UI делать.
Но всё же так всё иерархично и можно прибрать и сделать красиво
UI это прокачка композиции

#vue 
https://ru.vuejs.org/v2/guide/reactivity.html#%D0%94%D0%BB%D1%8F-%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%BE%D0%B2
https://ru.vuejs.org/v2/guide/computed.html
https://github.com/vuejs/awesome-vue
https://vuex.vuejs.org/ru/

# project start
npm install --global gulp-cli
npm init
package.json
npm install
eslint --init
npm install mongodb
npm install --save-dev @babel/core @babel/cli @babel/preset-env
npm install --save lodash
npm install mocha --save-dev
npm install --save-dev gulp
https://babeljs.io/docs/en/usage
npm install -g sass
npm install --save-dev typescript ts-loader
https://webpack.js.org/loaders/babel-loader/
npm install hbs --save
pm install pug pug-cli -g
npm install webpack webpack-cli css-loader ts-loader babel-loader @babel/core @babel/preset-env --save-dev
npm install react react-dom --save-dev
npm install nodemon express --save-dev
npm install --save-dev @babel/preset-react

npx webpack-cli init
webpack-dev-server
npm install html-webpack-plugin --save-dev
npm install --save-dev css-loader

npm install terser-webpack-plugin --save-dev
npm install uglifyjs-webpack-plugin --save-dev

npm install --save-dev webpack-merge
npm install -g pnpm
npm install --save-dev jest

#npm
https://habr.com/ru/post/133363/
npx

# NPM ALL GLOBAL NEED
npm install nodemon -g
npm install -g @vue/cli
lite-server
# host
https://devcenter.heroku.com/articles/deploying-nodejs

# js
https://nodejs.org/api/esm.html
https://babeljs.io/docs/en/babel-plugin-transform-modules-commonjs
https://learn.javascript.ru/property-descriptors#globalnoe-zapechatyvanie-obekta
https://github.com/Patashu/break_eternity.js/tree/master

# to learn TODO
https://github.com/danistefanovic/build-your-own-x
https://blog.csssr.com/ru/article/candidates-mistakes/
Structure and interpretation of computer programs (SICP)” Harold Abelson, Gerald Jay Sussman;
“Искусство программирования” Дональд Кнут;
“Алгоритмы: построение и анализ” Томас Кормен;
“Грокаем алгоритмы. Иллюстрированное пособие для программистов и любопытствующих” Адитья Бхаргава;
“Паттерны проектирования” Эрик Фримен;
“Чистый код. Создание, анализ и рефакторинг” Роберт Мартин;
“You don’t know JS” Kyle Simpson;
“Секреты JavaScript ниндзя” Джон Резиг, Беэр Бибо;
“Не заставляйте меня думать” Стив Круг.
https://refactoring.guru/
https://regex101.com/r/z9Y2M8/1
https://learn.javascript.ru/async-iterators-generators
https://reactstrap.github.io/
https://pragmaticpineapple.com/ultimate-vim-typescript-setup/#code-completions
$ npm install renamer -g
$ renamer -regex --find '\.js^' --replace '.mjs' './outDir/**/*.js'
https://learn.javascript.ru/closure#summa-s-pomoschyu-zamykaniy
https://webpack.js.org/configuration/configuration-languages/
https://webpack.js.org/guides/development/
https://webpack.js.org/guides/typescript/

TODO: 
https://learn.javascript.ru/binary
https://learn.javascript.ru/fetch
https://learn.javascript.ru/ui
https://learn.javascript.ru/template-element
https://metanit.com/web/typescript/6.1.php
https://ru.reactjs.org/docs/getting-started.html
https://metanit.com/web/nodejs/7.1.php
https://ru.hexlet.io/webinars
https://ru.hexlet.io/courses/layout-designer-basics
https://ru.hexlet.io/courses/css-content
https://developer.mozilla.org/ru/docs/Web/CSS/CSS_Grid_Layout/Basic_Concepts_of_Grid_Layout
https://medium.com/@stasonmars/%D0%B2%D0%B5%CC%88%D1%80%D1%81%D1%82%D0%BA%D0%B0-%D0%BD%D0%B0-grid-%D0%B2-css-%D0%BF%D0%BE%D0%BB%D0%BD%D0%BE%D0%B5-%D1%80%D1%83%D0%BA%D0%BE%D0%B2%D0%BE%D0%B4%D1%81%D1%82%D0%B2%D0%BE-%D0%B8-%D1%81%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D1%87%D0%BD%D0%B8%D0%BA-220508316f8b
https://habr.com/ru/post/527310/
https://htmlacademy.ru/courses/297/run/1
https://nuxtjs.org/
https://metanit.com/web/nodejs/6.1.php
https://htmlacademy.ru/courses/299/run/2
https://metanit.com/web/react/2.8.php
https://guides.hexlet.io/how-to-learn-sicp/
https://ru.hexlet.io/courses/js-objects/lessons/about/theory_unit
http://frontendinterviewhandbook.com/ru/css-questions/#what-is-css-selector-specificity-and-how-does-it-work
https://learn.javascript.ru/onscroll#tasks
https://learn.javascript.ru/mouse-drag-and-drop
https://htmlacademy.ru/courses/301/run/16
https://medium.com/@luisvieira_gmr/understanding-the-critical-rendering-path-rendering-pages-in-1-second-735c6e45b47a
https://ru.reactjs.org/docs/optimizing-performance.html#examples

!!vuex Redux React
https://metanit.com/web/react/5.1.php
https://ru.reactjs.org/docs/create-a-new-react-app.html
RxJS
!Flexbox или Grid https://html5book.ru/css3-flexbox/
https://habr.com/ru/company/itsoft/blog/553266/

https://www.gatsbyjs.com/docs/quick-start
https://www.sitepoint.com/react-toggle-switch-reusable-component/
https://nextjs.org/learn/basics/create-nextjs-app

if will required then read before interview
WebSockets socket.io
React Native
vue-router

-------------
https://learn.javascript.ru/web-components
Понимание производительности веб приложений и принципов оптимизации;
pug
адаптивная верстка
Gatsby.js
Cordova
Firebase, Gatsby
https://vuex.vuejs.org/ru/guide/state.html#%D0%B5%D0%B4%D0%B8%D0%BD%D0%BE%D0%B5-%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE-%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D1%8F
https://vuex.vuejs.org/ru/#%D1%87%D1%82%D0%BE-%D1%82%D0%B0%D0%BA%D0%BE%D0%B5-%C2%AB%D0%BF%D0%B0%D1%82%D1%82%D0%B5%D1%80%D0%BD-%D1%83%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F-%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%D0%BC%C2%BB
https://next.vuex.vuejs.org/
https://vuex.vuejs.org/ru/#%D1%87%D1%82%D0%BE-%D1%82%D0%B0%D0%BA%D0%BE%D0%B5-%C2%AB%D0%BF%D0%B0%D1%82%D1%82%D0%B5%D1%80%D0%BD-%D1%83%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F-%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%D0%BC%C2%BB
https://v3.ru.vuejs.org/ru/guide/introduction.html

# lib
https://sinonjs.org/
https://jestjs.io/docs/getting-started
syntax hi https://prismjs.com/
https://modernizr.com/
https://prerender.io/
https://www.snowpack.dev/
https://github.com/jaredpalmer/razzle
##react lib
https://github.com/smartprocure/futil-js
https://lodash.com/docs/4.17.15
https://github.com/lodash/lodash/wiki/FP-Guide
https://nextjs.org/
  https://nextjs.org/learn/basics/create-nextjs-app
https://www.gatsbyjs.com/
https://www.gatsbyjs.com/starters/
https://www.gatsbyjs.com/docs/
https://neutrinojs.org/
https://nx.dev/react
https://parceljs.org/
https://rxjs.dev/guide/overview

##RxJs
https://habr.com/ru/post/438642/

# mobile
https://developer.mozilla.org/en-US/docs/Web/CSS/touch-action

# digital pen
https://learn.javascript.ru/pointer-events#tipy-sobytiy-ukazatelya
https://developer.mozilla.org/en-US/docs/Web/API/Pointer_events
https://w3c.github.io/pointerevents/#pointerevent-interface
pointerdown pressure
dom.w3c_pointer_events.dispatch_by_pointer_messages - true about:config (firefox)

# jss 
https://cssinjs.org/?v=v10.8.0
https://cssinjs.org/react-jss/?v=v10.8.0

# top
https://ui.dev/javascript-visualizer/
https://developer.mozilla.org/ru/docs/Web/JavaScript
https://developer.mozilla.org/ru/docs/Web/JavaScript/A_re-introduction_to_JavaScript
https://developer.mozilla.org/ru/docs/Web/JavaScript/Equality_comparisons_and_sameness
https://developer.mozilla.org/ru/docs/Web/JavaScript/Guide/Functions#definition
https://dorey.github.io/JavaScript-Equality-Table/

# logging
используйте console.trace()
Используйте имена вычисляемых свойств ES6 для идентификации объектов и чтобы не путать их с именами переменных. ({user, user2})
уровня логирования, — console.debug(), console.warning() и console.error()
При логировании списков элементов пользуйтесь console.table()
debugger;
Тонкое профилирование с console.profile() и console.time()
Подсчёт количества выполнений кода через console.count()
