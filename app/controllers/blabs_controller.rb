class BlabsController < ApplicationController
  
  def new
    @blab = Blab.new
  end
  
  def create
    @blab = Blab.new(params[:blab])
    if @blab.save
      redirect_to(root_path, notice: 'Just created a new blab')
    else
      render(:new)
    end
  end
  
end
