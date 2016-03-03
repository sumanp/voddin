class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@task = Task.find(params[:task_id])
		@comment = @task.comments.build(comment_params)
		@comment.name = current_user.name
		@comment.email = current_user.email

		if @comment.save
			CommentMailer.comment_created(@task.project, @comment).deliver_now
			redirect_to @task, notice: "Comment posted."
		else
			redirect_to @task, notice: "Comment bot posted."
		end
	end

	def destroy
		authorize! :destroy
		@task = Task.find(params[:task_id])
		@comment =  Comment.find(params[:id])
		@comment.destroy

		redirect_to @task, notice: "Comment Deleted"
	end

	private

	def comment_params
		params.require(:comment).permit(:body)	
	end

end 