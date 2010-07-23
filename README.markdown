File Store
==========

A simple Spree extension that places a tab in the Administration section allowing users to upload files and manage uploaded files.  Uploaded files are placed within the public directory and are therefore readable by users of the application.

Installation
------------

From the beginning:

 # Make your spree website
 # cd vendor/extensions
 # git clone <github link>
 # cd ../..
 # rake db:migrate

And then you are ready to go. 

Using The Links
---------------

If you want to add any link to a page in your website then the file upload
page will give you a link like this:

    http://localhost:3000/uploaded_files/0000/0002/Gaming.pdf

you should use it in your element like this:

    /uploaded_files/0000/0002/Gaming.pdf

For example, if you wanted to make a link to this pdf:

    <a href="/uploaded_files/0000/0002/Gaming.pdf">Gaming PDF</a>

And that is all that you need to know for this plugin.
