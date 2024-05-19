#include <math.h>
#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int runHello() {
    {
        printf("Hello World\n");
    }

    {
        time_t t;
        srand((unsigned) time(&t));
        int rNum = rand();

        double sr = sqrt(rNum);
        printf("Sqrt(%d): %lf\n", rNum, sr);
    }

    return 0;
}