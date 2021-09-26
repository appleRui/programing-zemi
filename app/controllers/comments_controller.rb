class CommentsController < ApplicationController
  def index
    @tweet = Tweet.find_by(id: params[:tweet_id])
    @comment = Comment.new
    @comments = Comment.where(tweet_id: tweet_params)
  end
  def create
    @comment = Comment.new(comment_params)
    @comment.tweet_id = tweet_params
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to tweet_comments_path
    else
      render :index
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_to tweet_comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def tweet_params
    params.require(:tweet_id)
  end
end