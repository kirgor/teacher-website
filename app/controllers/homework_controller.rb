class HomeworkController < ApplicationController
  def show
    @homework = Homework.find(params[:id])
  end

  def edit
    @homework = Homework.find(params[:id])
  end

  def all
    @homeworks = Homework.all
  end

  def add
    @homework = Homework.create(:title => '', :content => '')
    render 'edit'
  end

  def delete
    Homework.delete(params[:id])
    redirect_to :action => 'all'
  end

  def save
    h = Homework.find(params[:id])
    h.title = params[:title]
    h.content = params[:content]
    h.save
    redirect_to :action => 'show', :id => h.id
  end
end