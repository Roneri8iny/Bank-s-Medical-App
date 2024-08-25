USE [master]
GO
/****** Object:  Database [Bank Medical DB]    Script Date: 8/25/2024 12:37:27 PM ******/
CREATE DATABASE [Bank Medical DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bank Medical DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Bank Medical DB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bank Medical DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Bank Medical DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Bank Medical DB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bank Medical DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bank Medical DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bank Medical DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bank Medical DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bank Medical DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bank Medical DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bank Medical DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bank Medical DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bank Medical DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bank Medical DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bank Medical DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bank Medical DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bank Medical DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bank Medical DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bank Medical DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bank Medical DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bank Medical DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bank Medical DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bank Medical DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bank Medical DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bank Medical DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bank Medical DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bank Medical DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bank Medical DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bank Medical DB] SET  MULTI_USER 
GO
ALTER DATABASE [Bank Medical DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bank Medical DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bank Medical DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bank Medical DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bank Medical DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bank Medical DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Bank Medical DB] SET QUERY_STORE = ON
GO
ALTER DATABASE [Bank Medical DB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Bank Medical DB]
GO
/****** Object:  User [nbe]    Script Date: 8/25/2024 12:37:27 PM ******/
CREATE USER [nbe] FOR LOGIN [nbe] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 8/25/2024 12:37:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[SlotID] [int] NULL,
	[EmployeeID] [int] NULL,
	[ApStatus] [int] NOT NULL,
	[Diagnosis] [nvarchar](max) NULL,
	[FinanceID] [int] NULL,
	[SLDStart] [date] NULL,
	[SLDEnd] [date] NULL,
	[AppointmentDate] [date] NULL,
 CONSTRAINT [PK__Appointm__8ECDFCA24EC6F503] PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 8/25/2024 12:37:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Departme__B2079BCD8C937218] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 8/25/2024 12:37:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[DoctorID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NULL,
	[MFID] [int] NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[DoctorName] [nvarchar](100) NULL,
	[Position] [nvarchar](100) NOT NULL,
	[DoctorPassword] [nvarchar](50) NOT NULL,
	[Mobile] [bigint] NOT NULL,
 CONSTRAINT [PK__Doctor__2DC00EDFB4F3AC09] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 8/25/2024 12:37:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Photo] [nvarchar](200) NOT NULL,
	[EmployeeName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Employee__7AD04FF1578CB1DE] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Finance]    Script Date: 8/25/2024 12:37:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Finance](
	[FinanceID] [int] IDENTITY(1,1) NOT NULL,
	[FinancePassword] [nvarchar](100) NOT NULL,
	[FinanceName] [nvarchar](100) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Finance__7917A8FFEE5F5F16] PRIMARY KEY CLUSTERED 
(
	[FinanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LabReports]    Script Date: 8/25/2024 12:37:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabReports](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentID] [int] NULL,
	[PayStatus] [int] NOT NULL,
	[LabName] [nvarchar](100) NULL,
	[ReportDate] [date] NOT NULL,
 CONSTRAINT [PK__LabRepor__D5BD48E5E892B0BB] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LabReportsDetails]    Script Date: 8/25/2024 12:37:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabReportsDetails](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[ReportID] [int] NULL,
	[TestID] [int] NULL,
	[FinancialApprovalStatus] [int] NOT NULL,
	[ResultPDF] [nvarchar](300) NULL,
 CONSTRAINT [PK__LabRepor__135C314DF698735D] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalField]    Script Date: 8/25/2024 12:37:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalField](
	[MFID] [int] IDENTITY(1,1) NOT NULL,
	[MMID] [int] NULL,
	[Username] [nvarchar](100) NOT NULL,
	[MFName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[MFPassword] [nvarchar](100) NOT NULL,
	[Hotline] [bigint] NOT NULL,
	[MFAddress] [nvarchar](100) NOT NULL,
	[MFType] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__MedicalF__1B48A421C1EE1CDA] PRIMARY KEY CLUSTERED 
(
	[MFID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicines]    Script Date: 8/25/2024 12:37:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicines](
	[MedicineID] [int] IDENTITY(1,1) NOT NULL,
	[MedicineName] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK__Medicine__4F2128F07CFC9BE8] PRIMARY KEY CLUSTERED 
(
	[MedicineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MiddleMan]    Script Date: 8/25/2024 12:37:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MiddleMan](
	[MMID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[MMName] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[MMPassword] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__MiddleMa__6D0F547208104DAA] PRIMARY KEY CLUSTERED 
(
	[MMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescriptions]    Script Date: 8/25/2024 12:37:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescriptions](
	[PrescriptionID] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentID] [int] NULL,
	[RenewalStatus] [int] NOT NULL,
	[Monthly] [bit] NOT NULL,
	[SupplyDate] [date] NULL,
 CONSTRAINT [PK__Prescrip__40130812CB728D0A] PRIMARY KEY CLUSTERED 
(
	[PrescriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrescriptionsDetails]    Script Date: 8/25/2024 12:37:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrescriptionsDetails](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[PrescriptionID] [int] NULL,
	[FinanceApprovalStatus] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Frequency] [int] NOT NULL,
	[Notes] [nvarchar](300) NULL,
	[MedicineID] [int] NULL,
 CONSTRAINT [PK__Prescrip__135C314D6874AA2C] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tests]    Script Date: 8/25/2024 12:37:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tests](
	[TestID] [int] IDENTITY(1,1) NOT NULL,
	[TestName] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK__Tests__8CC331003C86ACA8] PRIMARY KEY CLUSTERED 
(
	[TestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timetable]    Script Date: 8/25/2024 12:37:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timetable](
	[SlotID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NULL,
	[TTDay] [nvarchar](50) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[MFID] [int] NOT NULL,
 CONSTRAINT [PK__Timetabl__0A124A4F65ADABF0] PRIMARY KEY CLUSTERED 
(
	[SlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([AppointmentID], [SlotID], [EmployeeID], [ApStatus], [Diagnosis], [FinanceID], [SLDStart], [SLDEnd], [AppointmentDate]) VALUES (1, 1, 1, 2, N'She has Flu', 1, CAST(N'2024-08-22' AS Date), CAST(N'2024-08-24' AS Date), CAST(N'2024-08-21' AS Date))
INSERT [dbo].[Appointments] ([AppointmentID], [SlotID], [EmployeeID], [ApStatus], [Diagnosis], [FinanceID], [SLDStart], [SLDEnd], [AppointmentDate]) VALUES (2, 4, 2, 2, N'He need a surgery', 2, CAST(N'2024-08-14' AS Date), CAST(N'2024-08-17' AS Date), CAST(N'2024-08-13' AS Date))
INSERT [dbo].[Appointments] ([AppointmentID], [SlotID], [EmployeeID], [ApStatus], [Diagnosis], [FinanceID], [SLDStart], [SLDEnd], [AppointmentDate]) VALUES (3, 1, 3, 3, NULL, 3, NULL, NULL, CAST(N'2024-08-18' AS Date))
INSERT [dbo].[Appointments] ([AppointmentID], [SlotID], [EmployeeID], [ApStatus], [Diagnosis], [FinanceID], [SLDStart], [SLDEnd], [AppointmentDate]) VALUES (4, 3, 1, 1, NULL, 1, NULL, NULL, CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Appointments] ([AppointmentID], [SlotID], [EmployeeID], [ApStatus], [Diagnosis], [FinanceID], [SLDStart], [SLDEnd], [AppointmentDate]) VALUES (5, 2, 2, 3, NULL, 2, NULL, NULL, CAST(N'2024-08-18' AS Date))
INSERT [dbo].[Appointments] ([AppointmentID], [SlotID], [EmployeeID], [ApStatus], [Diagnosis], [FinanceID], [SLDStart], [SLDEnd], [AppointmentDate]) VALUES (6, 3, 3, 1, N'', 3, CAST(N'2024-08-21' AS Date), CAST(N'2024-08-22' AS Date), CAST(N'2024-08-20' AS Date))
INSERT [dbo].[Appointments] ([AppointmentID], [SlotID], [EmployeeID], [ApStatus], [Diagnosis], [FinanceID], [SLDStart], [SLDEnd], [AppointmentDate]) VALUES (7, 5, 1, 1, NULL, 2, NULL, NULL, CAST(N'2024-08-26' AS Date))
INSERT [dbo].[Appointments] ([AppointmentID], [SlotID], [EmployeeID], [ApStatus], [Diagnosis], [FinanceID], [SLDStart], [SLDEnd], [AppointmentDate]) VALUES (8, 1, 1, 1, NULL, 1, NULL, NULL, CAST(N'2024-08-25' AS Date))
SET IDENTITY_INSERT [dbo].[Appointments] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (1, N'Cardiology')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (2, N'Pediatrics')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (3, N'Orthopedics')
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([DoctorID], [DepartmentID], [MFID], [Username], [Price], [DoctorName], [Position], [DoctorPassword], [Mobile]) VALUES (1, 3, 1, N'drallen', CAST(250 AS Decimal(18, 0)), N'Dr. Allen', N'Specialized', N'securepass1', 9876543210)
INSERT [dbo].[Doctor] ([DoctorID], [DepartmentID], [MFID], [Username], [Price], [DoctorName], [Position], [DoctorPassword], [Mobile]) VALUES (2, 2, 2, N'drbaker', CAST(181 AS Decimal(18, 0)), N'Dr. Baker', N'Specialized', N'securepass2', 8765432109)
INSERT [dbo].[Doctor] ([DoctorID], [DepartmentID], [MFID], [Username], [Price], [DoctorName], [Position], [DoctorPassword], [Mobile]) VALUES (3, 1, 4, N'drclark', CAST(221 AS Decimal(18, 0)), N'Dr. Clark', N'Analysis', N'securepass3', 7654321098)
INSERT [dbo].[Doctor] ([DoctorID], [DepartmentID], [MFID], [Username], [Price], [DoctorName], [Position], [DoctorPassword], [Mobile]) VALUES (4, 2, 1, N'test', CAST(2222 AS Decimal(18, 0)), N'test 1', N'Pharmacy Doctor', N'21354655s', 100002244)
SET IDENTITY_INSERT [dbo].[Doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [Photo], [EmployeeName], [Email], [Password]) VALUES (1, N'../assets/images/faces/noor.jpg', N'Noor', N'noor@gmail.com', N'no0r123')
INSERT [dbo].[Employees] ([EmployeeID], [Photo], [EmployeeName], [Email], [Password]) VALUES (2, N'../assets/images/faces/omar.jpg', N'Omar', N'omar@gmail.com', N'omar123')
INSERT [dbo].[Employees] ([EmployeeID], [Photo], [EmployeeName], [Email], [Password]) VALUES (3, N'../assets/images/faces/sally.jpeg', N'Sally', N'sally@gmail.com', N'sally123')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Finance] ON 

INSERT [dbo].[Finance] ([FinanceID], [FinancePassword], [FinanceName], [Username]) VALUES (1, N'pass123', N'Ahmed', N'finAhmed')
INSERT [dbo].[Finance] ([FinanceID], [FinancePassword], [FinanceName], [Username]) VALUES (2, N'pass456', N'Mohamed', N'finMohamed')
INSERT [dbo].[Finance] ([FinanceID], [FinancePassword], [FinanceName], [Username]) VALUES (3, N'pass789', N'Sara', N'finSara')
SET IDENTITY_INSERT [dbo].[Finance] OFF
GO
SET IDENTITY_INSERT [dbo].[LabReports] ON 

INSERT [dbo].[LabReports] ([ReportID], [AppointmentID], [PayStatus], [LabName], [ReportDate]) VALUES (1, 1, 1, N'Alpha Labs', CAST(N'2024-08-15' AS Date))
INSERT [dbo].[LabReports] ([ReportID], [AppointmentID], [PayStatus], [LabName], [ReportDate]) VALUES (2, 2, 1, N'Alpha Labs', CAST(N'2024-08-14' AS Date))
INSERT [dbo].[LabReports] ([ReportID], [AppointmentID], [PayStatus], [LabName], [ReportDate]) VALUES (3, 5, 1, N'Alpha Labs', CAST(N'2024-08-13' AS Date))
INSERT [dbo].[LabReports] ([ReportID], [AppointmentID], [PayStatus], [LabName], [ReportDate]) VALUES (4, 1, 1, NULL, CAST(N'2024-08-21' AS Date))
SET IDENTITY_INSERT [dbo].[LabReports] OFF
GO
SET IDENTITY_INSERT [dbo].[LabReportsDetails] ON 

INSERT [dbo].[LabReportsDetails] ([DetailID], [ReportID], [TestID], [FinancialApprovalStatus], [ResultPDF]) VALUES (1, 1, 1, 1, N'cbc.pdf')
INSERT [dbo].[LabReportsDetails] ([DetailID], [ReportID], [TestID], [FinancialApprovalStatus], [ResultPDF]) VALUES (2, 2, 2, 1, N'vitD.pdf')
INSERT [dbo].[LabReportsDetails] ([DetailID], [ReportID], [TestID], [FinancialApprovalStatus], [ResultPDF]) VALUES (3, 3, 3, 1, N'ha1c.pdf')
INSERT [dbo].[LabReportsDetails] ([DetailID], [ReportID], [TestID], [FinancialApprovalStatus], [ResultPDF]) VALUES (4, 3, 2, 1, NULL)
SET IDENTITY_INSERT [dbo].[LabReportsDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicalField] ON 

INSERT [dbo].[MedicalField] ([MFID], [MMID], [Username], [MFName], [Email], [MFPassword], [Hotline], [MFAddress], [MFType]) VALUES (1, 1, N'mfclinic1', N'City Clinic', N'clinic1@example.com', N'clinicpass123', 1234567890, N'123 Main St', N'Clinic')
INSERT [dbo].[MedicalField] ([MFID], [MMID], [Username], [MFName], [Email], [MFPassword], [Hotline], [MFAddress], [MFType]) VALUES (2, 2, N'mfhospital1', N'Central Hospital', N'hospital1@example.com', N'hospitalpass456', 2345678901, N'456 Elm St', N'Hospital')
INSERT [dbo].[MedicalField] ([MFID], [MMID], [Username], [MFName], [Email], [MFPassword], [Hotline], [MFAddress], [MFType]) VALUES (3, 3, N'mfpharmacy1', N'Community Health Pharmacy', N'pharmacy1@example.com', N'healthpass789', 3456789012, N'789 Oak St', N'Pharmacy')
INSERT [dbo].[MedicalField] ([MFID], [MMID], [Username], [MFName], [Email], [MFPassword], [Hotline], [MFAddress], [MFType]) VALUES (4, 3, N'alphalab1', N'Alpha Lab', N'Lab1@example.com', N'alphalab789', 357862149, N'789 Oak St', N'Lab')
SET IDENTITY_INSERT [dbo].[MedicalField] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicines] ON 

INSERT [dbo].[Medicines] ([MedicineID], [MedicineName], [Price]) VALUES (1, N'Panadol', CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[Medicines] ([MedicineID], [MedicineName], [Price]) VALUES (2, N'Vitamin D', CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[Medicines] ([MedicineID], [MedicineName], [Price]) VALUES (3, N'Limitless Vitamins', CAST(400 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Medicines] OFF
GO
SET IDENTITY_INSERT [dbo].[MiddleMan] ON 

INSERT [dbo].[MiddleMan] ([MMID], [Username], [MMName], [Email], [MMPassword]) VALUES (1, N'mmjohn', N'John Doe', N'john.doe@example.com', N'pass1234')
INSERT [dbo].[MiddleMan] ([MMID], [Username], [MMName], [Email], [MMPassword]) VALUES (2, N'mmjane', N'Jane Smith', N'jane.smith@example.com', N'securepass5678')
INSERT [dbo].[MiddleMan] ([MMID], [Username], [MMName], [Email], [MMPassword]) VALUES (3, N'mmbob', N'Bob Johnson', N'bob.johnson@example.com', N'mypassword7890')
SET IDENTITY_INSERT [dbo].[MiddleMan] OFF
GO
SET IDENTITY_INSERT [dbo].[Prescriptions] ON 

INSERT [dbo].[Prescriptions] ([PrescriptionID], [AppointmentID], [RenewalStatus], [Monthly], [SupplyDate]) VALUES (1, 5, 0, 1, CAST(N'2024-08-19' AS Date))
INSERT [dbo].[Prescriptions] ([PrescriptionID], [AppointmentID], [RenewalStatus], [Monthly], [SupplyDate]) VALUES (2, 2, 0, 1, CAST(N'2024-08-13' AS Date))
INSERT [dbo].[Prescriptions] ([PrescriptionID], [AppointmentID], [RenewalStatus], [Monthly], [SupplyDate]) VALUES (3, 6, 0, 1, CAST(N'2024-08-18' AS Date))
INSERT [dbo].[Prescriptions] ([PrescriptionID], [AppointmentID], [RenewalStatus], [Monthly], [SupplyDate]) VALUES (4, 1, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[Prescriptions] OFF
GO
SET IDENTITY_INSERT [dbo].[PrescriptionsDetails] ON 

INSERT [dbo].[PrescriptionsDetails] ([DetailID], [PrescriptionID], [FinanceApprovalStatus], [Quantity], [Frequency], [Notes], [MedicineID]) VALUES (1, 1, 1, 3, 2, N'Before Meals', 1)
INSERT [dbo].[PrescriptionsDetails] ([DetailID], [PrescriptionID], [FinanceApprovalStatus], [Quantity], [Frequency], [Notes], [MedicineID]) VALUES (2, 2, 1, 7, 3, N'After Meals', 2)
INSERT [dbo].[PrescriptionsDetails] ([DetailID], [PrescriptionID], [FinanceApprovalStatus], [Quantity], [Frequency], [Notes], [MedicineID]) VALUES (3, 3, 1, 8, 4, N'Between Meals', 3)
INSERT [dbo].[PrescriptionsDetails] ([DetailID], [PrescriptionID], [FinanceApprovalStatus], [Quantity], [Frequency], [Notes], [MedicineID]) VALUES (4, 3, 1, 1, 2, N'After Meals', 1)
SET IDENTITY_INSERT [dbo].[PrescriptionsDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Tests] ON 

INSERT [dbo].[Tests] ([TestID], [TestName], [Price]) VALUES (1, N'CBC', CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[Tests] ([TestID], [TestName], [Price]) VALUES (2, N'Vitamin D', CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[Tests] ([TestID], [TestName], [Price]) VALUES (3, N'HAB1C', CAST(400 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Tests] OFF
GO
SET IDENTITY_INSERT [dbo].[Timetable] ON 

INSERT [dbo].[Timetable] ([SlotID], [DoctorID], [TTDay], [StartTime], [EndTime], [MFID]) VALUES (1, 1, N'Sun', CAST(N'15:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[Timetable] ([SlotID], [DoctorID], [TTDay], [StartTime], [EndTime], [MFID]) VALUES (2, 1, N'Mon', CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1)
INSERT [dbo].[Timetable] ([SlotID], [DoctorID], [TTDay], [StartTime], [EndTime], [MFID]) VALUES (3, 2, N'Sun', CAST(N'15:00:00' AS Time), CAST(N'18:00:00' AS Time), 2)
INSERT [dbo].[Timetable] ([SlotID], [DoctorID], [TTDay], [StartTime], [EndTime], [MFID]) VALUES (4, 2, N'Tue', CAST(N'15:00:00' AS Time), CAST(N'18:00:00' AS Time), 2)
INSERT [dbo].[Timetable] ([SlotID], [DoctorID], [TTDay], [StartTime], [EndTime], [MFID]) VALUES (5, 3, N'Mon', CAST(N'15:00:00' AS Time), CAST(N'18:00:00' AS Time), 4)
INSERT [dbo].[Timetable] ([SlotID], [DoctorID], [TTDay], [StartTime], [EndTime], [MFID]) VALUES (6, 3, N'Wed', CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), 4)
INSERT [dbo].[Timetable] ([SlotID], [DoctorID], [TTDay], [StartTime], [EndTime], [MFID]) VALUES (8, 1, N'Friday', CAST(N'03:00:00' AS Time), CAST(N'06:00:00' AS Time), 1)
INSERT [dbo].[Timetable] ([SlotID], [DoctorID], [TTDay], [StartTime], [EndTime], [MFID]) VALUES (9, 1, N'Saturday', CAST(N'03:00:00' AS Time), CAST(N'06:00:00' AS Time), 1)
SET IDENTITY_INSERT [dbo].[Timetable] OFF
GO
ALTER TABLE [dbo].[Appointments]  WITH NOCHECK ADD  CONSTRAINT [FK_Appointment_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointment_Employee]
GO
ALTER TABLE [dbo].[Appointments]  WITH NOCHECK ADD  CONSTRAINT [FK_Appointment_TimeTable] FOREIGN KEY([SlotID])
REFERENCES [dbo].[Timetable] ([SlotID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointment_TimeTable]
GO
ALTER TABLE [dbo].[Appointments]  WITH NOCHECK ADD  CONSTRAINT [FK_Appointments_Finance] FOREIGN KEY([FinanceID])
REFERENCES [dbo].[Finance] ([FinanceID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Finance]
GO
ALTER TABLE [dbo].[Doctor]  WITH NOCHECK ADD  CONSTRAINT [FK_Doctor] FOREIGN KEY([MFID])
REFERENCES [dbo].[MedicalField] ([MFID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor]
GO
ALTER TABLE [dbo].[Doctor]  WITH NOCHECK ADD  CONSTRAINT [FK_Doctor_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Departments]
GO
ALTER TABLE [dbo].[LabReports]  WITH NOCHECK ADD  CONSTRAINT [FK_LabReports] FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[Appointments] ([AppointmentID])
GO
ALTER TABLE [dbo].[LabReports] CHECK CONSTRAINT [FK_LabReports]
GO
ALTER TABLE [dbo].[LabReportsDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_LabReportsDetails_Report] FOREIGN KEY([ReportID])
REFERENCES [dbo].[LabReports] ([ReportID])
GO
ALTER TABLE [dbo].[LabReportsDetails] CHECK CONSTRAINT [FK_LabReportsDetails_Report]
GO
ALTER TABLE [dbo].[LabReportsDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_LabReportsDetails_Test] FOREIGN KEY([TestID])
REFERENCES [dbo].[Tests] ([TestID])
GO
ALTER TABLE [dbo].[LabReportsDetails] CHECK CONSTRAINT [FK_LabReportsDetails_Test]
GO
ALTER TABLE [dbo].[MedicalField]  WITH NOCHECK ADD  CONSTRAINT [FK_MedicalField] FOREIGN KEY([MMID])
REFERENCES [dbo].[MiddleMan] ([MMID])
GO
ALTER TABLE [dbo].[MedicalField] CHECK CONSTRAINT [FK_MedicalField]
GO
ALTER TABLE [dbo].[Prescriptions]  WITH NOCHECK ADD  CONSTRAINT [FK_Prescriptions_Appointments1] FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[Appointments] ([AppointmentID])
GO
ALTER TABLE [dbo].[Prescriptions] CHECK CONSTRAINT [FK_Prescriptions_Appointments1]
GO
ALTER TABLE [dbo].[PrescriptionsDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_PrescriptionDetails] FOREIGN KEY([PrescriptionID])
REFERENCES [dbo].[Prescriptions] ([PrescriptionID])
GO
ALTER TABLE [dbo].[PrescriptionsDetails] CHECK CONSTRAINT [FK_PrescriptionDetails]
GO
ALTER TABLE [dbo].[PrescriptionsDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_PrescriptionDetails_Medicine] FOREIGN KEY([MedicineID])
REFERENCES [dbo].[Medicines] ([MedicineID])
GO
ALTER TABLE [dbo].[PrescriptionsDetails] CHECK CONSTRAINT [FK_PrescriptionDetails_Medicine]
GO
ALTER TABLE [dbo].[Timetable]  WITH NOCHECK ADD  CONSTRAINT [FK_TimeTable] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctor] ([DoctorID])
GO
ALTER TABLE [dbo].[Timetable] CHECK CONSTRAINT [FK_TimeTable]
GO
USE [master]
GO
ALTER DATABASE [Bank Medical DB] SET  READ_WRITE 
GO
