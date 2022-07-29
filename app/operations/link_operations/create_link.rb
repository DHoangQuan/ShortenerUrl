# frozen_string_literal: true

module LinkOperations
  # create operation
  class CreateLink
    def initialize(params, current_user_id)
      @params = params
      @current_user_id = current_user_id
    end

    # rubocop:disable Metrics/MethodLength
    def execute
      return { status: 'failed', message: 'this link already exist' } if Link.exists? link: @params[:link]

      flag = true
      slug = GenerateSlugService.new.execute
      while flag == true
        flag = false unless Link.exists? slug: slug
        slug = GenerateSlugService.new.execute
      end

      link = Link.new(user_id: @current_user_id, slug: slug, link: @params[:link])

      return { status: 'failed', message: 'invalid data' } unless link.valid?

      link.save
      link.create_link_stat

      { status: 200 }
    end
    # rubocop:enable Metrics/MethodLength
  end
end
