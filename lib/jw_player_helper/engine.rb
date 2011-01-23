require 'rails'

module JWPlayerHelper

  class Engine < Rails::Engine
    ActionView::Base.send :include, JWPlayerHelper::Helper

    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/assets"
    end
  end

end
