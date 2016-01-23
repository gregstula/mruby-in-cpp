//  Copyright © 2016 Gregory D. Stula. All rights reserved.
#include <iostream>
#include "vigenere.hpp"
#include "mruby_state.hpp"

int main() {
    try {
        mruby_state mruby = mruby_state();
        mruby.load(bytecode);
    } catch (int t) {
       std::cout << "ERRRRRR " << t << std::endl;;
        return t;
    }
  return 0;
}
