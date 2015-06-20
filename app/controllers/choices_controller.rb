class ChoicesController < ApplicationController

  def index
    @choices = Choice.all
  end

  def new
    @choice = Choice.new
  end

  def create
    @choice = Choice.create(choice_params)
    user = User.find(session[:user_id])   
    user.choices << @choice
    redirect_to surveys_path
  end

  def show
    @choice = Choice.find(params[:user_id])
  end

  def edit
    @choice = Choice.find(params[:id])
  end

  def update
    @choice = Choice.find(params[:id])
    @choice.assign_attributes(choice_params)
    if @choice.save
      redirect_to surveys_path
    else
      redirect_to edit_choice_path
    end
  end

  def destroy
    @choice = Choice.find(params[:id])
    @choice.destroy
    redirect_to surveys_path
  end

  private

  def choice_params
    params.require(:choice).permit(:content, :question_id)
  end
end