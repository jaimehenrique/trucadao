# README
**Steps required to run the application**
## Ruby version
    Ruby 2.3.4
## Rails version
    Rails 4.2.5
## System dependencies
* ImageMagick (https://www.imagemagick.org)
```
sudo apt-get update
sudo apt-get install imagemagick libmagickwand-dev
```
* Graphviz (https://www.graphviz.org) - _Only for deployment_
```
sudo apt-get update
sudo apt-get install graphviz
```
## Task dev:setup
Running this task will drop, create, migrate and seed the database
   
    rake dev:setup
    
## Default users
**Admin**
 
    email: admin@admin.com
    senha: 123456
**Member**

    email: membro@membro.com
    senha: 123456

## Admin area 

    localhost:3000/backoffice