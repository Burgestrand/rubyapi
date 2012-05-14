#include <ruby.h>

static VALUE to_native(VALUE self, VALUE value)
{
  return LONG2FIX((VALUE) value);
}

static VALUE from_native(VALUE self, VALUE value)
{
  return (VALUE) FIX2LONG(value);
}

void Init_rubyapi_ext()
{
  VALUE rb_mCRuby = rb_define_module("RubyAPI");
  rb_define_singleton_method(rb_mCRuby, "to_native", to_native, 1);
  rb_define_singleton_method(rb_mCRuby, "from_native", from_native, 1);
}
