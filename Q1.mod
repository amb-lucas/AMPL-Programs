
set Usina = 1 .. 3 by 1;
set Mina = 1 .. 2 by 1;

param custo	{Mina, Usina};
param demanda {Usina};
param capacidade {Mina};
param tecnicalidade {Mina, Usina};

var qt {Mina, Usina} >= 0;

minimize FO: sum{i in Mina, j in Usina} custo[i, j]*qt[i, j];

subject to Demand {j in Usina}: sum{i in Mina} qt[i, j] >= demanda[j];
subject to Capacity {i in Mina}: sum{j in Usina} qt[i, j] <= capacidade[i];

subject to Tecnichality {i in Mina, j in Usina}:
	qt[i, j] >= tecnicalidade[i, j]*(sum{k in Mina} qt[k, j]);
