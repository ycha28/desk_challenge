class CasesController < ApplicationController
  respond_to :json, :only => [:index, :show]

  def index
    @cases = Case.all
    respond_with @cases
  end

  def show
    @case = Case.find(params[:id])
    respond_with @case
  end
end