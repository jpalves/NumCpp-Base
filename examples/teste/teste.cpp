#include"NumCpp.hpp"

#include <complex>
#include <cstdlib>
#include <iostream>
#include <stdexcept>
#include <vector>

using namespace nc;

int main(){
   NdArray<std::complex<double>> array2d = {
        {1, 5, 0},
        {7, 1, 2}, 
        {0, 0, 1} 
    };
    
    for (int i = 0; i < 3;i++){
    	for(int j = 0; j < 3; j++)
    		std::cout << array2d[3*i+j] << " ";
    	std::cout << std::endl;
    }
    
    for (int i = 0; i < 3;i++){
    	for(int j = 0; j < 3; j++)
    		std::cout << array2d(i,j) << " ";
    	std::cout << std::endl;
    }
    
    std::cout << array2d(0,0) <<std::endl;
    array2d  = nc::linalg::swaprows(array2d ,0, 2);
    array2d  = nc::linalg::swaprows(array2d ,1, 2);
    	
    std::cout << linalg::inv(array2d);
    NdArray <double> A(array2d.shape());
    
    for(uint32 i=0;i < A.size();i++)
    	A[i] = array2d[i].real();
    
    std::cout << A;
    std::cout<<nc::linalg::pinv(A);
    
    return EXIT_SUCCESS;
}
