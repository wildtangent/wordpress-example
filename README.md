# README #

<<<<<<< HEAD
See [PREINSTALL.md](PREINSTALL.md) for details on how to get set up with [Trellis](https://roots.io/trellis/) and [Vagrant](https://www.vagrantup.com/)
=======
See [PREINSTALL.md](PREINSTALL.md) for details for now
>>>>>>> master

## THEME DEVELOPMENT

We are currently using the [sage-twig-theme](https://github.com/studiorabota/sage-twig-theme) theme.

However it has been modified to support [Webpack](https://webpack.github.io/) and [CoffeeScript](http://coffeescript.org/), [PostCSS](https://github.com/postcss/postcss), and [SCSS](http://sass-lang.com/) instead of [Gulp](http://gulpjs.com/).

Much as I like Gulp, this means we can natively support all the modular codebase and optimisations of Webpack without Browserify and lots of Gulp configuration.

It also enabled Hot Module Replacement (liveReload) and other goodnesss.
It "MIGHT" however have broken the staging build...

## How To build (Dev Mode)

```
cd [project-root]/site/web/app/themes
npm run watch
open https://localhost:3000
```

## How to build (Production Mode)

```
cd [project-root]/site/web/app/themes
npm run build-production
```

## How to clean dist

```
cd [project-root]/site/web/app/themes
npm run clean
```


