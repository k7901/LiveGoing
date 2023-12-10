class Admin::HotelsController < ApplicationController
  
  def new
    @hotel = Hotel.new
  end
  
  def create
    
  end
  
  def index
    @hotels = Hotel.all
  end

  def show
  end

  def edit
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
   private
  
end