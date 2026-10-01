#include <vector>
#include <cstdlib>
#include <ctime>
#include <cmath>
#include <iostream>

#include "owa_knap.h"

using namespace std;


int main(int argc, char* argv[])
{
    //parameters: ./main n p seed

    int n = atoi(argv[1]);
    double p = atof(argv[2]);
	srand(atoi(argv[3]));
    int N = 1000;

    //generate knapsack problem
    OWA_KNAP owa;

    if (string(argv[4]) == "knapsack")
        owa.gen_instance(n, _PT_KNAPSACK);
    else if (string(argv[4]) == "assignment")
        owa.gen_instance(n, _PT_ASSIGNMENT);
    else
    {
        cout<<"usage: ./main n p seed knapsack/assignment\n";
        exit(0);
    }

    //BUM function middle row
    double betaL = (p+2)/(p+1);
    double betaV = 2*p/(sqrt(3)*(2*p-1));
    double betaH = ( sqrt(2*M_PI)/2.0 ) * (p-1.0/sqrt(p))/(p-1);

    double beta1 = (1 + 1.0/p)/3.0;
    double beta2 = 2*betaH/sqrt(12);

    vector<vector<double> > samx;
    vector<double> times;
    vector<int> S = {10, 50, 100};
    for (int i=0; i<S.size(); ++i)
    {
        double start = clock();
        samx.push_back(owa.solve_SA(S[i], p));
        times.push_back((clock()-start)/CLOCKS_PER_SEC);
    }

    double start = clock();
    vector<double> s16x = owa.solve_16(betaL/2);
    times.push_back((clock()-start)/CLOCKS_PER_SEC);

    start = clock();
    vector<double> s29x = owa.solve_29(min(betaV,betaH));
    times.push_back((clock()-start)/CLOCKS_PER_SEC);

    start = clock();
    vector<double> s30x = owa.solve_30(beta1, beta2);
    times.push_back((clock()-start)/CLOCKS_PER_SEC);

    //evaluation
    vector<vector<double> > objvals(samx.size()+3);
    for (int rep=0; rep<100; ++rep)
    {
        owa.gen_oos(N,p);

        for (int i=0; i<samx.size(); ++i)
            objvals[i].push_back(owa.eval(p,samx[i]));
        objvals[samx.size()].push_back(owa.eval(p,s16x));
        objvals[samx.size()+1].push_back(owa.eval(p,s29x));
        objvals[samx.size()+2].push_back(owa.eval(p,s30x));
    }

    for (int i=0; i<times.size(); ++i)
        cout<<times[i]<<";";
    cout<<"\n"<<flush;

    for (int rep=0; rep<100; ++rep)
    {
        for (int i=0; i<objvals.size(); ++i)
            cout<<objvals[i][rep]<<";";
        cout<<"\n";
    }


    return 0;
}
