class TasksController < ApplicationController
  def create
    @task = Task.create(name: tasks_params[:name], text: tasks_params[:text], weight: tasks_params[:weight], user_id: current_user.id)
    redirect_to controller: "users", action: "index"
  end

  def complete
    @complete_task = Task.find(params[:task_id])
    #更新に成功した時の処理
    if @complete_task.update_attributes(complete: 100)
      redirect_to controller: 'users', action: 'index'
    else
      redirect_to controller: 'users', action: 'index'
    end
  end

  def delete
    @deleted_task = Task.find(params[:task_id])
    @deleted_task.delete
    redirect_to controller: 'users', action: 'index'
  end

  private
  def tasks_params
    params.permit(:name, :text, :weight)
  end
end
