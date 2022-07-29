# frozen_string_literal: true

class LinkSerializer
  include FastJsonapi::ObjectSerializer

  attributes :slug, :link

  attribute :viewed do |object|
    object&.link_stat.clicked || 0
  end
end
