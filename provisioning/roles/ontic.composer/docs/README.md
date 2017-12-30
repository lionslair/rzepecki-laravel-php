# Documentation

## Example

```
composer_home_owner: 'deployer'
composer_home_group: 'deployer'
composer_global_packages:
  - { name: 'phpunit/phpunit', release: '@stable' }
```

## Role Variables

Available variables are listed below, along with default values (see [defaults/main.yml](/defaults/main.yml)):

```
composer_path: '/usr/local/bin/composer'
```

The path where composer will be installed and available to your system. It will automatically be added
to your user's `$PATH` so you can run commands simply with `composer` instead of the full path.

```
composer_keep_updated: no
```

When set to `yes` Composer will be updated to the latest version every time the playbook is run.

```
composer_add_to_path: yes
```

When set to `yes` and there are `composer_global_packages` defined, the `vendor/bin` directory inside
`composer_home_path` will be added to the system's default ``$PATH` (for all users).

```
composer_version:
```

If defined you can install a specific release of Composer, for example `'1.0.0-alpha11'`. When omitted
the latest development version will be installed. Note that `composer_keep_updated` will override this
variable as it will always install the latest development version.

```
composer_home_path: '~/.composer'
```

The location where `composer_global_packages` will get installed.

```
composer_home_owner: 'root'
```

The user who will take directory and file ownership.

```
composer_home_group: 'root'
```

The group who will take directory and file ownership.

```
composer_global_packages:
```

A list of packages to install globally (using `composer global require`). Each package one parameter,
`name` which is the name of Composer package. . An optional parameter `release` can be specified, which
defaults to `@stable`.

```
composer_github_oauth_token:
```

GitHub OAuth token, used to avoid GitHub API rate limiting errors when building and rebuilding applications
using Composer. Follow GitHub's directions to [Create a personal access token](https://help.github.com/articles/creating-an-access-token-for-command-line-use/)
if you run into these rate limit errors.