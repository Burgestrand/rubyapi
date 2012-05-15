$LOAD_PATH.unshift File.dirname(__FILE__)

require 'rubyapi'
require 'minitest/spec'
require 'minitest/autorun'
require 'stringio'

def capture_stdout
  old_stdout, $stdout = $stdout, StringIO.new
  yield
  $stdout.rewind
  $stdout.read
ensure
  $stdout = old_stdout
end

describe RubyAPI do
  it "allows binding ruby C API" do
    RubyAPI.attach_function :new_array, :rb_ary_new, [], :object
    RubyAPI.new_array.must_equal []
  end

  it "runs the example from the README" do
    RubyAPI.attach_function :new_array, :rb_ary_new, [], :object
    RubyAPI.attach_function :inspect, :rb_p, [ :object ], :void

    stdout = capture_stdout do
      RubyAPI.inspect("Hello, world!")
      RubyAPI.inspect(RubyAPI.new_array)
    end

    stdout.must_match /Hello, world!/
    stdout.must_match "[]"
  end
end
