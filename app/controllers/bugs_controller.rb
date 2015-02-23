class BugsController < ApplicationController
  #before_action :authenticate_user!

  def index
    @bugs ||= Bug.all
  end

  def show
    @user = current_user
    @bug = Bug.all.find(params[:id])
    if @bug.not_current_user?(@user)
      flash[:notice] = "You do not own this bug!"
      redirect_to profiles_path
    end
  end

  def create
    @sim = 0
    @user = current_user
    @user_bugs = @user.bugs.paginate(page: session[:bug_page], per_page: 5)
    @bug = Bug.new(bug_params)
    @request = @user.requests.find_by_id(params[:bug][:request][:request_id])
    if @request.nil?
      respond_to do |format|
        format.js
      end
    elsif @request.permits.first.status == "審核中"
      respond_to do |format|
        format.js
      end
    elsif @request.find_similarity(@bug)
      @sim = 1
      respond_to do |format|
        format.js
      end
    else
      @user.bugs << @bug
      @request.bugs << @bug
      if @bug.save
        respond_to do |format|
          format.html { redirect_to bug_show_path(@bug) }
          format.js
        end
      else
        respond_to do |format|
          format.js
        end
      end
    end
  end

  def update
    @bug = Bug.all.find(params[:bug][:id])
    current_user.apply!(@bug)
    respond_to do |format|
      format.html { redirect_to @bug }
      format.js
    end
  end

  def destroy
    @bug = Bug.all.find(params[:bug][:id])
    current_user.unapply!(@bug)
    respond_to do |format|
      format.html { redirect_to @bug }
      format.js
    end
  end

  private

  def bug_params
    params.require(:bug).permit(:title, :level, :url, :parameter_1, :parameter_2, :parameter_3, :description)
  end

end