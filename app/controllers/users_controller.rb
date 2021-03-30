class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            # render 'new'
            redirect_to new_user_path
        end
    end

    def show
        if session[:user_id] != nil
            @user = User.find(params[:id])
        else
            redirect_to '/'
        end
    end

    def index
        @users = User.all
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end
end
