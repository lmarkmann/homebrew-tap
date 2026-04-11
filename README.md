# homebrew-tap

Homebrew tap for [lmarkmann/celsius](https://github.com/lmarkmann/celsius).

```sh
brew install lmarkmann/tap/celsius
```

Formulae here are built from source via `cargo install`. Version bumps after
v0.1.0 are automated by the `release.yml` workflow in the celsius repo, which
runs `mislav/bump-homebrew-formula-action` on every `v*` tag push.
