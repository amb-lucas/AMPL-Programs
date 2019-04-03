
set Empresas := {"D", "N"};
set Produtos := {"Cerveja", "Refrigerantes"};

param InvMax;
param LimiteEmp {i in Empresas};
param LimiteProd {j in Produtos};
param InvEmpProd {i in Empresas, j in Produtos};
param Lucro {i in Empresas};

var investimento {i in Empresas} >= 0;

maximize FO: sum{i in Empresas} investimento[i]*Lucro[i];

subject to Limites_Prod {j in Produtos}: sum{i in Empresas} investimento[i]*InvEmpProd[i, j] <= LimiteProd[j];
subject to Limites_Emp {i in Empresas}: investimento[i] <= LimiteEmp[i];
subject to Lim_Inv: (sum{i in Empresas} investimento[i]) <= InvMax;
