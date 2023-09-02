class TasksController < ApplicationController
  def index
    tasks = Task.all.order(:id)
    render json: tasks
  end

  def show
    render json: @task
  end

  def create
    task = Task.new(task_params)
    if task.save
      render json: task
    else
      render json: task.errors
    end
  end

  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors
    end
  end

  def destory
    if @task.destroy
      render json: @task
    else
      render json: @task.errors
    end
  end

  private
    def task_params
      params.require(:task).permit(:name, :description, :status)
    end
end
