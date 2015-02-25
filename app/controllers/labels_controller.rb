class LabelsController < ApplicationController
  respond_to :json, :only => [:index, :create]
  
  def index
    @labels = Label.all
    respond_with @labels
  end

  def create
    
  end
end