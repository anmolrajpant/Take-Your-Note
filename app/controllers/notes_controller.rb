class NotesController < ApplicationController
  #before_action :find_note, only: {:show, :edit, :update, :destroy}
  def index
@notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to @notes_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def note_params
    params.require(:note).permit(:title, :content)
  end

  def find_note
    @note = Notes.find(params[:id])
  end

end
