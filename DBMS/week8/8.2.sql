SET SERVEROUTPUT ON;
DECLARE
   CURSOR cur IS
      SELECT p.prj_no, p.dno, p.prj_credit, p.prj_fund, d.dept_budget
      FROM proj p
      JOIN dept d ON p.dno = d.dno;
   
   v_total_alloc NUMBER;
BEGIN
   FOR rec IN cur
   LOOP

      v_total_alloc := (rec.prj_credit * 0.2) * rec.prj_fund;
      
      IF rec.prj_credit > 0 THEN
         v_total_alloc := (0.7 * v_total_alloc) / rec.prj_credit;
      ELSE
         v_total_alloc := 0;
      END IF;
      
      UPDATE dept SET dept_budget = dept_budget + (0.3 * v_total_alloc) WHERE dno = rec.dno;
      
      UPDATE emp
      SET sal = sal + v_total_alloc
      WHERE prj_id = rec.prj_no AND deptno = rec.dno;
     
      DBMS_OUTPUT.PUT_LINE('Project: ' || rec.prj_no);
      DBMS_OUTPUT.PUT_LINE('Department: ' || rec.dno);
      DBMS_OUTPUT.PUT_LINE('Incentive allocated to the department: ' || v_total_alloc * 0.3);
      DBMS_OUTPUT.PUT_LINE('Incentive allocated per employee: ' || v_total_alloc * 0.7 / rec.prj_credit);
      DBMS_OUTPUT.PUT_LINE('Amount added to the department budget: ' || v_total_alloc * 0.3);
   END LOOP;
   
   COMMIT;
END;
/