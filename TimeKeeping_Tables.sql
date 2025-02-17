USE [master]
GO
CREATE DATABASE [TimeKeeping]
GO
ALTER DATABASE [TimeKeeping] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TimeKeeping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TimeKeeping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TimeKeeping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TimeKeeping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TimeKeeping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TimeKeeping] SET ARITHABORT OFF 
GO
ALTER DATABASE [TimeKeeping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TimeKeeping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TimeKeeping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TimeKeeping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TimeKeeping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TimeKeeping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TimeKeeping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TimeKeeping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TimeKeeping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TimeKeeping] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TimeKeeping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TimeKeeping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TimeKeeping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TimeKeeping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TimeKeeping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TimeKeeping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TimeKeeping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TimeKeeping] SET RECOVERY FULL 
GO
ALTER DATABASE [TimeKeeping] SET  MULTI_USER 
GO
ALTER DATABASE [TimeKeeping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TimeKeeping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TimeKeeping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TimeKeeping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TimeKeeping] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TimeKeeping] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TimeKeeping', N'ON'
GO
ALTER DATABASE [TimeKeeping] SET QUERY_STORE = ON
GO
ALTER DATABASE [TimeKeeping] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TimeKeeping]
GO
/****** Object:  Table [dbo].[account]    Script Date: 10/7/2024 5:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[accountid] [int] IDENTITY(1,1) NOT NULL,
	[address] [varchar](255) NULL,
	[birth_date] [datetime2](6) NULL,
	[code_bank] [int] NOT NULL,
	[email] [varchar](255) NULL,
	[full_name] [nvarchar](255) NULL,
	[gender] [varchar](255) NULL,
	[hire_date] [datetime2](6) NULL,
	[image_paths] [text] NULL,
	[password] [varchar](255) NULL,
	[phone_number] [varchar](255) NULL,
	[status] [varchar](255) NULL,
	[username] [varchar](255) NULL,
	[department_id] [int] NULL,
	[position_id] [int] NULL,
	[role_id] [int] NULL,
	[salaryid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[accountid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[activity]    Script Date: 10/7/2024 5:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[activity](
	[activity_id] [int] IDENTITY(1,1) NOT NULL,
	[activity_name] [varchar](255) NULL,
	[budget] [float] NOT NULL,
	[description] [ntext] NULL,
	[location] [varchar](255) NULL,
	[start_time] [datetime2](6) NULL,
	[type] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[activity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[activity_notification]    Script Date: 10/7/2024 5:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[activity_notification](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[content] [varchar](255) NULL,
	[is_read] [bit] NOT NULL,
	[notification_time] [datetime2](6) NULL,
	[account_id] [int] NULL,
	[activity_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[attendance_record]    Script Date: 10/7/2024 5:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attendance_record](
	[recordid] [int] IDENTITY(1,1) NOT NULL,
	[clock_in_time] [datetime2](6) NULL,
	[clock_out_time] [datetime2](6) NULL,
	[date] [date] NULL,
	[formatted_working_hours] [varchar](255) NULL,
	[notes] [varchar](255) NULL,
	[status] [varchar](255) NULL,
	[account_id] [int] NULL,
	[shift_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[recordid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bonus]    Script Date: 10/7/2024 5:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bonus](
	[bonusid] [int] IDENTITY(1,1) NOT NULL,
	[amount] [float] NOT NULL,
	[bonus_type] [nvarchar](255) NULL,
	[payroll_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[bonusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[candidate]    Script Date: 10/7/2024 5:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[candidate](
	[candidateid] [int] IDENTITY(1,1) NOT NULL,
	[candidate_date] [date] NOT NULL,
	[date_of_birth] [datetime2](6) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[first_name] [varchar](255) NOT NULL,
	[gender] [varchar](255) NULL,
	[last_name] [varchar](255) NOT NULL,
	[location] [varchar](255) NOT NULL,
	[phone_number] [varchar](255) NULL,
	[profile_picture] [varchar](255) NULL,
	[profile_picture_path] [varchar](255) NULL,
	[requirements] [varchar](255) NOT NULL,
	[resume] [varchar](255) NOT NULL,
	[status] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[candidateid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[deduction]    Script Date: 10/7/2024 5:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deduction](
	[deductionid] [int] IDENTITY(1,1) NOT NULL,
	[amount] [float] NOT NULL,
	[deduction_type] [varchar](255) NULL,
	[description] [varchar](255) NULL,
	[payroll_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[deductionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[department]    Script Date: 10/7/2024 5:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[job]    Script Date: 10/7/2024 5:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[job](
	[jobid] [int] IDENTITY(1,1) NOT NULL,
	[closing_date] [datetime2](6) NULL,
	[description] [varchar](255) NULL,
	[experience_years] [int] NOT NULL,
	[location] [varchar](255) NULL,
	[path] [varchar](255) NULL,
	[posting_date] [datetime2](6) NULL,
	[requirements] [varchar](255) NULL,
	[salary_range] [varchar](255) NULL,
	[status] [varchar](255) NULL,
	[title] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[jobid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[participation]    Script Date: 10/7/2024 5:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[participation](
	[participate_id] [int] IDENTITY(1,1) NOT NULL,
	[reason] [varchar](255) NULL,
	[status] [varchar](255) NULL,
	[account_id] [int] NULL,
	[id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[participate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payroll]    Script Date: 10/7/2024 5:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll](
	[payrollid] [int] IDENTITY(1,1) NOT NULL,
	[created_at] [datetime2](6) NULL,
	[gross_salary] [float] NOT NULL,
	[net_salary] [float] NOT NULL,
	[pay_date] [date] NULL,
	[accountid] [int] NULL,
	[salaryid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[payrollid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[position]    Script Date: 10/7/2024 5:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[position](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recruitment]    Script Date: 10/7/2024 5:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recruitment](
	[recruitmentid] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[end_date] [datetime2](6) NOT NULL,
	[interview_date] [datetime2](6) NOT NULL,
	[interview_type] [varchar](255) NOT NULL,
	[location] [varchar](255) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[notes] [varchar](255) NOT NULL,
	[start_date] [datetime2](6) NOT NULL,
	[status] [varchar](255) NOT NULL,
	[account_id] [int] NOT NULL,
	[job_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[recruitmentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[region]    Script Date: 10/7/2024 5:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[region](
	[regionid] [int] IDENTITY(1,1) NOT NULL,
	[minimum_wage] [float] NOT NULL,
	[region_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[regionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[requestion]    Script Date: 10/7/2024 5:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[requestion](
	[requestid] [int] IDENTITY(1,1) NOT NULL,
	[accountid] [int] NOT NULL,
	[approverid] [varchar](255) NULL,
	[end_date] [datetime2](6) NOT NULL,
	[reason] [nvarchar](255) NULL,
	[request_date] [datetime2](6) NULL,
	[request_name] [nvarchar](255) NOT NULL,
	[start_date] [datetime2](6) NOT NULL,
	[status] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[requestid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 10/7/2024 5:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[roleid] [int] IDENTITY(1,1) NOT NULL,
	[active] [bit] NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salary_template]    Script Date: 10/7/2024 5:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salary_template](
	[salaryid] [int] IDENTITY(1,1) NOT NULL,
	[base_salary] [float] NOT NULL,
	[effective_date] [date] NULL,
	[expiry_date] [date] NULL,
	[grade_name] [varchar](255) NULL,
	[regionid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[salaryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shift]    Script Date: 10/7/2024 5:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shift](
	[shift_id] [int] IDENTITY(1,1) NOT NULL,
	[end_time] [time](7) NULL,
	[shift_name] [nvarchar](255) NULL,
	[start_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[shift_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[work_schedule]    Script Date: 10/7/2024 5:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[work_schedule](
	[schedule_id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[status] [nvarchar](255) NULL,
	[account_id] [int] NULL,
	[shift_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK8vgcbp37ert4cyxml4eb3rvgo]    Script Date: 10/7/2024 5:07:44 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK8vgcbp37ert4cyxml4eb3rvgo] ON [dbo].[job]
(
	[title] ASC
)
WHERE ([title] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FK5l70ejb7b4p3fvj8as9clgtwo] FOREIGN KEY([department_id])
REFERENCES [dbo].[department] ([id])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK5l70ejb7b4p3fvj8as9clgtwo]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FKb4why7d2tbw5aw163rucgrswl] FOREIGN KEY([position_id])
REFERENCES [dbo].[position] ([id])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FKb4why7d2tbw5aw163rucgrswl]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FKd4vb66o896tay3yy52oqxr9w0] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([roleid])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FKd4vb66o896tay3yy52oqxr9w0]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FKfv6bkep1ku8w6vffshwc7kns5] FOREIGN KEY([salaryid])
REFERENCES [dbo].[salary_template] ([salaryid])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FKfv6bkep1ku8w6vffshwc7kns5]
GO
ALTER TABLE [dbo].[activity_notification]  WITH CHECK ADD  CONSTRAINT [FKiq356jp3bxtfiq9x2jd0haylm] FOREIGN KEY([activity_id])
REFERENCES [dbo].[activity] ([activity_id])
GO
ALTER TABLE [dbo].[activity_notification] CHECK CONSTRAINT [FKiq356jp3bxtfiq9x2jd0haylm]
GO
ALTER TABLE [dbo].[activity_notification]  WITH CHECK ADD  CONSTRAINT [FKp3fyhj8oceqcl7vns5w10w4ww] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([accountid])
GO
ALTER TABLE [dbo].[activity_notification] CHECK CONSTRAINT [FKp3fyhj8oceqcl7vns5w10w4ww]
GO
ALTER TABLE [dbo].[attendance_record]  WITH CHECK ADD  CONSTRAINT [FK1eijr5wcwv9u72obmdywvuicr] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([accountid])
GO
ALTER TABLE [dbo].[attendance_record] CHECK CONSTRAINT [FK1eijr5wcwv9u72obmdywvuicr]
GO
ALTER TABLE [dbo].[attendance_record]  WITH CHECK ADD  CONSTRAINT [FKot5j5u6pn6mmgfa34egurs72q] FOREIGN KEY([shift_id])
REFERENCES [dbo].[shift] ([shift_id])
GO
ALTER TABLE [dbo].[attendance_record] CHECK CONSTRAINT [FKot5j5u6pn6mmgfa34egurs72q]
GO
ALTER TABLE [dbo].[bonus]  WITH CHECK ADD  CONSTRAINT [FK88h5s1jmuyqk6gdmyhm0pqghs] FOREIGN KEY([payroll_id])
REFERENCES [dbo].[payroll] ([payrollid])
GO
ALTER TABLE [dbo].[bonus] CHECK CONSTRAINT [FK88h5s1jmuyqk6gdmyhm0pqghs]
GO
ALTER TABLE [dbo].[deduction]  WITH CHECK ADD  CONSTRAINT [FKgbj0xoia2jd7xrqss0m5eblh0] FOREIGN KEY([payroll_id])
REFERENCES [dbo].[payroll] ([payrollid])
GO
ALTER TABLE [dbo].[deduction] CHECK CONSTRAINT [FKgbj0xoia2jd7xrqss0m5eblh0]
GO
ALTER TABLE [dbo].[participation]  WITH CHECK ADD  CONSTRAINT [FK310irnkb4pyb3prm007vkup3r] FOREIGN KEY([id])
REFERENCES [dbo].[activity_notification] ([id])
GO
ALTER TABLE [dbo].[participation] CHECK CONSTRAINT [FK310irnkb4pyb3prm007vkup3r]
GO
ALTER TABLE [dbo].[participation]  WITH CHECK ADD  CONSTRAINT [FK6qxsa7c58u2xoevg1w22axivs] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([accountid])
GO
ALTER TABLE [dbo].[participation] CHECK CONSTRAINT [FK6qxsa7c58u2xoevg1w22axivs]
GO
ALTER TABLE [dbo].[payroll]  WITH CHECK ADD  CONSTRAINT [FK9711t1ln4jjtq7uhoowyk2fxf] FOREIGN KEY([salaryid])
REFERENCES [dbo].[salary_template] ([salaryid])
GO
ALTER TABLE [dbo].[payroll] CHECK CONSTRAINT [FK9711t1ln4jjtq7uhoowyk2fxf]
GO
ALTER TABLE [dbo].[payroll]  WITH CHECK ADD  CONSTRAINT [FKdose1d9y2a92bg90noc8ukf8k] FOREIGN KEY([accountid])
REFERENCES [dbo].[account] ([accountid])
GO
ALTER TABLE [dbo].[payroll] CHECK CONSTRAINT [FKdose1d9y2a92bg90noc8ukf8k]
GO
ALTER TABLE [dbo].[recruitment]  WITH CHECK ADD  CONSTRAINT [FKks8nxupq3e2gfwbax3rod181d] FOREIGN KEY([job_id])
REFERENCES [dbo].[job] ([jobid])
GO
ALTER TABLE [dbo].[recruitment] CHECK CONSTRAINT [FKks8nxupq3e2gfwbax3rod181d]
GO
ALTER TABLE [dbo].[recruitment]  WITH CHECK ADD  CONSTRAINT [FKm7m73wajuuhoxq4ux5afdcn1d] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([accountid])
GO
ALTER TABLE [dbo].[recruitment] CHECK CONSTRAINT [FKm7m73wajuuhoxq4ux5afdcn1d]
GO
ALTER TABLE [dbo].[salary_template]  WITH CHECK ADD  CONSTRAINT [FKmnrf3mkgkfdwv91gpwd1sxi5x] FOREIGN KEY([regionid])
REFERENCES [dbo].[region] ([regionid])
GO
ALTER TABLE [dbo].[salary_template] CHECK CONSTRAINT [FKmnrf3mkgkfdwv91gpwd1sxi5x]
GO
ALTER TABLE [dbo].[work_schedule]  WITH CHECK ADD  CONSTRAINT [FK3jj0rdtm4k9m6tr3j8pxkv1nl] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([accountid])
GO
ALTER TABLE [dbo].[work_schedule] CHECK CONSTRAINT [FK3jj0rdtm4k9m6tr3j8pxkv1nl]
GO
ALTER TABLE [dbo].[work_schedule]  WITH CHECK ADD  CONSTRAINT [FKecv0f0fbx9xaugnudb23j73yf] FOREIGN KEY([shift_id])
REFERENCES [dbo].[shift] ([shift_id])
GO
ALTER TABLE [dbo].[work_schedule] CHECK CONSTRAINT [FKecv0f0fbx9xaugnudb23j73yf]
GO
ALTER TABLE [dbo].[activity]  WITH CHECK ADD CHECK  (([type]='OPTIONAL' OR [type]='MANDATORY'))
GO
ALTER TABLE [dbo].[participation]  WITH CHECK ADD CHECK  (([status]='REASON_DENIED' OR [status]='REASON_APCEPTED' OR [status]='DENIED' OR [status]='JOINED'))
GO
ALTER TABLE [dbo].[work_schedule]  WITH CHECK ADD CHECK  (([status]='REJECTED' OR [status]='APPROVED' OR [status]='PENDING'))
GO
USE [master]
GO
ALTER DATABASE [TimeKeeping] SET  READ_WRITE 
GO
