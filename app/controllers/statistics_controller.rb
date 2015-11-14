class StatisticsController < ApplicationController

  def index
    @statistics = Micropost.select(:id, "date(created_at, 'start of month') as date, count(*) as count", :user_id)
                           .group(:user_id, 'date')
  end

end
