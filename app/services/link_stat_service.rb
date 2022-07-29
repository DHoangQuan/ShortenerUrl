# frozen_string_literal: true

# generate slug service
class LinkStatService
  def initialize(params)
    @params = params
  end

  def execute
    link_stat = LinkStat.find_by(link_id: @params[:id])
    link_stat.delay.increment!(:clicked)
  end
end
