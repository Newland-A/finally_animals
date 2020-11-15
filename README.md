# Animal Associations

## Install

### Clone the repository
```shell
git clone git@github.com:Newland-A/finally_animals.git
cd into project file on local machine
```

## Check your Ruby and Rails versions
```
ruby -v
rails -v
```
### Ruby Output
The output should start with something like `ruby 2.6.1`
If not, Install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (It could take a while):
```
rbenv install 2.5.1
```
### Rails Output
The output should start with something like `Rails 6.0.3.4`
If not, Install the right rails version using rbenv (It could take a while):
```shell
gem install rails
```

## Install Dependencies
Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):
```shell
bundle && yarn
```

## Initialize the database

```shell
rails db:create 
rails db:migrate
rails db:seed
```

## Start the Rails Server
```shell
rails s
```
And now you can visit the site with the URL http://localhost:3000