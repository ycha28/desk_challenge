class LabelsController < ApplicationController
  respond_to :json, :only => [:index, :create]
  
  def index
    @labels = Label.all
    respond_with @labels
  end

  def create
    @label = Label.new(label_params)

    if @label.save
      Labels::CreateWorker.new.perform(@label.id)
      head :ok
    else
      respond_with @label.errors.full_messages
    end
  end

  private

  def label_params
    params.require(:label).permit(:name)
  end
end