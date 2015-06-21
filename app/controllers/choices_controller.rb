class ChoicesController < ApplicationController

  def index
    @choices = Choice.all
  end

  def new
    @choice = Choice.new
  end

  def create
    @choice = Choice.new(choice_params)
    if @choice.save
    user = User.find(session[:user_id])
    user.choices << @choice
    question = Question.find_by(id: params[:question_id])
    request.xhr? ? render(partial: 'choice', object: @choice) : redirect_to(@choice)
    else
    request.xhr? ? render(status: 422) : render('new')
    end
  end

  def choiceform
    render partial: 'choices/form', locals: {choice: Choice.new}
  end

  def show
    @choice = Choice.find(params[:id])
  end

  def edit
    @choice = Choice.find(params[:id])
  end

  def update
    @choice = Choice.find(params[:id])
    @choice.assign_attributes(choice_params)
    if @choice.save
      redirect_to edit_survey_path(id: @choice.question.survey_id)
    else
      redirect_to edit_choice_path
    end
  end

  def destroy
    @choice = Choice.find(params[:id])
    @choice.destroy
    redirect_to new_survey_path
  end

  private

  def choice_params
    params.require(:choice).permit(:content, :question_id)
  end
end
