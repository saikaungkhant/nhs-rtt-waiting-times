# NHS Referral to Treatment (RTT) Waiting Times Analysis

A personal data analysis project using real NHS England waiting list data.
SQL Server is used to load, clean and query the data, and Power BI to visualise it.

## Question
Which NHS trusts and specialties have the most patients still waiting 52 weeks or more,
and how does that change across months?

## Data
- Source: [NHS England, Consultant-led Referral to Treatment Waiting Times](https://www.england.nhs.uk/statistics/statistical-work-areas/rtt-waiting-times/)
- Files used: monthly "Full CSV data file" extracts for April, May and June 2026
- About 182,000 rows and 121 columns per month
- The raw CSVs are not stored in this repo. Download them from the link above.

## Tools
SQL Server 2022 Express, SQL Server Management Studio, T-SQL, Power BI Desktop, DAX

## Repo contents
| Path | What it does |
|---|---|
| `sql/01_create_table.sql` | Creates the table with all 121 columns as NVARCHAR |
| `sql/02_load_data.sql` | BULK INSERT template for one monthly extract |
| `sql/03_exploration_and_practice.sql` | Exploration queries: distinct values, group and count, trust totals |
| `sql/04_over_52_weeks_by_trust_and_period_ORIGINAL.sql` | First version of the trend query (partial buckets, see limitations) |
| `sql/05_over_52_weeks_by_trust_and_period_CORRECTED.sql` | Full 52 weeks and over query, all 53 buckets |
| `powerbi/RTT_Waiting_Time.pbix` | Dashboard: Top N trusts bar chart, month slicer, dynamic title |

## Data issues found and fixed
1. **Import Wizard type guessing**: it picked smallint for a column that later held larger values and text such as "Total All". Fixed by creating the table with a script and loading with BULK INSERT.
2. **Commas inside quoted organisation names** shifted columns for some rows. Fixed with `FORMAT = 'CSV'` and `FIELDQUOTE`.
3. **Windows line endings**: `ROWTERMINATOR = '0x0a'` left a hidden carriage return in the last column, so every numeric conversion failed. Fixed with `'0x0d0a'`.
4. **Mixed text and numbers in count columns**: the columns stay NVARCHAR and are converted at query time with `TRY_CONVERT`.

## Analysis notes
- Each row is part of a monthly snapshot. Only `RTT_Part_Description = 'Incomplete Pathways'` (patients still waiting) is used for backlog figures. Mixing in completed pathways or new referrals would double count.
- Rows where `Treatment_Function_Name = 'Total'` are pre-computed subtotals and are excluded to avoid double counting.
- 52 weeks is the standard NHS long wait threshold.

## Known limitations
- The dashboard was built on the first version of the trend query, which only summed the 52 to 60 week buckets and the 104+ bucket. Its figures are understated. The corrected query is in `sql/05`.
- The Period slicer sorts alphabetically (April, June, May), not chronologically.
- Three months are loaded, so the trend view is short.

## How to reproduce
1. Install SQL Server Express and SSMS, then create a database called `NHS_Practice`.
2. Run `sql/01_create_table.sql`.
3. Download the monthly CSVs, edit the path in `sql/02_load_data.sql`, and run it once per file.
4. Run the queries in `sql/03` and `sql/05`.
5. Open the `.pbix` and point its data source at your own SQL Server instance.
