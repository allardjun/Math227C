/******************************************************************************/
// Math 227C Problem Set 2
// Jun Allard jun.allard@uci.edu
/******************************************************************************/

/******************************************************************************/
//  INCLUDES
/******************************************************************************/

#include <math.h>
#include <stdio.h>
#include "twister.c" //random number generation

/******************************************************************************/
//  MACROS
/******************************************************************************/

#define RAND genrand_real3()
#define nSample 20000
#define ntmax 1000000 // a stop condition to make sure the loop eventually terminates

/******************************************************************************/
//  Variable declarations
/******************************************************************************/

int nt, iSample;
int x;
double p;

// parameters
double pE3toI, pE3toE1, pItoI;

// data collectors
int counter_geneLength;
int counter_numberOfIntrons;
int counter_proteinLength;
int counter_lengthOfIntron;

/******************************************************************************/
//  Main function
/******************************************************************************/

int main( int argc, char *argv[] )
{
    // intialize random number generator
    RanInit(0,0);

    // set parameters
    pE3toI  = 0.0001;
    pE3toE1 = 0.99989;
    pItoI   = 0.999;

    for (iSample=1;iSample<nSample;iSample++)
    {
        // intial condition
        x = 0;

        /***************************************************************************/
        // Simulate!
        /***************************************************************************/

        for (nt=0;nt<ntmax;nt++)
        {
            // cases for current state
            if (x == 0) 
                x=1; // START -> E1
            else if (x==1)
                x=2; // E1 -> E2
            else if (x==2)
            {
                x=3; // E2 -> E3
                counter_proteinLength++;
            }
            else if (x==3)
            {
                p = RAND;
                if (p<pE3toI)
                {
                    x = 4; // E3 -> I
                    counter_numberOfIntrons++;
                    counter_lengthOfIntron++;
                }
                else if (p<pE3toI+pE3toE1)
                    x = 1; // E3 -> E1
                else
                    x = 5; // E3 -> STOP
            }
            else if (x==4)
            {
                p = RAND;
                if (p<pItoI)
                {
                    x=4; // I -> I
                    counter_lengthOfIntron++;
                }
                else
                    x=1; // I -> E1
            }
            else
            {
                // E3 -> STOP
                counter_geneLength += nt;
                break;
            }
        } //finished for-loop through nt

        //printf("gene length = %d\n",nt);

    } // finished loop through samples

    printf("Mean protein length = %lf\n", 
        (double)counter_proteinLength/(double)nSample);
    printf("Mean number of introns per gene = %lf\n", 
        (double)counter_numberOfIntrons/(double)nSample);
    printf("Mean intron length = %lf\n", 
        (double)counter_lengthOfIntron/( ((double)counter_numberOfIntrons/(double)nSample) *(double)nSample) );
    printf("Mean gene length = %lf\n", 
        (double)counter_geneLength/(double)nSample);

    return 0;
} // finished main
