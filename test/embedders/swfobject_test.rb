require 'helper'

class JWPlayerHelper::Embedders::SwfobjectTest < Test::Unit::TestCase

  context "Swfobject instance" do

    setup do
      @flashvars = {:file => "/path/to/video"}
    end

    should "respond to to_html method" do
      @embedder = JWPlayerHelper::Embedders::Swfobject.new(@flashvars)
      assert @embedder.respond_to?(:to_html)
    end

    should "generate default javascript for jwplayer" do
      @embedder = JWPlayerHelper::Embedders::Swfobject.new(@flashvars)
      video_script = @embedder.to_html
      assert video_script.include?("/path/to/video")
      assert video_script.include?("/swf/player.swf")
      assert video_script.include?(%q{id="jw_player"})
      assert video_script.include?("flashvars_jw_player")
      assert video_script.include?("params_jw_player")
      assert video_script.include?("attributes_jw_player")
    end

    should "generate different id and vars if is defined" do
      video_script = JWPlayerHelper::Embedders::Swfobject.new(@flashvars, {:id => "video_div"}).to_html
      assert video_script.include?(%q{id="video_div"})
      assert video_script.include?("flashvars_video_div")
      assert video_script.include?("params_video_div")
      assert video_script.include?("attributes_video_div")
    end

    should "set correct path to skin if is set" do
      video_script = JWPlayerHelper::Embedders::Swfobject.new(@flashvars.merge(:skin => "some_awesome_skin"), {:id => "video_div"}).to_html
      assert video_script.include?("/swf/skins/some_awesome_skin.zip")
    end

  end
end
