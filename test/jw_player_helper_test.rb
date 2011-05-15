require 'helper'

class TestJwPlayerHelper < Test::Unit::TestCase

  class StubView < ActionView::Base
  end

  context "Rails application" do
    setup do
      @view = StubView.new
    end

    should "load JWPlayerHelper into ActionView helpers" do
      assert ActionView::Base.include?(JWPlayerHelper::Helper)
      assert @view.respond_to?(:video_player)
    end

    should "generate swfobject javascript if configured in JWPlayerHelper::Configuration" do
      JWPlayerHelper::Configuration.embedder "swfobject"
      swfobject = JWPlayerHelper::Embedders::Swfobject.new :file => '/some/file'
      JWPlayerHelper::Embedders::Swfobject.expects(:new).with(:file => '/some/file').returns(swfobject)
      @view.video_player :file => "/some/file"
    end

    should "generate jwplayer javascript if configured JWPlayerHelper::Configuration" do
      JWPlayerHelper::Configuration.embedder "jwplayer"
      jwplayer = JWPlayerHelper::Embedders::Jwplayer.new :file => '/some/file'
      JWPlayerHelper::Embedders::Jwplayer.expects(:new).with(:file => '/some/file').returns(jwplayer)
      @view.video_player :file => "/some/file"
    end

    should "raise exceptoion when unknown embedder is set" do
      JWPlayerHelper::Configuration.embedder "unknown"
      assert_raise(NameError) { @view.video_player :file => "/some/file" }
    end

  end

end
