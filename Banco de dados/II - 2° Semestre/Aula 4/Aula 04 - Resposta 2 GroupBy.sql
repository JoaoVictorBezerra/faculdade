use Imoveis
go

/*1. Liste o total de ofertas por comprador de 2008 a 2009 mostrando o total geral no final da listagem*/
Select cd_Comprador, sum(vl_Oferta) 
	From Oferta 
	Where Year(dt_Oferta) Between 2008 and 2009 
	Group by cd_Comprador with Rollup

/*2. Liste o valor m�dio de todos os Im�veis por bairro, somente do estado de S�o Paulo e coloque o resultado em ordem decrescente de valor.*/
Select cd_Bairro, cd_Cidade, sg_Estado, AVG(vl_Imovel) as Media
	From Imovel
	Group By cd_Bairro, cd_Cidade, sg_Estado
	Having sg_Estado = 'SP'
	Order by Media desc

/*3. Liste o maior valor de im�vel por vendedor, somente para os vendedores 1 e 2.*/
Select cd_Vendedor, MAX(vl_Imovel) Maior
	From Imovel
	Group By cd_Vendedor
	Having cd_Vendedor in (1,2)

/*4. Mostre a quantidade de im�veis cujo pre�o de venda seja inferior a 150 mil por Estado e a �rea total inferior a 300.*/
Select sg_Estado, COUNT(*) Total
	From Imovel
	Where vl_Imovel < 150000 and qt_AreaTotal < 300
	Group By sg_Estado
	
/*5. Escreva o comando para apresentar o pre�o m�dio dos Im�veis por 
c�digo de vendedor. Considere somente aqueles que custam mais de  100000 e o valor m�dio n�o ultrapasse 200000.*/
Select cd_Vendedor, AVG(vl_Imovel) Media
	From Imovel
	Where vl_Imovel > 100000 
	Group By cd_Vendedor
	Having AVG(vl_Imovel) <= 200000

/*6. Apresente o pre�o m�ximo, o pre�o m�nimo e o pre�o m�dio dos 
Im�veis cujos os estados s�o �SP�, �RJ� ou �MG� por c�digo de Cidade, colocar em ordem crescente de estado.*/
Select cd_Cidade, sg_Estado, MAX(vl_Imovel) Maior, 
       MIN(vl_Imovel) Menor, AVG(vl_Imovel) Media
	   From Imovel
	   Group By cd_Cidade, sg_Estado
	   Having sg_Estado in ('SP', 'RJ', 'MG')
	   Order By sg_Estado

/*7. Escreva o comando para apresentar o pre�o m�dio das ofertas por 
comprador, somente para as ofertas feitas em outubro de 2009.*/
Select cd_Comprador, AVG(vl_Oferta) Media
	From Oferta
	Where Month(dt_Oferta) = 10 and Year(dt_Oferta) = 2009
	Group By cd_Comprador
	
/*8. Mostre soma das ofertas por m�s, somente o ano de 2009, cujo 
valor esteja entre 100 mil e 250 mil.*/
Select Month(dt_Oferta), SUM(vl_Oferta)
	From Oferta
	Where Year(dt_Oferta) = 2009 and 
              vl_Oferta Between 100000 and 250000
	Group By Month(dt_Oferta)
	