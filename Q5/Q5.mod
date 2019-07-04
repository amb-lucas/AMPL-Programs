
set Disciplinas := {"A", "B", "C"};

param HorasTotais;
param QuestoesHora {i in Disciplinas};
param NotaPassada {i in Disciplinas};

var horas {i in Disciplinas} >= 0;

maximize FO: sum {i in Disciplinas} horas[i]*QuestoesHora[i];

subject to NotaMaxima {i in Disciplinas}: horas[i]*QuestoesHora[i] <= 100;
subject to TempoEstudo: (sum {i in Disciplinas} horas[i]) <= HorasTotais;
subject to NotaMinima {i in Disciplinas}: horas[i]*QuestoesHora[i] + NotaPassada[i]*10 >= 100;