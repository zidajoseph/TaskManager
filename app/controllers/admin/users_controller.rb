class Admin::UsersController < ApplicationController
    skip_before_action :login_required, only: [:new, :create, :edit]
    
    def index
      @users = User.all
    end
    
    def new
      # if logged_in?
      #   flash[:notice] = 'New registrations must be logged out of the app.'
      #   redirect_to tasks_path
      # else
      #   @user = User.new
      # end
      @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          flash[:notice] = 'User create succesfully'
          redirect_to admin_users_path
        else
          render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
          redirect_to user_admin_path(@user.id), notice: "User edited !"
      else
          render :edit
      end
    end
    
    private
    
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                    :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end


end
