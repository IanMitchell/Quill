**Note:** This repository is out of date. I used this project to learn Ruby on Rails, and try things out that I wanted to learn. It's no longer in active development, and hasn't been updated in a while.

----

# Quill

Quill wants to be a blogging platform. At the moment, it's really just something I'm making to learn Rails. As such, there are a lot of errors and half-implemented features. I'm sure there are plenty of best-practices that I've broken as well. If you notice anything specific, please let me know! I'd love to change it.

It should be noted that Quill is still very much in development, and shouldn't be used as a live website. Hopefully we'll be able to offer a stable release soon!

### Setup

Quill doesn't work out of the box (yet!) -- there are a few things you need to do first.

Before you push your app, you need to set the default url in `config/environments/production.rb` -- right now it defaults to the main Quill website.

After that, you can push your app. Next, you need to set up an admin account

    $ rails c
    > a = Author.new
    > a.name = "John Doe"
    > a.email = "jdoe@quill.com"
    > a.password = "quill" 
    > a.google_id = 001
    > a.twitter = "handle"
    > a.save
    
Then, you need to create an initial post (this is due to a bug I'm working on fixing as fast as I can)

    > p = Post.new
    > p.title = "Hello World!"
    > p.content = "*Hello, world.*"
    > p.author_id = 1
    > p.save
    
You can add categories via the admin panel later. Finally, you'll need to define a few basic ENV variables

If you're on Heroku:

    heroku config:add PUSHER_APP_ID=0000

If you're not, create `config/application.yml` and define them there (`PUSHER_APP_ID: 0000`).

The variables Quill uses are as follows:

    # Amazon S3
    AWS_ACCESS_KEY_ID
    AWS_SECRET_ACCESS_KEY
    AWS_FOG_DIRECTORY
    
    # Google Analytics
    GOOGLE_ANALYTICS
    
    # Gmail
    GMAIL_USERNAME
    GMAIL_PASSWORD
    
    # Heroku
    HIREFIRE_EMAIL
    HIREFIRE_PASSWORD
    APP_NAME 
    
**Note:** If you don't want to use Amazon S3, remove the `config/initializers/carrierwave.rb` file and modify the uploaders. You'll need to switch back to `storage :file`

### Current Features

* Ajax Comments
* PJAX (http://pjax.heroku.com/)
* Post Categories
* Archives that sort via Date and Category
* Dynamic Header / Sidebar Page Links
* Syntax highlighting
* Markdown styled posts/pages
* Inline comment moderation
* JS form validations *(Uses Ajax)*
* Localstorage autosaving
    * Precursor to Draft Support / Auto Saving
* File upload (Amazon S3)
* Admin Bar
* Creation/Order of Header / Sidebar Links
* Google Author support
* Email options (new comment notification)
* Author Twitter handle

### Broken Features

* Twitter Integration / Caching *(Gem issue? Usually works)*

### Future Plans

* Multiple author support
* Multiple Twitter account support
* Comment credential storage
* XML-RPC server
* Tests!
* Akismet spam protection
* Thumbnail support
* Image galleries
* Image watermark
* Microdata
* IE9 pinned site support
* Blog mentions

If you'd like to help out with any of these features, let me know!

#### Current Development

Since I'm now at school, development has hit a bit of a standstill. This is still very much a project that I want to pursue however, and I'll be returning to it when I have time. I'll still be pushing updates occasionally!

#### Conclusion

If you'd like to see Quill in action, usually a current version is running here:

<http://quill.heroku.com>

------------
Ian Mitchell
