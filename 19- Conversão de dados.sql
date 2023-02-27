select current_timestamp() as result;

select concat('O dia de hoje é: ', date_format(current_timestamp(),'%W, %d/%M/%y - %U')) as result; 
#%Y = ano, %y = 2 digitos do ano
#%m = mês, %M = nome do mês
#%d = dia, %W = nome do dia, %D = primeiro, segundo...
#%U = número de semanas do ano até agora

select convert(23.3, CHAR) as result; #Converte 23.3 pra string

select substring(convert(23.3, CHAR), 1, 2) as result; #1,2 pega o 1º caracter e mais 1 caracter


#EXERCÍCIO: Queremos construir um SQL cujo resultado seja, para cada cliente:
#“O cliente João da Silva faturou 120000 no ano de 2016”.
#Somente para o ano de 2016.

select concat('O(A) cliente ', NOME, ' faturou R$', ROUND(SUM(INF.QUANTIDADE * INF.PRECO), 2), ' no ano 2016') as result
from itens_notas_fiscais 
INF inner join notas_fiscais NF on NF.NUMERO = INF.NUMERO
inner join tabela_de_clientes TC on NF.CPF = TC.CPF
where year(DATA_VENDA) = 2016
group by TC.NOME, year(DATA_VENDA);



