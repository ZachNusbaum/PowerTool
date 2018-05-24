class Emails::DmarcReportsController < ApplicationController
  def show
    @dmarc_account = Emails::DmarcAccount.find_by_token(params[:account_id])
    authorize @dmarc_account
    @report = @dmarc_account.client.report(params[:report_id])
  end
end
