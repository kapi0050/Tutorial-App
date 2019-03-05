class AttendancesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @attendance = @user.attendances.find_by(worked_on: Date.today)
    if @attendance.started_at.nil?
      @attendance.update_attributes(started_at: current_time)
      flash[:info] = 'おはようございます。'
    elsif @attendance.finished_at.nil?
      @attendance.update_attributes(finished_at: current_time)
      flash[:into] = 'お疲れ様でした。'
    else
      flash[:danger] = 'トラブルがあり、登録出来ませんでした。'
    end
    redirect_to @user
  end
  
  def edit
    @user = User.find(params[:id])
    @first_day = Date.parse(params[:date])
    @last_day = @first_day.end_of_month
    @dates = @user.attendances.where('worked_on >= ? and worked_on <= ?', @first_day, @last_day).order('worked_on')
  end
  
end
