module JWPlayerHelper
  module Helper

    def video_player(*args)
      begin
        embedder_class = JWPlayerHelper::Embedders.const_get(Configuration.embedder.camelize)
      rescue NameError => e
        puts "Wrong embedder class in JWPlayerHelper::Configuration.embedder (available embedders: [#{JWPlayerHelper::Embedders.constants.map(&:downcase).join(", ")}])"
        raise e
      end

      embedder = embedder_class.new(*args)
      raise NoMethodError, "You need to implement 'to_html' method in your embedder." unless embedder.respond_to?(:to_html)

      result = embedder.to_html

      result.respond_to?(:html_safe) ? result.html_safe : result
    end

  end
end

