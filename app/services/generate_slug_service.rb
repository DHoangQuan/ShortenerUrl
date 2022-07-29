# frozen_string_literal: true

# generate slug service
class GenerateSlugService
  def execute
    scope = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
    result = []
    i = 0
    while i < 8
      i += 1
      result << scope[rand(0..61)]
    end

    result.join('')
  end
end
