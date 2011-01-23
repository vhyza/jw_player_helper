require 'helper'

class TestJwPlayerHelper < ActionView::TestCase

  include JWPlayerHelper::Helper

  setup do
    @flashvars = {:file => "/path/to/video"}
  end

  should "be loaded" do
    assert ActionView::Base.include?(JWPlayerHelper::Helper)
  end

  should "generate default javascript for jwplayer" do
    video_script = video_player(@flashvars)
    assert video_script.include?("/path/to/video")
    assert video_script.include?("/swf/player.swf")
    assert video_script.include?(%q{id="jw_player"})
    assert video_script.include?("flashvars_jw_player")
    assert video_script.include?("params_jw_player")
    assert video_script.include?("attributes_jw_player")
  end

  should "generate different id and vars if is defined" do
    video_script = video_player(@flashvars, {:id => "video_div"})
    assert video_script.include?(%q{id="video_div"})
    assert video_script.include?("flashvars_video_div")
    assert video_script.include?("params_video_div")
    assert video_script.include?("attributes_video_div")
  end

end
