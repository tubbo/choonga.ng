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

This is assuming you know what goes into installing a Rails app..

Download gem dependencies:

```bash
$ bundle install
```

Set up the database:

```bash
$ rake db
```

Add content to the database from YAML configuration:

```bash
$ rake content
```

The one-time setup of the database is complete!

You can now run the following to start the server:

```bash
$ foreman start
```

## Contributing

All contributions are welcome, provided they include tests and are
submitted in the form of a Git or GitHub pull request.
