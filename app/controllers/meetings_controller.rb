class MeetingsController < ApplicationController

  before_action :set_params, only: %i[show edit update]


  def index
    @meetings = Meeting.all
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      redirect_to meetings_path, notice: '新規作成しました'
    else
      render :new
    end
  end

  def  show
  end

  def update
    if @meeting.update(meeting_params)
      redirect_to @meeting, notice: '更新しました'
    else
      render edit
    end
  end

  def destroy
    @meeting.destroy
    redirect_to meetings_path, notice: '削除しました'
  end

  private

  def meeting_params
    params.require(:meeting).permit(:title, :content)
  end

  def set_params
    @meeting = Meeting.find(params[:id])
  end
end
