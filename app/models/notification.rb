# == Schema Information
#
# Table name: notifications
#
#  actor_id           :integer
#  created_at         :datetime         not null
#  id                 :integer          not null, primary key
#  notify_type        :string           not null
#  read_at            :datetime
#  second_target_id   :integer
#  second_target_type :string
#  target_id          :integer
#  target_type        :string
#  third_target_id    :integer
#  third_target_type  :string
#  updated_at         :datetime         not null
#  user_id            :integer          not null
#
# Indexes
#
#  index_notifications_on_user_id                  (user_id)
#  index_notifications_on_user_id_and_notify_type  (user_id,notify_type)
#

# Auto generate with notifications gem.
class Notification < ActiveRecord::Base
  include Notifications::Model

  # Write your custom methods...
end
