# TO DISPLAY ALL THE RECORDS FROM THE TABLE
select* from sql_india.diabetes;

# TO DISPLAY ONE RECORD ADN COLUMN  FROM TABLE
select pregnancies from sql_india.diabetes;

#TO DISPLAY TWO OR MORE RECORDS FROM THE TABLE
select glucose,skinthickness,bmi from sql_india.diabetes;

#USING ALIAS TO DISPLAY THE COLUMNS
select bloodpressure as bp from sql_india.diabetes; -- this will show column name as given name without changing the actual name
select diabetespedigreefunction as dpf from sql_india.diabetes;

#ARITHMATIC OPERATOR#
-- TO SUBTRACT SKIN THICKNESS AND THE AGE FROM THE TABLE
select skinthickness-age as subtraction from sql_india.diabetes;

-- TO ADDING SKIN THICKNESS AND THE AGE FROM THE TABLE
select skinthickness+age as addition from sql_india.diabetes;

-- SHOW BOTH ADDITION AND SUBTRACTION OF AGE FROM THE TABLE
select skinthickness-age as subtraction, skinthickness+age as addition from sql_india.diabetes;

#COMPARISION OPERATOR#
-- DISPLAY ALL THE RECORDS WHOS AGE IS GREATER THEN AND EQUAL TO 25
select * from sql_india.diabetes where age>=25;

-- DISPLAY ALL THE RECORDS WHERE INSULIN IS NOT EQUAL TO 0
select * from sql_india.diabetes where Insulin!=0;

#LOGICAL OPERATORS#
-- TO DISPLAY ALL THE RECORDS HOWS AGE IS GRETER THAN 35 AND AND BLOODPRESSURE IS 80
select* from sql_india.diabetes where age>35 and BloodPressure=80;

-- TO DISPLAY ALL THE RECORDS WHO OUTCOMES IS 1
select * from sql_india.diabetes where Outcome=1;

-- TO DISPLAY ALL THE RECORDS WHOS PREGNANCIES IS NOT 3
select * from sql_india.diabetes where Pregnancies != 2;  -- APPROACH.1

select * from sql_india.diabetes where Pregnancies <> 2; -- APPROACH.2

select * from sql_india.diabetes where Pregnancies not in(2);  -- APPROACH.3

select * from sql_india.diabetes where not Pregnancies=2; -- APPROACH.4

-- DISPLAY ALL THE RECORDS WHOSE AGE IS LIES BETWEEN 20 TO 40
select * from sql_india.diabetes where age>20 and age<40;  -- APPROACH.1

select * from sql_india.diabetes where age between 20 and 40;  -- APPROACH.2

#MEMBERSHIP OPERATOR#
-- DISPLAY ALL THE RECORDS WHOSE DO NOT HAVE BLOODPRESSURE AND SKIN THICKNESS 
select * from sql_india.diabetes where BloodPressure=0 and skinthickness=0;

#LIKE OPERATOR#
-- TO DISPLAY ALL THE RECORDS WHOSE GLUCOSE LEVEL START WITH 5
select* from sql_india.diabetes where Glucose like "5%";

-- TO DISPLAY ALL THE RECORDS WHOSE DIABETES PREDIGREE FUNCTION LEVEL STARTS WITH 0 AND ANDS WITH 2
select* from sql_india.diabetes where DiabetesPedigreeFunction like "0%2";

-- TO DISPLAY THE RECORDS WHO HAVE HIGHEST BLOODPRESSURE 
select* from sql_india.diabetes order by BloodPressure desc limit 1;

-- DISPLAY AGE AND BMI IN ONE COLUMN ONLY FROM table USING CONCAT
select age and bmi, concat(age,'-',bmi) from sql_india.diabetes;

#group by#
-- TO DISPLAY SKINTHICKNESS AGE OF PERSON
select skinthickness,count(age) from sql_india.diabetes
group by SkinThickness;

-- TO DISPLAY BLOODPRESSURE MIN, MAX,AVG AGEWISE FROM TABLE
select age,min(bloodpressure) from sql_india.diabetes
group by age;

select age,max(bloodpressure) from sql_india.diabetes
group by age;

select age,avg(bloodpressure) from sql_india.diabetes
group by age;

#SUBQUERY
-- TO DISPLAY SECOND HIGHEST AGE FROM THE DATASET
select max(age) from sql_india.diabetes where age<>(select max(age) from sql_india.diabetes);
select * from sql_india.diabetes where age=(select max(age) from sql_india.diabetes where age<>(select max(age) from sql_india.diabetes));

-- 	TO DISPLAY ALL THE RECORDS WHOS BLOODPRESSURE IS MORE THAN THE PERSONE WHOS BMI IS BETWEEN 25 TO 40 
select * from sql_india.diabetes where BloodPressure > all (select BloodPressure from sql_india.diabetes where bmi between 25 and 40);

-- 	TO DISPLAY SECOND HIGHST GLUCOSE LEVEL FROM THE DATASET
select Glucose from sql_india.diabetes where  Pregnancies <>(select max(Pregnancies) from sql_india.diabetes);

#JOINS#
#inner join
select BloodPressure as bp,genre as gender
from sql_india.diabetes
join sql_india.mall_customers
on sql_india.diabetes.age=sql_india.mall_customers.age;

#left join
select bmi as bp,Customerid as id
from sql_india.diabetes
left join sql_india.mall_customers
on sql_india.diabetes.age=sql_india.mall_customers.age;

#right join
select Glucose as gl, genre as gender
from sql_india.diabetes
right join sql_india.mall_customers
on sql_india.diabetes.age=sql_india.mall_customers.age;

#union
select bmi as bp,Customerid as id
from sql_india.diabetes
left join sql_india.mall_customers
on sql_india.diabetes.age=sql_india.mall_customers.age
union
select Glucose as gl, genre as gender
from sql_india.diabetes
right join sql_india.mall_customers
on sql_india.diabetes.age=sql_india.mall_customers.age;

#union all
select bmi as bp,Customerid as id
from sql_india.diabetes
left join sql_india.mall_customers
on sql_india.diabetes.age=sql_india.mall_customers.age
union all
select Glucose as gl, genre as gender
from sql_india.diabetes
right join sql_india.mall_customers
on sql_india.diabetes.age=sql_india.mall_customers.age;

# cross join
select Insulin as Isn, CustomerID as id 
from sql_india.diabetes
cross join sql_india.mall_customers
on sql_india.diabetes.age=sql_india.mall_customers.age;

