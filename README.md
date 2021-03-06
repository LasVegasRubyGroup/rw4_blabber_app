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
- add the code above the `yield`:
```html
<header>
  <h1>Top Nav</h1>
</header>
```

- add the code below the `yield`:
```html
<footer>
  <h6>Footer</h6>
</footer>
```

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
```ruby
<% @blabs.each do |blab| %>
  <p>I said <%= blab.text %> at <%= blab.created_at %></p>
<% end %>
```

_from the browser_
- refresh the page

## Controllers and models and views
_from the console_
- run `rails generate controller blabs`
_from the code editor_
- open `config/routes.rb`
- add the code:
```ruby
resources :blabs
```

- open `app/controllers/blabs_controller.rb`
- add the code:
```ruby
def new
  @blab = Blab.new
end
  
def create
  @blab = Blab.new(params[:blab])
  if @blab.save
    redirect_to(root_path, notice: 'Just created a new blab')
  else
    render(:new)
  end
end
```

- add a new file `app/views/blabs/new.html.erb`
- add the code:
```ruby
<h1>Write a new blab</h1>
<%= form_for(@blab) do |f| %>
  <p><%= f.text_area(:text) %></p>
  <p><%= f.submit('Save') %></p>
<% end %>
```

_from the browser_
- go to `localhost:3000/blabs/new`
- write a blab
- fix the error
_from the code editor_
- open `app/views/models/blab.rb`
- add the code:
```ruby
attr_accessible :text
```

_from the browser_
- refresh the page

_from the code editor_
- open `app/views/site/index.html.erb`
- add a link to the form. the url helper is `new_blab_path`

## Validations
_from the code editor_
- open `app/models/blab.rb`
- add the code:
```ruby
validates :text, presence: true
```

_from the browser_
- go to `localhost:3000/blabs/new`
- submit empty form

## Helpers
_from the code editor_
- open `app/helpers/application_helper.rb`
- add the code:
```ruby
def flash_message
  unless flash.blank?
    [:notice, :error].each do |message|
      return content_tag(:div, flash[message], class: message) if flash[message].present?
    end
  end
end
```

- open `app/views/layouts/application.html.erb`
- add the code:
```ruby
<%= flash_message %>
```

- open `app/controllers/blabs_controller.rb`
- add the line `flash[:error] = 'oops!'` to the create action.

## Make it "pretty" (not really)
_from the code editor_
- open `app/assets/stylesheets/application.css`
- add the code:
```css
a {
  color: red;
  font-size: 20px;
}
header {
  border-bottom: 2px solid black;
}
footer {
  border-top: 2px solid black;
}
.notice {
  color: green;
  font-size: 20px;
}
.error {
  color: red;
  font-size: 20px;
}
```

_from the browser_
- refresh the browser

## Gems
_from the code editor_
- open `Gemfile`
- add the gem `will_paginate`, `unicorn`, `zurb-foundation`, `pg`, `heroku`
- move sqlite3 gem to development group and pg to production group

_from the console_
- run `bundle install`
- configure foundation with `rails g foundation:install`
**press y to access overwrite**

_from the browser_
- refresh the browser

_from the code editor_
- open `app/controllers/site_controller.rb`
- remove the code `@blabs = Blab.all`
- add the code:
```ruby
@blabs = Blab.paginate(page: params[:page], per_page: 5)
```

- open `app/views/site/index.html.erb`
- add the code: `<%= will_paginate @blabs %>`

## Heroku and git
- Signup at https://api.heroku.com/signup
_from the console_
- run `git init`
- run `git add .`
- run `git commit -m "Initial Commit"`

## Deploying the app
_from the console_
- run `heroku create --stack cedar`
- run `git push heroku master`
- run `heroku run rake db:migrate`

_from the browser_
- visit your site

## User signup

## Adding a migration
_from the console_
- run `rails generate migration add_fields_to_blab`
_from the code editor_
- open the new migration file
- add the code:
```ruby
add_column :blabs, :tags, :string
```

_from the console_
- run rake db:migrate

_from the code editor_
- open `app/views/blabs/new.html.erb`
- add the code:
```html
<p><%= f.text_field(:tags, placeholder: 'tags') %></p>
```

- open `app/models/blab.rb`
- update attr_accessible with `:tags`

## Another Deploy
_from the console_
- run `git add .`
- run `git commit -am "more updates"`
- run `git push heroku master`
- run `heroku run rake db:migrate`

_from the browser_
- refresh your site

## Rails Challenges

1. Create another page. Link to it from the home page, and link to the home page from it
2. Update your layout to have a new header and footer
3. Change some styles.
4. Add a "private" boolean to your blab model and database
5. deploy your changes

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