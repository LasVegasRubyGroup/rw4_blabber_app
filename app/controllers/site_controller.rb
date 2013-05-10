class SiteController < ApplicationController
  def index
    @foods = ['pizza', 'burger', 'burrito', 'cat']
  end
  def about
  end
end
