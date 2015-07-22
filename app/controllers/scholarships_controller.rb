class ScholarshipsController < ApplicationController
  def index
    @scholarships = Scholarship.all
    if params[:search]
      @scholarships = Scholarship.search(params[:search])
    else
      @scholarships = Scholarship.all
    end
  end

  def show
    @scholarship = Scholarship.find(params[:id])
  end

  def new
    @user = current_user
    @scholarship = @user.scholarships.new
  end

  def create
    @user = current_user
    @scholarship = @user.scholarships.new(scholarship_params)
    if @scholarship.save()
      flash[:notice] = "Your scholarship has been added!"
      redirect_to scholarships_path
    else
      flash[:alert] = "There was a problem with your submission. Please try again."
      render :new
    end
  end

  private
  def scholarship_params
    params.require(:scholarship).permit(:amount_requested, :description, :study_type, :title)
  end

end
