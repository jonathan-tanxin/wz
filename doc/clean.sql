delete from customer;
delete from course;
delete from address;
delete from customerbalancedetail;
delete from customercard;
delete from health;
delete from healthcomment;
delete from `order`;
delete from orderitem;
delete from pay;
delete from profit;
delete from profitdetail;
delete from profitphase;
update dish set totalsold = 0, monthsold = 0;
delete from distributioncenter; 