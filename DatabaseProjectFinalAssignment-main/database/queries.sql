-- SELECT ano, processo_seletivo, curso, nr_vagas FROM processo_seletivos_graduacao;

-- Achar os cursos com maior número de evasão na base de dados (nesse caso, os 5 maiores)

SELECT nomecurso, SUM(evadidos) AS total_evadidos
FROM quantitativo_alunos
GROUP BY nomecurso
ORDER BY total_evadidos DESC
LIMIT 5;

/*  Achar os cursos com maiores TAXAS (%) de alunos evadidos por vinculados, que mostrará com mais precisão
os cursos que mais tem alunos evadindo, pois existem cursos com muitos mais alunos que outros, e,
naturalmente eles teriam uma evasão maior proporcional. */

SELECT nomecurso, ano, periodo, ((evadidos*100/vinculados)) AS pct_evadidos
FROM quantitativo_alunos
WHERE ((evadidos*100/vinculados)) < 100
ORDER BY pct_evadidos DESC
LIMIT 5;

-- consultas novas

SELECT ano, SUM(ingressantes) AS Total_Ingressantes, SUM(evadidos) AS Total_Evadidos
FROM quantitativo_alunos
GROUP BY ano;
	
SELECT nomecurso, ano, periodo, ((ingressantes*100/vinculados)) AS pct_ingressantes
FROM quantitativo_de_alunos
WHERE ((ingressantes*100/vinculados)) < 100
ORDER BY pct_ingressantes DESC
LIMIT 5;

SELECT nomecurso, ano, periodo, ((ingressantes*100/vinculados)) AS pct_ingressantes
FROM quantitativo_de_alunos
WHERE ((ingressantes*100/vinculados)) < 100
AND ano BETWEEN 2020 AND 2022
ORDER BY pct_ingressantes DESC
LIMIT 5;

SELECT nomecurso, ano, periodo, ((evadidos*100/vinculados)) AS pct_evadidos
FROM quantitativo_de_alunos
WHERE ((evadidos*100/vinculados)) < 100
AND ano BETWEEN 2020 AND 2022
ORDER BY pct_evadidos DESC
LIMIT 5;


SELECT ano, periodo, MAX((ingressantes*100/vinculados)) AS max_pct_ingressantes
FROM quantitativo_de_alunos qda
WHERE (ingressantes*100/vinculados) < 100
GROUP BY ano, periodo
ORDER BY max_pct_ingressantes desc
LIMIT 5;

SELECT ano, periodo, MAX((evadidos*100/vinculados)) AS max_pct_ingressantes
FROM quantitativo_de_alunos qda
WHERE (evadidos*100/vinculados) < 100
GROUP BY ano, periodo
ORDER BY max_pct_ingressantes desc
LIMIT 5;