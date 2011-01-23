# JW Player Helper #

Simple Rails helper for rendering [JWPlayer 5.4](http://www.longtailvideo.com/players/) using [SWFObject v2.2](http://code.google.com/p/swfobject/)

## JW Player ##

Is opensource player supporting video (for example .mp4, .mov, .f4v, .flv), audio (.mp3) and image (.jpg, .png, .gif) files ([full list](http://www.longtailvideo.com/support/jw-player/jw-player-for-flash-v5/12539/supported-video-and-audio-formats)).


## Usage ##

### Installation ###

#### Rails 3 ####

* add `gem 'jw_player_helper'` into your `Gemfile`
* add `<%= javascript_include_tag 'swfobject' %>` in your layout
* now you can use `<%= video_player(flashvars={}, attributes={}, params={}) %>` to render JW Player

#### Rails 2 ####

* add `config.gem "jw_player_helper"` into your `config/environment.rb`
* add `<%= javascript_include_tag 'swfobject' %>` in your layout
* now you can use `<%= video_player(flashvars={}, attributes={}, params={}) %>` to render JW Player

### Configuration ###

#### flashvars ####

    :file => "relative path to file (for example: /video/pf2011.flv)",
    :image => "relative path to splash image (for example: /video/pf2011.jpg)",
    :bufferlength => 1,
    :autostart => false


[Full list of JW Player flashvars](http://developer.longtailvideo.com/trac/wiki/Player5FlashVars)

#### attributes ####

    :id => 'jw_player',
    :name => 'jw_player',
    :width => 300,
    :height => 300,
    :message => "Get the Adobe Flash Player to see this video.",
    :element => "div",
    :onmouseover => nil, # you can define javascript callbacks for element
    :onmouseout => nil,
    :onclick => nil

#### params ####

    :allowfullscreen => true,
    :allowscriptaccess => 'always'

### examples ###

    <%= video_player({:file => "/video/pf2011.flv", :image => "/video/pf2011.jpg"}) %>
renders JW Player with splash screen pf2011.jpg

    <%= video_player({:file => "/video/pf2011.flv", :image => "/video/pf2011.jpg"}, {:width => 640, :height => 480, :id => "pf2011_video"}) %>
renders JW Player with resolution `640x480px` and id `pf2011_video`

    <%= video_player({:file => "/video/pf2011.flv", :image => "/video/pf2011.jpg", :mute => true}, {:width => 640, :height => 480, :id => "pf2011_video", :onclick => "alert('clicked!');"}) %>
renders muted JW player with javascript alert when user click on video


### skins ###

Gem is packed with few skins

* [glow](http://www.longtailvideo.com/addons/skins/196/Glow?q=)
* [beelden](http://www.longtailvideo.com/addons/skins/155/Beelden?q=)
* [stormtrooper](http://www.longtailvideo.com/addons/skins/156/Stormtrooper?q=)
* [simple](http://www.longtailvideo.com/addons/skins/51/Simple?q=)

        Usage: add :skin => 'name' to your flashvars. For example: <%= video_player({:file => "/video/pf2011.flv", :image => "/video/pf2011.jpg", :skin => "glow"}) %>

You can find more skins [here](http://www.longtailvideo.com/addons/skins).

Usage: Copy downloaded zip into `RAILS_ROOT/public/swf/skins` and set `:skin => 'name without .zip extension'` flashvar

