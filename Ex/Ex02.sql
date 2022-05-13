/**********************
* 그룹함수
***********************/
/*
select  first_name,
         sum(salary)
from employees;
*/
select sum(salary)
from employees;

--그룹함수 - count()
select  *
from employees;

select  count(*),
        count(commission_pct),  --commission_pct 컬럼의 null 카운트에서 제외
        count(manager_id)
from employees;

select count(*)
from employees
where salary > 16000;

--그룹함수 - sum()
select  count(salary),
        sum(salary)
from employees;

--그룹함수 - avg()
select  avg(salary),        --급여가 null인 사람은 평균계산 제외 
        avg(nvl(salary, 0)), --null인값은 0으로 변경후 평균계산
        round(avg(salary), 0),  -- 반올림
        count(*),
        sum(salary)
from employees;

--그룹함수 - max() / min()
select  max(salary),
        min(salary),
        count(*)
from employees;

--GROUP BY 절
--절 구성
select first_name
from employees
where salary > 16000
order by salary desc;

/*
select  department_id,  -- 여러개
        avg(salary) --전체평균 1개
from employees;
*/

select  department_id,
        job_id,
        avg(salary),  -- department_id(부서별 평균)
        sum(salary),  -- department_id(부서별 합계)
        count(salary) -- department_id(부서별 카운트)
from employees
group by department_id, job_id
order by department_id asc;

--연봉(salary)의 합계가 20000 이상인 부서의 
--부서 번호와 , 인원수, 급여합계를 출력하세요
select  department_id,
        count(*),
        sum(salary)
from employees
where sum(salary)>= 20000   --where절에는 그룹함수를 쓸수 없다
group by department_id;

--having 절
--정상
select  department_id,
        count(*),
        sum(salary)
from employees
group by department_id
having sum(salary) >= 20000
and sum(salary) <= 100000
and department_id = 90;

--오류
select  department_id,
        count(*),
        sum(salary)
from employees
group by department_id
having sum(salary) >= 20000
and sum(salary) <= 100000
and department_id = 90
and hire_date >= '04/01/01';   /*having 절에는 그룹함수 와 
                                 Group by에 참여한 컬럼만 사용할 수 있다.
                                */
