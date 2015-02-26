class FiltersController < ApplicationController
  respond_to :json, :only => [:index]

  def index
    @filters = Filter.active
    respond_with @filters
  end
end