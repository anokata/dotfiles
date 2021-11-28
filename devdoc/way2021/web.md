https://bower.io/
"в каскаде победит последний из сильнейших" .

https://storybook.js.org/
https://habr.com/ru/post/587674/
https://www.fast.design/
# youtube
https://www.youtube.com/c/VladilenMinin/playlists
https://www.youtube.com/channel/UCedskVwIKiZJsO8XdJdLKnA

#tools
https://habr.com/ru/company/jugru/blog/586376/
https://www.postman.com/downloads/
# templates
https://themeforest.net
free html admin templates
free html templates
http://athemes.com/collections/free-bootstrap-admin-templates/
https://colorlib.com/wp/free-admin-templates

# page builders
https://mobirise.com/


# css frameworks
https://cdnjs.com/libraries/materialize

# info
https://blog.csssr.com/ru
https://blog.csssr.com/ru/culture/
https://blog.csssr.com/ru/article/css-grid-by-example/
https://httpbin.org/
https://github.com/typicode/json-server
img image random  https://picsum.photos/
    <div class="item"> <img src="https://source.unsplash.com/random/200x200?sig=1" /></div>
    <div class="item"> <img src="https://picsum.photos/200" alt=""></div>
https://jgthms.com/web-design-in-4-minutes/
[firebug for firefox](https://www.mozilla.org/en-US/firefox/developer/?utm_source=firebug&utm_medium=lp&utm_campaign=switch&utm_content=landingpage)
https://habr.com/ru/company/macloud/blog/549966/
FREE 
https://github.com/ripienaar/free-for-dev

browser.link.open_newwindow 

https://ru.hexlet.io/courses/css-content/lessons/intro/theory_unit
https://epixx.github.io/emmet/
html:5 <C-y>,
html:5

# design css
https://moderncss.dev/custom-css-styles-for-form-inputs-and-textareas/

# css
https://developer.mozilla.org/en-US/docs/Web/CSS/:host()
https://mui.com/
https://materializecss.com/
https://css-tricks.com/snippets/css/a-guide-to-flexbox/
https://css-tricks.com/snippets/css/complete-guide-grid/
https://html5book.ru/css3-flexbox/
Если у элемента есть позиционированный предок, то position: absolute работает относительно него, а не относительно документа.  То есть, достаточно поставить родительскому div позицию relative, даже без координат – и заголовок будет в его правом-верхнем углу, вот так:
Блок по горизонтали центрируется margin: 0 auto
Вертикальные отступы поглощают друг друга, горизонтальные – нет.
Отрицательные значения margin-top/margin-left смещают элемент со своего обычного места.соседние элементы занимают освободившееся пространство в отличие от position: relative, при котором элемент визуально сдвигается, но место, где он был, остаётся «занятым».
Правильно: height:100% + position:absolute

https://autoprefixer.github.io/ru/
https://developer.mozilla.org/ru/docs/Web/CSS/CSS_Grid_Layout/Basic_Concepts_of_Grid_Layout
Используйте обобщённые свойства только один раз при задании стандартных стилей.
https://ru.hexlet.io/courses/css-content/lessons/fonts/exercise_unit

https://ru.bem.info/tutorials/classic/i-bem/
https://ru.bem.info/
https://nicothin.pro/idiomatic-pre-CSS/
https://github.com/orgs/epixx/repositories
https://epixx.github.io/code-guide/

https://htmlacademy.ru/courses
https://htmlacademy.ru/courses/297/run/1
https://ru.code-basics.com/languages/html
https://caniuse.com/
! https://htmlacademy.ru/skills?_ga=2.209258714.974607141.1632031694-1343963918.1632031693

    Задавай значения в em, если свойства масштабируются относительно font-size;
    Во всех остальных случаях задавай значения в rem.

https://meyerweb.com/eric/tools/css/reset/

# semantic web, microtag
https://yandex.ru/support/webmaster/schema-org/what-is-schema-org.html
https://schema.org/
https://ru.code-basics.com/languages/html/lessons/microdata
https://webmaster.yandex.ru/tools/microtest/
https://search.google.com/test/rich-results

# book css
CSS. Каскадные таблицы стилей. Подробное руководство | Мейер Эрик А.
Большая книга CSS3. Дэвид Макфарланд. (есть)

# css
единицы: em, rem, %

https://material.angular.io/
##flex
Абсолютно позиционированный flex-элемент не участвует в компоновке гибкого макета.
Поля margin соседних flex-элементов не схлопываются.
https://stackoverflow.com/questions/6867254/browsers-default-css-for-html-elements
https://habr.com/ru/company/otus/blog/580442/
https://cssdeck.com/blog/what-is-a-css-reset/
https://get.foundation/
https://materializecss.com/
https://csstools.github.io/sanitize.css/
reset: https://habr.com/ru/company/otus/blog/580442/

#seo
https://developers.google.com/search/docs/advanced/crawling/special-tags?visit_id=637679866829730081-2176296101&rd=1
https://yandex.ru/support/webmaster/controlling-robot/html.html

# design
1. content
2. style, centring
https://unsplash.com/

# TO READ
https://medium.com/web-standards/episode-187-b581c5d9dd8e
http://html5doctor.com/


# main style
* {
  margin: 0;
  padding: 0;
}

body {
  margin: 0 auto;
  max-width: 50em;
}

! atomic design

https://www.i18next.com/
https://vscode.dev/

# browser GET HTTP
1. from url: http(s)://host.some/location/index.html
    extract: protocol: http(s)
             host: host.some
             location path: location/index.html
2. dns get IP for host:cache or request 
3. connect IP by TCP in port 80/443.
4. https - TSL cerctificate handshake
5. Make HTTP Header: method version: location, host
        GET /location 1.0
        Host: virtual.some
        Connection: close
6. send HTTP Request, get response:status
    get success 200 ok, + HTML
7. Parse HTML.  Make DOM, CSSOM. несколько проходов. Скрпты могут вызвать reflow/redraw
8. Rendering. Events. Event loop

# jwt
способы защиты клиент-серверных запросов(+JWT).
https://ru.wikipedia.org/wiki/JSON_Web_Token
https://habr.com/ru/post/340146/
https://jwt.io/
https://github.com/panva/jose
https://blog.angular-university.io/angular-jwt-authentication/
https://firebase.google.com/docs/auth/admin/create-custom-tokens
https://jasonwatmore.com/post/2019/06/22/angular-8-jwt-authentication-example-tutorial#auth-guard-ts
https://www.npmjs.com/package/@auth0/angular-jwt

# bem Блок, Элемент, Модификатор
В его основе лежит принцип разделения интерфейса на независимые блоки. Он позволяет легко и быстро разрабатывать интерфейсы любой сложности и повторно использовать существующий код
## block
Название блока характеризует смысл («что это?» — «меню»: menu, «кнопка»: button), а не состояние («какой, как выглядит?» — «красный»: red, «большой»: big).
Блок не должен влиять на свое окружение, т. е. блоку не следует задавать внешнюю геометрию (в виде отступов, границ, влияющих на размеры) и позиционирование.
Блоки можно вкладывать друг в друга.
<header class="header">
    <div class="logo"></div>
    <form class="search-form"></form>
</header>
## element
Составная часть блока, которая не может использоваться в отрыве от него.
Название элемента характеризует смысл («что это?» — «пункт»: item, «текст»: text), а не состояние 
Структура полного имени элемента соответствует схеме: имя-блока__имя-элемента, block__element
<form class="search-form">
    <input class="search-form__input">
    <button class="search-form__button"></button>
</form>
Элемент — всегда часть блока, а не другого элемента. Это означает, что в названии элементов нельзя прописывать иерархию вида block__elem1__elem2.

#css anime
left/top - тормозно
transform - быстро

# optimize
minify
cdn for lib
img optimize, exact size
ico - svg
optimize html, css
animation: transform
use system fonts
no icon font, use svg
cache+zip on server

# lay
event hasLayout
main, article, section, footer, aside, nav, header - block/div
span for text, or em strong
section>header>h1
nav>ul>li>a
