class CommentsController < ApplicationController

def create
    @request = Request.find(params[:request_id])
    @comment = @request.comments.create(comment_params)
    redirect_to request_path(@request)
  end

  private
    def comment_params
      pr = params.require(:comment).permit(:content)
      pr[:user_id] = current_user.id
      pr
    end

end
