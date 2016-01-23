#ifndef __MRUBY_STATE__HPP__
#define __MRUBY_STATE__HPP__

#include "mruby.h"
#include "mruby/irep.h"

class mruby_state {
public:
    mruby_state(); 
    ~mruby_state();
    
    void load(const uint8_t
#if defined __GNUC__
              __attribute__((aligned(4)))
#elif defined _MSC_VER
              __declspec(align(4))
#endif
    bytes[]);

private:
    mrb_state* _state;
};

#endif
