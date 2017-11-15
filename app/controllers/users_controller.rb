class UsersController < ApplicationController
  layout 'user_home'

  def index
    @tasks = Task.all.where(user_id: current_user.id).where(complete: 0..99)
  end
end
