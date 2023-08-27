class CommentsController < ApplicationController
    def create
        @book=Book.find(params[:book_id])
        @comment  = current_user.comments.new(params_comment)
        @book.comments << @comment
        redirect_to book_path(@book), notice: "Comment added"
    end

    def params_comment
        params.require(:comment).permit(:content, :parent_id)
    end
end
