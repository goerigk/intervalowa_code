#ifndef _H_OWA_KNAP_H
#define _H_OWA_KNAP_H

#include <vector>

enum probtype
{
    _PT_KNAPSACK = 1,
    _PT_ASSIGNMENT = 2
};

struct instance_knap
{
    int n;
    std::vector<double> w;
    std::vector<double> cl, cu;
    double B;
};


class OWA_KNAP
{
    public:
        void gen_instance(int _n, probtype _ptype);
        void gen_oos(int _N, double p);
        double eval(double p, std::vector<double> sol);

        std::vector<double> solve_SA(int S, double p);
        std::vector<double> solve_16(double beta);
        std::vector<double> solve_29(double beta);
        std::vector<double> solve_30(double beta1, double beta2);

    private:
        double BUM(double t, double p);

        instance_knap I;

        std::vector<std::vector<double> > scen;
        std::vector<double> ow;

        int N;

        probtype ptype;
};

#endif
