use vk;

-- 1) Проанализировать запросы, которые выполнялись на занятии, определить возможные корректировки и/или улучшения (JOIN пока не применять).
-- среднее количество постов для каждого пользователя

select (select count(*) from posts) / (select count(*) from users) as avg_posts;

-- 2) Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

select from_user_id, to_user_id, count(from_user_id) from messages
where to_user_id=4 group by from_user_id order by count(from_user_id) desc; 

-- 3)Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

select count(user_id) from (select user_id 
from like_comments union all
select user_id
from like_photos union all
select user_id
from like_posts) as summ_likes
where user_id in (select id from (select id, birthday from users order by birthday desc limit 10) as younger_id);

-- 4)Определить кто больше поставил лайков (всего) - мужчины или женщины?

select case (gender)
		when 'f' then 'female'
	end as gender, count(*) from users where id in (select user_id
from (select user_id 
	from like_comments union all
	select user_id
	from like_photos union all
	select user_id
	from like_posts) as summ_likes
where user_id in (
select id from users where gender = 'f'))
union 
select 
case (gender)
		when 'm' then 'male'
	end as gender, count(*) from users where id in (select user_id
from (select user_id 
	from like_comments union all
	select user_id
	from like_photos union all
	select user_id
	from like_posts) as summ_likes
where user_id in (
select id from users where gender = 'm'))


-- 5)Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
-- Активность мерял по лайкам

select user_id, count(user_id) from (select user_id 
from like_comments union all
select user_id
from like_photos union all
select user_id
from like_posts) as summ_likes
group by user_id
order by count(user_id) 
limit 10;
