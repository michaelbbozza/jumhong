class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      survey = Survey.find_by(creator_id: session[:user_id])
      survey.questions << @question
      request.xhr? ? render(partial: 'question', object: @question) : redirect_to(@question)
    else
      request.xhr? ? render(status: 422) : render('new')
    end
  end

  def questionform
    render partial: 'questions/form', locals: {question: Question.new}
  end
  
  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    survey = Survey.find_by(creator_id: session[:user_id])
    @question.update(question_params)
    # if @question.save
    redirect_to edit_survey_path
    # else
    #   render :edit
    # end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to survey_path
  end

  private

  def question_params
    params.require(:question).permit(:content, :survey_id)
  end

end
