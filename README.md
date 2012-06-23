# ActionAssets

**ActionAssets for assets following your structure standards**. Previously your structure ended in controllers and views. Sadly, after those, what you have is only empty CSS & javascript files. ActionAssets makes it easier to follow your standards when writing SASS/SCSS or javascript/coffeescript.

ActionAssets ads helpers which generate a tag which will contain the actual controller, the action and the template. It provides you a jquery plugin to make your javascript look nicer and provides sass mixins for your SASS/SCSS.

## Using

###Install

Just insert it to your bundle.

    gem 'action_assets'

### ERB/HAML

Put an action_assets_tag in your layout

    <%= action_asset_tag do %>
      <head>
        <title>ActionAssets is cool</title>
      </head>
      <body>
      </body
    <% end %>

or preferably in HAML

    = action_asset_tag do
      %head
        %title ActionAssets is cool
      %body

If you want to use it on another tag, you can put it to body of course.

    %html
      %head
        %title ActionAssets is cool
      = action_asset_tag :body do
        %p It works!

And also to a div. In the case of using div, don't forget to add an id, because it makes it faster for the browser to find it.

    = action_asset_tag :div, id: :wrapper do
      %p It works!

If you want to use purely HAML tags, you can!

    %div#wrapper{action_assets_attributes}

### CoffeeScript/Javascript

Include the jquery plugin in your application.js

    //= require action_assets

Initialize it, create a file, let's say action_assets_init.js.coffee

    $(document).ready ->
      $('html').actionAssetsTag()

Or if you want to use a div with an id

    $(document).ready ->
      $('div#wrapper').actionAssetsTag()

And now, let's say you have a posts_controller.rb with a posts.js.coffee

    class @PostsScript
      index: ->
        alert 'Hi there!'
      new: ->
        alert 'New post... I see...'

**That's it.** Everytime you load the page with this controller and action, it just works.

### SASS/SCSS

Include mixins for SASS/SCSS

    @import 'action_assets'

You probably have a posts.css.scss

    html {
      @include controller('posts') {
        @include action('index') {
          body {
            background-color: blue;
          }
        }
        
        @include action(('new', 'edit', 'show')) {
          body {
            background-color: green;
          }
        }
        
        @include action(('create', 'update')) {
          body {
            background-color: red;
          }
        }
      }
    }

or a post.css.sass file

    html
      + controller('posts')
        + action('index')
          body
            background-color: blue
        + action(('new', 'edit', 'show'))
          body
            background-color: green
        + action(('create', 'update'))
          body
            background-color: red

As you can see you can apply the same rules for several action, you just need to wrap the action names in brackets (create an array), the same works for controllers and layouts.

For a layout you can just use

    html
      + layout('layouts/application')
        ...

#### Important note
**You should only use it for controller, action specific presentation** or you'll end up with bloated css code, store your general selectors in an other file or just don't nest it under these selectors. Make sure that **you don't nest your selectors deeper than 4 levels**, because that could cause some performance degradation.