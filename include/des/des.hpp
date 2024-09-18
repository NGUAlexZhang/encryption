#pragma once

#include <string>
#include <bitset>

class Des{
private:
    std::string token_str;
    std::bitset<28> key_bit[2];
    std::bitset<48> generateNextSubKey();
    void setKeyBit();
    void loop_right_move(int offset);
    unsigned char generate_count;
public:
    Des(std::string token_str); 
};
