#include <algorithm>
#include <des/des.hpp>
#include <des/boxes.hpp>
#include <string>
#include <iostream>

Des::Des(std::string token_str){
    this->generate_count = 0;
    this->token_str = token_str;
    this->setKeyBit();
}

void Des::loop_right_move(int offset){
    this->key_bit[0] = (this->key_bit[0] >> offset) | (this->key_bit[0] << (28 - offset));
}

void Des::setKeyBit(){
    for(int i = 0; i < 8; i++){
        for(int j = 0; j < 7; j++){
            auto bit_idx = (i * 7 + j);
            auto str_idx = boxes::displacement_box1[i][j];
            auto ch = this->token_str[(str_idx - 1) / 8];
            if(!!(ch & (1<<(7-((str_idx - 1) % 8))))){
                this->key_bit[bit_idx > 27].set(bit_idx > 27 ? bit_idx - 28 : bit_idx);
            }
            else{
                this->key_bit[bit_idx > 27].reset(bit_idx > 27 ? bit_idx - 28 : bit_idx);
            }
        }
    }
}

std::bitset<48> Des::generateNextSubKey(){
    this->generate_count++;
    if(this->generate_count == 1 || this->generate_count == 2 || this->generate_count == 9
    || this->generate_count == 16){
        this->loop_right_move(1);
    } 
    else{
        this->loop_right_move(2);
    }
    std::bitset<48> tmp_bitset;
    for(int i = 0; i < 6; i++){
        for(int j = 0; j < 8; j++){
            auto bit_idx = (i * 8) + j;
            auto str_idx = boxes::displacement_box2[i][j];
            
            if(key_bit[str_idx > 27][str_idx > 27 ? str_idx - 27 : str_idx]){
                tmp_bitset.set(bit_idx);
            }
            else{
                tmp_bitset.reset(bit_idx);
            }
        }
    }
    return tmp_bitset;
}
