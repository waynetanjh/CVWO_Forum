# README

How to start the server 
1. Install database
rails db:create
rails db:migrate

3. Install gem file
bundle install

4. To run server rails s

If there are issues with react components loading (good to do if you start the server for the first time) 
- stop the server
- run yarn build
- run rails assets:precompile
- run "server s" to restart the server

I am using esbuilder instead of webpacker. For front end i am using react and some ruby on rails with bootstrap framework. 

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* versions
ruby: ruby 3.3.5

  "dependencies": 
    "@hotwired/stimulus": "^3.2.2",
    "@hotwired/turbo-rails": "^8.0.12",
    "esbuild": "^0.24.2",
    "jquery": "^3.7.1",
    "react": "^19.0.0",
    "react-dom": "^19.0.0",
    "sass": "^1.83.1",
    "ts-loader": "^9.5.1",
    "typescript": "^5.7.2"

* ...
# Forum
