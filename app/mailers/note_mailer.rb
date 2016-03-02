class NoteMailer < ActionMailer::Base

	def note_created(note, current_user)
		@note = note
		@current_user = current_user
		mail(to: note.project.user.email,
			from: "Project Management<info@vodd.in>",
			subject: "New Note Received",
			
		)
	end
	

end