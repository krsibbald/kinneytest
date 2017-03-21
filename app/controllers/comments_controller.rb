class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  before_action :authenticate_user!, only: [:create, :destroy]


  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@comment.post), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        if @comment.post
          format.html { redirect_to post_path(@comment.post), notice: "Problem creating comment: #{@comment.errors.messages}" }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        else
          format.html { redirect_to posts_path, notice: "Problem creating comment: #{@comment.errors.messages}" }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
        
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:post_id, :body, :user_id)
    end

end
