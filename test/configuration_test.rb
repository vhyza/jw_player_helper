require 'helper'

class JWPlayerHelper::ConfigurationTest < Test::Unit::TestCase
  context "Configuration" do
    setup do
      JWPlayerHelper::Configuration.instance_variable_set(:@embedder,    nil)
      JWPlayerHelper::Configuration.instance_variable_set(:@load_with_defaults, nil)
    end

    should "return default embedder" do
      assert_equal "swfobject", JWPlayerHelper::Configuration.embedder
    end

    should "allow to set and retrieve embedder" do
      JWPlayerHelper::Configuration.embedder "jwplayer"
      assert_equal "jwplayer", JWPlayerHelper::Configuration.embedder
    end

    should "return default load_with_defaults value" do
      assert_equal false, JWPlayerHelper::Configuration.load_with_defaults
    end

    should "allow to set and retrieve load_with_defaults" do
      JWPlayerHelper::Configuration.load_with_defaults true
      assert_equal true, JWPlayerHelper::Configuration.load_with_defaults
    end
  end

end
