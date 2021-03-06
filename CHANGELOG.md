# Changelog

## Unplanned

- [ ] jRuby support https://spin.atomicobject.com/2013/04/24/bundler-jruby-complete/
- [ ] Consider shipping all of Lanyon inside a Docker container
- [ ] Utilize `passthru` more (vs `spawnSync`)
- [ ] Add `travis` to Gemfile, and run it from our local shims vs from global during `lanyon encrypt`
- [ ] Add image optimizer from `assets/images` -> `assets/build/images`
- [ ] Brush up terminal output (less verbose jekyll etc, instruct the user to "please wait on browsersync->webpack, assets will automatically load")
- [ ] Throw an error if we find legacy Jekyll residue such as `./vendors` or `.bundle`
- [ ] Maybe add https://github.com/btford/write-good
- [ ] Consider https://www.npmjs.com/package/webpack-svgstore-plugin
- [ ] Consider postcss
- [ ] Hooks are ran with every build, but not when doing HMR. We might be able to write a `CallHooksPlugin` to work around this that calls the hook for assets, while lib/cli.js calls it for content
- [ ] Consider sourcemaps like https://github.com/rstacruz/webpack-tricks#source-maps
- [ ] Consider bundlesize tracking on cli like https://github.com/rstacruz/webpack-tricks#investigating-bundle-sizes
- [ ] Fix bug: Lanyon is lying about being symlinked: `Booting symlinked lanyon v0.0.47` when this is not the case
- [ ] Consider distributing the Gem lockfile so new installs don't get bumped to incompatible versions like what happened with nokogiri gracefully upgrading from 1.6->1.7 but then requiring ruby 2.0->2.1 wich isn't present on OSX, hence requiring a full 3rd party ruby install that could easily have been avoided
- [ ] Add a real command line parser for `lib/cli.js` like minimist
- [ ] Once jemoji relies on `gemoji` 3.0+ (vs ~2.0),  add cli command to generate emoji into `assets/images/emoji` (`build:emoji` calling bundle exec gemoji extract assets/images/emoji) 
- [ ] Wait on https://github.com/imagemin/imagemin-cli/pull/11 and https://github.com/imagemin/imagemin/issues/226 and add image building
- [ ] Windows support. See #1 - See also https://github.com/avajs/ava/blob/master/appveyor.yml

## v0.0.51

Released: TBA.

- [x] Remove underscore version from libxml2 on brew osx prefix as `/usr/local/Cellar/libxml2/2.9.4` exists but advertised `/usr/local/Cellar/libxml2/2.9.4_2` does not
- [x] Add `container:rebuild` to rebuild a container from scratc (`docker build --no-cache`)

## v0.0.50

Released: 2017-01-06.

[Diff](https://github.com/kvz/lanyon/compare/v0.0.49...v0.0.50).

- [x] Add pkg-config to resolve another Another Nokogiri error https://travis-ci.org/kvz/lanyon/jobs/193744753#L418
- [x] Skip installs if `LANYON_NOINSTALL==1`
- [x] Switch to ES6 (see https://github.com/transloadit/botty/blob/738f9d51417d84d429cd4b558898bc3a9826cd9d/decaf.sh), mostly to profit from template strings. Transpile down to ES5 for npm as Lanyon aims for portability.

## v0.0.49

Released: 2017-01-06.

[Diff](https://github.com/kvz/lanyon/compare/v0.0.48...v0.0.49).

- [x] Add experimental support for optimizing images via `build:images` (from `assets/images` to `assets/build/images`)
- [x] Build docker container inside `.lanyon` dir. Write config from `utils` like any other config, vs copying over files (allows for intelligent cache invalidation later on also)
- [x] Do not use docker cache so we get a fresh Gemfile. Fixes https://travis-ci.org/kvz/lanyon/jobs/188882616#L1530
- [x] Add `container:connect` command to look inside docker container
- [x] Give Lanyon Jekyll :gem: theme awareness

## v0.0.48

Released: 2017-01-04.

[Diff](https://github.com/kvz/lanyon/compare/v0.0.47...v0.0.48).

- [x] Upgrade to github pages gem version `v104` -> `v112` (https://github.com/github/pages-gem/compare/v104...v112)
- [x] Provide access to gemlist of gh pages gem for internal use via `./lib/cli.js list:ghpgems`
- [x] Avoid new installs preferring nokogiri 1.7 over 1.6 so more systems can use Ruby 2.0 vs then nokogiri 1.7 required 2.1
- [x] Also initProject at `start` so that config can be written if users type start as a first run
- [x] Add a website <http://lanyon.io>
- [x] First go into projectDir before running deploy, to support nested websites

## v0.0.47

[Diff](https://github.com/kvz/lanyon/compare/v0.0.46...v0.0.47).

- [x] Basic support for injecters via `contentIgnore` and `contentScandir`

## v0.0.46

[Diff](https://github.com/kvz/lanyon/compare/v0.0.45...v0.0.46).

- [x] Add support for `OptimizeCssAssetsPlugin`

## v0.0.45

[Diff](https://github.com/kvz/lanyon/compare/v0.0.44...v0.0.45).

- [x] Support for a `js-untouched` directory, where js won't pass through babel

## v0.0.44

[Diff](https://github.com/kvz/lanyon/compare/v0.0.43...v0.0.44).

- [x] Fix babel source maps
- [x] Only exit on error when in production mode`

## v0.0.43

[Diff](https://github.com/kvz/lanyon/compare/v0.0.42...v0.0.43).

- [x] Use Babel ES2015 as shipped by Lanyon, ignoring any project's `.babelrc` (BREAKING) (We _might_ support sth more intelligent in the future, but for now are favoring convention & near-zero-setup by the project)
- [x] "Don't use JSX loader, use babel instead" - https://github.com/petehunt/jsx-loader
- [x] Fix bug: test: could not interpret expression

## v0.0.42

[Diff](https://github.com/kvz/lanyon/compare/v0.0.41...v0.0.42).

- [x] Ditch uglify loader in favor of plugin, as the loader cannot handle ES6 (even though the babel loader is ran first)

## v0.0.41

[Diff](https://github.com/kvz/lanyon/compare/v0.0.40...v0.0.41).

- [x] Fix bug where only incremental builds receive asset indices
- [x] Only reset `jekyll.lanyon_assets.yml` if it does not exist

## v0.0.40

[Diff](https://github.com/kvz/lanyon/compare/v0.0.39...v0.0.40).

- [x] Add globby as a dependency

## v0.0.39

[Diff](https://github.com/kvz/lanyon/compare/v0.0.38...v0.0.39).

- [x] Fix deploy failsafe

## v0.0.38

[Diff](https://github.com/kvz/lanyon/compare/v0.0.37...v0.0.38).

- [x] No longer exclude `node_modules|bower_components|vendor` by default
- [x] Disable resolve-url-loader for less as less currently produces invalid css (in its eyes)
- [x] Make errors fatal in production
- [x] Include plain css with ExtractTextPlugin

## v0.0.37

[Diff](https://github.com/kvz/lanyon/compare/v0.0.36...v0.0.37).

- [x] Make Deploy check aware of hashed cachebuster assets
- [x] Fix less resolve-url-loader sourcemap issues

## v0.0.36

[Diff](https://github.com/kvz/lanyon/compare/v0.0.35...v0.0.36).

- [x] Move uglify loader to deps (vs devDeps)

## v0.0.35

[Diff](https://github.com/kvz/lanyon/compare/v0.0.34...v0.0.35).

- [x] Build assets first, so that Jekyll can copy it into `_site`, and also `jekyll.lanyon_assets.yml` exists in time
- [x] Add debugging notes
- [x] Add uglify as a dependency

## v0.0.34

[Diff](https://github.com/kvz/lanyon/compare/v0.0.33...v0.0.34).

- [x] More optimization for production builds
- [x] Fix svgeezy (which works with a local `svgeezy` var, not one on `window`)
- [x] Enable vizualizer support by default, writing to `assets/build/stats.html`, unless you set `lanyon.statistics` to `false` in your `package.json` 
- [x] Add support for long-term caching, and cache busting
- [x] Add vizualizer by definining `lanyon.statistics: "webpack-statistics.html"` in your `package.json`. Directory is fixed to build dir, and this does not work in `development`/HMR mode
- [x] Add support for shared code-splitted bundles by defining `lanyon.common` in your `package.json`
- [x] Add jquery to bower components
- [x] Fix coffee loader
- [x] Add resolve-url-loader so e.g. mediaplayer & select2 can find their relative assets such as `./select2.png` or `./controls.png`
- [x] Allow asset loaders to load from `bower_components`
- [x] Allow bower installed bootstrap-sass to use `window` and `jQuery`
- [x] Offer a lodash `_` plugin
- [x] Reset (a possibly corrupted) `records.json`
- [x] Fix: `Module not found: Error: Cannot resolve module 'fs'` by adding  `node: { fs: 'empty' }, target: 'node'` to webpack config
- [x] Support `prebuild*` hooks being arrays
- [x] Fix bad Git ignores
- [x] Revert plain css files to extract text plugin

## v0.0.33 (bad build)

[Diff](https://github.com/kvz/lanyon/compare/v0.0.32...v0.0.33).

- [x] Add plain css files to extract text plugin /thx @Acconut

## v0.0.32

[Diff](https://github.com/kvz/lanyon/compare/v0.0.31...v0.0.32).

- [x] Allow relative projectDir

## v0.0.31

[Diff](https://github.com/kvz/lanyon/compare/v0.0.30...v0.0.31).

- [x] Allow scanning from `LANYON_PROJECT`

## v0.0.30

[Diff](https://github.com/kvz/lanyon/compare/v0.0.29...v0.0.30).

- [x] Never settle for `lanyon` as a projectDir

## v0.0.29

[Diff](https://github.com/kvz/lanyon/compare/v0.0.28...v0.0.29).

- [x] Do `realpathSync` relative from `gitRoot`

## v0.0.28

[Diff](https://github.com/kvz/lanyon/compare/v0.0.27...v0.0.28).

- [x] Fix bad build

## v0.0.27

[Diff](https://github.com/kvz/lanyon/compare/v0.0.26...v0.0.27).

- [x] Added `utils.upwardDirContaining` for definitive pathfinding

## v0.0.26

[Diff](https://github.com/kvz/lanyon/compare/v0.0.25...v0.0.26).

- [x] Use `find-up` for finding `gitRoot` and `npmRoot`, which might not be `projectDir`
- [x] Also support `web:deploy` npm script name

## v0.0.25

[Diff](https://github.com/kvz/lanyon/compare/v0.0.24...v0.0.25).

- [x] Also traverse upwards from projectDir to find `node_modules`

## v0.0.24

[Diff](https://github.com/kvz/lanyon/compare/v0.0.23...v0.0.24).

- [x] Better module pathfinding

## v0.0.23

[Diff](https://github.com/kvz/lanyon/compare/v0.0.22...v0.0.23).

- [x] Use `gitRoot` instead of `projectDir` for flat module finding, so it works when your project is in a subdir (like `website` or `docs`)

## v0.0.22

[Diff](https://github.com/kvz/lanyon/compare/v0.0.21...v0.0.22).

- [x] Support for flat module structure where modules live in `projectDir`

## v0.0.21

[Diff](https://github.com/kvz/lanyon/compare/v0.0.20...v0.0.21).

- [x] Deploy now supports `web:build:production`

## v0.0.20

[Diff](https://github.com/kvz/lanyon/compare/v0.0.19...v0.0.20).

- [x] Prefix deps with node

## v0.0.19

[Diff](https://github.com/kvz/lanyon/compare/v0.0.18...v0.0.19).

- [x] Fix bug leading to block postinstall resets

## v0.0.18

[Diff](https://github.com/kvz/lanyon/compare/v0.0.17...v0.0.18).

- [x] Make installs idempotent
- [x] Detect rubyProvider of existing shims
- [x] Introduce a `LANYON_RESET`, that removes all shims

## v0.0.17

[Diff](https://github.com/kvz/lanyon/compare/v0.0.16...v0.0.17).

- [x] Don't rely on `.bin` symlinks as they don't appear to survive Travis CI cache

## v0.0.16

[Diff](https://github.com/kvz/lanyon/compare/v0.0.15...v0.0.16).

- [x] Use spawn-sync for older nodes

## v0.0.15

[Diff](https://github.com/kvz/lanyon/compare/v0.0.14...v0.0.15).

- [x] Pathfinding fixes, added `gitRoot`
- [x] Rename `vendor/bin` to `bin`
- [x] Refactoring of deploy & encrypt

## v0.0.14

[Diff](https://github.com/kvz/lanyon/compare/v0.0.13...v0.0.14).

- [x] Offer `lanyon deploy` for deploying onto GitHub Pages
- [x] Offer `lanyon encrypt` for encrypting GitHub Pages deploy secrets onto Travis CI
- [x] Fix broken shim quoting

## v0.0.13

[Diff](https://github.com/kvz/lanyon/compare/v0.0.12...v0.0.13).

- [x] Avoid double installs by fixing binDir references for shims

## v0.0.12

[Diff](https://github.com/kvz/lanyon/compare/v0.0.11...v0.0.12).

- [x] Utilize Webpack `--production` flag
- [x] Add Jekyll config writer (so we can ignore `node_modules` and `.lanyon`)
- [x] By default prefer system ruby over docker, for performance reasons

## v0.0.11

[Diff](https://github.com/kvz/lanyon/compare/v0.0.10...v0.0.11).

- [x] Add support for `production`-or-`development`-only hooks
- [x] Add coffeescript support
- [x] Add less support

## v0.0.10

[Diff](https://github.com/kvz/lanyon/compare/v0.0.9...v0.0.10).

- [x] Add support for configurable projectDir (so you can have a `./website` or `./docs` in your project)
- [x] Refactoring

## v0.0.9

[Diff](https://github.com/kvz/lanyon/compare/v0.0.8...v0.0.9).

- [x] Switch to a local lanyon install if available
- [x] Simplify/fix Browserify file watching
- [x] Do docker connect via shim
- [x] Store everything in `cacheDir` (projectDir/.lanyon) instead of in node_modules dir

## v0.0.8

[Diff](https://github.com/kvz/lanyon/compare/v0.0.7...v0.0.8).

- [x] Support for prebuild hook

## v0.0.7

[Diff](https://github.com/kvz/lanyon/compare/8d2286d78ea5f0e0ad2b9f021a00158774d31891...v0.0.7).

- [x] Use textextractor loader in production for scss, also check https://github.com/gowravshekar/font-awesome-webpack#extract-text-webpack-plugin
- [x] checkout http://stackoverflow.com/questions/33649761/how-do-i-load-font-awesome-using-scss-sass-in-webpack-using-relative-paths
