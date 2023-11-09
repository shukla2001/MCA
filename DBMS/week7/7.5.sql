set serveroutput on
declare
pi constant number(4,2) := 3.14;
v_radius circle.radius%type;
v_area circle.area%type;

begin
v_radius :=3;
while v_radius <=7 loop
  
v_area := pi * power(v_radius,2);
 
insert into circle values(v_radius, v_area);
 
v_radius := v_radius + 1;
   
end loop;
end;
/
