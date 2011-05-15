require 'helper'

class JWPlayerHelper::Embedders::JwplayerTest < Test::Unit::TestCase
  context "Jwplayer instance" do

    should "generate default javascript for jwplayer" do
      video_script = JWPlayerHelper::Embedders::Jwplayer.new(:file => "/path/to/video").to_html
      assert video_script.include?("/path/to/video")
      assert video_script.include?("/swf/player.swf")
      assert video_script.include?(%q{id="jw_player"})
    end

    should "generate javascript and html with custom id" do
      video_script = JWPlayerHelper::Embedders::Jwplayer.new(:file => "/path/to/video", :id => "custom_id").to_html
      assert video_script.include?(%q{id="custom_id"})
    end

    should "generate javascript with custom swf player" do
      video_script = JWPlayerHelper::Embedders::Jwplayer.new(:file => "/path/to/video", :id => "custom_id", :flashplayer => "/swf/another_flash_player.swf").to_html
      assert video_script.include?("/swf/another_flash_player.swf")
    end

    should "generate javascript with correct skin path" do
      video_script = JWPlayerHelper::Embedders::Jwplayer.new(:file => "/path/to/video", :skin => "awesome_skin").to_html
      assert video_script.include?("/swf/skins/awesome_skin.zip")
      video_script = JWPlayerHelper::Embedders::Jwplayer.new(:file => "/path/to/video", :skin => "/full/path/to/awesome_skin.zip2").to_html
      assert video_script.include?("/full/path/to/awesome_skin.zip2")
    end

  end
end
