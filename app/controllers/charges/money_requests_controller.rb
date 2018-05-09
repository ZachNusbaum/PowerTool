class Charges::MoneyRequestsController < ApplicationController
  def show
    @money_request = Charges::MoneyRequest.find(params[:id])
  end

  def new
    @money_request = Charges::MoneyRequest.new
  end

  def create
    @money_request = Charges::MoneyRequest.new(request_params)
    @money_request.user = current_user
    if @money_request.save!
      redirect_to charges_money_request_path(@money_request),
        notice: 'Created successfully.'
    end
  end

  private

  def request_params
    params.require(:charges_money_request).permit(:amount, :description)
  end
end
