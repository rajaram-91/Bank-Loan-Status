select * from bank_loan_data

select count(id) as MTD_Total_Loan_Applications from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

select count(id) as PMTD_Total_Loan_Applications from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021

select concat('$',' ',round(sum(total_payment)*1.00/1000000,2),' ','M') as PMTD_Total_Amount_Received from bank_loan_data 
where month(issue_date) = 11 and year(issue_date) = 2021

select concat(round(avg(dti)*100,2),'%') as Avg_Dti from bank_loan_data

SELECT concat(round((Count(case when loan_status = 'Charged Off' then id end)*100.0)/
count(id),2),'%') as Bad_Loan_Applications_Percentage from bank_loan_data

select concat(round((count(id)*1.0/1000),2),'K') as Bad_Loan_Applications from bank_loan_data 
where loan_status = 'Charged Off'

 select
	loan_status,count(id) as Total_Applications,sum(loan_amount) as Total_Funded,
	sum(total_payment) as Total_Amount_Received,avg(int_rate * 100) as Interest_rate,
	avg(dti * 100) as DTI from bank_loan_data group by loan_status 

	select
	loan_status,sum(loan_amount) as MTD_Total_Funded,
	sum(total_payment) as MTD_Total_Amount_Received from bank_loan_data 
	where month(issue_date) = 12 and year(issue_date) = 2021 group by loan_status

	select
		Month(issue_date) as Month_number,datename(month,issue_date) as Month_name,count(id) as Total_Applications,
		sum(loan_amount) as Total_Funded,sum(total_payment) as Total_Amount_Received from bank_loan_data 
		group by Month(issue_date),datename(month,issue_date) order by Month_number

select
	term,count (id) as Total_Loan_Applications,sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Received_Amount from bank_loan_data group by term

	select
	home_ownership,count (id) as Total_Loan_Applications,sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Received_Amount from bank_loan_data group by home_ownership