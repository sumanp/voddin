class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@task = Task.find(params[:task_id])
		@comment = @task.comments.build(comment_params)
		@comment.name = current_user.name
		@comment.email = current_user.email

		if @comment.save
			CommentMailer.comment_created(@task.project, @comment).deliver_now
			redirect_to @task, notice: "Report submitted."
		else
			redirect_to @task, notice: "Report no submitted."
		end
	end

	def destroy

		@task = Task.find(params[:task_id])
		@comment =  Comment.find(params[:id])
		
		if @comment.destroy
			flash[:success] = "Your message is deleted"
		else
			flash[:error] = "Your message could not be deleted"
		end
		@comment.destroy

		redirect_to @task, notice: "Submission Deleted"
	end

	private

	def comment_params
		params.require(:comment).permit(:body, {attachments: []})	
	end

end 