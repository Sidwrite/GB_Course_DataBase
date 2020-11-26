use vk;

alter table friend_requests 
alter status set default  'requested';

alter table users 
rename column creates_at TO created_at;