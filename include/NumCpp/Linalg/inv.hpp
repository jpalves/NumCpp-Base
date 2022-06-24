/// @file
/// @author David Pilger <dpilger26@gmail.com>
/// [GitHub Repository](https://github.com/dpilger26/NumCpp)
///
/// License
/// Copyright 2018-2022 David Pilger
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy of this
/// software and associated documentation files(the "Software"), to deal in the Software
/// without restriction, including without limitation the rights to use, copy, modify,
/// merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
/// permit persons to whom the Software is furnished to do so, subject to the following
/// conditions :
///
/// The above copyright notice and this permission notice shall be included in all copies
/// or substantial portions of the Software.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
/// INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
/// PURPOSE AND NONINFRINGEMENT.IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
/// FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
/// OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
/// Description
/// matrix inverse
///
#pragma once

#include "NumCpp/Core/Internal/Error.hpp"
#include "NumCpp/Core/Internal/StaticAsserts.hpp"
#include "NumCpp/Core/Shape.hpp"
#include "NumCpp/Core/Types.hpp"
#include "NumCpp/NdArray.hpp"
#include "NumCpp/Functions/arange.hpp"
#include "NumCpp/Functions/ones.hpp"
#include "NumCpp/Functions/zeros.hpp"
#include "NumCpp/Functions/diag.hpp"
#include "NumCpp/Linalg/svd.hpp"

#include <string>

namespace nc
{
    namespace linalg
    {
	template <typename T>
 	NdArray<T> swaprows(NdArray<T> in,int a, int b){
 		NdArray <uint32> index = arange<uint32>(0,in.shape().cols);
 		NdArray <T> aux = in.row(a);
 		NdArray <uint32> indexa = index + in.shape().rows*a*ones<uint32>(index.shape());
 		NdArray <uint32> indexb = index + in.shape().rows*b*ones<uint32>(index.shape());
 	       
 		put(in,indexa,in.row(b));
 		put(in,indexb,aux);
 	
 		return in;
 	}
 	
 	template <typename T>
 	NdArray<T> swapcols(NdArray<T> in,int a, int b){
 	
 		in = in.transpose();
 		in = swaprows(in,a,b);
 		return in.transpose();
 	}

        //============================================================================
        // Method Description:
        /// matrix inverse
        ///
        /// 
        /// @param inArray
        /// @return NdArray
        ///
        template<typename dtype>
        NdArray<dtype> inv(const NdArray<dtype>& inArray){
            STATIC_ASSERT_ARITHMETIC_OR_COMPLEX(dtype);
            
            const Shape inShape = inArray.shape();
            if (inShape.rows != inShape.cols){
                THROW_INVALID_ARGUMENT_ERROR("input array must be square.");
            }

            NdArray <dtype> result(inShape.rows,inShape.cols), in = inArray;
            NdArray <int>   incidence = nc::zeros<int>(inShape);
            int i,j,k,l;
            
            for(k = 0;k < (int)inShape.rows-1; k++){
		if(in(k,k)==0.0){      
			for(l = k;in(k,l)==0.0;l++){}
			in = swaprows(in ,k,l);
			incidence(k,k)=1;
			incidence(k,l)=1; 
		}
	    }
	    	
	    for(k = 0;k < (int)inShape.rows ; k++){
            	//cerne do algoritmo de shipley para a matriz inversa 
            	result(k,k) = -1.0/in(k,k);
            	for(i = 0; i < (int)inShape.rows; i++)
            		for(j = 0; j < (int)inShape.cols; j++){
            			if( (i - k)&& (j - k)) result(i,j) = in(i,j) + in(k,j)*in(i,k)*result(k,k);
            			if( (i - k)&&!(j - k)) result(i,k) = in(i,k)*result(k,k);		
				if(!(i - k)&& (j - k)) result(k,j) = in(k,j)*result(k,k);  
            		}
            	for(i = 0; i < (int)inShape.rows; i++)
            		for(j = 0; j < (int) inShape.cols; j++)	
            			in(i,j) = result(i,j);
            }
            result = -result;
           
            for(i=(int)inShape.rows-1;i+1;i--)
			 if(incidence(i,i)){
				for(k=0;;k++){
					if((k-i) && incidence(i,k)!=0.0)break;
				}
				result = swapcols(result,i,k);
			 }
     
            return result;
        }
 

template<typename dtype>
	NdArray<dtype> pinv(const NdArray<dtype>& inArray){
               NdArray <dtype> U,d,V;
               
               nc::linalg::svd(inArray,U,d,V);
               NdArray <dtype> D_plus = nc::zeros<dtype>(inArray.shape()).transpose(), aux = nc::diag(d), aux1, A_plus;
               
               Shape index(aux.shape().cols,aux.shape().cols);
               aux1 = nc::zeros<dtype>(index);
               for(uint32 i= 0; i < aux1.shape().rows;i++)
               	aux1(i,i) = aux[i];
               
               aux1 = inv(aux1);
               for(uint32 i= 0; i < aux1.shape().rows;i++)
               	D_plus(i,i) = aux1(i,i);
               
               A_plus = V.transpose().dot(D_plus).dot(U.transpose());
               
               return A_plus;    
	}
   } // namespace linalg
}  // namespace nc
