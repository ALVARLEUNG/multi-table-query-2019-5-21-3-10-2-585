# 1.查询同时存在1课程和2课程的情况
select id,name,age,sex,courseId,score 
from student,student_course 
where student.id = student_course.studentId and courseId in (1,2);

# 2.查询同时存在1课程和2课程的情况
select s.id,s.name,s.sex,c.name,t.name,sc.score 
from student as s,student_course as sc,teacher as t, course as c 
where s.id = sc.studentId and  sc.courseId = c.id and c.teacherId = t.id and sc.courseId in (1,2);

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select s.id, s.name, AVG(score)
from student as s, student_course as sc
where s.id = sc.studentId
group by s.id
having avg(score)>60;

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
select * 
from student
where id not in (select studentId from student_course);

# 5.查询所有有成绩的SQL
select * 
from student
where id in (select studentId from student_course);

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select id,name,age,sex,courseId,score from student,student_course where student.id = student_course.studentId and courseId in (1,2);

# 7.检索1课程分数小于60，按分数降序排列的学生信息
select *
from student as s, student_course as sc
where s.id = sc.studentId and courseId = '1' and score<60
order by score desc;

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
select c.name, avg(score)
from course as c, student_course as sc
where c.id = sc.courseId
group by sc.courseId
order by avg(score) desc, c.id asc;

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
select s.name, sc.score
from student as s, student_course as sc, course as c
where s.id =sc.studentId and sc.courseId=c.id and c.name = '数学' and sc.score < 60;

