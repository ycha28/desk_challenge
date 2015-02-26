class Filters::CasesController < ApplicationController
  respond_to :json, :only => [:index]

  def index
    @filtered_cases = Case.from_filters(params[:filter_id]).includes(:labels)
    respond_with @filtered_cases
  end
end
