class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only:[:destroy]
  
  
  def index
    @tasks=Task.all
  end
  
  def show
  end

  def new
    @task=Task.new
  end

  def create
    @task=Task.new(task_params)
    @task.user_id=current_user.id
    
    if @task.save
      flash[:success]='タスクが正常に投稿されました'
      redirect_to root_url
    else
      flash.now[:danger]='タスクが投稿されませんでした'
      render :new
    end
  end

  def edit
    @task=Task.find_by(id: params[:id])
  end

  def update
    @task=Task.find_by(id: params[:id])
    @task.user_id=current_user.id
    
    if @task.update(task_params)
      flash[:success]='タスクが正常に更新されました'
      redirect_to root_url
    else
      flash.now[:danger]='タスクが更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task.destroy
    
    flash[:success]='タスクを削除しました'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  #strong parameter
  def task_params
    params.require(:task).permit(:content,:status)
  end
  
  def correct_user
    @task=current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end
