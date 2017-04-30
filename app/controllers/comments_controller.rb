class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
     if @comment.save
       format.html do
         redirect_to '/comments/new', notice: 'Comment was successfully created.'
       end
     else
       format.html { render :new, status: 422 }
       format.json { render json: @comment.errors, status: :unprocessable_entity }
     end
   end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id,:project_id, :content)
  end


end
