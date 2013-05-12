class SiteController < ApplicationController
  def index
    @foods = ['pizza', 'burger', 'burrito', 'cat']
    @blabs = Blab.paginate(page: params[:page], per_page: 5)
  end
  def about
  end
end
