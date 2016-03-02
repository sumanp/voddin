class ProjectMailer < ActionMailer::Base

	def project_created(project)
		@project = project
		mail(to: project.user.email,
			from: "info@vodd.in",
			subject: "Project Created",
			
		)
	end
	

end