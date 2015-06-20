class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def update
  end

  def destroy
  end

end