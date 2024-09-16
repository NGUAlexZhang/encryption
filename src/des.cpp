#include <des.hpp>
#include <string>
#include <iostream>

Des::Des(std::string token_str){
    for(auto ch : token_str){
       std::cout << ch << " ";
    }
    std::cout << std::endl;
}