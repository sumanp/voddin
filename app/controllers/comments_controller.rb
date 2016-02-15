class CommentsController < ApplicationController
	def create
		@task = Task.find(params[:task_id])
		@comment = @task.comments.build(comment_params)

		if @comment.save
			redirect_to @task, notice: "Comment posted."
		else
			redirect_to @task, notice: "Comment bot posted."
		end
	end

	def destroy
		@task = Task.find(params[:task_id])
		@comment =  Comment.find(params[:id])
		@comment.destroy

		redirect_to @task, notice: "Comment Deleted"
	end

	private

	def comment_params
		params.require(:comment).permit(:name, :email, :body)	
	end

end 