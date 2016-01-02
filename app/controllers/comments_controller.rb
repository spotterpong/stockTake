class CommentsController < ApplicationController
    def create 
        @comment = Comment.new(comment_params)
        @comment.contact_id = params[:contact_id]
        if @comment.save
            flash[:success] = "Comment successfully added"
            redirect_to contact_path(@comment.contact_id)
        else
            flash[:danger] = 'Comment was not added. Please make sure it had a minimum of 5 chracters'
            redirect_to contact_path(@comment.contact_id)
        end
    end
    
    private
    def comment_params
        params.require(:comment).permit(:comment_body)
    end
end