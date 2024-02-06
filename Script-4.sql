SELECT ano, SUM(ingressantes) AS Total_Ingressantes, SUM(evadidos) AS Total_Evadidos
FROM quantitativo_alunos
GROUP BY ano;