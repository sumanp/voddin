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
			redirect_to @project, notice: "Note added"
		else
			redirect_to @project, notice: "Note not added"
		end
	end

	def destroy

		@note = @project.notes.find(params[:id])
		authorize! :destroy, @note
		if @note.destroy
			flash[:success] = "Your note was deleted"
		else
			flash[:error] = "Your note could not be deleted"
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
