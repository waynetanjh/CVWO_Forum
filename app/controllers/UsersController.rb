class UsersController < ApplicationController 
    #skip_before_action :require_user, only: [:new, :create]

    def index 
        
    end 
    def new
        # need to create student object to work with
        @user = User.new
    end

    def create 
        @user = User.new(user_params)

        if @user.save
            flash[:notice] = "You have signed up successfully."
            redirect_to login_path
        else 
            # render template if there is a problem 
            render 'new', status: :unprocessable_entity # Render with status 422
        end
    end

    def show 
        @user = User.find(params[:id])
        @posts = @user.posts
    end 

    private
    def user_params
        #white listing require top level key 
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end 