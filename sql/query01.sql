insert into code values ('100', '����');

insert into code values ('200', '����');

insert into code values ('300', '����');

select * from code;

commit;

show parameter processes;

drop table detail_code;


SELECT * FROM USER_SYS_PRIVS;

select * from detail_code
where group_code = 200;

select * from code;

select * from detail_code
where detail_name='������';

delete from detail_code
where group_code=200;

commit;