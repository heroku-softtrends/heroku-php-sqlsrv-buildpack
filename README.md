# Steps to be followed for installing Microsoft ODBC Driver v17, v18 For PHP For Sql Server on Ubuntu 20.04

## How to use these Modules
The code samples are available [here](https://github.com/microsoft/msphpsql/blob/master/sample)

## SQLSRV and PDO_SQLSRV drivers
- v5.9.0 supports PHP ^7.4.0 to ~8.0.0
- v5.10.0 supports PHP ^7.4.0 to ~8.1.0

## Add Aptfile File
Aptfile file is mandatory, create a file called Aptfile in your project root folder and 
- copy the content from [v5.9.0](https://github.com/heroku-softtrends/mssql-server-drivers-for-php/blob/main/5.9.0/ubuntu/20.04/Aptfile) or download the file from [v5.9.0](https://github.com/heroku-softtrends/mssql-server-drivers-for-php/blob/main/5.9.0/ubuntu/20.04/Aptfile)
- copy the content from [v5.10.0](https://github.com/heroku-softtrends/mssql-server-drivers-for-php/blob/main/5.10.0/ubuntu/20.04/msodbcsql18/Aptfile) or download the file from [v5.10.0](https://github.com/heroku-softtrends/mssql-server-drivers-for-php/blob/main/5.10.0/ubuntu/20.04/msodbcsql18/Aptfile)

to your project root folder.

## Add Environment Variable For Extension Repositories
It must be set,

PHP 8.1

`heroku config:set HEROKU_PHP_PLATFORM_REPOSITORIES="https://github.com/heroku-softtrends/mssql-server-drivers-for-php/raw/main/5.10.0/ubuntu/20.04/php/8.1/nts/packages.json" -a <heroku_app_name>`

PHP 8.0

`heroku config:set HEROKU_PHP_PLATFORM_REPOSITORIES="https://github.com/heroku-softtrends/mssql-server-drivers-for-php/raw/main/5.9.0/ubuntu/20.04/php/8.0/nts/packages.json" -a <heroku_app_name>`

PHP 7.4

`heroku config:set HEROKU_PHP_PLATFORM_REPOSITORIES="https://github.com/heroku-softtrends/mssql-server-drivers-for-php/raw/main/5.9.0/ubuntu/20.04/php/7.4/nts/packages.json" -a <heroku_app_name>`
  
## Update your composer.json file
Add required dependencies to composer.json file

PHP 8.1

    {
        "require": {
          "php": "~8.1.0",
          "ext-sqlsrv": "^5.10",
          "ext-pdo_sqlsrv": "^5.10"
        }
    }
    
PHP 8.0

    {
        "require": {
          "php": "~8.0.0",
          "ext-sqlsrv": "^5.9",
          "ext-pdo_sqlsrv": "^5.9"
        }
    }
    
PHP 7.4

    {
        "require": {
          "php": "~7.4.0",
          "ext-sqlsrv": "^5.9",
          "ext-pdo_sqlsrv": "^5.9"
        }
    }

After adding new dependencies to composer.json file, must be updated by running:
```
$ composer update --ignore-platform-reqs
```

Finally the `composer.lock` file will look like,

PHP 8.1

    {
      "platform": {
        "php": "~8.1.0",
        "ext-pdo_sqlsrv": "^5.10",
        "ext-sqlsrv": "^5.10"
       }
    }

PHP 8.0

    {
      "platform": {
        "php": "~8.0.0",
        "ext-sqlsrv": "^5.9",
        "ext-pdo_sqlsrv": "^5.9"
      }
    }
    
PHP 7.4

    {
      "platform": {
        "php": "~7.4.0",
        "ext-sqlsrv": "^5.9",
        "ext-pdo_sqlsrv": "^5.9"
      }
    }
  
## Add Buildpacks
- The first buildpak:
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

## Finally, check that everything is working
```
$ heroku open -a <heroku_app_name>
```

## References
[Getting started with php](https://devcenter.heroku.com/articles/getting-started-with-php?singlepage=true)

[Heroku platform dependencies installation](https://github.com/heroku/heroku-buildpack-php/blob/main/support/build/README.md#how-heroku-installs-platform-dependencies)

[Heroku php buildpack](https://github.com/heroku/heroku-buildpack-php)
