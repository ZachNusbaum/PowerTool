class Emails::DmarcAccountsController < ApplicationController
  before_action :authenticate_user!

  def index
    @dmarc_accounts = current_user.dmarc_accounts
    authorize @dmarc_accounts
  end

  def new
    @dmarc_account = current_user.dmarc_accounts.new
    authorize @dmarc_account
  end

  def create
    @dmarc_account = current_user.dmarc_accounts.new(account_params)
    authorize @dmarc_account
    if @dmarc_account.save
      redirect_to emails_dmarc_account_url(@dmarc_account),
        notice: 'Account created successfully.'
    else
      render :new
    end
  end

  def show
    @dmarc_account = Emails::DmarcAccount.find_by_token(params[:account_id])
    authorize @dmarc_account
    @reports = @dmarc_account.client.reports(
      before: params[:before], after: params[:after],
      from_date: params[:from_date], to_date: params[:to_date],
      limit: params[:limit], reverse: params[:reverse]
    )
  end

  private

  def account_params
    params.require(:emails_dmarc_account).permit(:title, :api_key)
  end
end
