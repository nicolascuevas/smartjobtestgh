class ApplicantsController < ApplicationController
  layout "applicant", only: [ :show_by_token ]
  before_action :authenticate_user!, except: [ :show_by_token]
  before_action :set_applicant, only: %i[ show edit update destroy send_test_via_email ]
  before_action :set_applicant_by_token, only: [ :show_by_token ]

  # GET /applicants or /applicants.json
  def index
    @applicants = Applicant.all
    @applicants = @applicants.where("email ilike ?", "%#{params[:email]}%" ) if params[:email].present?
    @applicants = @applicants.where("first_name ilike ?", "%#{params[:first_name]}%" ) if params[:first_name].present?
    @applicants = @applicants.where("last_name ilike ?", "%#{params[:last_name]}%" ) if params[:last_name].present?

  end

  # GET /applicants/1 or /applicants/1.json
  def show
  end

  # GET /applicants/1 or /applicants/1.json
  def show_by_token
    
  end

  # GET /applicants/new
  def new
    @applicant = Applicant.new
  end

  # GET /applicants/1/edit
  def edit
  end

  # POST /applicants or /applicants.json
  def create
    @applicant = Applicant.new(applicant_params)
    @applicant.user = current_user
    respond_to do |format|
      if @applicant.save
        format.html { redirect_to @applicant, notice: "Applicant was successfully created." }
        format.json { render :show, status: :created, location: @applicant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applicants/1 or /applicants/1.json
  def update
    respond_to do |format|
      if @applicant.update(applicant_params)
        format.html { redirect_to @applicant, notice: "Applicant was successfully updated." }
        format.json { render :show, status: :ok, location: @applicant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicants/1 or /applicants/1.json
  def destroy
    @applicant.destroy
    respond_to do |format|
      format.html { redirect_to applicants_url, notice: "Applicant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def send_test_via_email
    QuizMailer.with(applicant: @applicant).send_quiz_to_applicant.deliver_later

    respond_to do |format|
      format.html { redirect_to applicant_path(@applicant), notice: "Email enviado correctamente" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant
      @applicant = Applicant.find(params[:id])
    end

    def set_applicant_by_token
      @applicant = Applicant.where(token: params[:token]).first
    end


    # Only allow a list of trusted parameters through.
    def applicant_params
      params.require(:applicant).permit(:email, :first_name, :last_name, :token, :quizes_attributes => [:quiz_id])
    end
end
