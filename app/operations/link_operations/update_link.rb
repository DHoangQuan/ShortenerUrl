# frozen_string_literal: true

module LinkOperations
  # create operation
  class UpdateLink
    REGEXR_CHECK_SPECIAL_CHARACTER = %r/[!@#$%^&*()_+{}\[\]:;'"\/\\?><.,]/

    def initialize(params, link)
      @params = params
      @link = link
    end

    def execute
      validate = validate_link
      return validate if validate.present? && validate[:status] == 'error'

      update = @link.update!(
        link: @params[:link],
        slug: @params[:slug]
      )

      return { status: 'failed' } unless update

      { status: 200 }
    end

    private

    def validate_link
      return { status: :error, message: 'slug length at least 8 characters' } if @params[:slug].size < 8
      # rubocop:disable Layout/LineLength
      return { status: :error, message: 'slug must not contains special character' } if @params[:slug].scan(REGEXR_CHECK_SPECIAL_CHARACTER).present?
      # rubocop:enable Layout/LineLength
      return { status: :error, message: 'slug is existing' } if Link.exists? slug: @params[:slug]
      return { status: :error, message: 'link is existing' } if Link.exists? link: @params[:link]
    end
  end
end
