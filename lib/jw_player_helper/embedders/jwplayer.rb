module JWPlayerHelper
  module Embedders
    class Jwplayer

      DEFAULT_OPTIONS = {
        :id => 'jw_player',
        :name => 'jw_player',
        :width => 300,
        :height => 300,
        :message => "Get the Adobe Flash Player to see this video.",
        :element => "div",
        :flashplayer => "/swf/player.swf"
      }

      def initialize(*options)
        #NOTE: For compatibility with swfobject embedder
        @options = DEFAULT_OPTIONS
        options.each do |opt|
          @options.merge!(opt) if opt.is_a?(Hash)
        end

        @options[:skin] = "/swf/skins/#{@options[:skin]}.zip" if @options[:skin] and !@options[:skin].include?("/")
      end

      def to_html
        %Q{<#{@options[:element]} id="#{@options[:id]}">#{@options[:message]}</#{@options[:element]}>
        <script type="text/javascript">
            jwplayer("#{@options[:id]}").setup(
              #{@options.except(:id, :message, :element, :name).to_json}
            );
        </script>}
      end


    end
  end
end
