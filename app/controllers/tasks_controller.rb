class TasksController < ApplicationController
  before_action :set_task, only: %i[update show edit destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice:'タスクを作成しました'
    else
      render :new
    end
  end 

  def update 
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'タスクを更新しました'
    else 
      render :edit 
    end
  end

  def show 
    @tasks = Task.all.select(:id, :title, :content)
  end

  def edit 
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'タスクを削除しました'
  end
 
  private
  
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params 
    params.require(:task).permit(:title, :content)
  end
end
