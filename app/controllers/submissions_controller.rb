class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update]
  before_action :login_required
  before_action :correct_user, only: [:show, :edit, :update]

  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = Submission.where(user_id: current_user.id).all
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
  end

  # GET /submissions/new
  def new
    @submission = current_user.submissions.build(assignment_id: params[:assignment_id]) #Submission.new
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = current_user.submissions.build(submission_params.merge(assignment_id: params[:assignment_id])) #Submission.new(submission_params)

    @submission.submitted_at = Time.now if submitting?

    respond_to do |format|
      if @submission.save
        format.html { redirect_to @submission, notice: 'Submission was successfully created.' }
        format.json { render :show, status: :created, location: @submission }
      else
        format.html { render :new }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  def update
    @submission.submitted_at = Time.now if submitting?

    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  #def destroy
    #@submission.destroy
    #respond_to do |format|
      #format.html { redirect_to submissions_url, notice: 'Submission was successfully destroyed.' }
      #format.json { head :no_content }
    #end
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    def correct_user
      @submission = current_user.submissions.find_by(id: params[:id])
      redirect_to submissions_path, notice: "Not authorized to edit this submission" if @submission.nil?
    end

    def submitting?
      params[:commit] == "Submit to teacher"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:title, :body, :assignment_id, :user_id, :submitted_at)
    end
end
