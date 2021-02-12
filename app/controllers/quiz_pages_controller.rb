class QuizPagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quiz
  before_action :set_quiz_page, only: %i[ show edit update destroy ]

  # GET /quiz_pages or /quiz_pages.json
  def index
    @quiz_pages =  @quiz.quiz_pages
  end

  # GET /quiz_pages/1 or /quiz_pages/1.json
  def show
  end

  # GET /quiz_pages/new
  def new
    @quiz_page = QuizPage.new
  end

  # GET /quiz_pages/1/edit
  def edit
  end

  # POST /quiz_pages or /quiz_pages.json
  def create
    @quiz_page = QuizPage.new(quiz_page_params)

    respond_to do |format|
      if @quiz_page.save
        format.html { redirect_to @quiz_page, notice: "Quiz page was successfully created." }
        format.json { render :show, status: :created, location: quiz_quiz_pages_path(@quiz, @quiz_page) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quiz_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quiz_pages/1 or /quiz_pages/1.json
  def update
    respond_to do |format|
      if @quiz_page.update(quiz_page_params)
        format.html { redirect_to @quiz_page, notice: "Quiz page was successfully updated." }
        format.json { render :show, status: :ok, location: quiz_quiz_pages_path(@quiz, @quiz_page) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quiz_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_pages/1 or /quiz_pages/1.json
  def destroy
    @quiz_page.destroy
    respond_to do |format|
      format.html { redirect_to quiz_path(@quiz), notice: "Quiz page was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_page
      @quiz_page = @quiz.quiz_pages.find(params[:id])
    end

    def set_quiz
      @quiz = Quiz.find(params[:quiz_id])
    end

    # Only allow a list of trusted parameters through.
    def quiz_page_params
      params.require(:quiz_page).permit(:title, :quiz_id)
    end
end
