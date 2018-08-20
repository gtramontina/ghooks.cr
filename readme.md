<h1>
    <p align=center>ghooks.cr</p>
    <p align=center><sup><sup>simple git hooks</sup></sup></p>
</h1>

**This is inspired by [ghooks-org/ghooks](https://github.com/ghooks-org/ghooks). It is also a proof of concept for a possible new major version of the javascript library.**

---

## Installation

1. Add this to your application's `shard.yml`:

```yaml
development_dependencies:
  ghooks.cr:
    github: gtramontina/ghooks.cr
    version: <version>
```

_NOTE: It is not advised to install `ghooks.cr` as a production dependency as it will install git hooks in your production environment as well. Please install it under the `development_dependencies` section of your `shard.yml`._

2. Run `shards install`;
3. Then place all your git hooks under the `.githooks/` directory. Make sure they are executable, as per the [documentation](https://git-scm.com/docs/githooks);

## How does it work?

This shard is actually just a `makefile` that does the following:

1. Backs up the existing `.git/hooks/` directory to `.git/hooks.bkp/`;
2. Creates a symbolic link between `.git/hooks/` and `.githooks/`;

That's essentially it. A couple of benefits I see over the original javascript implementation are, at this point:

1. Does not abstract the execution of the hooks too much (makes it closer to how git actually works);
2. Different branches can have a set of different hooks; this is not much of a problem with the original implementation, though;
3. I've been using this approach with makefiles and a directory to host the git hooks for non-javascript projects for a while and I'm quite satisfied with the usage;

* NOTE: still have to figure out how this would work on Windows, given we're relying on symlinks.

## License

This software is licensed under the MIT license
