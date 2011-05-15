require 'active_support/inflector'
require 'active_support/core_ext'
require 'yajl/json_gem'
require 'pathname'

gem_root = Pathname.new(File.expand_path("../../", __FILE__))

require gem_root.join('lib', 'jw_player_helper', 'configuration')

Dir.glob(gem_root.join('lib', 'jw_player_helper', 'embedders', '*rb')).each do |embedder|
  require embedder
end

require gem_root.join('lib', 'jw_player_helper', 'helper')

if defined?(Rails)

  if defined?(Rails::Engine)
    puts "* Loading engine jw_player_helper"
    require 'jw_player_helper/engine'
  else
    ActionView::Base.send :include, JWPlayerHelper::Helper

    ["swfobject.js", "jwplayer.js"].each do |js|
      gem_javascript_file = gem_root.join("assets", "javascripts", js)
      javascript_file = Rails.root.join("public", "javascripts", js)

      if !File.exists?(javascript_file) or javascript_file.size != gem_javascript_file.size
        puts "Copying #{js} to public/javascripts"
        FileUtils.cp_r File.join(gem_root, "assets", "javascripts"), Rails.root.join("public")
      end
    end

    swf_file = Rails.root.join("public", "swf", "player.swf")
    gem_swf_file = Pathname.new(File.join(gem_root, "assets", "swf", "player.swf"))

    if !File.exists?(swf_file) or swf_file.size != gem_swf_file.size
      puts "Copying SWF files to public/swf"
      FileUtils.cp_r File.join(gem_root, "assets", "swf"), Rails.root.join("public")
    end
  end
end
