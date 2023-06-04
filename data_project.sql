insert into team values
(1, '������', '��������', '���������', '1977-02-02', '�����', 1020304050, '123-123-123 12', '123456789123', 'dementyev@yandex.ru'),
(2, '�����', '���������', '������', '1991-03-14', '����', 1020304051, '123-123-123 13', '123456789124', 'igoshin@inbox.ru'),
(3, '�����', '����������', '������', '1956-12-13', '��� ��. �.�. ����������', 1020304052, '123-123-123 14', '123456789125', 'saakyan@yandex.ru'),
(4, '�����', '����������', '���������', '1986-11-30', '���', 1020304053, '123-123-123 15', '123456789126', 'dobryakova@yandex.ru'),
(5, '������', '�����', '���������', '1969-11-11', '���� ��. �.�. ���������', 1020304054, '123-123-123 16', '123456789127', 'emelyanov@yandex.ru'),
(6, '�����', '�������', '��������', '1992-01-17', '���� ��. �.�. ���������', 1020304055, '123-123-123 17', '123456789128', 'roman_r@mail.ru'),
(7, '��������', '���������', '��������', '1980-04-01', '�����', 1020304056, '123-123-123 18', '123456789129', 'malahova@mail.ru'),
(8, '�������', '����������', '����������', '1968-07-19', '��� ��. �.�. ����������', 1020304057, '123-123-123 19', '123456789130', 'nataliya_p@mail.ru'),
(9, '����', '���������', '������', '1982-10-03', '�����', 1020304058, '123-123-123 20', '123456789131', 'ilya_amadov@yandex.ru'),
(10, '����', '�������������', '���������', '1989-12-09', '����', 1020304059, '123-123-123 21', '123456789132', 'anna_lu@yandex.ru')

insert into administration values
(3, '���. ��������� �� ���', 40, 1020304052, 89990001112),
(5, '��������', 28, 1020304054, 89990001100),
(7, '���. ��������� �� �����������', 19, 1020304056, 89990001134)

insert into teachers values 
(1, '������� ����������', 20, 1020304050, 12345612345),
(2, '������� �������', 6, 1020304051, 12345612340),
(4, '������� ���', 11, 1020304053, 12345612389),
(6, '������� �������� ����� � ����������', 4, 1020304055, 12345612382),
(8, '������� ���������� ��������', 25, 1020304057, 12345612410),
(9, '������� �����������', 12, 1020304058, 12345612416),
(10, '������� �����������', 8, 1020304059, 12345615691)

insert into school_classes values 
(1, '1 �'), (2, '2 �'), (3, '3 �'), (4, '4 �'), (5, '5 �'),
(6, '6 �'), (7, '7 �'), (8, '8 �'), (9, '9 �'), (10, '10 �')

insert into pupils values 
(1, '������', '�������', '����������', '2010-01-01', 6, '000-000-000 00'),
(2, '�����', '��������', '������', '2006-12-07', 10, '000-000-000 01'),
(3, '������', '����������', '�����', '2006-08-14', 10, '000-000-000 02'),
(4, '�����', '���������', '�������', '2009-03-24', 7, '000-000-000 03'),
(5, '������', '����������', '������', '2015-01-10', 1, '000-000-000 04'),
(6, '���������', '��������', '������', '2014-02-12', 2, '000-000-000 05'),
(7, '����', '��������', '���������', '2011-06-10', 5, '000-000-000 06'),
(8, '������', '��������', '���������', '2007-05-30', 9, '000-000-000 07'),
(9, '������', '���������', '�������', '2012-03-03', 4, '000-000-000 08'),
(10, 'ϸ��', '������������', '�����', '2008-09-16', 8, '000-000-000 09')

insert into class_teachers values 
(1, 10), (2, 1), (3, 9), (4, 2), (6, 8), (7, 7), (8, 4), (9, 5), (10, 6)

insert into parents values 
(1, '����', '��������', '�������', '1977-01-14', '111-111-111-00', 12121212120),
(2, '����', '��������', '����������', '1976-10-03', '111-111-111-01', 12121212121),
(3, '������', '��������', '�������', '1991-11-08', '111-111-111-02', 12121212122),
(4, '���������', '���������', '��������', '1989-06-01', '111-111-111-03', 12121212123),
(5, '��������', '����������', '�����', '1985-01-15', '111-111-111-04', 12121212124),
(6, '�����', '��������', '������', '1985-01-15', '111-111-111-05', 12121212125),
(7, '������', '��������', '������', '1980-02-18', '111-111-111-06', 12121212126)

insert into relation values 
(1, 2), (5, 3), (9, 4), (10, 5), (6, 6), (4, 7), 
(2, 2), (3, 7)

insert into school_subjects values 
(1, '�������'), (2, '������� ����'), (3, '����������'),
(4, '���'), (5, '������'), (6, '�����'),
(7, '���������� ����'), (8, '��������')

insert into schoolbooks values 
(1, 3, '����������. ������� �������. 6 �����', '�.�. ���������, �.�. ����', 6), 
(2, 3, '����������. ������� �������. 10 �����', '�.�. ���������, �.�. ����������', 10), 
(3, 1, '������� ������. XIX ���.', '�. �. Ը�����, �.�. ��������',9), 
(4, 2, '������� ����', '�. �. ������, �. �. �������', 7), 
(5, 6, '�����. ������� �������', '�.�. �����', 8), 
(6, 8, '��������', '�.�. �����', 5)

insert into classrooms values 
(1, 1, 432, '������� ����������'), (2, 2, 107, '������� ��������� �������'),
(3, 6, 425, '������� �������� �����'), (4, 9, 255, '������� �����������'),
(5, 10, 430, '������� �����������'), (6, 4, 103, '������� ��������� �������')



























