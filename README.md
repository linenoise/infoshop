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

**Data and Metadata**

All of the data to be published should be in the `content/archives` folder with appropriate metadata.  Each piece of content added to the library needs to be accompanied by a note of YAML metadata.  The filename of the metadata must match the filename of the data itself, save for the .yaml extension on the metadata file rather than whichever extnsion is on the data file.  So, to give metadata to a file called `little brother.pdf`, you'd put something like the following in a file called `little brother.yaml`:

		---
		title: Little Brother
		authors: Cory Doctorow
		published_on: 2011
		added_on: 2011-07-06
		topics: Fiction, Hacktivism
		languages: en
		blurb: |
		  Little Brother is an adventure set in a scarily real environment, one in which abuses of government power are overcome by techno-wiardry.  This is one of those rare finds in which the Afterwords and Bibliography contain useful information on counteracting the surveillance culture described in the book itself.
		license: Creative Commons Attribution-NonCommercial-Sharealike 3.0
		publisher: craphound.com
		---

Collections
-----------

If you want to publish resources in a collection, you'll want to create a .yaml file in the `collections` folder containing a description of the collection and a listing of the files contained therein.  That file should look something like this:

		title: Introduction to Freedom
		blurb: |
		  This is a collection of the best introductary files on free culture and free people in a free society. If you only download one thing from this infoshop, it should be this.
			archives:
			  - Basic Internet Security.pdf
				- Do It Yourself - A Handbook for Changing our World.pdf
				- Free Culture.pdf
				- Little Brother.pdf
				- The Revolution of Everyday Life.pdf

To display a link to a collection, you'll want to use the collection partial wherever you'd like to embed it:

		<%= render '_collection', :collection => items.select{|i| i.identifier =~ /\/collections.+/}[0] %>

Deployment
----------

In order to deploy your site, you'll want to create a full build of your site:

	$ nanoc compile -f

Once infoshop has your site ready in the `output` directory, you can do whatever you like with it.  Generally, you'll upload it to a server via SCP, SFTP, or rsync.  Additionaly, you may publish it to freenet if you have the software installed.  

**rsync**

RSync deployment is built into nanoc, the primary driver of this package.  To configure your site for rsync deployment, edit the `config.yml` file's "deploy" stanza near the end.  Once that matches the server and path you'd like to deploy to, run:

	$ rake deploy:rsync

