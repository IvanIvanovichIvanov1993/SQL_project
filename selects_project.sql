
-- �����, �������, ��� �������,  ��� ��������� ������������

create or replace view pup (class, lastname, name, t_lname, t_fname, t_patr) as
select sc.class, p.lastname, p.firstname, t.lastname, t.firstname, t.patronymic  
from pupils p join team t join school_classes sc join class_teachers ct 
on p.class_id = sc.id and sc.id = ct.class_id and t.id = ct.class_teacher_id 

select * from pup


-- �������, �������� ��������, �����, ����� 

create or replace view subj (subject, book, author, class) as
select ss.subj_denomination, sb.book_denomination, sb.author, sb.book_grade
from school_subjects ss join schoolbooks sb
on sb.school_subj_id = ss.id 
order by subj_denomination 

select * from subj


-- �������, ��� ������, ��� ��������

select p.lastname pup_lstname, p.firstname pup_name, par.lastname par_lstname, 
par.firstname par_name, par.patronymic 
from pupils p join parents par join relation r 
on r.pupil_id = p.id and r.parent_id = par.id
order by pup_lstname


-- ���, �������, ��������� ������������, ����� ��������, �������� �������� � �����, ������� � ���� ��������

select t.firstname teacher_name, t.lastname teacher_lstname, c.num, c.title, sc.class
from team t join classrooms c join school_classes sc join class_teachers ct 
on t.id = c.worker_id and sc.id = ct.class_id and t.id = ct.class_teacher_id
order by num


-- ���������� ��������, ���������� ���������� ����

select count(id), education 
from team t 
group by education 
order by count(id)


-- ���������� �������� �������������, � ������� ������ 1 ������� � ������ 

select firstname, lastname from team 
where id in (select ct.class_teacher_id 
from class_teachers ct join pupils p join school_classes sc join team t 
on p.class_id = sc.id and sc.id = ct.class_id and t.id = ct.class_teacher_id
group by p.class_id 
having count(p.class_id) > 1);


-- ������� ���������, � ������� ������ 1 ������

select lastname, firstname, patronymic from parents 
where id in (select r.parent_id 
from relation r join pupils p join parents par
on r.pupil_id = p.id and r.parent_id = par.id
group by r.parent_id
having count(r.parent_id) > 1);


-- ����������, ������� ��� �������� �������� ����������� ������� �� �������� ������ 

drop procedure if exists until_pension;

delimiter //

create procedure until_pension (t_id int)
begin 
	declare num int;
	select work_experience into num from teachers where teacher_id = t_id;
	select t.firstname, t.patronymic, t.lastname, thr.specialization, (25 - num) pref_pens
from team t join teachers thr
where thr.teacher_id = t_id and t.id = t_id;
end //

delimiter ;

call until_pension (4);


-- �� ������� ������ ������� ���������, ����������� �� ��� 6.5 ���

drop trigger if exists check_pupils;

delimiter //

create trigger check_pupils before insert on pupils
for each row
begin 
	set new.birthday = new.birthday;
	if round((datediff(curdate(), new.birthday)) / 365.25, 2) < 6.51 then
		signal sqlstate '45000' set message_text = '������� ������ ����������� 6 ��� 6 �������!';
	end if;
end //

delimiter ;

insert into pupils values -- ���������
(16, '�����', '�������', '�������', '2015-08-31', 6, '642-045-000 00');


