File Store
==========

A simple [Spree][1] extension that places a tab in the Administration section allowing users to upload files and manage uploaded files.  Uploaded files are placed within the public directory and are therefore readable by users of the application.

Installation
------------

From the beginning:

1. Make your spree website
1.
For 0.9.x:
        git clone git://github.com/pklingem/spree-file-store.git -b 0.9.x vendor/extensions/file_store
For 0.10.x:
        git clone git://github.com/pklingem/spree-file-store.git -b 0.10.x vendor/extensions/file_store
1. rake db:migrate

And you are ready to go!
If you are using capistrano to deploy to your production server, don't forget to share the uploads dir over your releases. See example capistrano snippets at the bottom of this file.

Using The Links
---------------

If you want to add any link to a page in your website then the file upload
page will give you a link like this:

    http://localhost:3000/uploaded_files/0000/0002/Gaming.pdf

you should use it in your element like this:

    /uploaded_files/0000/0002/Gaming.pdf

For example, if you wanted to make a link to this pdf:

    <a href="/uploaded_files/0000/0002/Gaming.pdf">Gaming PDF</a>

Troubleshooting
---------------

If you are getting a 'Template is missing' error (Missing template admin/uploaded_files/index.erb in view path), then you are probably missing the haml gem. Two options:

* Require the HAML gem in your environment.rb, or:
* Use the ['erb' branch][2] that you can find in Robert Massaioli's fork

Example capistrano setup
------------------------

If you deploy using Capistrano, and don't like 404's, it is important that the 'public/uploaded\_files' directory is a) excluded from your Version Control System and b) symlinked to an 'uploaded\_files' in a shared dir. You will have to take care of the first thing yourself, and here is a capistrano snippet to set you up for the latter:

<pre><code>
  namespace :uploads do
    desc "Create shared uploads dir"
    task :create\_shared\_uploads do
        run "mkdir -p #{shared\_path}/public/uploaded\_files"
    end

    desc "Link public/uploaded_files to shared/public/uploaded_files"
    task :link_uploads do
        run "ln -nfs #{shared_path}/public/uploaded_files #{release_path}/public/uploaded_files"
    end
  end

  after "deploy:setup" do
      uploads::create\_shared\_uploads
  end
  
  after "deploy:update_code" do
      uploads::link_uploads
  end
</code></pre>

Contributors
------------

* [Patrick Klingemann][3]
* [Robert Massaioli][4]
* [Benny Degezelle][5]

[1]: http://spreecommerce.com/ "Spree: Open Source E-Commerce for Ruby on Rails"
[2]: http://github.com/robertmassaioli/spree-file-store/tree/erb "Git branch of this extension that does not require HAML"
[3]: http://github.com/pklingem
[4]: http://massaioli.homelinux.com/wordpress/
[5]: http://hardcoreforkingaction.com
