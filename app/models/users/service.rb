# == Schema Information
#
# Table name: users_services
#
#  access_token        :string
#  access_token_secret :string
#  auth                :text
#  created_at          :datetime         not null
#  expires_at          :datetime
#  id                  :bigint(8)        not null, primary key
#  provider            :string
#  refresh_token       :string
#  uid                 :string
#  updated_at          :datetime         not null
#

class Users::Service < ApplicationRecord
end
