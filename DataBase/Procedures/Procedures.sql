--- Procedure 1
create procedure pr_1
   @personid int,
   @staffid  int, 
    @firstname varchar(50),
    @lastname varchar(50),
    @quantitysave int,
    @loginid varchar(50)
as
begin
   

  
   

  
    insert into person (personid, firstname, lastname)
    values (@personid, @firstname, @lastname)

   
    

    insert into staff (staffid, personid)
    values (@staffid, @personid)

    
    insert into staffsave (staffid, quantitysave)
    values (@staffid, @quantitysave)

    insert into [Authentication System]
	values(@loginid,1234)

    insert into staff_authentication (sttafid, loginid)
    values (@staffid, @loginid)
end


exec pr_1 
    @personid = 10,
	@staffid = 11,
    @firstname = 'merhdad',
    @lastname = 'alinaghi',
    @quantitysave = 5000,
    @loginid = 'fdlafha';




--- Procedure2
create procedure pr_2
    @authorid int
as
begin
 

 
    delete from author_book
    where authorid = @authorid

    delete from author
    where authorid = @authorid

    delete b 
    from author_book ab
    join book b on ab.[ISBN number] = b.ISBNnumber
    where ab.authorid = authorid 

	 delete author
	
	 from Author inner join person 
	on Author.PersonId = Person.PersonId
	where author.AuthorId = authorid


end



exec pr_2 @authorid= 1




--- Procedure3 
alter procedure pr_33
    @isbn_number int
as
begin



    declare @author_id int;
    declare @person_id int;
    declare @author_name varchar(100)

    create table #temp_authors
    (
        authorid int,
        personid int
    )

    insert into #temp_authors (authorid, personid)
    select author.authorid, author.personid
    from author_book
    inner join author on author_book.authorid = author.authorid
    where author_book.[ISBN number] = @isbn_number

    declare author_cursor cursor for
        select authorid, personid
        from #temp_authors


    open author_cursor


    fetch next from author_cursor into @author_id, @person_id

while @@fetch_status = 0
begin

        select @author_name =  name          
        from person as p
        where p.personid = @person_id

   
        print @author_name

       
        fetch next from author_cursor into @author_id, @person_id
    end;

    close author_cursor
    deallocate author_cursor


    drop table #temp_authors
end
