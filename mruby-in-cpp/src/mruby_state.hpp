#ifndef __MRUBY_STATE__HPP__
#define __MRUBY_STATE__HPP__

#include "mruby.h"
#include "mruby/irep.h"

class mruby_state {
    mruby_state(); 
    ~mruby_state();

private:
    mrb_state *state;
};

#endif

