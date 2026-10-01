
#include <vector>
#include <algorithm>
#include <cmath>
#include <iostream>
#include <cstdlib>

#include "owa_knap.h"
#include "gurobi_c++.h"


#define GEN_KNAP_CON \
	for (int j=0; j<I.n; ++j) \
		x[j] = model.addVar(0, 1, 0.0, GRB_BINARY); \
    { \
        GRBLinExpr rhs = 0; \
            for (int j=0; j<I.n; ++j) \
                rhs += I.w[j]*x[j]; \
            model.addConstr(rhs >= I.B); \
    }

#define GEN_ASSIGNMENT_CON \
    int sqn = sqrt(I.n); \
	for (int j=0; j<I.n; ++j) \
		x[j] = model.addVar(0, 1, 0.0, GRB_CONTINUOUS); \
    for (int j=0; j<sqn; ++j) \
    { \
        GRBLinExpr rhs = 0; \
        for (int k=0; k<sqn; ++k) \
            rhs += x[k*sqn + j]; \
        model.addConstr(rhs == 1); \
    } \
    for (int k=0; k<sqn; ++k) \
    { \
        GRBLinExpr rhs = 0; \
        for (int j=0; j<sqn; ++j) \
            rhs += x[k*sqn + j]; \
        model.addConstr(rhs == 1); \
    } \


using namespace std;

double OWA_KNAP::BUM(double t, double p)
{
    return (p/(p-1)) * (t-pow(t,p)/p);
}

void OWA_KNAP::gen_instance(int _n, probtype _ptype)
{
    ptype = _ptype;

    I.n=_n;
    if (ptype == _PT_KNAPSACK)
    {
        I.w.resize(I.n);
        I.B=0;
        for (int i=0; i<I.n; ++i)
        {
            I.w[i] = rand()%51+50;
            I.B += I.w[i];
        }
        I.B /= 10;

        //generate cost intervals
        I.cl.resize(I.n);
        I.cu.resize(I.n);
        for (int i=0; i<I.n; ++i)
        {
            // int r=10;
            bool ok=false;
            do
            {
            int r=rand()%50;

            double v1 = rand()%201;
            double v2 = rand()%201;
            I.cl[i] = int((I.w[i] - r)*(0.9 + v1/1000.0));
            I.cu[i] = int((I.w[i] + r)*(0.9 + v2/1000.0));
            if (I.cl[i] <= I.cu[i] - 1)
                ok = true;
            }while(!ok);
        }

    }
    else if (ptype == _PT_ASSIGNMENT)
    {
        //no data needs to be generated
        if (sqrt(I.n) != (int) sqrt(I.n))
            cout<<"Error: n needs to be square number for assignment.\n";

        I.cl.resize(I.n);
        I.cu.resize(I.n);
        for (int i=0; i<I.n; ++i)
        {
            int v1 = rand()%101+50;
            int v2 = rand()%101+50;
            I.cl[i] = min(v1,v2);
            I.cu[i] = max(v1,v2);
        }
    }
    else
        cout<<"Error: Unknown problem type.\n";


}

void OWA_KNAP::gen_oos(int _N, double p)
{
    N = _N;
    ow.resize(N);
    for (int i=0; i<N; ++i)
        ow[i] = BUM( ((double)i+1)/N, p) - BUM( ((double)i)/N, p);

    scen.resize(N);
    for (int i=0; i<N; ++i)
    {
        scen[i].resize(I.n);
        for (int j=0; j<I.n; ++j)
            scen[i][j] = I.cl[j] + (rand()%101/100.0) * (I.cu[j] - I.cl[j]);
    }
}

double OWA_KNAP::eval(double p, vector<double> sol)
{
    //find objective values
    vector<double> vals(N,0);
    for (int i=0; i<N; ++i)
        for (int j=0; j<I.n; ++j)
            vals[i] += sol[j]*scen[i][j];
    sort(vals.rbegin(), vals.rend());
    double result = 0;
    for (int i=0; i<N; ++i)
        result += ow[i]*vals[i];
    return result;
};


vector<double> OWA_KNAP::solve_SA(int S, double p)
{
    vector<double> ow(S);
    for (int i=0; i<S; ++i)
        ow[i] = BUM( ((double)i+1)/S, p) - BUM( ((double)i)/S, p);

    //sample S scenarios
    vector<vector<double> > scen(S);
    for (int i=0; i<S; ++i)
    {
        scen[i].resize(I.n);
        for (int j=0; j<I.n; ++j)
            scen[i][j] = I.cl[j] + (rand()%101/100.0) * (I.cu[j] - I.cl[j]);
    }

    //solve classic OWA
    GRBEnv env = GRBEnv();
	GRBModel model = GRBModel(env);

	GRBVar alpha[S], beta[S];
	for (int i=0; i<S; ++i)
    {
		alpha[i] = model.addVar(-GRB_INFINITY, GRB_INFINITY, 1.0, GRB_CONTINUOUS);
        beta[i] = model.addVar(-GRB_INFINITY, GRB_INFINITY, 1.0, GRB_CONTINUOUS);
    }

    GRBVar x[I.n];
    if (ptype == _PT_KNAPSACK)
    {
        GEN_KNAP_CON
    }
    else if (ptype == _PT_ASSIGNMENT)
    {
        GEN_ASSIGNMENT_CON
    }
    else
        cout<<"Unknown problem type.\n";

    for (int i=0; i<S; ++i)
        for (int k=0; k<S; ++k)
        {
            GRBLinExpr rhs = 0;
            for (int j=0; j<I.n; ++j)
                rhs += ow[k]*scen[i][j]*x[j];
            model.addConstr(alpha[i] + beta[k] >= rhs);
        }


    if (ptype == _PT_ASSIGNMENT)
        model.set(GRB_IntParam_Presolve,0);
    model.set(GRB_IntParam_OutputFlag,0);
    model.set(GRB_DoubleParam_TimeLimit, 30);
    model.set(GRB_IntParam_Threads, 1);

    model.optimize();

    vector<double> sol(I.n);
    for (int j=0; j<I.n; ++j)
			sol[j] = x[j].get(GRB_DoubleAttr_X);

    return sol;
};


vector<double> OWA_KNAP::solve_16(double beta)
{
    GRBEnv env = GRBEnv();
	GRBModel model = GRBModel(env);

    GRBVar x[I.n];
    if (ptype == _PT_KNAPSACK)
    {
        GEN_KNAP_CON
    }
    else if (ptype == _PT_ASSIGNMENT)
    {
        GEN_ASSIGNMENT_CON
    }
    else
        cout<<"Unknown problem type.\n";

    for (int j=0; j<I.n; ++j)
		x[j].set(GRB_DoubleAttr_Obj, I.cl[j] + beta*(I.cu[j] - I.cl[j]));

    if (ptype == _PT_ASSIGNMENT)
        model.set(GRB_IntParam_Presolve,0);
    model.set(GRB_IntParam_OutputFlag,0);
    model.set(GRB_DoubleParam_TimeLimit, 30);
    model.set(GRB_IntParam_Threads, 1);

    model.optimize();

    vector<double> sol(I.n);
    for (int j=0; j<I.n; ++j)
			sol[j] = x[j].get(GRB_DoubleAttr_X);

    return sol;
};


vector<double> OWA_KNAP::solve_29(double beta)
{
    GRBEnv env = GRBEnv();
	GRBModel model = GRBModel(env);

    GRBVar x[I.n];
    GRBVar t = model.addVar(0, GRB_INFINITY, beta, GRB_CONTINUOUS);

    if (ptype == _PT_KNAPSACK)
    {
        GEN_KNAP_CON
    }
    else if (ptype == _PT_ASSIGNMENT)
    {
        GEN_ASSIGNMENT_CON
    }
    else
        cout<<"Unknown problem type.\n";

    for (int j=0; j<I.n; ++j)
		x[j].set(GRB_DoubleAttr_Obj, (I.cu[j] + I.cl[j])/2.0);

	{
		GRBQuadExpr con = 0;
		for (int j=0; j<I.n; ++j)
			con += (I.cu[j] - I.cl[j])*(I.cu[j] - I.cl[j])*x[j]*x[j];
		model.addQConstr(t*t >= con);
	}

    if (ptype == _PT_ASSIGNMENT)
        model.set(GRB_IntParam_Presolve,0);
    model.set(GRB_IntParam_OutputFlag,0);
    model.set(GRB_DoubleParam_TimeLimit, 30);
    model.set(GRB_IntParam_Threads, 1);

    model.optimize();

    vector<double> sol(I.n);
    for (int j=0; j<I.n; ++j)
			sol[j] = x[j].get(GRB_DoubleAttr_X);

    return sol;
};


vector<double> OWA_KNAP::solve_30(double beta1, double beta2)
{
    GRBEnv env = GRBEnv();
	GRBModel model = GRBModel(env);

    GRBVar x[I.n];

    GRBVar tmax = model.addVar(0, GRB_INFINITY, beta1, GRB_CONTINUOUS);
    GRBVar t = model.addVar(0, GRB_INFINITY, beta2, GRB_CONTINUOUS);


    if (ptype == _PT_KNAPSACK)
    {
        GEN_KNAP_CON
    }
    else if (ptype == _PT_ASSIGNMENT)
    {
        GEN_ASSIGNMENT_CON
    }
    else
        cout<<"Unknown problem type.\n";

    for (int j=0; j<I.n; ++j)
        x[j].set(GRB_DoubleAttr_Obj, (I.cu[j] + I.cl[j])/2.0);

	{
		GRBQuadExpr con = 0;
		for (int j=0; j<I.n; ++j)
			con += (I.cu[j] - I.cl[j])*(I.cu[j] - I.cl[j])*x[j]*x[j];
		model.addQConstr(t*t >= con);
	}

	for (int j=0; j<I.n; ++j)
        model.addConstr(tmax >= (I.cu[j] - I.cl[j])*x[j]);

    if (ptype == _PT_ASSIGNMENT)
        model.set(GRB_IntParam_Presolve,0);
    model.set(GRB_IntParam_OutputFlag,0);
    model.set(GRB_DoubleParam_TimeLimit, 30);
    model.set(GRB_IntParam_Threads, 1);

    model.optimize();

    vector<double> sol(I.n);
    for (int j=0; j<I.n; ++j)
			sol[j] = x[j].get(GRB_DoubleAttr_X);

    return sol;
};
