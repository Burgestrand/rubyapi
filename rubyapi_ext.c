#include <ruby.h>

static VALUE to_native(VALUE self, VALUE value)
{
#if SIZEOF_VALUE == SIZEOF_LONG_LONG
  return LL2NUM(value);
#elif SIZEOF_VALUE == SIZEOF_LONG
  return LONG2NUM(value);
#elif SIZEOF_VALUE == SIZEOF_INT
  return INT2NUM(value);
#else
  rb_raise(rb_eRuntimeError, "size of VALUE is %d", SIZEOF_VALUE);
#endif
}

static VALUE from_native(VALUE self, VALUE value)
{
#if SIZEOF_VALUE == SIZEOF_LONG_LONG
  return (VALUE) NUM2LL(value);
#elif SIZEOF_VALUE == SIZEOF_LONG
  return (VALUE) NUM2LONG(value);
#elif SIZEOF_VALUE == SIZEOF_INT
  return (VALUE) NUM2INT(value);
#else
  rb_raise(rb_eRuntimeError, "size of VALUE is %d", SIZEOF_VALUE);
#endif
}

void Init_rubyapi_ext()
{
  VALUE rb_mCRuby = rb_define_module("RubyAPI");
  rb_define_singleton_method(rb_mCRuby, "to_native", to_native, 1);
  rb_define_singleton_method(rb_mCRuby, "from_native", from_native, 1);
}
