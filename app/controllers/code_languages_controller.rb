class CodeLanguagesController < ApplicationController
  before_action :set_code_language, only: [:show, :edit, :update, :destroy]

  # GET /code_languages
  # GET /code_languages.json
  def index
    @code_languages = CodeLanguage.all
  end

  # GET /code_languages/1
  # GET /code_languages/1.json
  def show
  end

  # GET /code_languages/new
  def new
    @code_language = CodeLanguage.new
  end

  # GET /code_languages/1/edit
  def edit
  end

  # POST /code_languages
  # POST /code_languages.json
  def create
    @code_language = CodeLanguage.new(code_language_params)

    respond_to do |format|
      if @code_language.save
        format.html { redirect_to @code_language, notice: 'Code language was successfully created.' }
        format.json { render :show, status: :created, location: @code_language }
      else
        format.html { render :new }
        format.json { render json: @code_language.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /code_languages/1
  # PATCH/PUT /code_languages/1.json
  def update
    respond_to do |format|
      if @code_language.update(code_language_params)
        format.html { redirect_to @code_language, notice: 'Code language was successfully updated.' }
        format.json { render :show, status: :ok, location: @code_language }
      else
        format.html { render :edit }
        format.json { render json: @code_language.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /code_languages/1
  # DELETE /code_languages/1.json
  def destroy
    @code_language.destroy
    respond_to do |format|
      format.html { redirect_to code_languages_url, notice: 'Code language was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_code_language
      @code_language = CodeLanguage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def code_language_params
      params.fetch(:code_language, {})
    end
end
