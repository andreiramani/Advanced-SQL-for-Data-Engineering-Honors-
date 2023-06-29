-- 11
select t1.name_of_school, t1.community_area_name, t1.average_student_attendance, t2.hardship_index
from chicagopublicschools as t1
left outer join chicagocensusdata as t2
on t1.community_area_number=t2.community_area_number
where t2.HARDSHIP_INDEX=98
order by t1.average_student_attendance desc

-- 12
select case_number, primary_type, location_description, t2.community_area_name
from chicagocrimedata as t1
inner join chicagocensusdata t2 on t1.community_area_number=t2.community_area_number
where lower(LOCATION_DESCRIPTION) like '%school%'
order by t2.community_area_name

-- 21
create or replace view school_icon(name_of_school, leaders_icon)
as select distinct(name_of_school), leaders_icon from chicagopublicschools;
select * from school_icon;

-- 31
--#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE (IN in_School_ID INTEGER, IN in_Leader_Score INTEGER)
  LANGUAGE SQL
 	BEGIN 

	END@

-- 32
--#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE (IN in_School_ID INTEGER, IN in_Leader_Score INTEGER)
  LANGUAGE SQL
  
	BEGIN 
	
		UPDATE CHICAGO_PUBLIC_SCHOOLS
		SET "Leaders_Score" = in_Leader_Score
		WHERE "School_ID" = in_School_ID;
			
	END@

-- 33
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE (IN in_School_ID INTEGER, IN in_Leader_Score INTEGER)
LANGUAGE SQL
  
	BEGIN 

		UPDATE CHICAGO_PUBLIC_SCHOOLS
		SET "Leaders_Score" = in_Leader_Score
		WHERE "School_ID" = in_School_ID;
			
		IF in_Leader_Score > 0 AND in_Leader_Score < 20 THEN
	      	UPDATE CHICAGO_PUBLIC_SCHOOLS
				SET "Leaders_Icon" = 'Very Weak';
	    ELSEIF in_Leader_Score < 40 THEN
	       	UPDATE CHICAGO_PUBLIC_SCHOOLS
				SET "Leaders_Icon" = 'Weak';	
	    ELSEIF in_Leader_Score < 60 THEN
	       	UPDATE CHICAGO_PUBLIC_SCHOOLS
				SET "Leaders_Icon" = 'Average';
	    ELSEIF in_Leader_Score < 80 THEN
	       	UPDATE CHICAGO_PUBLIC_SCHOOLS
				SET "Leaders_Icon" = 'Strong';
	    ELSEIF in_Leader_Score < 100 THEN
	       	UPDATE CHICAGO_PUBLIC_SCHOOLS
				SET "Leaders_Icon" = 'Very Strong';
	   	END IF;
		
	END@

-- 34
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE (IN in_School_ID INTEGER, IN in_Leader_Score INTEGER)
  LANGUAGE SQL
  
	BEGIN 

		UPDATE CHICAGO_PUBLIC_SCHOOLS
		SET "Leaders_Score" = in_Leader_Score
			WHERE "School_ID" = in_School_ID;
			
		IF in_Leader_Score > 0 AND in_Leader_Score < 20 THEN
	      	UPDATE CHICAGO_PUBLIC_SCHOOLS
				SET "Leaders_Icon" = 'Very Weak';
	    ELSEIF in_Leader_Score < 40 THEN
	       	UPDATE CHICAGO_PUBLIC_SCHOOLS
				SET "Leaders_Icon" = 'Weak';	
	    ELSEIF in_Leader_Score < 60 THEN
	       	UPDATE CHICAGO_PUBLIC_SCHOOLS
				SET "Leaders_Icon" = 'Average';
	    ELSEIF in_Leader_Score < 80 THEN
	       	UPDATE CHICAGO_PUBLIC_SCHOOLS
				SET "Leaders_Icon" = 'Strong';
	    ELSEIF in_Leader_Score < 100 THEN
	       	UPDATE CHICAGO_PUBLIC_SCHOOLS
				SET "Leaders_Icon" = 'Very Strong';
	   	END IF;
		
	END@

-- 41
-- 42
