# Sprockets Strict Mode

`sprockets-strict-mode` is a Sprockets processor that enables ECMAScript 5 strict mode for your JavaScript files.


## What's strict mode?

The ES5 version of JavaScript introduced something called ["strict mode"](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions_and_function_scope/Strict_mode). It's a directive that you can add to your JavaScript files, which makes the browser use a slightly stricter parser that prevents code from doing various things which are considered harmful or simply are errors that JavaScript previously didn't complain about. This includes things like:

- modifying or deleting object properties that should not be modified or deleted
- using the `with` keyword
- implicitly adding fields to `window` when you forget to add `var`

Instead of silently ignoring those, the browser will now throw an error that you can see in the JS console. While it's not really a replacement for [JSLint](http://www.jslint.com) or [JSHint](http://www.jshint.com), it can help you detect things like objects leaking to the global scope. It should also help you prepare your code to be compatible with future versions of JavaScript, and generally make your code a bit more "proper" (if you care about such things).

So how do you enable this strict mode? It's simple, you just need to add this line to the beginning of a file (or function) to make it strict:

```js
"use strict";
```

Yes, it's just an unassigned string. It doesn't do anything by itself, but it lets the JS interpreter know that you want to enable strict mode.

So why almost no one uses this feature? Mostly because people don't know (or care) about it, but also because you can't enable it globally and it's a bit annoying to have to type this again and again in every file.

But what if you could enable it globally? That's basically what this tiny gem does.


## The processor

`sprockets-strict-mode` is an add-on to Sprockets (which is used by the Rails asset pipeline). You set it up as a postprocessor for JavaScript files, which means it acts as an invisible filter that all JavaScript files go through after they're processed by all the standard processors. The only thing it changes in those files is that it adds the strict mode line at the beginning. It skips empty files and files generated from CoffeeScript, since those are automatically strict mode compatible.

If you only use CoffeeScript to write your frontend, you DO NOT need this gem. (You might want to use it though if you have a mix of JavaScript and CoffeeScript files.)


## Setting up

Add the gem to your gemfile:

```rb
gem 'sprockets-strict-mode'
```

Then tell Sprockets to use it, e.g. in `application.rb`, or even better, in an initializer:

```rb
Rails.application.assets.register_postprocessor('application/javascript', Sprockets::StrictMode)
```

I'd recommend to only enable this processor in development mode, not in production (but it's your choice).


## Credits

Created by [Jakub Suder](http://psionides.eu), licensed under MIT License.
 