# frozen_string_literal: true

class ApplicationService
  # Read this about service classes: https://www.toptal.com/ruby-on-rails/rails-service-objects-tutorial
  # Read this about testing: https://blog.engineyard.com/keeping-your-rails-controllers-dry-with-services
  # More about testing: https://blog.appsignal.com/2020/06/17/using-service-objects-in-ruby-on-rails.html
  # More about validation: https://www.twilio.com/blog/2017/06/validate-ruby-objects-with-active-model-validations.html
  def self.call(...)
    new(...).call
  end
end
