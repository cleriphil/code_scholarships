class ScholarshipsController < ApplicationController
  def index
    @scholarships = Scholarship.all
  end

  def new
    @scholarship = Scholarship.new
  end

  def create
    @scholarship = Scholarship.new(scholarship_params)
    if @scholarship.save()
      flash[:notice] = "Your scholarship as been added!"
      redirect_to scholarships_path
    else
      flash[:flash] = "There was a problem with your submission. Please try again."
      render :new
    end
  end

  private
  def scholarship_params
    params.require(:scholarship).permit(:amount_requested, :description, :study_type)
  end

end
