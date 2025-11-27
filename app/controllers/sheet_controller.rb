class SheetController < ApplicationController
  def new
  end

  def show
  end

  # Renders the partial used inside the turbo frame based on params[:system]
  def system_preview
    @system = params[:system]
    render partial: 'system_preview', locals: { system: @system }
  end
end
