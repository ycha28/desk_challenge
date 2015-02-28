class CasesController < ApplicationController
  respond_to :json, :only => [:index, :show, :update]

  def index
    @cases = Case.includes(:labels)
    respond_with @cases
  end

  def show
    @case = Case.find(params[:id])
    respond_with @case
  end

  def update
    @case = Case.find(params[:id])

    if @case.update(case_params)
      Cases::UpdateWorker.new.perform(@case.id)
      head :ok
    else
      respond_with @case.errors.full_messages
    end
  end

  private

  def case_params
    params.permit(:subject, :priority, :description, :status).merge(params.slice(:label_ids))
  end
end