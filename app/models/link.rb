# frozen_string_literal: true

class Link < ActiveRecord::Base
  has_one :link_stat

  belongs_to :user

  validates :slug, :link, presence: true
end
