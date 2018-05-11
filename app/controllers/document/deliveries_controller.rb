class Document::DeliveriesController < ApplicationController
  before_action :authenticate_user!

  def show
    @delivery = Document::Delivery.find params[:id]
  end
  
  def new
    @delivery = current_user.document_deliveries.new
  end

  def create
    @delivery = Document::Delivery.new(delivery_params)
    @delivery.user = current_user
    if @delivery.save!
      redirect_to document_delivery_path(@delivery)
    else
      render :new
    end
  end

  private

  def delivery_params
    params.require(:document_delivery).permit(:description, :file, :expires_at)
  end
end
