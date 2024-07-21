create view student_information as
select St_Fname+' '+St_Lname as "full name",Crs_Name from Stud_Course sc,Student s,Course c
where c.Crs_Id=sc.Crs_Id and s.St_Id=sc.St_Id and Grade>50
/****/
go
create view Instructor_Department as
select i.Ins_Name,d.Dept_Name from Instructor i,Department d
where i.Dept_Id=d.Dept_Id and (d.Dept_Name='SD' or d.Dept_Name='Java')
/****/
go
create view student_data as
select s.Dept_Id,s.St_Address,s.St_Age,s.St_Fname,s.St_Id,s.St_Lname,s.St_super  from Student s
where s.St_Address in ('Alex','Cairo') with check option

Update student_data  set st_address='tanta'
Where st_address='Alex'
/*The attempted insert or update failed because the target view either
specifies WITH CHECK OPTION or spans a view that specifies WITH CHECK OPTION
and one or more rows resulting from the operation did not qualify under the CHECK OPTION constraint.*/
/****/
go
Use Company_SD
go
create view project_employee as
select p.Pname,COUNT(ESSn) 'number of emplyee in this project' from Works_for w,Project p
where w.Pno=p.Pnumber
group by w.Pno,p.Pname
/****/
go
CREATE CLUSTERED INDEX index1 ON dbo.departments ([MGRStart Date])
/*Cannot create more than one clustered index on table 'dbo.departments'.
Drop the existing clustered index 'PK_Departments' before creating another.*/
/****/
use ITI
CREATE unique INDEX unique_age ON dbo.Student ([St_age])
/*Msg 1505, Level 16, State 1, Line 37
The CREATE UNIQUE INDEX statement terminated because a duplicate key
was found for the object name 'dbo.Student' and the index name 'unique_age'.
The duplicate key value is (21).*/
/****/
create table daily_trans(
[user_id] int,
Trans_Amount smallmoney
)
insert into daily_trans
values (1,1000),(2,2000),(3,1000)

create table last_trans(
[user_id] int,
Trans_Amount smallmoney
)
insert into last_trans
values (1,4000),(4,2000),(2,10000)

Merge into [dbo].[last_trans] as T 
using [dbo].[daily_trans] as S
On T.[user_id]=S.[user_id]

When matched then
update set T.Trans_Amount=S.Trans_Amount

When not matched by target Then 
insert([user_id],Trans_Amount)
values(S.[user_id],Trans_Amount);
/****/











