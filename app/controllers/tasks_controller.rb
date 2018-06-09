class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:succes] = 'Taskが正常に作成されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskが作成されませんでした'
      render :new
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.save(task_params)
      flash[:succes] = 'Taskは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskは更新されませんでした'
      render :edit
    end
    
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:succes] = 'Taskは正常に削除されました'
    redirect_to tasks_url
  end
  


end

private

def task_params
 params.require(:tasks).permit(:content)
end
