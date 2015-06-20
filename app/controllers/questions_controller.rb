class QuestionsController < ApplicationController

  def create
    @question = Question.new(question_params)
    if @question.save
      render :new
    else
      render :new
    end
  end

  def new
    @question = Question.new
    @survey = @question.survey
  end

  def edit
    @question = Question.find(params[:id])
    @survey = @question.survey
  end

  def update
    @question = Question.find(params[:id])
    @question.assign_attributes(question_params)
    if @question.save
      redirect_to survey
    else
      render :edit
    end
  end

  def destroy
    @survey.find(params[:id]).destroy
  end

  private

  def survey_params
    params.require(:question).permit(:content, :survey_id)
  end

end