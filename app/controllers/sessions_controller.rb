class SessionsController < Devise::SessionsController
  
  def create
    super
    flash[:notice] = "#{t('.success')} #{current_user.first_name} #{current_user.last_name}!"
  end
  
end
