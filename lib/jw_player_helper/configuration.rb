module JWPlayerHelper
  module Configuration

    def self.embedder(value=nil)
      @embedder = value || @embedder || "swfobject"
    end

    def self.load_with_defaults(value=nil)
      @load_with_defaults = value || @load_with_defaults || false
    end

  end
end
