class ApplicationController < ActionController::Base
  helper_method :portfolio_admin?

  private

  def portfolio_admin?
    session[:portfolio_admin] == true
  end

  def require_portfolio_admin!
    return if portfolio_admin?

    redirect_to projects_path, alert: "관리자 로그인이 필요합니다."
  end
end
