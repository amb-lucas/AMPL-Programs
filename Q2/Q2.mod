
set Minas = 1 .. 2 by 1;
set Intermed = 1 .. 2 by 1;

param demanda;
param capM {Minas};

param custoMI {Minas, Intermed};
param capMI {Minas, Intermed};

param custoIP {Intermed};
param capIP {Intermed};

var qtMI {Minas, Intermed} >= 0;
var qtIP {Intermed} >= 0;

minimize FO: (sum{i in Minas, j in Intermed} custoMI[i, j]*qtMI[i, j])
			+ (sum{j in Intermed} custoIP[j]*qtIP[j]);

subject to CapMina {i in Minas}: (sum{j in Intermed} qtMI[i, j]) <= capM[i];
subject to CapInter {j in Intermed}: qtIP[j] <= sum{i in Minas} qtMI[i, j];

subject to CapRuaMI {i in Minas, j in Intermed}: qtMI[i, j] <= capMI[i, j];
subject to capRuaIP {j in Intermed}: qtIP[j] <= capIP[j];

subject to Demanda: sum{j in Intermed} qtIP[j] = demanda;
