class ShortAnswersController < ApplicationController
  before_action :set_short_answer, only: [:show, :edit, :update, :destroy]

  # GET /short_answers
  # GET /short_answers.json
  def index
    @short_answers = ShortAnswer.all
  end

  # GET /short_answers/1
  # GET /short_answers/1.json
  def show
  end

  # GET /short_answers/new
  def new
    @short_answer = ShortAnswer.new
  end

  # GET /short_answers/1/edit
  def edit
  end

  # POST /short_answers
  # POST /short_answers.json
  def create
    @short_answer = ShortAnswer.new(short_answer_params)

    respond_to do |format|
      if @short_answer.save
        format.html { redirect_to @short_answer, notice: 'Short answer was successfully created.' }
        format.json { render :show, status: :created, location: @short_answer }
      else
        format.html { render :new }
        format.json { render json: @short_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /short_answers/1
  # PATCH/PUT /short_answers/1.json
  def update
    respond_to do |format|
      if @short_answer.update(short_answer_params)
        format.html { redirect_to @short_answer, notice: 'Short answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @short_answer }
      else
        format.html { render :edit }
        format.json { render json: @short_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /short_answers/1
  # DELETE /short_answers/1.json
  def destroy
    @short_answer.destroy
    respond_to do |format|
      format.html { redirect_to short_answers_url, notice: 'Short answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_answer
      @short_answer = ShortAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_answer_params
      params.require(:short_answer).permit(:name, :description, :answer)
    end
end
