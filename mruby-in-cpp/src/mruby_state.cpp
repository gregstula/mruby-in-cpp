#include "mruby_state.hpp"

mruby_state::mruby_state() {
    _state = mrb_open();
    if (!_state) {
        throw 9999;
    }
}

mruby_state::~mruby_state() {
    mrb_close(_state);
}

void mruby_state::load(const uint8_t bytes[]) {
    mrb_load_irep(_state, bytes);
}
