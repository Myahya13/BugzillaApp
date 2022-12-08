class BugsController <ApplicationController
    def new
      # Manager and QA can create bugs
        if current_user.role == "developer"
          flash[:danger] = "You don't have permission to perform this operation"
          redirect_to bugs_path
        else
          @bug = Bug.new
        end 
    end

    def index 
      if current_user.role =="manager"
        @bugs = Bug.all
      else
        if current_user.role == "developer"
          @bugs = Bug.where(assign_to: current_user.id)
        else
          @bugs = current_user.bugs
        end
      end

    end
    
    def create
      # Manager % @users.each do |user| %>
          
         
      return if current_user.role == "developer"
       @bug = current_user.bugs.new(bug_params)
        if @bug.save
             redirect_to bugs_path
        else
           render 'new'
        end
    end  

    def edit
      # the person who has created the bug can edit the bug and manager can edit all bugs
      bug = Bug.find_by(id: params[:id])
      if bug 
        if current_user.id != bug.user_id && current_user.role != "manager"
          flash[:danger] = "You don't have permission to perform this operation"
          redirect_to bugs_path
        else
        @bug = bug
        end
      else
        redirect_to root_path
      end
    end

    def update
      # the person who has created the bug can edit the bug and manager can edit all bugs
      @bug = Bug.find(params[:id])
      if @bug.update(bug_params)
        flash[:success] = "Bug updated"
        redirect_to bugs_path
        # Handle a successful update.
      else
        render 'edit'
      end
    end


    def show
      bug = Bug.find_by!(bug: params[:id])
      redirect_to bug_path
    end

       
    def assign
      # Manager can assign bug
      if current_user.role == "developer" || current_user.role == "qa"
        flash[:danger] = "You don't have permission to perform this operation"
        redirect_to bugs_path
      else
            @bug = Bug.find(params[:id])
            @users = User.where("role IN ('qa', 'developer')").pluck(:email, :role, :id)
            @users.each do |user|
              user[0] = "#{user[0]} - #{user[1]}"              
        end 
      end
      
    end

   

      def destroy
        # manager can delete bug and the person who created the bug can delete it
        if current_user.role== "developer"
            flash[:danger] = "You don't have permission to perform this operation"
          redirect_to bugs_path
          else
          bug = Bug.find_by_id params[:id]
          bug.destroy
          flash[:success] = "Bug deleted"
          redirect_to bugs_path
        end  
      end 
     
        def assign_users
          #manager and qa can assign bug
          
          @bug = Bug.find_by(id: params[:id])
          if @bug.update(assign_to: params[:assign_users])
            flash[:success] = "Bug assigned successfully"
            redirect_to   bugs_path
          else
            flash[:danger] = "Something went wrong, please try again!"
            redirect_to assign_bug_path(params[:id])
          end
        end 

    private
      
    def bug_params
      params.require(:bug).permit(:title, :description, :priority, :Completiontime)
    end

    def authorize_bug
      if @bug.present?
        authorize @bug
      else
        flash[:danger] = "Something went wrong, please try again!"
      end
     
    end
  end
