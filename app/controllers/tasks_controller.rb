class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  def index

    if params[:sort_expired]
      @tasks = current_user.tasks.all.order(dead_line: :desc).page(params[:page])
    elsif params[:sort_priority]
      @tasks = current_user.tasks.all.order(priority: :asc).page(params[:page])
    else
      @tasks = current_user.tasks.all.order(created_at: :desc).page(params[:page])
    end

    if params[:name].present? && params[:number].present?
      # return search results where both name and status are valid
      @tasks = current_user.tasks.search_name(params[:name]).search_status(params[:number]).page(params[:page])
      # When the only parameter passed is the task name
    elsif params[:name].present?
      @tasks = current_user.tasks.search_name(params[:name]).page(params[:page])
      # When the only parameter passed is status
    elsif params[:number].present?
      @tasks = current_user.tasks.search_status(params[:number]).page(params[:page])
    elsif params[:label_id].present?
      @tasks = current_user.tasks.all.joins(:labels).where(labels: { id: params[:label_id] }).page(params[:page])
    end


  end

  def show
    @task = Task.find(params[:id])
  end  

  def new
    @task = Task.new
  end  

  def create
    @task = current_user.tasks.build(task_params)
    # @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Tache cree avec success"
    else
      render :new  
    end
  end

  def edit 
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task.id), notice: "Task updated !"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "Tache cree avec success"
  end

  private 
  def task_params
    params.require(:task).permit(:name, :content, :dead_line, :status, :priority,  { label_ids: [] })
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
