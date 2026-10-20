SELECT 
    Provider_Org_Name,
    Period,
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
GROUP BY Provider_Org_Name, Period
ORDER BY Provider_Org_Name, Period;