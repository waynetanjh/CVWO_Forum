class LoginsController < ApplicationController 
    #skip_before_action :require_user, only: [:new, :create]
    
    def new
        
    end 

    def create
        user = User.find_by(email: params[:email].downcase)
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:notice] = "Logged in successfully"
            redirect_to root_path
        else 
            # flash.now is used to display flash messages on the same page and disappears
            flash.now[:notice] = "Invalid email/password combination"
            render 'new'
        end
    end 

    def destroy
        # log out need to set to nil
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to login_path
    end
end