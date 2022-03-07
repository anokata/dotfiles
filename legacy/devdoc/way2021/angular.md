https://github.com/angular/angularfire
https://angular.io/guide/interpolation#expression-context
#todo
- Уделить больше внимания качеству кода, архитектуре, тому как устроена система директорий в проекте.
- Овладеть уверенно версткой: 
  - scss: любым css препроцессором, 
  - БЭМ
- Изучить системы логирования/мониторинга ошибок на фронтенде, да и в принципе интеграции сторонних сервисов.
 https://sentry.io/for/frontend/
https://sentry.io/welcome/#
https://rollbar.com/
npm install --save rollbar
- Изучить способы защиты клиент-серверных запросов(+JWT).
https://www.npmjs.com/package/jsonwebtoken
https://www.npmjs.com/package/@auth0/angular-jwt
https://jasonwatmore.com/post/2019/06/22/angular-8-jwt-authentication-example-tutorial
https://github.com/cornflourblue/angular-8-jwt-authentication-example
- Оптимизация фронтенд
- Подучить использование webpack, его возможности.
js:
  async/defer
  this
  web api
  rest, methods get/post/delete/update
ts:
  unknown
  type &
  const a = 3; type: 3
  let 3: 3 = 3;
  infer
ng:
    oninit... lyfe cycle of component/directive/pipe
    Input: get/set
    ng-content template container
css:
  pseudo:: content
  viewport, mobile

#zone
https://medium.com/@overthesanity/zone-js-%D0%BE%D1%82-%D0%B0-%D0%B4%D0%BE-%D1%8F-fdb995917968

# all
Сервис это синглтон
Директива трансформатор dom: компонентные (подствновка), атрибутивные(class, style, attr, model), структурные(ngFor ngIf)
https://tutorialsforangular.com/
https://tutorialsforangular.com/2019/12/31/skipping-tests-in-angular-cli/
https://medium.com/@overthesanity/zone-js-%D0%BE%D1%82-%D0%B0-%D0%B4%D0%BE-%D1%8F-fdb995917968
https://marketplace.visualstudio.com/items?itemName=johnpapa.Angular2
https://angular.io/guide/lifecycle-hooks
Quiz: https://github.com/Angular-RU/angular-ru-interview-questions
https://material.angular.io/

https://vk.com/wall-79831840_49525?z=video-79831840_456270674%2F93cb44f3cbe0b20165%2Fpl_post_-79831840_49525
https://github.com/Angular-RU/angular-ru-interview-questions
https://vk.com/wall-79831840_49525

https://developer.mozilla.org/ru/docs/Learn/Tools_and_testing/Client-side_JavaScript_frameworks/Angular_getting_started#the_class

https://stackblitz.com/
https://angular.io/start#take-a-tour-of-the-example-application
https://angular.io/tutorial
https://angular.io/guide/architecture
https://angular.io/guide/devtools
https://material.angular.io/
https://angular.io/cli

https://angular.io/guide/architecture-components

https://angular.io/tutorial/toh-pt0#make-changes-to-the-application

angular reactive: https://ngrx.io/
https://metanit.com/web/angular2/1.1.php

https://habr.com/ru/post/348818/
https://mkdev.me/posts/zachem-nuzhen-angular-js-i-pochemu-imenno-on
https://angular.io/resources?category=education
https://ru.wikipedia.org/wiki/%D0%92%D0%BD%D0%B5%D0%B4%D1%80%D0%B5%D0%BD%D0%B8%D0%B5_%D0%B7%D0%B0%D0%B2%D0%B8%D1%81%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D0%B8

https://angular.io/guide/cheatsheet

https://github.com/nrwl/nx-console
https://nx.dev/angular

# ngrx (redux)

https://angdev.ru/ngrx/about/
https://ngrx.io/
npm install @ngrx/store --save
ng add @ngrx/store@latest
ng add @ngrx/store-devtools@latest

# tut book learn

https://angdev.ru/guide/basic/components/

# ng cli

ng serve
ng build

npm install -g nx
npx create-nx-workspace --preset=angular
https://nx.dev/l/a/getting-started/nx-setup

ng new --package-manager=pnpm --routing=true --skip-tests=true --style=scss %NAME

# npm

npm install -g @angular/cli
npm install @angular/common @angular/compiler @angular/core @angular/forms @angular/platform-browser @angular/platform-browser-dynamic @angular/router rxjs zone.js
npm install --save-dev @angular-devkit/build-angular @angular/cli @angular/compiler-cli @types/node typescript

# rxjs

https://angdev.ru/doc/angular-and-rxjs/

# deploy

https://github.com/angular-schule/angular-cli-ghpages
https://angular.io/guide/deployment#routed-apps-must-fallback-to-indexhtml

# forms

Кроме того, необходимо связать объекты FormControl с элементами ввода с помощью атрибута formControlName:

# style css
https://habr.com/ru/post/588969/
Селектор ::ng-deep Это мощный инструмент, позволяющий точечно отключать инкапсуляцию у селектора.  При компиляции на селекторы вложенные в ::ng-deep не вешаются уникальный атрибут компонента. Это делает данные стили глобальными.
Единственный вариант, в котором можно использовать ::ng-deep, это воздействие на вложенные компоненты сторонних библиотек не предоставляющих интерфейса для их кастомизации.
В этом случае согласно документации, нужно оборачивать ::ng-deep в :host или другие селекторы, на которых имеется инкапсуляция. Это ограничит распространение глобального стиля только данным компонентом.

# log
https://www.npmjs.com/package/ngx-logger
https://angular-ru.github.io/angular-ru-logger-example-app/
https://www.npmjs.com/package/@angular-ru/logger

# concepts
<ng-template> element defines a template that is not rendered by default.
<ng-container> can be used to hold directives without creating an HTML element.
<ng-content> element specifies where to project content inside a component template.
