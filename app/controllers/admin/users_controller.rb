class Admin::UsersController < ApplicationController
    before_action :login_required, :admin_users, only: [:new, :create, :edit]
    before_action :admin_users
    
    def index
      @users = User.all.includes(:tasks)
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
        @tasks = @user.tasks.all
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
          redirect_to admin_users_path, notice: "User edited !"
      else
          render :edit
      end
    end

    def destroy
      @user = User.find(params[:id])
      if current_user.id == @user.id
        redirect_to admin_users_path, notice: "Can't delete current user !"
      elsif
        if @user.destroy
          redirect_to admin_users_path, notice: "User has been delete !"
        else
          redirect_to admin_users_path, notice: "Can't delete laste admin!"
        end
      end  
    end
    
    private
    
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                    :password_confirmation, :admin)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def admin_users
      unless current_user.admin?
        redirect_to tasks_path, notice: "Can't access the administration page !"
      end
    end


end
