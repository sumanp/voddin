class NotesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_project

	def index
		@notes = Note.all
	end

	def new
		@note = Note.new
		
	end
	
	def create
		@note = @project.notes.create(note_params)
		@note.user = current_user.name
		if @note.save
			NoteMailer.note_created(@note, current_user).deliver_now
			redirect_to @project, notice: "Message sent"
		else
			redirect_to @project, notice: "Message was not sent"
		end
	end

	def destroy

		@note = @project.notes.find(params[:id])
		authorize! :destroy, @note
		if @note.destroy
			flash[:success] = "Your message is deleted"
		else
			flash[:error] = "Your message could not be deleted"
		end
		redirect_to @project
	end

	private

	def set_project
		@project = Project.find(params[:project_id])
	end

	def note_params
		params[:note].permit(:content, {attachments: []})
	end

end
