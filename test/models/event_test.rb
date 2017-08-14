# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string
#  occurence  :integer          default("biweekly")
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
