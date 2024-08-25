print SUBSTRING('Hussein',1,3);

print len('Hussein');

print Upper('Hussein');

print lower('Hussein');

print  '        Hussein        ';
print trim('        Hussein        ');
print ltrim('        Hussein        ');
print rtrim('        Hussein        ');


print 'Hussein' + replicate('0',5);

print replace('Hussein','s','@')

print getDate()
print getDate() - 2


print sysdatetime()

print Dateadd(second,10,getDate());
print Dateadd(minute,10,getDate());
print Dateadd(hour,10,getDate());
print Dateadd(day,10,getDate());
print Dateadd(month,10,getDate());
print Dateadd(year,10,getDate());

print format(getdate(),'yyyy-MMM-dd');


declare @x int;
select @x = COUNT(1) from production.products;
print @x;

declare @y int;
set @y = ( select COUNT(1) from production.products);
print @y;


select Nullif(order_status,4) from sales.orders

select coalesce(Null,Null,Null,'Ahmed')


select case when list_price < 300 then 'Hello'
			when list_price > 500 then 'Ma'
			else 'Mano'
			end
from production.products;

select iif(list_price > 500,'Big','small') from production.products

select Sum(case
			when order_status = 1
			then 1
			else 0
			end) as 'Pending'
from sales.orders