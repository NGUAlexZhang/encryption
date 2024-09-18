#include <algorithm>
#include <des/des.hpp>
#include <des/boxes.hpp>
#include <string>
#include <iostream>

Des::Des(std::string token_str){
    this->token_str = token_str;
    this->setKeyBit();
}

void Des::setKeyBit(){
    for(int i = 0; i < 8; i++){
        for(int j = 0; j < 7; j++){
            auto bit_idx = i * 7 + j;
            auto str_idx = boxes::key_box[i][j];
            auto ch = this->token_str[(str_idx - 1) / 8];
            if(!!(ch & (1<<(7-((str_idx - 1) % 8))))){
                this->key_bit.set(bit_idx);
            }
            else{
                this->key_bit.reset(bit_idx);
            }
        }
    }
}