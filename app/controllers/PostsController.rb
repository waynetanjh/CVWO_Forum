class PostsController < ApplicationController
    def index
        @posts = Posts.all
        #redirect_to articles_path if logged_in?
    end
      
    def about
    
    end
end 