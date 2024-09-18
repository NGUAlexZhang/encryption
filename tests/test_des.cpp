#include <des/des.hpp>
#include <des/boxes.hpp>
#include <bitset>
#include <string>
#include <iostream>

int main(){
    Des des("Fuckuuuu");
    std::string str = "Fuckuuuu";
    std::string binStr = "";
    for(auto ch : str){
        binStr += std::bitset<8>(ch).to_string();
    }
    std::cout << std::endl;
    std::cout << binStr << std::endl;
    for(int i = 0; i < 8; i++){
        for(int j = 0; j < 7; j++)
            std::cout << binStr[boxes::key_box[i][j] - 1];
    }
    return 0;
}