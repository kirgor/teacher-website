class HomeworksController < ApplicationController
  def index
    @homework = Homework.find(params[:id])
  end

  def all
    @homeworks = Homework.all
  end

  def add
    Homework.create(:id => params[:id], :content => params[:content])
  end

  def delete
    Homework.delete(:id => params[:id])
  end
end