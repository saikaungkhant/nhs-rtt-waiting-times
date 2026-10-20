-- Load one monthly NHS RTT full extract into dbo.RTT_Waiting_Times.
-- Replace the path with the location of the CSV on your own machine.
-- Run once per month. Do NOT truncate between months, rows are appended.
-- Months loaded in this project: April, May, June 2026.
--
-- Notes learned the hard way:
--   FORMAT = 'CSV' + FIELDQUOTE handles commas inside quoted org names.
--   ROWTERMINATOR = '0x0d0a' (CRLF). Using '0x0a' leaves a hidden \r in the
--   last column, which breaks every numeric conversion on Total_All.

BULK INSERT dbo.RTT_Waiting_Times
FROM 'C:\path\to\20260630-RTT-June-2026-full-extract.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0d0a',
    CODEPAGE = '65001',
    TABLOCK
);
GO

SELECT DISTINCT Period FROM RTT_Waiting_Times;
