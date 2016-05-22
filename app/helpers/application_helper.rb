module ApplicationHelper

  #Set Github defaults for the markdown to html renderer
  def markdown(text)
    markdown = Redcarpet::Markdown.new(
        Redcarpet::Render::HTML,
        no_intra_emphasis: true,
        tables: true,
        fenced_code_blocks: true,
        autolink: true,
        disable_indented_code_blocks: true,
        strikethrough: true )
    return markdown.render(text).html_safe
  end

  #Make current_user accessible from the view
  def get_current_user
    @current_user ||= User.find(session[:user_id]) unless session[:user_id].blank?
    return @current_user
  end

  def logged_in?
    if get_current_user.blank?
      false
    else
      true
    end
    # !!current_user
  end

  #Redirect to login page if user is not logged in
  def restrict_access
    unless logged_in?
      flash[:error] = "You have to login to access this page."
      redirect_to login_url
    end
  end

end
