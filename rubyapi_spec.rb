$LOAD_PATH.unshift File.dirname(__FILE__)

require 'rubyapi'
require 'minitest/spec'
require 'minitest/autorun'

describe RubyAPI do
  it "allows binding ruby C API" do
    RubyAPI.attach_function :new_array, :rb_ary_new, [], :object
    RubyAPI.new_array.must_equal []
  end
end
