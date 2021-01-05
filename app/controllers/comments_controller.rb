class CommentsController < ApplicationController
  def create
    #Comment.create(comment_params)
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to "/prototypes/#{@comment.prototype.id}"
    else
      @prototype = Prototype.find(@comment.prototype.id)
      render "prototypes/show"
    end
  end

#  def create
#    @comment = Comment.new(comment_params)
#    @Comment.create(comment_params)
#    if @comment.save
#      redirect_to prototypes_index_path(@comment.tweet) # 今回の実装には関係ありませんが、このようにPrefixでパスを指定することが望ましいです。
#    else
#      @tweet = @comment.tweet
#      @comments = @tweet.comments
#      render "prototypes/show" # views/tweets/show.html.erbのファイルを参照しています。
#    end
#  end

#      PICTWEETより抜粋  ##################
#def create
#  comment = Comment.create(comment_params)
#  redirect_to "/tweets/#{comment.tweet.id}"
#end
#private
#def comment_params
#  params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
#end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
