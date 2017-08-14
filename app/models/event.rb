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

class Event < ApplicationRecord
  enum occurence: { biweekly: 0, monthly: 1, annually: 2 }

  def schedule
    # Not covered in the video, but in these situations,
    # I'll most likely call schedule multiple times in a 
    # complex view, so I will use memoization for the schedule
    @schedule ||= begin
      schedule = IceCube::Schedule.new(now = start_date)
      case occurence      
      when 'biweekly'
        schedule.add_recurrence_rule IceCube::Rule.weekly(2)
      when 'monthly'
        schedule.add_recurrence_rule IceCube::Rule.monthly(1)
      when 'annually'
        schedule.add_recurrence_rule IceCube::Rule.yearly(1)
      end
      schedule
    end
  end
end
