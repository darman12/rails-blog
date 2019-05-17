class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    
                                  # create() is a method that creates a row entry in the db. In this case, the entry is being added to the comments table, with a foreign key that associates it with an entry in the article table
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
