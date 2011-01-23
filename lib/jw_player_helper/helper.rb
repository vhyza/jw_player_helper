module JWPlayerHelper
  module Helper

    DEFAULT_ATTRIBUTES = {
      :id => 'jw_player',
      :name => 'jw_player',
      :width => 300,
      :height => 300,
      :message => "Get the Adobe Flash Player to see this video.",
      :element => "div"
    }

    DEFAULT_FLASHVARS = {
      :bufferlength => 1,
      :autostart => false
    }

    DEFAULT_PARAMS = {
      :allowfullscreen => true,
      :allowscriptaccess => 'always'
    }

    def video_player(flashvars, attributes = {} , params = {})
      flashvars[:skin] = "/swf/skins/#{flashvars[:skin]}.zip" if flashvars[:skin]

      attributes = DEFAULT_ATTRIBUTES.merge(attributes)
      flashvars = DEFAULT_FLASHVARS.merge(flashvars)
      params = DEFAULT_PARAMS.merge(params)

      result = %Q{<script type="text/javascript">
                    var flashvars_#{attributes[:id]} = #{flashvars.to_json};
                    var params_#{attributes[:id]} = #{params.to_json};
                    var attributes_#{attributes[:id]} = #{attributes.except(:width, :height, :message, :element).to_json};
                    swfobject.embedSWF('/swf/player.swf','#{attributes[:id]}','#{attributes[:width]}','#{attributes[:height]}','9','false', flashvars_#{attributes[:id]}, params_#{attributes[:id]}, attributes_#{attributes[:id]})

                </script>
                <#{attributes[:element]} id="#{attributes[:id]}">#{attributes[:message]}</#{attributes[:element]}>
              }

      result.respond_to?(:html_safe) ? result.html_safe : result
    end

  end
end

