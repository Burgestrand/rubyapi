require 'ffi'
require 'rubyapi_ext'

module RubyAPI
  extend FFI::Library
  ffi_lib FFI::CURRENT_PROCESS

  module ObjectExtension
    # This is a bit of a dangerous hack, as FFI will now accept any
    # object as a pointer argument anywhere. This renders the FFI type
    # checking useless for pointers.
    def to_ptr
      FFI::Pointer.new(RubyAPI.to_native(self))
    end
  end

  class VALUE
    extend FFI::DataConverter
    native_type FFI::Type::POINTER

    def self.from_native(value, ctx)
      RubyAPI.from_native(super.address)
    end

    def self.to_native(value, ctx)
      value.to_ptr
    end
  end

  typedef VALUE, :object
end

Object.send(:include, RubyAPI::ObjectExtension)
