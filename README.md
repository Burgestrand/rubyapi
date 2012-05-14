rubyapi
=======

Access help to the Ruby C library from FFI.

Installation
------------

    gem install rubyapi

Usage
-----

```ruby

RubyAPI.attach_function :new_array, :rb_array_new, [], :object
RubyAPI.attach_function :inspect, :rb_p, [ :object ], :void

RubyAPI.inspect("Hello, world!")
RubyAPI.inspect(RubyAPI.new_array)

```

WHY?
----

:trollface:

License
-------

Simplified (2-clause) BSD license.
