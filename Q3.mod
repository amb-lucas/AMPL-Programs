
set Cultura := {"TRIGO", "ARROZ", "MILHO"};

param Produtividade {i in Cultura};
param Lucro {i in Cultura};

param AreaTotal;
param PesoMaximo;
param DemandaSitio {i in Cultura};

var area {i in Cultura} >= 0;

maximize FO: sum{i in Cultura} area[i]*Produtividade[i]*Lucro[i];

subject to Area_Maxima: (sum{i in Cultura} area[i]) <= AreaTotal;
subject to Peso_Maximo: (sum{i in Cultura} area[i]*Produtividade[i]) <= PesoMaximo;

subject to Demanda_Sitio {i in Cultura}: area[i] >= DemandaSitio[i];
