-- SELECT ano, processo_seletivo, curso, nr_vagas FROM processo_seletivos_graduacao;

SELECT nomecurso, SUM(evadidos) AS total_evadidos
FROM quantitativo_alunos
GROUP_BY nomecurso
ORDER BY total_evadidos DESC
LIMIT 5;

SELECT nomecurso, ano, periodo, ((evadidos*100/vinculados)) AS pct_evadidos
FROM quantitativo_alunos
WHERE ((evadidos*100/vinculados)) < 100
ORDER BY pct_evadidos DESC
LIMIT 5;

SELECT nomecurso,ano,periodo,sum(evadidos) AS evadidos
FROM quantitativo_alunos
GROUP BY nome_curso,ano,periodo
ORDER BY ano,periodo;

-- consultas novas

SELECT ano, SUM(ingressantes) AS Total_Ingressantes, SUM(evadidos) AS Total_Evadidos
FROM quantitativo_alunos
GROUP BY ano;

SELECT
    ano,
    SUM(evadidos) AS Total_Evadidos,
    SUM(ingressantes) AS Total_Ingressantes,
    SUM(evadidos) * 1.0 / SUM(ingressantes) AS Proporcao_Evadidos_Ingressantes
FROM
    quantitativo_alunos
GROUP BY
    Ano
ORDER BY
    Proporcao_Evadidos_Ingressantes DESC;