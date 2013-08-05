# choonga.ng

A bookmark-sharing and discussion site for music and music-related
links. Organized into a series of tags, the links on choonga.ng are
specifically geared towards actual pieces of music for listening.

If you're reading this, you probably have some interest in the code, or
you wish to submit some kind of issue. Check out the "Issues" link on
the right if you wish to submit a bug report. Otherwise, read on!

## Object Model

- **Links** are simply URLs with titles, posted by users. They are automatically previewable with a number of
  pre-defined "engines". For sites like Soundcloud, Spotify and Youtube,
  to name a few, the links will open in a preview pane for instant
  listening capability.
- **Comments** can be posted to links by other users, and use Markdown as a
  basic formatting language.
- **Tags** categorize the links into various genres for easy browsing and
  subscribing.
- **Services** are not configurable, they are automatically discovered
  based on the URL of the Link. They are attached to links and responsible
  for providing the preview engines that allow for viewability directly on
  the site.
- Finally, **Users** are simple authentication models that allow the
  users of the site to be identified with the application. Users can
  comment on, vote on and post links.

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
submitted in the form of a Git or GitHub pull request. This project is
open source and governed by the terms of the license below:

### License

    The MIT License (MIT)

    Copyright (c) 2013 Tom Scott

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
