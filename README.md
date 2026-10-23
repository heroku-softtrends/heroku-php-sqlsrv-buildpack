# Steps to be followed for installing Microsoft ODBC Driver v17, v18 For PHP For Sql Server on Ubuntu 20.04, 22.04, 24.04, 26.04

## How to use these Modules
The code samples are available [here](https://github.com/microsoft/msphpsql/blob/master/sample)

## SQLSRV and PDO_SQLSRV drivers
- v5.10.0 supports PHP ^7.4.0 to ~8.1.0 — Ubuntu 20.04 (heroku-20)
- v5.11.1 supports PHP ~8.1.0 to ~8.2.0 — Ubuntu 22.04 (heroku-22)
- v5.13.3 supports PHP ~8.3.0 to ~8.5.0 — Ubuntu 24.04 (heroku-24) and Ubuntu 26.04 (heroku-26, PHP 8.4/8.5 only — see note below)

## Add Aptfile File
Aptfile file is mandatory. Create a file called `Aptfile` in your project root folder, then copy its content from one of these (pick the one matching your driver/Ubuntu version), or download it directly:
- [v5.10.0](https://github.com/heroku-softtrends/mssql-server-drivers-for-php/blob/main/5.10.0/ubuntu/20.04/msodbcsql18/Aptfile)
- [v5.11.1](https://github.com/heroku-softtrends/mssql-server-drivers-for-php/blob/main/5.11.1/ubuntu/22.04/msodbcsql18/Aptfile)
- [v5.13.3 / Ubuntu 24.04](https://github.com/heroku-softtrends/mssql-server-drivers-for-php/blob/main/5.13.3/ubuntu/24.04/msodbcsql18/Aptfile)
- [v5.13.3 / Ubuntu 26.04](https://github.com/heroku-softtrends/mssql-server-drivers-for-php/blob/main/5.13.3/ubuntu/26.04/msodbcsql18/Aptfile) (msodbcsql18 only — see note below)

## Add Environment Variable For Extension Repositories
It must be set,

#### 5.13.3 for PHP Driver for SQL Server
- Ubuntu 24.04
  - PHP 8.3
  ```
  $ heroku config:set HEROKU_PHP_PLATFORM_REPOSITORIES="https://github.com/heroku-softtrends/mssql-server-drivers-for-php/raw/main/5.13.3/ubuntu/24.04/php/8.3/nts/packages.json" -a <heroku_app_name>
  ```
  - PHP 8.4
  ```
  $ heroku config:set HEROKU_PHP_PLATFORM_REPOSITORIES="https://github.com/heroku-softtrends/mssql-server-drivers-for-php/raw/main/5.13.3/ubuntu/24.04/php/8.4/nts/packages.json" -a <heroku_app_name>
  ```
  - PHP 8.5
  ```
  $ heroku config:set HEROKU_PHP_PLATFORM_REPOSITORIES="https://github.com/heroku-softtrends/mssql-server-drivers-for-php/raw/main/5.13.3/ubuntu/24.04/php/8.5/nts/packages.json" -a <heroku_app_name>
  ```
- Ubuntu 26.04
  - PHP 8.4
  ```
  $ heroku config:set HEROKU_PHP_PLATFORM_REPOSITORIES="https://github.com/heroku-softtrends/mssql-server-drivers-for-php/raw/main/5.13.3/ubuntu/26.04/php/8.4/nts/packages.json" -a <heroku_app_name>
  ```
  - PHP 8.5
  ```
  $ heroku config:set HEROKU_PHP_PLATFORM_REPOSITORIES="https://github.com/heroku-softtrends/mssql-server-drivers-for-php/raw/main/5.13.3/ubuntu/26.04/php/8.5/nts/packages.json" -a <heroku_app_name>
  ```

#### 5.11.1 for PHP Driver for SQL Server
- Ubuntu 22.04
  - PHP 8.1
  ```
  $ heroku config:set HEROKU_PHP_PLATFORM_REPOSITORIES="https://github.com/heroku-softtrends/mssql-server-drivers-for-php/raw/main/5.11.1/ubuntu/22.04/php/8.1/nts/packages.json" -a <heroku_app_name>
  ```
  - PHP 8.2
  ```
  $ heroku config:set HEROKU_PHP_PLATFORM_REPOSITORIES="https://github.com/heroku-softtrends/mssql-server-drivers-for-php/raw/main/5.11.1/ubuntu/22.04/php/8.2/nts/packages.json" -a <heroku_app_name>
  ```

#### 5.10.0 for PHP Driver for SQL Server
- Ubuntu 20.04
  - PHP 8.1
  ```
  $ heroku config:set HEROKU_PHP_PLATFORM_REPOSITORIES="https://github.com/heroku-softtrends/mssql-server-drivers-for-php/raw/main/5.10.0/ubuntu/20.04/php/8.1/nts/packages.json" -a <heroku_app_name>
  ```
  - PHP 8.0
  ```
  $ heroku config:set HEROKU_PHP_PLATFORM_REPOSITORIES="https://github.com/heroku-softtrends/mssql-server-drivers-for-php/raw/main/5.10.0/ubuntu/20.04/php/8.0/nts/packages.json" -a <heroku_app_name>
  ```
  - PHP 7.4
  ```
  $ heroku config:set HEROKU_PHP_PLATFORM_REPOSITORIES="https://github.com/heroku-softtrends/mssql-server-drivers-for-php/raw/main/5.10.0/ubuntu/20.04/php/7.4/nts/packages.json" -a <heroku_app_name>
  ```

## Update your composer.json file
Add required dependencies(SQLSRV and PDO_SQLSRV drivers) to composer.json file

#### Drivers 5.13.3
- PHP 8.3
```
{
  "require": {
    "php": "~8.3.0",
    "ext-sqlsrv": "^5.13",
    "ext-pdo_sqlsrv": "^5.13"
  }
}
```
- PHP 8.4
```
{
  "require": {
    "php": "~8.4.0",
    "ext-sqlsrv": "^5.13",
    "ext-pdo_sqlsrv": "^5.13"
  }
}
```
- PHP 8.5
```
{
  "require": {
    "php": "~8.5.0",
    "ext-sqlsrv": "^5.13",
    "ext-pdo_sqlsrv": "^5.13"
  }
}
```

#### Drivers 5.11.1
- PHP 8.1
```
{
  "require": {
    "php": "~8.1.0",
    "ext-sqlsrv": "^5.11",
    "ext-pdo_sqlsrv": "^5.11"
  }
}
```
- PHP 8.2
```
{
  "require": {
    "php": "~8.2.0",
    "ext-sqlsrv": "^5.11",
    "ext-pdo_sqlsrv": "^5.11"
  }
}
```

#### Drivers 5.10.0
- PHP 8.1
```
{
  "require": {
    "php": "~8.1.0",
    "ext-sqlsrv": "^5.10",
    "ext-pdo_sqlsrv": "^5.10"
  }
}
```
- PHP 8.0
```
{
  "require": {
    "php": "~8.0.0",
    "ext-sqlsrv": "^5.10",
    "ext-pdo_sqlsrv": "^5.10"
  }
}
```
- PHP 7.4
```
{
  "require": {
    "php": "~7.4.0",
    "ext-sqlsrv": "^5.10",
    "ext-pdo_sqlsrv": "^5.10"
  }
}
```

After adding new dependencies to composer.json file, must be updated by running:
```
$ composer update --ignore-platform-reqs
```

Finally the `composer.lock` file will look like,

#### Drivers 5.13.3
- PHP 8.3
```
{
  "platform": {
    "php": "~8.3.0",
    "ext-sqlsrv": "^5.13",
    "ext-pdo_sqlsrv": "^5.13"
  }
}
```
- PHP 8.4
```
{
  "platform": {
    "php": "~8.4.0",
    "ext-sqlsrv": "^5.13",
    "ext-pdo_sqlsrv": "^5.13"
  }
}
```
- PHP 8.5
```
{
  "platform": {
    "php": "~8.5.0",
    "ext-sqlsrv": "^5.13",
    "ext-pdo_sqlsrv": "^5.13"
  }
}
```

#### Drivers 5.11.1
- PHP 8.1
```
{
  "platform": {
    "php": "~8.1.0",
    "ext-pdo_sqlsrv": "^5.11",
    "ext-sqlsrv": "^5.11"
  }
}
```
- PHP 8.2
```
{
  "platform": {
    "php": "~8.2.0",
    "ext-sqlsrv": "^5.11",
    "ext-pdo_sqlsrv": "^5.11"
  }
}
```

#### Drivers 5.10.0
- PHP 8.1
```
{
  "platform": {
    "php": "~8.1.0",
    "ext-pdo_sqlsrv": "^5.10",
    "ext-sqlsrv": "^5.10"
  }
}
```
- PHP 8.0
```
{
  "platform": {
    "php": "~8.0.0",
    "ext-sqlsrv": "^5.10",
    "ext-pdo_sqlsrv": "^5.10"
  }
}
```
- PHP 7.4
```
{
  "platform": {
    "php": "~7.4.0",
    "ext-sqlsrv": "^5.10",
    "ext-pdo_sqlsrv": "^5.10"
  }
}
```

## Add Buildpacks
- The first buildpack:
`https://github.com/heroku/heroku-buildpack-apt.git`
- The second buildpack:
`https://github.com/heroku/heroku-buildpack-php.git`
- The last buildpack:
`https://github.com/heroku-softtrends/heroku-php-sqlsrv-buildpack.git`

## Now deploy
```
$ git init
$ heroku git:remote -a <app_name>
$ git add --all
$ git commit -m "First commit"
$ git push heroku master
```

Set the stack explicitly if you're not using Heroku's current default (heroku-24):
```
$ heroku stack:set <heroku-20|heroku-22|heroku-24|heroku-26> -a <app_name>
```

## Finally, check that everything is working
```
$ heroku open -a <heroku_app_name>
```

## Notes on this update (scripts fixed, 24.04 + 26.04 added)

- **`bin/compile`**: now fails loudly with a clear message instead of
  silently producing an empty `MS_ODBC_VERSION` if `.apt/opt/microsoft`
  is missing (e.g. buildpack order wrong, or Aptfile didn't install
  msodbcsql). If both msodbcsql17 and msodbcsql18 end up installed at
  once, it picks the higher version deterministically; set
  `MSODBCSQL_VERSION=17` as a config var to force the other one. It also
  falls back from `lib64/` to `lib/` if a future package ever changes that
  layout, and copies `.profile.d/configure-odbc.sh` by resolving its own
  path instead of assuming a particular working directory.
- **`.profile.d/configure-odbc.sh`**: fixed a real bug — it used to glob
  `.apt/usr/lib/*` and take whatever file happened to sort first, which is
  **not necessarily the ODBC driver** once apt has also installed unixODBC
  and its dependencies into that same directory. It now globs
  `libmsodbcsql-*` specifically. It also fixes `ODBCINI`, which previously
  pointed at a **directory** (invalid — unixODBC expects `ODBCINI` to be a
  file path) instead of `odbc.ini` itself; `ODBCSYSINI` correctly stays a
  directory.
- **24.04 / 26.04 support**: the `/opt/microsoft/msodbcsql<N>/lib64/...`
  package layout these scripts rely on is the same across every Ubuntu
  version Microsoft ships `msodbcsql` for, so no stack-specific branching
  was needed in the scripts themselves — only the README's Aptfile/
  packages.json links needed the new 5.13.3 entries above.
- **26.04 caveat**: Microsoft's `msphpsql` has not announced official
  Ubuntu 26.04 support as of driver 5.13.3, and `msodbcsql17` isn't
  published for 26.04 at all — only `msodbcsql18` is. See the 26.04 notes
  in the [mssql-server-drivers-for-php README](https://github.com/heroku-softtrends/mssql-server-drivers-for-php) for the full reasoning. Treat the
  heroku-26 path here as untested until you've deploy-tested it yourself.
- None of this was deploy-tested against a live Heroku app in this pass —
  the fixes address concrete bugs found by reading the scripts (the glob
  bug and the `ODBCINI` bug above are real regardless of stack), but please
  verify a real `git push heroku` build + `heroku run php -m` /
  `heroku run php -r "var_dump(new PDO(...))"` before relying on this in
  production.

## References
[Getting started with php](https://devcenter.heroku.com/articles/getting-started-with-php?singlepage=true)

[Heroku platform dependencies installation](https://github.com/heroku/heroku-buildpack-php/blob/main/support/build/README.md#how-heroku-installs-platform-dependencies)

[Heroku php buildpack](https://github.com/heroku/heroku-buildpack-php)

[SQLSRV and PDO_SQLSRV drivers for PHP releases](https://github.com/microsoft/msphpsql/releases)

[Heroku PHP support / stack & version matrix](https://devcenter.heroku.com/articles/php-support)
