class UsersController < ApplicationController

    def index
        @users = User.where.not(role: "manager")
    end
    
   def edit
    @user = User.find_by(id: params[:id])
    
   end


    def update
        @user = User.find(params[:id])
        if @user.update(role: params[:role])
            flash[:success] = "Role  updated"
        end  
        redirect_to users_path

    end

end
