class StatisticsController < ApplicationController

  def index
    @statistics = Micropost.select(:id, "strftime('%Y-%m', created_at) as month, count(*) as count", :user_id)
                           .group(:user_id, 'month')
                           .map {|p| [p.user_id, p.month, p.count]}
  end

end
