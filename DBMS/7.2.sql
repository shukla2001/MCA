set serveroutput on
declare
    strinput varchar2(10) := '&strinput';
    palindrome varchar2(10);
BEGIN
    for i in REVERSE 1..LENGTH(strinput) loop
        palindrome:=palindrome||substr(strinput,i,1);
    end loop;
    if(strinput=palindrome) then
        dbms_output.put_line('The string is palindrome '||palindrome);
    ELSE
        dbms_output.put_line('The string is not palindrome '||palindrome);
    end if;
end;
/