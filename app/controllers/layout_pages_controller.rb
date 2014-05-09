class LayoutPagesController < ApplicationController
  def home  
    if signed_in?      
      @activities = Activity.paginate page: params[:page], per_page: 5
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
