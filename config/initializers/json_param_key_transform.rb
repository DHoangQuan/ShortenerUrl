# frozen_string_literal: true

# Transform JSON request param keys from JSON-conventional camelCase to
# Rails-conventional snake_case:
# For Rails 5 and 6
# ActionDispatch::Request.parameter_parsers[:json] = lambda { |raw_post|
#   # Modified from action_dispatch/http/parameters.rb
#   data = ActiveSupport::JSON.decode(raw_post)

#   # Transform camelCase param keys to snake_case
#   if data.is_a?(Array)
#     data.map { |item| item.deep_transform_keys!(&:underscore) }
#   else
#     data.deep_transform_keys!(&:underscore)
#   end

#   # Return data
#   data.is_a?(Hash) ? data : { '_json': data }
# }

# For Rails 4.2 (and maybe earlier versions)
# Rails.application.config.middleware.swap(
#   ::ActionDispatch::ParamsParser, ::ActionDispatch::ParamsParser,
#   ::Mime::JSON => Proc.new { |raw_post|
#     # Borrowed from action_dispatch/middleware/params_parser.rb except for
#     # data.deep_transform_keys!(&:underscore) :
#     data = ::ActiveSupport::JSON.decode(raw_post)
#     data = {:_json => data} unless data.is_a?(::Hash)
#     data = ::ActionDispatch::Request::Utils.deep_munge(data)

#     # Transform camelCase param keys to snake_case:
#     data.deep_transform_keys!(&:underscore)

#     data.with_indifferent_access
#   }
# )

# TWO WAYS BELOW JUST A SOLUTION
# SHOULD USE THE SOLUTION IN "wrap_parameter.rb" BECAUSE IT CONVERT PARAMS IN THE MIDDLEWARE
