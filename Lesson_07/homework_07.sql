-- 1)	Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

select id, name from users where id in (select user_id from orders);


-- 2)	Выведите список товаров products и разделов catalogs, который соответствует товару.

select prod.id, prod.name, prod.price, 
cat.id as catalog_id,
cat.name as catalog
from products as prod
join
catalogs as cat
on
prod.catalog_id = cat.id;

-- 3)	(по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.

 
select id, c.name as 'from', d.name as 'to'
from flights as f
join cities as c on f.from = c.label 
join cities as d on f.to = d.label
order by id
