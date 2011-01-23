require 'jw_player_helper/helper'

if defined?(Rails)

  if defined?(Rails::Engine)
    puts "* Loading engine jw_player_helper"
    require 'jw_player_helper/engine'
  else
    ActionView::Base.send :include, JWPlayerHelper::Helper

    gem_root = File.expand_path("../../", __FILE__)

    javascript_file = Rails.root.join("public", "javascripts", "swfobject.js")
    gem_javascript_file = Pathname.new(File.join(gem_root, "assets", "javascripts", "swfobject.js"))

    if !File.exists?(javascript_file) or javascript_file.size != gem_javascript_file.size
      puts "Copying swfobject.js to public/jovascripts"
      FileUtils.cp_r File.join(gem_root, "assets", "javascripts"), Rails.root.join("public")
    end

    swf_file = Rails.root.join("public", "swf", "player.swf")
    gem_swf_file = Pathname.new(File.join(gem_root, "assets", "swf", "player.swf"))

    if !File.exists?(swf_file) or swf_file.size != gem_swf_file.size
      puts "Copying SWF files to public/swf"
      FileUtils.cp_r File.join(gem_root, "assets", "swf"), Rails.root.join("public")
    end
  end
end
