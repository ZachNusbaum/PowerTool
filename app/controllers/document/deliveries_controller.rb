class Document::DeliveriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_delivery, only: [:show]
  before_action :expired, only: [:show]

  def show
  end
  
  def new
    @delivery = current_user.document_deliveries.new
  end

  def create
    @delivery = Document::Delivery.new(delivery_params)
    @delivery.user = current_user
    if @delivery.save!
      Document::DeliveryMailer.notification(@delivery).deliver_later! unless @delivery.recipient_email.blank?
      redirect_to document_delivery_path(@delivery)
    else
      render :new
    end
  end

  private

  def delivery_params
    params.require(:document_delivery).permit(:description, :file, :expires_at, :recipient_email)
  end

  def set_delivery
    @delivery = Document::Delivery.find params[:id]
  end

  def expired
    if @delivery.expires_at < DateTime.now
      render plain: 'Sorry, this download has expired.'
    end
  end
end
