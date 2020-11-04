module ApplicationHelper

  def logged_in?
    session[:user_id]
  end

  def redirect_if_not_logged_in
    if !logged_in?
      redirect "/sessions/login"
    end
  end

  def redirect_if_logged_in
    if logged_in?
      redirect "/show" 
    end
  end
  
end
