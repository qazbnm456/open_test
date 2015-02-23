class RequestsController < ApplicationController
  #before_action :authenticate_user!

  def index
    @requests ||= Request.all
  end

  def show
    @user = current_user
    @request = Request.all.find(params[:id])
    @total_money = @request.total_money
    @remaining_money = @request.remaining_money
  end

  def update
    @request = Request.all.find(params[:request][:id])
    ActiveRecord::Base.connection.execute("INSERT INTO urbs (user_id, request_id, permit_id) VALUES(#{current_user.id}, #{@request.id}, #{Permit.create(status: "審核中").id})")
    respond_to do |format|
      format.html { redirect_to @request }
      format.js
    end
  end

  def destroy
    @request = Request.all.find(params[:request][:id])
    ActiveRecord::Base.connection.execute("DELETE FROM urbs WHERE user_id = #{current_user.id} AND request_id = #{@request.id}")
    respond_to do |format|
      format.html { redirect_to @request }
      format.js
    end
  end

end