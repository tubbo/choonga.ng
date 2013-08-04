# choonga.ng

A bookmark-sharing and discussion site for music and music-related
links. Organized into a series of tags, the links on choonga.ng are
specifically geared towards actual pieces of music for listening.

If you're reading this, you probably have some interest in the code, or
you wish to submit some kind of issue. Check out the "Issues" link on
the right if you wish to submit a bug report. Otherwise, read on!

## Object Model

- Links are simply URLs with titles, posted by users. They are automatically previewable with a number of
  pre-defined "engines". For sites like Soundcloud, Spotify and Youtube,
  to name a few, the links will open in a preview pane for instant
  listening capability.
- Comments can be posted to links by other users, and use Markdown as a
  basic formatting language.
- Tags categorize the links into various genres for easy browsing and
  subscribing.

## Setup

You can get choonga.ng running on your own machine in two different ways

### Automatic

It's probably best if you develop on the same platform that choonga.ng
is running on, which is an Ubuntu 12 VM. We've provided Chef scripts and
a Vagrantfile, so you should just need to run `vagrant up` to
get things going!

### Manual

Assuming you know how to install a Rails app...go ahead and `bundle` the
gem dependencies. Then, run `rake db` to set the database up. You can
now run `bundle exec foreman start` to start the Rails server.

## Built With

- [Ember.js](http://emberjs.org) for the frontend application. We used
  EmberScript and Emblem as a replacement for JavaScript and Handlebars,
  respectively, to describe the logic and markup of the frontend app. Most
  display logic has been written in this part of the app and is generally
  what most users are interacting with.
- [Ruby on Rails](http://rubyonrails.org) was used to build the JSON API
  that communicates with the database, and integrates with the frontend
  to provide stellar asset packaging tools.
- [PostgreSQL](http://postgresql.org) is the database we use for
  persistence.
