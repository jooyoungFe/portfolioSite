class AdminSessionsController < ApplicationController
  def create
    configured_key = ENV["PORTFOLIO_ADMIN_KEY"].to_s
    submitted_key = params[:admin_key].to_s

    if configured_key.present? && ActiveSupport::SecurityUtils.secure_compare(submitted_key, configured_key)
      reset_session
      session[:portfolio_admin] = true
      redirect_to projects_path, notice: "관리자로 로그인했습니다."
    else
      redirect_to projects_path, alert: login_error_message(configured_key)
    end
  end

  def destroy
    reset_session
    redirect_to projects_path, notice: "관리자에서 로그아웃했습니다."
  end

  private

  def login_error_message(configured_key)
    if configured_key.blank?
      "서버에 관리자 키가 설정되지 않았습니다."
    else
      "관리자 키가 올바르지 않습니다."
    end
  end
end
