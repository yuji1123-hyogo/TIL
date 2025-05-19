class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to @task,notice: "タスク#{@task.name}が新規作成されました",status: 303
    else
      render :new,status: 422
    end
  end

  def update
    task = current_user.tasks.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_path,notice: "タスク:#{task.name}が編集されました" 
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy
    redirect_to tasks_path,notice: "タスク:#{task.name}を削除しました"
  end
  private 


  def task_params
    params.require(:task).permit(:name,:description)
  end
end
