//  Copyright © 2016 Gregory D. Stula. All rights reserved.
#include "vigenere.hpp"
#include "mruby_state.hpp"

int main() {
try {
  mruby_state mruby = mruby_state();
  mruby.load(bytecode);
} catch (int t) {
    return 1;
}
  return 0;
}
