class NotesController < ApplicationController
  before_action :current_note, only: [:show, :edit, :update, :destroy]

  def index
    notes = Note.all
  end

  def show
  end

  def new
    note = Note.new
  end

  def create
    note = Note.create(note_params)
    redirect_to notes_path
  end

  def edit
  end

  def update
    note.update(note_params)
    redirect_to note_path(note)
  end

  def destroy
    note.destroy
  end

  private

  def note_params
    params.require(:note).permit(:title, :due_date, :color, :text)
  end

  def current_note
    note = Note.find(params[:id])
  end


end
