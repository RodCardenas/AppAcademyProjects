# React-Flux Assessment

Read this entire README before running specs for the first time - it contains important information about running tests with jest.

## Design Documents
* [Database Schema][db_schema]
* [View Wireframes][views]

[db_schema]: ./docs/db_schema.md
[views]: ./docs/views.md

## Instructions

## Setup

If anything here fails, call over a TA to help.

1. `npm install`
2. `bundle install`
3. `bundle exec rake db:create`
4. `bundle exec rake db:migrate`
5. `rails server`
6. In a new terminal tab, `webpack --watch`

Test your code live at localhost:3000.

You will begin with the backend entirely set up. Parts of the skeleton, including the PostConstants, have been provided to you as well.

## Running specs

You will be running your code using Jest.

Run all the specs with `npm test`, and the results of your specs will appear in the terminal.

Jest specs are conventionally arranged in folders named `__tests__`
nested in the folder of the module they are testing. See below for instructions on how to run one test file at a time.

We recommend passing your specs in this order:

Entry point test:

1. `frontend/__tests__/reactA06-test.js`

Flux cycle tests:

1. `frontend/dispatcher/__tests__/dispatcher-test.js`
2. `frontend/actions/__tests__/serverActions-test.js`
3. `frontend/util/__tests__/apiUtil-test.js`
4. `frontend/actions/__tests__/clientActions-test.js`
5. `frontend/stores/__tests__/postStore-test.js`

Component tests:

1. `frontend/components/__tests__/postIndex-test.js`
2. `frontend/components/__tests__/postIndexItem-test.js`
3. `frontend/components/__tests__/postForm-test.js`
4. `frontend/components/__tests__/postEdit-test.js`
5. `frontend/components/__tests__/postShow-test.js`

## Debugging tips

Jest is Facebook's defacto testing framework for React components and Flux apps. Yup, it can throw some cryptic and intimidating errors. We hear you - jest stack traces can be downright unhelpful. Here are some tips for making debugging a little less intimidating.

1. Look at the test file to see how we expect the method to behave. Unsure about what something is doing? Check out the Jest Getting Started guide to learn about the jest api.

https://facebook.github.io/jest/docs/getting-started.html#content

2. You can control how jest runs with some flags, like `jest --watch`. To do so:
  * Install jest globally: `npm install -g jest-cli`
  * Now you can run:
  * `jest frontend/somepath/__tests__/sometest.js` - run a single test file (HIGHLY RECOMMENDED)
  * `jest --watch`: similar to `webpack --watch`, will update every time there is a change
  * `jest --bail`: similary to `rspec --fail-fast`, will bail once you fail a spec

3. Install bugger to debug your tests in Chrome Devtools - this is a super helpful tool and will allow you to put debuggers and breakpoints in your code.

  * `npm install -g bugger`
  * Place debuggers in your tests where needed.
  * `npm run bugger`

This will spit out a url that you can paste into the browser like:

chrome-devtools://devtools/bundled/inspector.html?ws=127.0.0.1:8058/devtools/page/3EF9CDA0-068E-11E6-9C8A-6572CFEAB9FF

Navigate over and debug.

More info: https://github.com/buggerjs/bugger
