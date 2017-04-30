class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy, :edit, :update]

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

  def update
    respond_to do |format|
       if @comment.update(comment_params)
         format.html do
           redirect_to @comment, notice: 'Comment was successfully updated.'
         end
         format.json { render :show, status: :ok, location: @comment }
       else
         format.html { render :edit }
         format.json { render json: @comment.errors, status: :unprocessable_entity }
       end

     end

  end
  private

  def set_comment
   @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id,:project_id, :content)
  end


end
