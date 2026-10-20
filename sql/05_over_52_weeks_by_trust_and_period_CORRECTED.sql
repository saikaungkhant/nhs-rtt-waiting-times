-- Patients still waiting 52 weeks or more, by trust and month.
-- Sums every week bucket from Gt_52_To_53 up to Gt_104_Weeks (53 columns).
-- The earlier version of this query only summed 52-60 weeks and 104+,
-- so it understated the backlog. Use this one for any figures you quote.
-- ISNULL(...,0) stops one blank bucket from turning the whole row into NULL.

SELECT
    Provider_Org_Name,
    Period,
    SUM(
        ISNULL(TRY_CONVERT(INT, Gt_52_To_53_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_53_To_54_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_54_To_55_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_55_To_56_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_56_To_57_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_57_To_58_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_58_To_59_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_59_To_60_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_60_To_61_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_61_To_62_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_62_To_63_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_63_To_64_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_64_To_65_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_65_To_66_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_66_To_67_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_67_To_68_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_68_To_69_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_69_To_70_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_70_To_71_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_71_To_72_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_72_To_73_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_73_To_74_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_74_To_75_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_75_To_76_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_76_To_77_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_77_To_78_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_78_To_79_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_79_To_80_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_80_To_81_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_81_To_82_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_82_To_83_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_83_To_84_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_84_To_85_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_85_To_86_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_86_To_87_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_87_To_88_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_88_To_89_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_89_To_90_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_90_To_91_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_91_To_92_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_92_To_93_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_93_To_94_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_94_To_95_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_95_To_96_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_96_To_97_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_97_To_98_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_98_To_99_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_99_To_100_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_100_To_101_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_101_To_102_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_102_To_103_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_103_To_104_Weeks_SUM_1), 0) +
        ISNULL(TRY_CONVERT(INT, Gt_104_Weeks_SUM_1), 0)
    ) AS Waiting52WeeksPlus
FROM RTT_Waiting_Times
WHERE Treatment_Function_Name != 'Total'
  AND RTT_Part_Description = 'Incomplete Pathways'
GROUP BY Provider_Org_Name, Period
ORDER BY Provider_Org_Name, Period;
