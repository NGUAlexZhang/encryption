#pragma once

#include <string>
#include <bitset>

class Des{
private:
    std::string token_str;
    std::bitset<56> key_bit;
    void generateNextSubkey();
    void setKeyBit();
public:
    Des(std::string token_str); 
};
