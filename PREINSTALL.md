# Setup for Roots.IO Wordpress

* Install Homebrew and ensure up to date then...  
* Install Vagrant 1.8.1 from https://www.vagrantup.com/downloads.html  
* Install VirtualBox Latest from https://www.virtualbox.org/wiki/Downloads  

## Install dependencies

```shell
brew install ansible
vagrant plugin install vagrant-bindfs
vagrant plugin install vagrant-hostmanager
```

## Install Ansible Galaxy Roles

```shell
cd trellis &&  ansible-galaxy install -r requirements.yml
```

## Setup Hostmanager

```shell
vagrant hostmanager
```


## Run Vagrant up

```shell
cd trellis
vagrant up
```

## Re-provision Vagrant environment (e.g. adding Composer libs)

```shell
cd  [project-path]/trellis
vagrant provision
```

## Enabling Wordpress Features

Log into the Wordpress admin at
https://astrumeducation.dev/admin

User/PW: admin/admin

### Enable all the theme and plugins

Theme is Sage + Twig Starter Theme
Enable all the plugins
ACF, Gravity Forms., Polylang, Soil, Timber and YOAST

Go to Plugins > Polylang > Settings and create new language (en_GB)
Go to Settings > Permalinks and just click save to flush the permalink cache
Finally, go to the post and the page it creates by default and re-save them to get it to use the proper locale

### Create a style guide page

Create a new Page with title “Style Guide” and the content from here:
http://www.poormansstyleguide.com/

Then try and view it:
https://astrumeducation.dev/en/style-guide/

## LOCAL SHIT

## Install Composer

```shell
cd .
php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
php -r "if (hash('SHA384', file_get_contents('composer-setup.php')) === '7228c001f88bee97506740ef0888240bd8a760b046ee16db8f4095c0d8d525f2367663f22a46b48d072c816e7fe19959') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer
```

## Install Sage Theme with Composer (assuming not already done!)

```shell
cd [project-path]/site
composer create-project roots/sage web/app/themes/astrum-education
```

## Activate the new theme

* Visit https://astrumeducation.dev
* Accept HTTPS security warning
* Log in using admin/admin
* Go to Appearance > Themes > Sage Starter Theme > Activate


## Install local dependencies

```shell
npm install -g npm@latest
npm install -g gulp bower
cd [project root]
cd web/app/themes/astrum-education
npm install
bower install
```

## Run gulp

```shell
cd [project root]
cd web/app/themes/astrum-education
gulp watch
```

## Build assets for production/staging

```shell
cd [project root]
cd web/app/themes/astrum-education
gulp --production
```


## Deploy Staging

```shell
cd [project root]/trellis
./deploy.sh staging astrumeducation.com
```

User: admin  
Password: PZJLgH31CCr#)EGqn7z08*(#  

## Get Help

This Wordpress Install is built on pre-tested tech with good documentation

* http://roots.io  
* https://github.com/roots/trellis  
* https://github.com/roots/bedrock  
* https://github.com/studiorabota/sage-twig-theme  
* http://timber.github.io/timber/  
