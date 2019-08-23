/* SELECT o quê?
FROM da onde?
WHERE condição? 
GROUP BY - se estiver utilizando função agregada (sum; count)
ORDER BY

=====Integridade referencial=====
PK = FK
1 = N
*/

--1º

SELECT f.id , f.nome , p.nome , c.nome
FROM funcionario f, projeto p, alocacao a, computador c
WHERE f.id = a.funcionario AND
p.id = a.projeto AND c.id = a.computador
ORDER BY p.nome , f.nome;

--2º

SELECT 
COUNT(*) , p.nome
FROM
	funcionario f,
	projeto p,
	alocacao a
--integridade referencial
WHERE 
	f.id = a.funcionario AND
	p.id = a.projeto
GROUP BY p.nome
ORDER BY p.nome;

--3º

SELECT f.nome , g.nome
FROM funcionario f , funcionario g
--integridade referencial
WHERE g.id = f.gerente
--group by
ORDER BY f.nome;

