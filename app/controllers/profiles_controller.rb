class ProfilesController < ApplicationController
  #before_action :authenticate_user!

  def index
    @user = current_user
    @user_bugs = @user.bugs.paginate(page: params[:bug_page], per_page: 5)
    session[:bug_page] = params[:bug_page]
    @user_requests = @user.requests.paginate(page: params[:request_page], per_page: 5)
    @bug = Bug.new
    @request_permit = @user.permits.select{|p| p.status == "審核通過"}.map{|p| p.requests.first}
  end
end