class NotesController < ApplicationController
  before_action :current_note, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorized #delete later?

  # /notes GET
  def index
    user = current_user
    notes = user.notes
    render json: notes
    # in JS it will be like  -> return JSON.stringify(notes)
    #  render is 'response to fetch call' which is the resp => resp.json()
  end

  # /notes/:id GET
  def show
    render json: current_note
  end

  #dont need new or edit because forms come from React. We only use create or update because they send the data.

  # /note/create POST
  def create
    # debugger
    note = Note.create(note_params)
    current_user.notes << note
    render json: current_user.notes
  end

  # /notes/:id/update PATCH
  def update
    note = current_note
    note.update(note_params)
    allNotes = current_user.notes
    render json: allNotes
  end

  # /notes/:id DELETE
  def destroy
    note = current_note
    note.destroy
    allNotes = current_user.notes
    render json: allNotes
  end

  private
  # BODY OF FETCH: { note: { title: , due_date: } }
  def note_params
    params.require(:note).permit(:title, :due_date, :color, :text, :user_id)
  end

  # id is from fetch url like: 'notes/:id or notes/4'
  # remember all notes have individual unique ids
  def current_note
    note = Note.find(params[:id])
  end

end
