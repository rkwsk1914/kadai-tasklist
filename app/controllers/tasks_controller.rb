class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :update, :destroy]
  
  def index
    if logged_in?
      @tasklist = current_user.tasks.build  # form_with 用
      @tasklist = current_user.tasks.all.page(params[:page])
    end
  end

  def show
    @tasklist = Task.find(params[:id])
  end

  def new
    @tasklist = Task.new
  end

  def create
    @tasklist = current_user.tasks.build(task_params)
    
    if @tasklist.save
      flash[:success] = "タスクを追加しました。"
      redirect_to @tasklist
    else
      flash[:danger] = "タスク追加が失敗しました。"
      render :new
    end
  end

  def edit
    @tasklist = Task.find(params[:id])
  end

  def update
    @tasklist = Task.find(params[:id])
    
    if @tasklist.update(task_params)
      flash[:success] = "タスクを更新しました。"
      redirect_to @tasklist
    else
      flash[:danger] = "タスク更新が失敗しました。"
      render :edit
    end
  end

  def destroy
    @tasklist = Task.find(params[:id])
    @tasklist.destroy
    
    flash[:success] = "タスクを削除しました。"
    redirect_to tasks_url
  end

  private
  
  def task_params
    
    #Kadaitaskモデルのフォームから得られるデータのうち、contentカラムだけ選択
    params.require(:task).permit(:content, :status)
  end
  
  def correct_user
    @tasklist = current_user.tasks.find_by(id: params[:id])
    unless @tasklist
      redirect_to root_url
    end
  end
end