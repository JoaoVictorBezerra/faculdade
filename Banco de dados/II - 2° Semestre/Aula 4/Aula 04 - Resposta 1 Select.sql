-- 1.Liste todas as linhas e os campos cd_Comprador, nm_Comprador e ds_Email da tabela COMPRADOR

select cd_Comprador, nm_Comprador ,ds_Email
from comprador


-- 2.Liste todas as linhas e os campos cd_Vendedor, nm_Vendedor e ds_Email da tabela VENDEDOR em ordem alfabética

select cd_Vendedor, nm_Vendedor, ds_Email
from vendedor
order by nm_Vendedor;


-- 3.Liste as colunas cd_Imovel, cd_Vendedor e vl_Imovel de todos os imóveis do vendedor 2.

select cd_Imovel, cd_Vendedor, vl_Imovel
from imovel
where cd_Vendedor = 2;


-- 4.Liste as colunas cd_Imovel, cd_Vendedor, vl_Imovel e sg_Estado dos imóveis cujo preço de venda seja inferior a 150 mil e sejam do Estado do RJ.

select cd_Imovel, cd_Vendedor, vl_Imovel, sg_Estado
from imovel
where vl_Imovel < 150000 and sg_Estado = 'RJ';


-- 5.Liste as colunas cd_Imovel, cd_Vendedor, vl_Preco e sg_Estado dos imóveis cujo preço de venda seja inferior a 150 mil ou seja do vendedor não seja 2.

select cd_Imovel, cd_Vendedor, vl_Imovel, sg_Estado
from imovel
where vl_Imovel < 150000 or cd_Vendedor <> 2;


-- 6. Liste as colunas cd_Comprador, nm_Comprador, ds_Endereco e sg_Estado da tabela COMPRADOR em que o Estado seja nulo.

select cd_Comprador, nm_Comprador, ds_Endereco, sg_Estado
from comprador
where sg_Estado is null;


-- 7.Liste todas as ofertas cujo valor esteja entre 100 mil e 150 mil

select *
from oferta 
where vl_Oferta between 100000 and 150000;


-- 8. Liste todos os vendedores que tenham a letra A na segunda posição do nome.

select nm_Vendedor
from vendedor
where nm_Vendedor like '_A%';

-- 9. Liste todas as ofertas cujo imóvel seja 2 ou 3 e o valor da oferta seja maior que 130 mil, em ordem decrescente de data.

select *
from oferta
where cd_Imovel in (2,3) and vl_Oferta > 130000
Order by dt_Oferta desc

--10. Liste todos os imóveis cujo preço de venda esteja entre 110 mil e 200 mil ou seja do vendedor 1 em ordem de área útil.

select *
from imovel
where (vl_Imovel between 110000 and 200000) or cd_Vendedor = 1
order by qt_AreaUtil

--11. Mostre o maior, o menor, o total e a média de preço de venda dos imóveis.

Select Max(vl_Imovel) maior, Min(vl_Imovel) menor, Sum(vl_Imovel) Soma, Avg(vl_Imovel) media
From Imovel

--12. Modifique o comando anterior para que sejam mostrados os mesmos índices por bairro.

Select cd_Bairro, cd_Cidade, sg_Estado, Max(vl_Imovel) maior, Min(vl_Imovel) menor, Sum(vl_Imovel) Soma, Avg(vl_Imovel) media
From Imovel
Group by cd_Bairro, cd_Cidade, sg_Estado

--13. Faça uma busca que retorne o total de ofertas realizadas nos anos de 2008, 2009 e 2010.

select Sum(vl_Oferta)
from Oferta
Where Year(dt_Oferta) between 2008 and 2010


