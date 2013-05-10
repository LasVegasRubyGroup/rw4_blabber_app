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
_from the console_

```text
rails new blabber
cd blabber
```

## Booting Rails
_from the console_
```text
rails server
```

_from the browser_
```text
localhost:3000
```
**kill the server with `control + c`**

## Our first home page
_from the code editor_
- delete `public/index.html`.
_from the console_
- `rails generate controller site index`.
_from the code editor_
- open `config/routes.rb`.
  - a. delete the line with `get "site/index"`
  - b. add the line `root :to => 'site#index'`

_from the console_
- `rails server`.
_from the browser_
- `localhost:3000`.

## Editing a page
_from the code editor_
- open `app/views/site/index.html.erb`.
- change `Site#index` to `Welcome to Blabber`.
_from the browser_
- refresh the page.
_from the code editor_
- open `app/views/layouts/application.html.erb`.
- add the line `<h1>Top Nav</h1>` above the `yield`.
- add the line `<h6>Footer</h6>` below the `yield`.
_from the browser_
- refresh the page.

## Taste of ERB
_from the code editor_
- open `app/views/site/index.html.erb`.
- add the line `<%= Time.now %>`.
_from the browser_
- refresh the page (over and over).
_from the code editor_
- add the line `<p><%= 1 + 1 %></p>`.
_from the browser_
- refresh the page.
_from the code editor_
- add the line `<% 'HELLO?' %>`.
_from the browser_
- refresh the page.

## Creating a new page
_from the code editor_
- open `app/controllers/site_controller.rb`.
- add the code:
```ruby
def about
end
```

- add a new file `app/views/site/about.html.erb`.
- add the line `<h1>About Blabber</h1>`.
- open the file `config/routes.rb`.
- add the line `get '/about' => 'site#about'`.
_from the browser_
- go to `localhost:3000/about`.

## Linking Pages
_from the code editor_
- open `app/views/site/about.html.erb`.
- add the code:
```ruby
<%= link_to('Go Back Home', root_path) %>
```

- open `app/views/site/index.html.erb`
- add the code:
```ruby
<%= link_to('About Us', about_path) %>
```

_from the browser_
- refresh the page


## Playing with the controller
_from the code editor_
- open `app/controllers/site_controller.rb`.
- inside of the `index` method add the code:
```ruby
@foods = ['pizza', 'burger', 'burrito', 'cat']
```

- **note: yes, I really mean add cat in there**
- open `app/views/site/index.html.erb`
- add the code:
```ruby
<% @foods.each do |food| %>
  <p>Eating <%= food %> is yummy!</p>
<% end %>
```

_from the browser_
- refresh the page
_from the code editor_
- open `app/views/site/index.html.erb`.
- fix the code:
```ruby
<% @foods.each do |food| %>
  <% if food == 'cat' %>
    <p>Wait, <%= food %> is not a food..</p>
  <% else %>
    <p>Eating <%= food %> is yummy!</p>
  <% end %>
<% end %>
```

## Our First model "the blab"
_from the console_
- stop the server `control + c`
- tell rails to generate a new model
  - `rails generate model blab`
_from the code editor_
- open `db/migrate/##############_create_blabs.rb`
- add the code:
```ruby
t.string :text
```

_from the console_
- run `rake db:migrate`

## Welcome to the console
_from the console_
- run `rails console`
```ruby
Blab
#=> Blab(id: integer, text: string, created_at: datetime, updated_at: datetime)
Blab.count
#=> 0
Blab.first
#=> nil
my_first_blab = Blab.new
#=> #<Blab id: nil, text: nil, created_at: nil, updated_at: nil>
my_first_blab.text = "BLABBING AWAY!!!"
#=> "BLABBING AWAY!!!"
my_first_blab.save
#=> true
```

- create a second blab
  - What is the id of the second blab?
  - What is the total count of blabs in the database?
  - What is the id of `Blab.first`?

**Done? type `exit`**

## Displaying our data
_from the code editor_
- open `app/controllers/site_controller.rb`
- add the code:
```ruby
@blabs = Blab.all
```
- open `app/views/site/index.html.erb`
- add the code:
```rails
<% @blabs.each do |blab| %>
  <p>I said <%= blab.text %> at <%= blab.created_at %></p>
<% end %>
```

## Adding a migration

## Controllers and models and views

## Make it pretty (not really)

## Add some gems to make it pretty for real

## Heroku and git

## Deploying the app

## User signup

## Favorite a blab

## Tag a blab

## Another Deploy

## Resources
Congrats! You've built a rails app. Now it's time to go re-learn what you just did.
Here are some links to help you get started
- http://meetup.lvrug.org/
- http://www.codecademy.com/tracks/ruby
- http://www.codeschool.com/paths/ruby
- http://www.codeschool.com/courses/ruby-bits
- http://railsforzombies.org/
- http://jumpstartlab.com/courses
- http://railscasts.com/
- http://ruby.railstutorial.org/
- http://railsbest.com/