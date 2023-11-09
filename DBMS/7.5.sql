SET SERVEROUTPUT ON
DECLARE
radius NUMBER(5,2) := &radius;
area NUMBER(5,2);
pi NUMBER(3,2) := 3.14;
BEGIN
area := radius * radius * pi;
DBMS_OUTPUT.PUT_LINE('Area is: ' || area);
INSERT INTO circle (radius, area) VALUES (radius, area);
END;
/