// A simple program that computes the square root of a number
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// taken from https://gist.github.com/Zulqurnain/b98de3a6c02a632e8a45
double mysqrt(int Number)
{
    int j;
    double i,k=1;
    double incre = 0.01;
    // 0.01 starting value it is the accuurate value upto 2 decimal places choose 0.01 or 0.001 or so on
    // the more the incre is lower the high the accuracy of root !
    
    for(i=1; i<=Number; i+=incre){ // Number n
        for(j=0;j<2;j++){ // any root
            k*=i;
        }
        if(k>Number){ // if multipe is becoming greater  then just return its 1 less
            return (i-incre);
            break;
        }
        else
            k=1; // special case
    }
}
