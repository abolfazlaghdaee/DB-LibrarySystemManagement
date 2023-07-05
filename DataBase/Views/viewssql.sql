--- view1
CREATE view  [dbo].[vw_1] 
as
select  name, count(*) as Countofloanedbook  from Reader_book as RB inner join Reader on Reader.UserId=  RB.UserId
inner join Person as p on p.PersonId= Reader.PersonId
group by   RB.UserId, name
GO



--- view2
CREATE view [dbo].[vw_2]
as
select Title, Edition, Category, Name,PublishDAte, Price   from Publisher as P inner join Publisher_Book as PB on P.PublisherId = PB.PublisherId
inner join Book as B on B.ISBNnumber= PB.[ISBN number]
GO





---- view3
create view [dbo].[vw_3] 
as
select Name,Title , [Order]   from  Author as A inner join Author_Book as AB on 
A.AuthorId = AB.AuthorId
inner join Book as B on 
B.[ISBNnumber] = AB.[ISBN number] inner join 
Person as P on P.PersonId= A.PersonId
GO



--- view4
create view [dbo].[vw_4]
as
select Name, QuantitySave, CountofGet, CountofGive  from 
(select staffId, count(GiveDate)as CountofGive, count(GetDate)as CountofGet from 
Staff_reader
group by staffId ) as A inner join staffsave on A.StaffId = staffsave.StaffId
inner join staff on staff.staffId= staffsave.staffId
inner join Person on Person.PersonId= staff.personId
GO


