#include <boxes.hpp>
#include <iostream>
int main(int argc, char* argv[]){
    for(int i = 0; i < 8; i++){
        for(int j = 0; j < 6; j++){
            std::cout << int(boxes::boxE[i][j]) << " ";
        }
        std::cout << std::endl;
    }
    return 0;
}