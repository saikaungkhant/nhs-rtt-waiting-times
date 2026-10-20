-- Level 1

-- SELECT DISTINCT Provider_Org_Name FROM RTT_Waiting_Times;
-- SELECT COUNT(DISTINCT Provider_Org_Name) FROM RTT_Waiting_Times;
-- every period is June 2026, cant excute the query 

-- Level 2

-- SELECT COUNT(DISTINCT Treatment_Function_Name) FROM RTT_Waiting_Times;
-- SELECT DISTINCT Provider_Org_Name FROM RTT_Waiting_Times ORDER BY Provider_Org_Name;
-- SELECT * FROM RTT_Waiting_Times WHERE Provider_Parent_Name = 'NHS ESSEX INTEGRATED CARE BOARD';
-- SELECT DISTINCT RTT_Part_Description FROM RTT_Waiting_Times;

-- Level 3
/* SELECT TOP 1 Treatment_Function_Name, COUNT(*) AS row_count
FROM RTT_Waiting_Times
GROUP BY Treatment_Function_Name
ORDER BY row_count DESC; */

/*SELECT TOP 1 Provider_Org_Name, COUNT(*) AS row_count
FROM RTT_Waiting_Times
GROUP BY Provider_Org_Name
ORDER BY row_count DESC;*/

-- Convert the Total column from text to a number, then find the trust with the highest total patient count

/*SELECT 
	Provider_Org_Name,
	SUM (TRY_CONVERT(INT, Total_ALL)) AS TotalIncompletePatients
FROM RTT_Waiting_Times
WHERE RTT_Part_Description = 'Incomplete Pathways' 
 AND Treatment_Function_Name != 'Total'
GROUP BY Provider_Org_Name
Order BY TotalIncompletePatients DESC;*/

/*Level 4 — Real analyst questions

Which specialty has the longest waits? (You'll need to look at the Gt_52_To_53_Weeks type columns and sum them)
Which trust has the worst 52+ week backlog?
Rank trusts by their number of patients waiting over a year*/

/*SELECT 
    Treatment_Function_Name,
    SUM(
        TRY_CONVERT(INT, Gt_52_To_53_Weeks_SUM_1) +
        TRY_CONVERT(INT, Gt_53_To_54_Weeks_SUM_1) +
        TRY_CONVERT(INT, Gt_54_To_55_Weeks_SUM_1) +
        TRY_CONVERT(INT, Gt_55_To_56_Weeks_SUM_1) +
        TRY_CONVERT(INT, Gt_56_To_57_Weeks_SUM_1) +
        TRY_CONVERT(INT, Gt_57_To_58_Weeks_SUM_1) +
        TRY_CONVERT(INT, Gt_58_To_59_Weeks_SUM_1) +
        TRY_CONVERT(INT, Gt_59_To_60_Weeks_SUM_1) +
        TRY_CONVERT(INT, Gt_104_Weeks_SUM_1)
    ) AS OverAYearWaiting
FROM RTT_Waiting_Times
WHERE Treatment_Function_Name != 'Total'
  AND RTT_Part_Description = 'Incomplete Pathways'
GROUP BY Treatment_Function_Name
ORDER BY OverAYearWaiting DESC;*/

/*SELECT
	Provider_Org_Name,
	SUM(TRY_CONVERT(INT, Gt_52_To_53_Weeks_SUM_1)+
		TRY_CONVERT(INT, Gt_53_To_54_Weeks_SUM_1) +
        TRY_CONVERT(INT, Gt_54_To_55_Weeks_SUM_1) +
        TRY_CONVERT(INT, Gt_55_To_56_Weeks_SUM_1) +
        TRY_CONVERT(INT, Gt_56_To_57_Weeks_SUM_1) +
        TRY_CONVERT(INT, Gt_57_To_58_Weeks_SUM_1) +
        TRY_CONVERT(INT, Gt_58_To_59_Weeks_SUM_1) +
        TRY_CONVERT(INT, Gt_59_To_60_Weeks_SUM_1) +
        TRY_CONVERT(INT, Gt_104_Weeks_SUM_1)
    ) AS OverAYearWaiting
FROM RTT_Waiting_Times
WHERE Treatment_Function_Name !='Total'
    AND RTT_Part_Description = 'Incomplete Pathways'
GROUP BY Provider_Org_Name
ORDER BY OverAYearWaiting DESC;*?

/*Level 5 — Trends (once you load a second month's data)

Is the backlog getting better or worse month over month?*/