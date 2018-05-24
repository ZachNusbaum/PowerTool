class Emails::DmarcAccountsController < ApplicationController
  before_action :authenticate_user!

  def index
    @dmarc_accounts = current_user.dmarc_accounts
  end

  def new
    @dmarc_account = current_user.dmarc_accounts.new
  end

  def create
    @dmarc_account = current_user.dmarc_accounts.new(account_params)
    if @dmarc_account.save
      redirect_to emails_dmarc_account_url(@dmarc_account),
        notice: 'Account created successfully.'
    else
      render :new
    end
  end

  def show
    @dmarc_account = Emails::DmarcAccount.find_by_token(params[:account_id])
  end

  private

  def account_params
    params.require(:emails_dmarc_accounts).permit(:title, :api_key)
  end
end
