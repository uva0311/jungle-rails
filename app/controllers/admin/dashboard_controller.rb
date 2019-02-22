class Admin::DashboardController < ApplicationController
  before_filter :admin_auth

  def show
  end

  protected

  def admin_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['ADMIN_NAME'] && password == ENV['ADMIN_PASSWORD']
    end
  end

end
