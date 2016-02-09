class NotesController < ApplicationController
	before_action :set_project
	
	def create
		@note = @project.notes.create(note_params)
		redirect_to @project
	end

	def destroy
		@note = @project.notes.find(params[:id])
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
		params[:note].permit(:content, :category)
	end

end
