class UsersController < ApplicationController
    def index 
        @users =User.all
    end

    def displayall 
        @users =User.all
    end
    

    def show 
        @user =User.find(params[:id])
    end

    def new 
        @user =User.new
    end

    def create 
        @user = User.new(user_data)
        if @user.save
          redirect_to @user
        else
          render :new, status: :unprocessable_entity
        end
    end
    def edit
        @user =User.find(params[:id])
    end

    def update
        @user =User.find(params[:id])
        if @user.update(user_data)
            redirect_to @user
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @user =User.find(params[:id])
        @user.destroy
        redirect_to root_path, status: :see_other
    end

    private 

    def user_data
        params.require(:user).permit(:id,:name,:age,:blog)
    end

end
