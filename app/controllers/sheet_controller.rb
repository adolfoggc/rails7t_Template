class SheetController < ApplicationController
  def new
  end

  def show
  end

  # Renders the partial used inside the turbo frame based on params[:system]
  def system_preview
    @rpg_system = params[:rpg_system]
    render partial: 'rpg_system_preview', locals: { rpg_system: @rpg_system }
  end
end
