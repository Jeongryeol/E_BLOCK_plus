SELECT at_no, ask_eno, sign_eno, ask_date, at_sort, ask_rsn, at_sdate, at_fdate, at_days, outcome, sign_rsn, sign_date FROM `view_attd_list`
 WHERE ask_eno = 205#{e_no}
	AND outcome = '대기'#{outcome}
    AND at_sort = '휴가'#{at_sort}
    AND ask_date > '2018-09-27'#{ask_date}
;