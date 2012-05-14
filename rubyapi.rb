require 'ffi'
require 'rubyapi_ext'

module RubyAPI
  extend FFI::Library
  ffi_lib FFI::CURRENT_PROCESS

  class VALUE
    extend FFI::DataConverter
    native_type FFI::Type::POINTER

    def self.from_native(value, ctx)
      RubyAPI.from_native(super.address)
    end

    def self.to_native(value, ctx)
      RubyAPI.to_native(super.address)
    end
  end

  typedef VALUE, :object
end
