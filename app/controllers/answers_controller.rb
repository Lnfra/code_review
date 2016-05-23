class AnswersController < ApplicationController

  before_action :restrict_access, only: [:edit, :update, :destroy, :landing, :index]

  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /submit_answer/1
  def submit_answer
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  #Post /create_answer
  def create_answer
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:success] = "Answer was successfully created."
      redirect_to question_path(@answer.question.id)
      # redirect_to @answer
      # redirect_to answer_path(@answer, id: @answer.), :notice => 'Answer was successfully created.'
    else
      render :new
    end
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:success] = "Answer was successfully created."
      redirect_to @answer
    else
      render :new
    end
  end

  # PATCH/PUT /answers/1
  def update
      if @answer.update(answer_params)
        flash[:success] = "Answer was successfully updated."
        redirect_to @answer
      else
        render :edit
      end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy
    flash[:success] = "Answer was successfully deleted."
      redirect_to answers_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:question_id, :content, :user_id, :code_language_id)
    end
end
