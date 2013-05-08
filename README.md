# Blabber
This is a "twitter" like clone for [Ruby Weekend 4](http://rubyweekend.com)

## Checking requirements
from the console

```text
ruby -v
  ruby 1.9.3p392 (2013-02-22 revision 39386) [x86_64-darwin12.3.0]
rails -v
  Rails 3.2.13
```

## Creating the app
from the console

```text
rails new blabber
cd blabber
```

## Booting Rails
from the console
```text
rails server
```

from the browser
```text
localhost:3000
```
** kill the server with `control + c` **

## Our first home page
from the code editor
1. delete `public/index.html`
from the console
2. `rails generate controller site index`
from the code editor
3. open `config/routes.rb`
  a. delete the line with `get "site/index"`
  b. add the line `root :to => 'site#index'`
from the console
4. `rails server`
from the browser
5. `localhost:3000`

## Editing a page
from the code editor
1. open `app/views/site/index.html.erb`
2. change `Site#index` to `Welcome to Blabber`
from the browser
3. refresh the page
from the code editor
4. open `app/views/layouts/application.html.erb`
5. add the line `<h1>Top Nav</h1>` above the `yield`
6. add the line `<h6>Footer</h6>` below the `yield`
from the browser
7. refresh the page

## Taste of ERB
from the code editor
1. open `app/views/site/index.html.erb`
2. add the line `<%= Time.now %>`
from the browser
3. refresh the page (over and over)
from the code editor
4. add the line `<p><%= 1 + 1 %></p>`
from the browser
5. refresh the page
from the code editor
6. add the line `<% 'HELLO?' %>`
from the browser
7. refresh the page

## Creating a new page
from the code editor
1. open `app/controllers/site_controller.rb`
2. add the code:
```ruby
def about
end
```
3. add a new file `app/views/site/about.html.erb`
4. add the line `<h1>About Blabber</h1>`
5. open the file `config/routes.rb`
6. add the line `get '/about' => 'site#about'`
from the browser
7. go to `localhost:3000/about`

## Linking Pages


## Playing with the controller

## Our First model

## Welcome to the console

## Adding a migration

## Displaying our data

## Controllers and models and views

## Make it pretty (not really)

## Add some gems to make it pretty for real
