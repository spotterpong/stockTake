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
    
    def update
        @comment = Comment.find(params[:id])
        
        if @comment.update(comment_params)
           flash[:success] = 'Comment successfully updated'
           redirect_to contact_path(@comment.contact)
        else
            @contact = @comment.contact
            @comments = @contact.comments
            if @contact.patch_test
                patch_test_test
            end
            
            render 'contacts/show', locals: {id: @contact, obj: @comment }
        end
            
    end
    
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        flash[:danger] = 'Comment successfully removed'
        redirect_to contact_path(@comment.contact_id)
    end
    private
    def comment_params
        params.require(:comment).permit(:comment_body)
    end
end