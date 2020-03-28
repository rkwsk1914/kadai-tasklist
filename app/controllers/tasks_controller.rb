class TasksController < ApplicationController
  def index
    @tasklist = Task.all
  end

  def show
    @tasklist = Task.find(params[:id])
  end

  def new
    @tasklist = Task.new
  end

  def create
    @tasklist = Task.new(task_params)
    
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
end

  private
  
  def task_params
    
    #Kadaitaskモデルのフォームから得られるデータのうち、contentカラムだけ選択
    params.require(:task).permit(:content)
  end
