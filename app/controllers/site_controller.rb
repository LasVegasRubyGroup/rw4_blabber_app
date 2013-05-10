class SiteController < ApplicationController
  def index
    @foods = ['pizza', 'burger', 'burrito', 'cat']
    @blabs = Blab.all
  end
  def about
  end
end
