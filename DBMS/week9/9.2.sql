set serveroutput on
declare
	p number(10);
	rate number(5);
	year number(4);
	intrest number(10,2);
	error_low exception;
begin
	p := & Principal;
	rate := & intrest;
	year := &year;
	if p <=1000 or rate < 5 or year < 1 then
	 	raise error_low;
	end if;
exception
	when error_low then
		dbms_output.put_line('Principle amount should be > 1000, interest rate > 5 and year > 1');
end;
/