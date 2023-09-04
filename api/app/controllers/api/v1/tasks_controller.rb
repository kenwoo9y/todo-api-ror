class Api::V1::TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  def index
    tasks = Task.all.order(created_at: :desc)
    render json: { status: '200', message: 'Loaded tasks', data: tasks }
  end

  def show
    render json: { status: '200', message: 'Loaded the task', data: @task }
  end

  def create
    task = Task.new(task_params)
    if task.save
      render json: { status: '200', data: task }
    else
      render json: { status: '500', data: task.errors }
    end
  end

  def update
    if @task.update(task_params)
      render json: { status: '200', message: 'Updated the task', data: @task }
    else
      render json: { status: '500', message: 'Not updated', data: @task.errors }
    end
  end

  def destroy
    if @task.destroy
      render json: { status: '200', message: 'Deleted the task', data: @task}
    else
      render json: { status: '500', message: 'Not deleted', data: @task.errors }
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :description, :status)
    end
end