class PostsController < ApplicationController
    before_action :set_post, only: [:edit, :update]
    
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end 
    
    def create
        @post = current_user.posts.build(post_params)
        if @post.save
          redirect_to root_path, notice: 'Post created successfully.'  # Use posts_path, not posts_index_path
        else
          render 'new', status: :unprocessable_entity
        end
    end

    def edit
    
    end 

    def update
        if @post.update(post_params)
            flash[:notice] = "Post updated successfully."
            redirect_to root_path
        else 
            render 'edit', status: :unprocessable_entity
        end
    end 

    def destroy
        @post = Post.find_by(id: params[:id])
        @post.destroy
        flash[:notice] = "Post deleted successfully."
        redirect_to posts_path
    end 


    def like 
        @post = Post.find(params[:id])
        @like = @post.likes.find_by(user: current_user)
        if @like
            @like.destroy
            @status ='unliked'
        else 
            @like = @post.likes.create(user: current_user)
            @status = 'liked'
            
        end
        render json: {likes: @post.likes.count, status: @status}
    end 

    private 
    def set_post
        @post = Post.find(params[:id])
    end
    
    def post_params
        #white listing require top level key 
        params.require(:post).permit(:post_title, :content, :topic, :user_id)
    end
   

end 