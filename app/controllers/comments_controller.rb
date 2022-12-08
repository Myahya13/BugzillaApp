class CommentsController < ApplicationController
     def new
        if current_user.role == "qa"
            flash[:danger] = "You don't have permission to perform this operation"
            redirect_to bugs_path
        else
            @bug_id = params[:id]
        end
      end

    def create
        @bug = Bug.find(params[:bug_id])
        @bug.comments.create(comment_params)
        redirect_to bugs_path
    end

   

    private

    def comment_params
        params.permit(:text)
    end
end
