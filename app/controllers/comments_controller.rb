class CommentsController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.create(comment_params)
    redirect_to project_path(@project)
  end

  def destroy
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:text, :created_at, :project_id, :user_id)
    end
end
