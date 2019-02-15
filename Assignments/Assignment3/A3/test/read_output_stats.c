#include <stdio.h>

int main()
{
    FILE* file = fopen("output_statistics.txt", "r");

    int N[21];
    int nsteps[21];
    double result1[21];
    double result2[21];

    for(int i = 0; i < 21; i++)
    {
        int N_, nsteps_;
        double result1_, result2_; 
        fscanf(file, "N=%d\n", &N_);
        fscanf(file, "NSTEPS=%d\n", &nsteps_);
        fscanf(file, "galsim: %lf\n", &result1_);
        fscanf(file, "galsim-array: %lf\n", &result2_);

        N[i] = N_;
        nsteps[i] = nsteps_;
        result1[i] = result1_;
        result2[i] = result2_;
    }

    fclose(file);


    for(int i = 0; i < 21; i++)
    {
        printf("%6d %6d %lf %lf\n", N[i], nsteps[i], result1[i], result2[i]);
    }


    file = fopen("output_statistics.txt", "a");

    fprintf(file, "%d", N[0]);
    for(int i = 1; i < 21; i++)
    {
        fprintf(file, ", %d", N[i]);
    }

    fprintf(file, "\n\n");

    fprintf(file, "%d", nsteps[0]);
    for(int i = 1; i < 21; i++)
    {
        fprintf(file, ", %d", nsteps[i]);
    }

    fprintf(file, "\n\n");

    fprintf(file, "%lf", result1[0]);
    for(int i = 1; i < 21; i++)
    {
        fprintf(file, ", %lf", result1[i]);
    }

    fprintf(file, "\n\n");

    fprintf(file, "%lf", result2[0]);
    for(int i = 1; i < 21; i++)
    {
        fprintf(file, ", %lf", result2[i]);
    }

    fprintf(file, "\n\n");

    fclose(file);

    return 0;
}