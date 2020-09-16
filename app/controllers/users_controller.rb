class UsersController < ApplicationController
	def index
		@users=User.all
	end

	def new
		@user = User.new
	end

	def create
		#@user = User.new(username: params[:username], email: params[:email], password: params[:password])
        @user=User.new(whitelisted_user_params)
        if @user.save
            #redirect_to new_user_path
            redirect_to new_user_path
        else
            render :new
        end
	end

	def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(whitelisted_user_params)
        redirect_to new_user_path
        
        
    end

	def whitelisted_user_params
      params.require(:user).permit(:username,:email,:password)
    end
end
