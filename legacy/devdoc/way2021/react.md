Redux-Saga
Redux Form,

https://github.com/alexgurr/react-coding-challenges
https://github.com/briang123/stats-challenge-in-react-js
https://react-rxjs.org/
https://redux-saga.js.org/

Всякий раз, когда корневые элементы имеют различные типы, React уничтожает старое дерево и строит новое с нуля. 
При уничтожении дерева старые DOM-узлы удаляются. Экземпляры компонента получают componentWillUnmount()
Любое состояние, связанное со старым деревом, теряется.
 есть метод shouldComponentUpdate. Он вызывается перед каждым потенциальным рендером, и в него аргументами приходят nextProps и nextState. Если этот метод возвращает false, то у компонента (а значит, и у всех дочерних) не вызывается рендер
    Каждый раз, когда меняются данные, должна создаваться новая ссылка.
    Новая ссылка должна создаваться только тогда, когда меняются данные.

https://medium.com/@rcdilorenzo/improve-your-react-state-code-with-lenses-70fbbf835d41
https://habr.com/ru/post/538844/
ImmutableJS
https://ru.reactjs.org/docs/react-api.html
https://ru.reactjs.org/docs/react-component.html

#links
!! https://zapier.com/engineering/how-to-build-redux/
!! https://benlesh.medium.com/learning-observable-by-building-observable-d5da57405d87
https://blog.csssr.com/ru/article/react-perfomance/
https://ru.reactjs.org/docs/reconciliation.html

https://reactstrap.github.io/
https://habr.com/ru/post/522896/
https://ru.reactjs.org/docs/hooks-reference.html#usereducer
https://habr.com/ru/post/507572/
https://github.com/pubudu-ranasinghe/react-context-example/blob/master/src/contexts/AuthContext.js
https://betterprogramming.pub/build-a-redux-like-store-with-react-context-hooks-234e3774495f
https://medium.com/nerd-for-tech/using-context-api-in-react-with-functional-components-dbc653c7d485
https://codepen.io/anokata/pen/abydvBL?editors=0011
https://facebook.github.io/flux/docs/overview/
https://reactnative.dev/docs/getting-started

https://ru.reactjs.org/docs/higher-order-components.html#use-hocs-for-cross-cutting-concerns
https://redux.js.org/tutorials/essentials/part-2-app-structure#using-the-counter-app

https://getaround.tech/setting-up-vim-for-react/
https://medium.com/@JedaiSaboteur/creating-a-react-app-from-scratch-f3c693b84658
https://medium.com/age-of-awareness/setup-react-with-webpack-and-babel-5114a14a47e9

https://ru.reactjs.org/docs/optimizing-performance.html#examples
https://create-react-app.dev/docs/getting-started
https://github.com/kriasoft/react-starter-kit
https://github.com/tj/frontend-boilerplate/blob/master/webpack.config.js

https://metanit.com/web/react/
https://metanit.com/web/react/2.8.php
https://practicum.yandex.ru/react/
https://ru.reactjs.org/docs/hello-world.html
https://ru.reactjs.org/docs/introducing-jsx.html
https://www.typescriptlang.org/docs/handbook/react.html
https://ru.reactjs.org/docs/static-type-checking.html
https://reactstrap.github.io/
https://metanit.com/web/react/5.1.php
https://ru.reactjs.org/docs/create-a-new-react-app.html
React Native
react-router/dom https://metanit.com/web/react/4.1.php
https://reacttraining.com/
https://reactrouter.com/
https://rxjs.dev/
https://create-react-app.dev/docs/adding-typescript/
npm install --save typescript @types/node @types/react @types/react-dom @types/jest

#redux
! https://habr.com/ru/post/498860/
https://redux.js.org/faq/general#when-should-i-use-redux
https://ru.reactjs.org/docs/hooks-intro.html
https://facebook.github.io/flux/
https://redux.js.org/
https://redux-toolkit.js.org/
https://redux-toolkit.js.org/introduction/getting-started#installation
https://redux.js.org/faq/react-redux
https://github.com/markerikson/react-redux-links
https://react-redux.js.org/

https://daveceddia.com/react-redux-immutability-guide/
https://react-redux.js.org/using-react-redux/connect-mapdispatch#approaches-for-dispatching

// action
const addTodoAction = {  type: 'todos/todoAdded',  payload: 'Buy milk'}
// action creator
const addTodo = text => {  return {    type: 'todos/todoAdded',    payload: text  }}

A reducer is a function that receives the current state and an action object, decides how to update the state if necessary, and returns the new state
(state, action) => newState
The Redux store has a method called dispatch
The only way to update the state is to call store.dispatch() and pass in an action object.
Selectors are functions that know how to extract specific pieces of information from a store state value.
? subscribe to any future store updates The store notifies all parts of the UI that are subscribed 
Redux provides a single store.subscribe method for notifying listeners that the store has updated

React Redux includes a <Provider /> component, which makes the Redux store available to the rest of your app:
React Redux provides a pair of custom React hooks that allow your React components to interact with the Redux store.

# react libs
https://formik.org/
https://nextjs.org/
https://github.com/pugjs/babel-plugin-transform-react-pug
https://github.com/bluewings/pug-as-jsx-loader

# info
В React функциональные компоненты являются более простым способом написания компонентов, которые содержат только метод render и не имеют собственного состояния
Вместо определения класса, который наследуется от React.Component, мы можем написать функцию, которая принимает на вход props и возвращает то, что должно быть отрендерено. 
После компиляции каждое JSX-выражение становится обычным вызовом JavaScript-функции, результат которого — объект JavaScript.
Babel компилирует JSX в вызовы React.createElement().
Для рендеринга React-элемента в корневой узел DOM вызовите ReactDOM.render() с React-элементом и корневым DOM узлом в качестве аргументов
Во многом компоненты ведут себя как обычные функции JavaScript. Они принимают произвольные входные данные (так называемые «пропсы») и возвращают React-элементы, описывающие, что мы хотим увидеть на экране.
Всегда называйте компоненты с заглавной буквы.
React-компоненты обязаны вести себя как чистые функции по отношению к своим пропсам.
Состояние контролируется и доступно только конкретному компоненту.
Классовые компоненты всегда должны вызывать базовый конструктор с аргументом props.
Не изменяйте состояние напрямую  - use setState. Конструктор — это единственное место, где вы можете присвоить значение this.state напрямую
Обновления состояния могут быть асинхронными - вы не должны полагаться на их текущее значение для вычисления следующего состояния.  Правильно будет использовать второй вариант вызова setState(), который принимает функцию, а не объект. Эта функция получит предыдущее состояние в качестве первого аргумента и значения пропсов непосредственно во время обновления в качестве второго аргумента
Компонент может передать своё состояние вниз по дереву в виде пропсов дочерних компонентов
События в React именуются в стиле camelCase вместо нижнего регистра.  С JSX вы передаёте функцию как обработчик события вместо строки.
При обращении к this в JSX-колбэках необходимо учитывать, что методы класса в JavaScript по умолчанию не привязаны к контексту. Надо их забиндить к this в конструкторе. Or  onClick={() => this.handleClick()}
В редких случаях может потребоваться позволить компоненту спрятать себя, хотя он уже и отрендерен другим компонентом. Чтобы этого добиться, верните null вместо того, что обычно возвращается на рендеринг.
Если установить управляемому компоненту проп value, то пользователь не сможет изменить его значение без вашего желания. 

Рефы создаются с помощью React.createRef() и прикрепляются к React-элементам через ref атрибут

npm install redux react-redux @reduxjs/toolkit

Хуки позволяют вам повторно использовать логику состояния, не затрагивая дерево компонентов. 
Хуки следует вызывать только на верхнем уровне. Не вызывайте хуки внутри циклов, условий или вложенных функций.
Хуки следует вызывать только из функциональных компонентов React. 
Хуки НЕ работают внутри классов, а используются вместо них.
Хук — это специальная функция, которая позволяет «подцепиться» к возможностям React. 
Что же делает useEffect? Используя этот хук, вы говорите React сделать что-то после рендера. ффекты выполняются после каждого рендера. 

useSelector reads a value from the store state and subscribes to updates, while useDispatch returns the store's dispatch method to let you dispatch actions.
Create a Redux store with configureStore
    configureStore accepts a reducer function as a named argument
    configureStore automatically sets up the store with good default settings
Provide the Redux store to the React application components
    Put a React-Redux <Provider> component around your <App />
    Pass the Redux store as <Provider store={store}>
Create a Redux "slice" reducer with createSlice
    Call createSlice with a string name, an initial state, and named reducer functions
    Reducer functions may "mutate" the state using Immer
    Export the generated slice reducer and action creators
Use the React-Redux useSelector/useDispatch hooks in React components
    Read data from the store with the useSelector hook
    Get the dispatch function with the useDispatch hook, and dispatch actions as needed

Redux is a pattern and library for managing and updating application state, using events called "actions".

npm install @types/react-redux
https://react-redux.js.org/using-react-redux/usage-with-typescript
https://redux-toolkit.js.org/usage/usage-with-typescript
https://github.com/typescript-cheatsheets/react#reacttypescript-cheatsheets

  handleChange(e: React.ChangeEvent<HTMLInputElement>) {
https://facebook.github.io/flux/docs/overview
# hooks
https://ru.reactjs.org/docs/context.html
Контекстовы объ должен быть в стейте
context obj must be in state (useState)

# next.js
https://nextjs.org/learn/basics/navigate-between-pages/pages-in-nextjs

# native
https://medium.com/wix-engineering/creating-a-native-module-in-react-native-93bab0123e46
https://reactnative.dev/docs/native-modules-android
