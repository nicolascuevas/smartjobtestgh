class ApplicantTestsController < ApplicationController
  layout "applicant", only: [ :show_test_by_applicant_token ]
  before_action :authenticate_user!, except: [:show_test_by_applicant_token]
  before_action :set_applicant_by_token, only: [ :show_test_by_applicant_token ]
  before_action :set_applicant_test_after_applicant, only: [ :show_test_by_applicant_token ]
  before_action :set_applicant_test, only: %i[ show edit update destroy ]

  # GET /applicant_tests or /applicant_tests.json
  def index
    @applicant_tests = ApplicantTest.all
  end

  # GET /applicant_tests/1 or /applicant_tests/1.json
  def show
  end

  def show_test_by_applicant_token
    
  end

  # GET /applicant_tests/new
  def new
    @applicant_test = ApplicantTest.new
  end

  # GET /applicant_tests/1/edit
  def edit
  end

  # POST /applicant_tests or /applicant_tests.json
  def create
    @applicant_test = ApplicantTest.new(applicant_test_params)

    respond_to do |format|
      if @applicant_test.save
        format.html { redirect_to @applicant_test, notice: "Applicant test was successfully created." }
        format.json { render :show, status: :created, location: @applicant_test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @applicant_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applicant_tests/1 or /applicant_tests/1.json
  def update
    respond_to do |format|
      if @applicant_test.update(applicant_test_params)
        format.html { redirect_to @applicant_test, notice: "Applicant test was successfully updated." }
        format.json { render :show, status: :ok, location: @applicant_test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @applicant_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicant_tests/1 or /applicant_tests/1.json
  def destroy
    @applicant_test.destroy
    respond_to do |format|
      format.html { redirect_to applicant_tests_url, notice: "Applicant test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant_test
      @applicant_test = ApplicantTest.find(params[:id])
    end

    def set_applicant_by_token
      @applicant = Applicant.where(token: params[:token]).first
    end

    def set_applicant_test_after_applicant
      @applicant_test = @applicant.applicant_tests.find(params[ :applicant_test_id ])
    end

    # Only allow a list of trusted parameters through.
    def applicant_test_params
      params.require(:applicant_test).permit(:applicant_id, :due_date, :applicant_test_status_id, :quiz_id)
    end
end
