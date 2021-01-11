class GoalsController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @goal=Goal.new
  end

  def create
    @goal=Goal.new(goal_params)
    @goal.user_id=current_user.id
    if @goal.save
      flash[:success]='目標を設定しました'
      redirect_to root_url
    else
      flash.now[:danger]='目標を設定できませんでした。'
      render :new
    end
  end

  def show
    
  end

  def destroy
  end
  
  private
  
  def goal_params
    params.require(:goal).permit(:set)
  end
end
