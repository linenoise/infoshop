Infoshop
========

Infoshop is a set of tools for creating and maintaining a lightweight web interface to a PDF archive.  This allows you to organize and present an archive of data over a lightweight web interface.  It is tested on Linux and Mac OS X, and might also work under Windows.

This software generates a simple folder of HTML and CSS files build around your content for you to upload to a server.  There are no databases, javascripts, PHP files, CGI requirements, or encryption assumptions.  Infoshop will index and present your data, and includes a few routines to help you publish it.  That's it--the rest is up to you.


Setup
-----

To generate your bundle, you'll need to have a few things installed first.  Infoshop runs on [Ruby](http://www.ruby-lang.org/) and [nanoc](http://nanoc.stoneship.org/), using bundler to manage the other resources it needs, and [ImageMagick](http://www.imagemagick.org/) to create tumbnails.  Having [Ruby Version Manager](https://rvm.beginrescueend.com/) installed will be helpful, but not wholly necessary.

You'll want to open your Terminal window and `cd` into the directory where you copied these files.  If you're using RVM, you'll want to make sure you have Ruby 1.9.2 installed first:

	$ rvm install ruby-1.9.2-p180

If you're not using RVM, you'll want to make sure you're on Ruby version 1.9.2 using your package manager of choice.  Next, install Bundler and the rest of the gemset:

	$ gem install bundler
	$ bundle install

At this point, you're ready to make changes.


Maintenance
-----------

In order to make changes to what's already here, you'll need to spin up the autocompiler:

	$ nanoc autocompile

This will watch the `content` and `layout` folders for any changes, build the output on the fly, making them available through a webserver. Point your browser of choice at http://localhost:3000/ to see your changes as you make them.  You'll still want to press F5 or click reload in the browser after each change you make to a content or layout file.

**YAML**

...

**topics**

...

**support**

...

**languages**

...


Deployment
----------

There are a number of mechanisms available for deployment.  First, you'll want to create a full build of your site:

	$ nanoc compile -f

Once infoshop has your site ready in the `output` directory, you can do whatever you like with it.  Generally, you'll upload it to a server via SCP, SFTP, or rsync.  Additionaly, you may publish it to freenet if you have the software installed.  If you're unsure, you probably want SFTP.

**SFTP**

...

**SCP**

...

**rsync**

	$ rake deploy:rsync

**freenet**

...


TODO
----

* Find in project "Lorem Ipsum".  Fill in appropriate content.
* Find in project "idtrail".  Fill in appropriate content.
* Fill in maintenance documentation.
* Fill in deployment documentation.
* Make the language bar behave properly
* Remove PDF Metadata http://www.marshalgraham.com/2011/04/removing-pdf-metadata-with-pdf-toolkit.html
* Remove scripts from PDFs http://blog.didierstevens.com/programs/pdf-tools/
* Integrate PDFTK as a dependency http://www.pdflabs.com/docs/install-pdftk/
* Integrate zip package support (YAML declaration?)
* Download buttons should be bigger and friendlier

TODO in V.2:

* Add Ogg Vorbis support
* Add Ogg Theora support
* Add support for JPEG, GIF, and PNG files
* Add support for ASCII Text files
* Add deploy route for Freenet
* Have collect.rake check contents of existing zip files before recreating (needs a good zip gem)
