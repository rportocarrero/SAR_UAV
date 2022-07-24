#include "gtest/gtest.h"

extern "C"{
    #include "test_module/test_module.h"
}

// Positive path test
TEST(test_module, ok){
    EXPECT_EQ(5,5);
}