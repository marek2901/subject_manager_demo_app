class SubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subject, only: [:show, :edit, :update, :destroy, :participants, :new_participant]

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new(teacher_id: params[:teacher_id])
  end

  # GET /subjects/1/edit
  def edit
  end

  def participants
  end

  def new_participant
    @participant = Participant.new
  end

  def assign_participant
    @participant = Participant.new(participant_params)
    @participant.subject_id = params[:id]
    @subject = Subject.find(params[:id])

    respond_to do |format|
      if @participant.save
        format.html { redirect_to subjects_participants_path(id: @participant.subject_id),
           notice: 'Participant was successfully assigned.' }
      else
        format.html { render :new_participant }
      end
    end
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:title, :teacher_id)
    end

    def participant_params
      params.require(:participant).permit(:subject_id, :participant_id)
    end
end
