class NotesController < ApplicationController
  def index
    @notes = Note.where(:user_id=>current_user)
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.new(note_params)

    if @note.save
      redirect_to notes_path
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to note_path
    end
  end

  def destroy
    @note = Note.find(params[:id])
    if @note.destroy
      redirect_to notes_path
    end
  end

  private
  def note_params
    params.require(:note).permit(:title, :content)
  end
end
