class NotesController < ApplicationController
  before_action :current_note, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorized #delete later?

  # /notes GET
  def index
    user = current_user
    notes = user.notes
    render json: notes
  end

  # /notes/:id GET
  def show
    render json: current_note
  end

  #dont need new or edit because forms come from React. We only use create or update because they send the data.

  # /notes/create POST
  def create
    note = Note.create(note_params)
  end

  # /notes/:id/update PATCH
  def update
    note = current_note
    note.update(note_params)
  end

  # /notes/:id DELETE
  def destroy
    note = current_note
    note.destroy
  end

  private

  def note_params
    params.require(:note).permit(:title, :due_date, :color, :text, :user_id)
  end

  def current_note
    note = Note.find(params[:id])
  end

end
