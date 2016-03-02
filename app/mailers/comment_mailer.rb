class CommentMailer < ActionMailer::Base

	def comment_created(tasks_project, comment)
		@comment_name = comment.name
		@comment_body = comment.body
		@project = tasks_project
		mail(to: tasks_project.user.email,
			from: "Project Management<info@vodd.in>",
			subject: "New Comment Received",
			
		)
	end
	

end