class UsersController < ApplicationController
    skip_before_action :login_required, only: [:new, :create, :edit]
    def new
      if logged_in?
        flash[:notice] = 'New registrations must be logged out of the app.'
        redirect_to tasks_path
      else
        @user = User.new
      end
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          flash[:notice] = 'You are logged in.'
          redirect_to tasks_path(@user.id)
        else
          render :new
        end
    end

    def show
        @user = User.find(params[:id])
        if @user.id != current_user.id
          redirect_to tasks_path, notice: "Can't access this page"
        end
    end

    def edit
      @user = User.find(params[:id])
      if @user.id != current_user.id
        redirect_to tasks_path, notice: "Can't access this page"
      end  
    end

    def update
        @user = User.find(params[:id])
      if @user.id == current_user.id 
          if @user.update(user_params)
              redirect_to user_path(@user.id), notice: "J'ai modifié l'utilisateur !"
          else
              render :edit
          end
      else
          redirect_to tasks_path, notice: "Impossible de modifier l'utilisateur !"
      end
    end
    
    private
    
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                    :password_confirmation)
    end
end
