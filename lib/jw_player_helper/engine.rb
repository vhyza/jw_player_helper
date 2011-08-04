module JWPlayerHelper

  class Engine < Rails::Engine
    ActionView::Base.send :include, JWPlayerHelper::Helper

    initializer "static assets" do |app|
      app.middleware.insert_before ::Rack::Lock, ::ActionDispatch::Static, "#{root}/assets"
    end

    #TODO: Test it somehow
    config.after_initialize do
      if Configuration.load_with_defaults
        default_javascripts = ActionView::Helpers::AssetTagHelper.javascript_expansions[:defaults] + ["#{Configuration.embedder}.js?#{Time.now.to_i}"]
        ActionView::Helpers::AssetTagHelper.register_javascript_expansion :defaults => default_javascripts
      end
    end
  end

end
