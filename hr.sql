USE [master]
GO
/****** Object:  Database [hr]    Script Date: 2021/3/1 上午 01:10:24 ******/
CREATE DATABASE [hr]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hr', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\hr.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'hr_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\hr_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [hr] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hr].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hr] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hr] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hr] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hr] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hr] SET ARITHABORT OFF 
GO
ALTER DATABASE [hr] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [hr] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hr] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hr] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hr] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hr] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hr] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hr] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hr] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hr] SET  DISABLE_BROKER 
GO
ALTER DATABASE [hr] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hr] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hr] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hr] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hr] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hr] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hr] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hr] SET RECOVERY FULL 
GO
ALTER DATABASE [hr] SET  MULTI_USER 
GO
ALTER DATABASE [hr] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hr] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hr] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hr] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [hr] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [hr] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'hr', N'ON'
GO
ALTER DATABASE [hr] SET QUERY_STORE = OFF
GO
USE [hr]
GO
/****** Object:  User [qq]    Script Date: 2021/3/1 上午 01:10:24 ******/
CREATE USER [qq] FOR LOGIN [qq] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [qq]
GO
/****** Object:  Table [dbo].[basicInformation]    Script Date: 2021/3/1 上午 01:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[basicInformation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[department] [int] NOT NULL,
	[staffCode] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[onDuty] [date] NOT NULL,
	[position] [int] NOT NULL,
	[supervisor] [nvarchar](50) NULL,
 CONSTRAINT [PK_basic] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[department]    Script Date: 2021/3/1 上午 01:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[department] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_department_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[education]    Script Date: 2021/3/1 上午 01:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[education](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[degree] [nvarchar](50) NOT NULL,
	[school] [nvarchar](50) NOT NULL,
	[department] [nvarchar](50) NOT NULL,
	[basicInformationID] [int] NOT NULL,
 CONSTRAINT [PK_education] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[experience]    Script Date: 2021/3/1 上午 01:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[experience](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[serviceUnit] [nvarchar](50) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[jobDescription] [nvarchar](50) NOT NULL,
	[start] [nvarchar](50) NOT NULL,
	[finish] [nvarchar](50) NOT NULL,
	[basicInformationID] [int] NULL,
 CONSTRAINT [PK_experience] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supervisor]    Script Date: 2021/3/1 上午 01:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supervisor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[department] [int] NOT NULL,
	[title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_supervisor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[basicInformation] ON 

INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (1, 1, 94, N'小明1', CAST(N'2021-03-01' AS Date), 0, N'1')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (2, 4, 130, N'小明2', CAST(N'2021-03-01' AS Date), 0, N'1')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (3, 1, 474, N'小明3', CAST(N'2021-03-01' AS Date), 0, N'1')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (4, 3, 979, N'小明4', CAST(N'2021-03-01' AS Date), 0, N'1')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (5, 1, 597, N'小明5', CAST(N'2021-03-01' AS Date), 0, N'1')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (6, 4, 24, N'小明6', CAST(N'2021-03-01' AS Date), 0, N'1')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (7, 3, 784, N'小明7', CAST(N'2021-03-01' AS Date), 0, N'1')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (8, 3, 288, N'小明8', CAST(N'2021-03-01' AS Date), 0, N'1')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (9, 4, 979, N'小明9', CAST(N'2021-03-01' AS Date), 0, N'1')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (10, 3, 803, N'小明10', CAST(N'2021-03-01' AS Date), 0, N'1')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (11, 1, 488, N'小明11', CAST(N'2021-03-01' AS Date), 0, N'1')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (12, 1, 692, N'小明12', CAST(N'2021-03-01' AS Date), 0, N'1')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (13, 3, 515, N'小明13', CAST(N'2021-03-01' AS Date), 0, N'1')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (14, 2, 433, N'小明14', CAST(N'2021-03-01' AS Date), 0, N'1')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (15, 4, 140, N'小明15', CAST(N'2021-03-01' AS Date), 0, N'1')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (16, 1, 313, N'小明16', CAST(N'2021-03-01' AS Date), 0, N'2')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (17, 1, 672, N'小明17', CAST(N'2021-03-01' AS Date), 0, N'2')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (18, 2, 425, N'小明18', CAST(N'2021-03-01' AS Date), 0, N'2')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (19, 3, 481, N'小明19', CAST(N'2021-03-01' AS Date), 0, N'2')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (20, 1, 304, N'小明20', CAST(N'2021-03-01' AS Date), 0, N'2')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (21, 2, 432, N'小明21', CAST(N'2021-03-01' AS Date), 0, N'2')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (22, 1, 672, N'小明22', CAST(N'2021-03-01' AS Date), 0, N'2')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (23, 3, 873, N'小明23', CAST(N'2021-03-01' AS Date), 0, N'2')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (24, 1, 84, N'小明24', CAST(N'2021-03-01' AS Date), 0, N'2')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (25, 2, 219, N'小明25', CAST(N'2021-03-01' AS Date), 0, N'2')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (26, 4, 205, N'小明26', CAST(N'2021-03-01' AS Date), 0, N'2')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (27, 2, 177, N'小明27', CAST(N'2021-03-01' AS Date), 0, N'2')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (28, 1, 660, N'小明28', CAST(N'2021-03-01' AS Date), 0, N'2')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (29, 3, 108, N'小明29', CAST(N'2021-03-01' AS Date), 0, N'2')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (30, 2, 291, N'小明30', CAST(N'2021-03-01' AS Date), 0, N'2')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (31, 4, 815, N'小花1', CAST(N'2021-03-01' AS Date), 0, N'3')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (32, 3, 688, N'小花2', CAST(N'2021-03-01' AS Date), 0, N'3')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (33, 2, 643, N'小花3', CAST(N'2021-03-01' AS Date), 0, N'3')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (34, 2, 254, N'小花4', CAST(N'2021-03-01' AS Date), 0, N'3')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (35, 4, 510, N'小花5', CAST(N'2021-03-01' AS Date), 0, N'3')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (36, 2, 786, N'小花6', CAST(N'2021-03-01' AS Date), 0, N'3')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (37, 2, 165, N'小花7', CAST(N'2021-03-01' AS Date), 0, N'3')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (38, 1, 260, N'小花8', CAST(N'2021-03-01' AS Date), 0, N'3')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (39, 1, 637, N'小花9', CAST(N'2021-03-01' AS Date), 0, N'3')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (40, 2, 433, N'小花10', CAST(N'2021-03-01' AS Date), 0, N'3')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (41, 1, 916, N'小花11', CAST(N'2021-03-01' AS Date), 0, N'3')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (42, 2, 42, N'小花12', CAST(N'2021-03-01' AS Date), 0, N'3')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (43, 2, 167, N'小花13', CAST(N'2021-03-01' AS Date), 0, N'3')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (44, 3, 130, N'小花14', CAST(N'2021-03-01' AS Date), 0, N'3')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (45, 4, 212, N'小花15', CAST(N'2021-03-01' AS Date), 0, N'3')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (46, 3, 748, N'小花16', CAST(N'2021-03-01' AS Date), 0, N'4')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (47, 1, 998, N'小花17', CAST(N'2021-03-01' AS Date), 0, N'4')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (48, 1, 569, N'小花18', CAST(N'2021-03-01' AS Date), 0, N'4')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (49, 3, 117, N'小花19', CAST(N'2021-03-01' AS Date), 0, N'4')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (50, 2, 348, N'小花20', CAST(N'2021-03-01' AS Date), 0, N'4')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (51, 2, 671, N'小花21', CAST(N'2021-03-01' AS Date), 0, N'4')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (52, 3, 509, N'小花22', CAST(N'2021-03-01' AS Date), 0, N'4')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (53, 4, 649, N'小花23', CAST(N'2021-03-01' AS Date), 0, N'4')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (54, 4, 623, N'小花24', CAST(N'2021-03-01' AS Date), 0, N'4')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (55, 3, 495, N'小花25', CAST(N'2021-03-01' AS Date), 0, N'4')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (56, 3, 31, N'小花26', CAST(N'2021-03-01' AS Date), 0, N'4')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (57, 4, 109, N'小花27', CAST(N'2021-03-01' AS Date), 0, N'4')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (58, 4, 403, N'小花28', CAST(N'2021-03-01' AS Date), 0, N'4')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (59, 1, 742, N'小花29', CAST(N'2021-03-01' AS Date), 0, N'4')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (60, 4, 340, N'小花30', CAST(N'2021-03-01' AS Date), 0, N'4')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (61, 4, 871, N'小新1', CAST(N'2021-03-01' AS Date), 0, N'5')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (62, 1, 118, N'小新2', CAST(N'2021-03-01' AS Date), 0, N'5')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (63, 4, 25, N'小新3', CAST(N'2021-03-01' AS Date), 0, N'5')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (64, 2, 682, N'小新4', CAST(N'2021-03-01' AS Date), 0, N'5')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (65, 4, 466, N'小新5', CAST(N'2021-03-01' AS Date), 0, N'5')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (66, 3, 571, N'小新6', CAST(N'2021-03-01' AS Date), 0, N'5')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (67, 2, 470, N'小新7', CAST(N'2021-03-01' AS Date), 0, N'5')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (68, 3, 902, N'小新8', CAST(N'2021-03-01' AS Date), 0, N'5')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (69, 3, 191, N'小新9', CAST(N'2021-03-01' AS Date), 0, N'5')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (70, 2, 789, N'小新10', CAST(N'2021-03-01' AS Date), 0, N'5')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (71, 1, 619, N'小新11', CAST(N'2021-03-01' AS Date), 0, N'5')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (72, 4, 22, N'小新12', CAST(N'2021-03-01' AS Date), 0, N'5')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (73, 1, 935, N'小新13', CAST(N'2021-03-01' AS Date), 0, N'5')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (74, 2, 844, N'小新14', CAST(N'2021-03-01' AS Date), 0, N'5')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (75, 2, 783, N'小新15', CAST(N'2021-03-01' AS Date), 0, N'5')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (76, 4, 883, N'小新16', CAST(N'2021-03-01' AS Date), 0, N'6')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (77, 3, 201, N'小新17', CAST(N'2021-03-01' AS Date), 0, N'6')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (78, 2, 367, N'小新18', CAST(N'2021-03-01' AS Date), 0, N'6')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (79, 3, 717, N'小新19', CAST(N'2021-03-01' AS Date), 0, N'6')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (80, 1, 814, N'小新20', CAST(N'2021-03-01' AS Date), 0, N'6')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (81, 4, 542, N'小新21', CAST(N'2021-03-01' AS Date), 0, N'6')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (82, 1, 331, N'小新22', CAST(N'2021-03-01' AS Date), 0, N'6')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (83, 4, 522, N'小新23', CAST(N'2021-03-01' AS Date), 0, N'6')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (84, 2, 616, N'小新24', CAST(N'2021-03-01' AS Date), 0, N'6')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (85, 1, 501, N'小新25', CAST(N'2021-03-01' AS Date), 0, N'6')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (86, 1, 93, N'小新26', CAST(N'2021-03-01' AS Date), 0, N'6')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (87, 3, 589, N'小新27', CAST(N'2021-03-01' AS Date), 0, N'6')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (88, 1, 674, N'小新28', CAST(N'2021-03-01' AS Date), 0, N'6')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (89, 3, 170, N'小新29', CAST(N'2021-03-01' AS Date), 0, N'6')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (90, 1, 617, N'小新30', CAST(N'2021-03-01' AS Date), 0, N'6')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (91, 2, 385, N'小依1', CAST(N'2021-03-01' AS Date), 0, N'7')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (92, 2, 261, N'小依2', CAST(N'2021-03-01' AS Date), 0, N'7')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (93, 1, 657, N'小依3', CAST(N'2021-03-01' AS Date), 0, N'7')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (94, 1, 13, N'小依4', CAST(N'2021-03-01' AS Date), 0, N'7')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (95, 3, 539, N'小依5', CAST(N'2021-03-01' AS Date), 0, N'7')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (96, 4, 693, N'小依6', CAST(N'2021-03-01' AS Date), 0, N'8')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (97, 2, 123, N'小依7', CAST(N'2021-03-01' AS Date), 0, N'8')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (98, 2, 249, N'小依8', CAST(N'2021-03-01' AS Date), 0, N'8')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (99, 4, 500, N'小依9', CAST(N'2021-03-01' AS Date), 0, N'8')
GO
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (100, 1, 562, N'小依10', CAST(N'2021-03-01' AS Date), 0, N'8')
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (101, 1, 506, N'鄭花花', CAST(N'2021-03-01' AS Date), 1, NULL)
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (102, 1, 174, N'鄭一方', CAST(N'2021-03-01' AS Date), 1, NULL)
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (103, 2, 23, N'陳發發', CAST(N'2021-03-01' AS Date), 1, NULL)
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (104, 2, 236, N'林黃依', CAST(N'2021-03-01' AS Date), 1, NULL)
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (105, 3, 43, N'蔡黃如', CAST(N'2021-03-01' AS Date), 1, NULL)
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (106, 3, 423, N'賴旺宏', CAST(N'2021-03-01' AS Date), 1, NULL)
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (107, 4, 534, N'林依芳', CAST(N'2021-03-01' AS Date), 1, NULL)
INSERT [dbo].[basicInformation] ([id], [department], [staffCode], [name], [onDuty], [position], [supervisor]) VALUES (108, 4, 736, N'陳芳瑜', CAST(N'2021-03-01' AS Date), 1, NULL)
SET IDENTITY_INSERT [dbo].[basicInformation] OFF
GO
SET IDENTITY_INSERT [dbo].[department] ON 

INSERT [dbo].[department] ([id], [department]) VALUES (1, N'管理部')
INSERT [dbo].[department] ([id], [department]) VALUES (2, N'企劃部')
INSERT [dbo].[department] ([id], [department]) VALUES (3, N'資訊部')
INSERT [dbo].[department] ([id], [department]) VALUES (4, N'財務部')
SET IDENTITY_INSERT [dbo].[department] OFF
GO
SET IDENTITY_INSERT [dbo].[education] ON 

INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (1, N'高中', N'新北市立新莊高級中學', N'普通科', 1)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (2, N'高中', N'新北市立新莊高級中學', N'普通科', 2)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (3, N'高中', N'新北市立新莊高級中學', N'普通科', 3)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (4, N'高中', N'新北市立新莊高級中學', N'普通科', 4)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (5, N'高中', N'新北市立新莊高級中學', N'普通科', 5)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (6, N'高中', N'新北市立新莊高級中學', N'普通科', 6)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (7, N'高中', N'新北市立新莊高級中學', N'普通科', 7)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (8, N'高中', N'新北市立新莊高級中學', N'普通科', 8)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (9, N'高中', N'新北市立新莊高級中學', N'普通科', 9)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (10, N'高中', N'新北市立新莊高級中學', N'普通科', 10)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (11, N'高中', N'新北市立新莊高級中學', N'普通科', 11)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (12, N'高中', N'新北市立新莊高級中學', N'普通科', 12)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (13, N'高中', N'新北市立新莊高級中學', N'普通科', 13)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (14, N'高中', N'新北市立新莊高級中學', N'普通科', 14)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (15, N'高中', N'新北市立新莊高級中學', N'普通科', 15)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (16, N'高中', N'東海高級中學', N'餐飲管理科', 16)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (17, N'高中', N'東海高級中學', N'餐飲管理科', 17)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (18, N'高中', N'東海高級中學', N'餐飲管理科', 18)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (19, N'高中', N'東海高級中學', N'餐飲管理科', 19)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (20, N'高中', N'東海高級中學', N'餐飲管理科', 20)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (21, N'高中', N'東海高級中學', N'餐飲管理科', 21)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (22, N'高中', N'東海高級中學', N'餐飲管理科', 22)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (23, N'高中', N'東海高級中學', N'餐飲管理科', 23)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (24, N'高中', N'東海高級中學', N'餐飲管理科', 24)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (25, N'高中', N'東海高級中學', N'餐飲管理科', 25)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (26, N'高中', N'東海高級中學', N'餐飲管理科', 26)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (27, N'高中', N'東海高級中學', N'餐飲管理科', 27)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (28, N'高中', N'東海高級中學', N'餐飲管理科', 28)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (29, N'高中', N'東海高級中學', N'餐飲管理科', 29)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (30, N'高中', N'東海高級中學', N'餐飲管理科', 30)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (31, N'高中', N'新北市立丹鳳高中', N'普通科', 31)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (32, N'高中', N'新北市立丹鳳高中', N'普通科', 32)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (33, N'高中', N'新北市立丹鳳高中', N'普通科', 33)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (34, N'高中', N'新北市立丹鳳高中', N'普通科', 34)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (35, N'高中', N'新北市立丹鳳高中', N'普通科', 35)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (36, N'高中', N'新北市立丹鳳高中', N'普通科', 36)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (37, N'高中', N'新北市立丹鳳高中', N'普通科', 37)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (38, N'高中', N'新北市立丹鳳高中', N'普通科', 38)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (39, N'高中', N'新北市立丹鳳高中', N'普通科', 39)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (40, N'高中', N'新北市立丹鳳高中', N'普通科', 40)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (41, N'高中', N'新北市立丹鳳高中', N'普通科', 41)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (42, N'高中', N'新北市立丹鳳高中', N'普通科', 42)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (43, N'高中', N'新北市立丹鳳高中', N'普通科', 43)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (44, N'高中', N'新北市立丹鳳高中', N'普通科', 44)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (45, N'高中', N'新北市立丹鳳高中', N'普通科', 45)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (46, N'高中', N'新北市泰山區泰山高級中學', N'普通科', 46)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (47, N'高中', N'新北市泰山區泰山高級中學', N'普通科', 47)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (48, N'高中', N'新北市泰山區泰山高級中學', N'普通科', 48)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (49, N'高中', N'新北市泰山區泰山高級中學', N'普通科', 49)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (50, N'高中', N'新北市泰山區泰山高級中學', N'普通科', 50)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (51, N'高中', N'新北市泰山區泰山高級中學', N'普通科', 51)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (52, N'高中', N'新北市泰山區泰山高級中學', N'普通科', 52)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (53, N'高中', N'新北市泰山區泰山高級中學', N'普通科', 53)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (54, N'高中', N'新北市泰山區泰山高級中學', N'普通科', 54)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (55, N'高中', N'新北市泰山區泰山高級中學', N'普通科', 55)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (56, N'高中', N'新北市泰山區泰山高級中學', N'普通科', 56)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (57, N'高中', N'新北市泰山區泰山高級中學', N'普通科', 57)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (58, N'高中', N'新北市泰山區泰山高級中學', N'普通科', 58)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (59, N'高中', N'新北市泰山區泰山高級中學', N'普通科', 59)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (60, N'高中', N'新北市泰山區泰山高級中學', N'普通科', 60)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (61, N'高中', N'私立醒吾高級中學附設國中部', N'普通科', 61)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (62, N'高中', N'私立醒吾高級中學附設國中部', N'普通科', 62)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (63, N'高中', N'私立醒吾高級中學附設國中部', N'普通科', 63)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (64, N'高中', N'私立醒吾高級中學附設國中部', N'普通科', 64)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (65, N'高中', N'私立醒吾高級中學附設國中部', N'普通科', 65)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (66, N'高中', N'私立醒吾高級中學附設國中部', N'普通科', 66)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (67, N'高中', N'私立醒吾高級中學附設國中部', N'普通科', 67)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (68, N'高中', N'私立醒吾高級中學附設國中部', N'普通科', 68)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (69, N'高中', N'私立醒吾高級中學附設國中部', N'普通科', 69)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (70, N'高中', N'私立醒吾高級中學附設國中部', N'普通科', 70)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (71, N'高中', N'私立醒吾高級中學附設國中部', N'普通科', 71)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (72, N'高中', N'私立醒吾高級中學附設國中部', N'普通科', 72)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (73, N'高中', N'私立醒吾高級中學附設國中部', N'普通科', 73)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (74, N'高中', N'私立醒吾高級中學附設國中部', N'普通科', 74)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (75, N'高中', N'私立醒吾高級中學附設國中部', N'普通科', 75)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (76, N'高中', N'新北市立海山高級中學', N'普通科', 76)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (77, N'高中', N'新北市立海山高級中學', N'普通科', 77)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (78, N'高中', N'新北市立海山高級中學', N'普通科', 78)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (79, N'高中', N'新北市立海山高級中學', N'普通科', 79)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (80, N'高中', N'新北市立海山高級中學', N'普通科', 80)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (81, N'高中', N'新北市立海山高級中學', N'普通科', 81)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (82, N'高中', N'新北市立海山高級中學', N'普通科', 82)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (83, N'高中', N'新北市立海山高級中學', N'普通科', 83)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (84, N'高中', N'新北市立海山高級中學', N'普通科', 84)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (85, N'高中', N'新北市立海山高級中學', N'普通科', 85)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (86, N'高中', N'新北市立海山高級中學', N'普通科', 86)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (87, N'高中', N'新北市立海山高級中學', N'普通科', 87)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (88, N'高中', N'新北市立海山高級中學', N'普通科', 88)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (89, N'高中', N'新北市立海山高級中學', N'普通科', 89)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (90, N'高中', N'新北市立海山高級中學', N'普通科', 90)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (91, N'高中', N'新北市立三民高級中學', N'普通科', 91)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (92, N'高中', N'新北市立三民高級中學', N'普通科', 92)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (93, N'高中', N'新北市立三民高級中學', N'普通科', 93)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (94, N'高中', N'新北市立三民高級中學', N'普通科', 94)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (95, N'高中', N'新北市立三民高級中學', N'普通科', 95)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (96, N'高中', N'新北市立三民高級中學', N'普通科', 96)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (97, N'高中', N'新北市立三民高級中學', N'普通科', 97)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (98, N'高中', N'新北市立三民高級中學', N'普通科', 98)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (99, N'高中', N'新北市立三民高級中學', N'普通科', 99)
GO
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (100, N'高中', N'新北市立三民高級中學', N'普通科', 100)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (101, N'大學', N'輔仁大學', N'醫學系', 1)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (102, N'大學', N'輔仁大學', N'醫學系', 2)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (103, N'大學', N'輔仁大學', N'醫學系', 3)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (104, N'大學', N'輔仁大學', N'醫學系', 4)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (105, N'大學', N'輔仁大學', N'醫學系', 5)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (106, N'大學', N'輔仁大學', N'醫學系', 6)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (107, N'大學', N'輔仁大學', N'醫學系', 7)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (108, N'大學', N'輔仁大學', N'醫學系', 8)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (109, N'大學', N'輔仁大學', N'醫學系', 9)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (110, N'大學', N'輔仁大學', N'醫學系', 10)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (111, N'大學', N'輔仁大學', N'醫學系', 11)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (112, N'大學', N'輔仁大學', N'醫學系', 12)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (113, N'大學', N'輔仁大學', N'醫學系', 13)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (114, N'大學', N'輔仁大學', N'醫學系', 14)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (115, N'大學', N'輔仁大學', N'醫學系', 15)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (116, N'大學', N'長庚大學', N'醫學系', 16)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (117, N'大學', N'長庚大學', N'醫學系', 17)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (118, N'大學', N'長庚大學', N'醫學系', 18)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (119, N'大學', N'長庚大學', N'醫學系', 19)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (120, N'大學', N'長庚大學', N'醫學系', 20)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (121, N'大學', N'長庚大學', N'醫學系', 21)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (122, N'大學', N'長庚大學', N'醫學系', 22)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (123, N'大學', N'長庚大學', N'醫學系', 23)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (124, N'大學', N'長庚大學', N'醫學系', 24)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (125, N'大學', N'長庚大學', N'醫學系', 25)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (126, N'大學', N'長庚大學', N'醫學系', 26)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (127, N'大學', N'長庚大學', N'醫學系', 27)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (128, N'大學', N'長庚大學', N'醫學系', 28)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (129, N'大學', N'長庚大學', N'醫學系', 29)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (130, N'大學', N'長庚大學', N'醫學系', 30)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (131, N'大學', N'東吳大學', N'法律系', 31)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (132, N'大學', N'東吳大學', N'法律系', 32)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (133, N'大學', N'東吳大學', N'法律系', 33)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (134, N'大學', N'東吳大學', N'法律系', 34)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (135, N'大學', N'東吳大學', N'法律系', 35)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (136, N'大學', N'東吳大學', N'法律系', 36)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (137, N'大學', N'東吳大學', N'法律系', 37)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (138, N'大學', N'東吳大學', N'法律系', 38)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (139, N'大學', N'東吳大學', N'法律系', 39)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (140, N'大學', N'東吳大學', N'法律系', 40)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (141, N'大學', N'東吳大學', N'法律系', 41)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (142, N'大學', N'東吳大學', N'法律系', 42)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (143, N'大學', N'東吳大學', N'法律系', 43)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (144, N'大學', N'東吳大學', N'法律系', 44)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (145, N'大學', N'東吳大學', N'法律系', 45)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (146, N'大學', N'國立體育大學', N'體育系', 46)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (147, N'大學', N'國立體育大學', N'體育系', 47)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (148, N'大學', N'國立體育大學', N'體育系', 48)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (149, N'大學', N'國立體育大學', N'體育系', 49)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (150, N'大學', N'國立體育大學', N'體育系', 50)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (151, N'大學', N'國立體育大學', N'體育系', 51)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (152, N'大學', N'國立體育大學', N'體育系', 52)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (153, N'大學', N'國立體育大學', N'體育系', 53)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (154, N'大學', N'國立體育大學', N'體育系', 54)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (155, N'大學', N'國立體育大學', N'體育系', 55)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (156, N'大學', N'國立體育大學', N'體育系', 56)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (157, N'大學', N'國立體育大學', N'體育系', 57)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (158, N'大學', N'國立體育大學', N'體育系', 58)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (159, N'大學', N'國立體育大學', N'體育系', 59)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (160, N'大學', N'國立體育大學', N'體育系', 60)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (161, N'大學', N'大同大學', N'電機系', 61)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (162, N'大學', N'大同大學', N'電機系', 62)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (163, N'大學', N'大同大學', N'電機系', 63)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (164, N'大學', N'大同大學', N'電機系', 64)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (165, N'大學', N'大同大學', N'電機系', 65)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (166, N'大學', N'大同大學', N'電機系', 66)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (167, N'大學', N'大同大學', N'電機系', 67)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (168, N'大學', N'大同大學', N'電機系', 68)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (169, N'大學', N'大同大學', N'電機系', 69)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (170, N'大學', N'大同大學', N'電機系', 70)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (171, N'大學', N'大同大學', N'電機系', 71)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (172, N'大學', N'大同大學', N'電機系', 72)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (173, N'大學', N'大同大學', N'電機系', 73)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (174, N'大學', N'大同大學', N'電機系', 74)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (175, N'大學', N'大同大學', N'電機系', 75)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (176, N'大學', N'臺灣大學', N'會計系', 76)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (177, N'大學', N'臺灣大學', N'會計系', 77)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (178, N'大學', N'臺灣大學', N'會計系', 78)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (179, N'大學', N'臺灣大學', N'會計系', 79)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (180, N'大學', N'臺灣大學', N'會計系', 80)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (181, N'大學', N'臺灣大學', N'會計系', 81)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (182, N'大學', N'臺灣大學', N'會計系', 82)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (183, N'大學', N'臺灣大學', N'會計系', 83)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (184, N'大學', N'臺灣大學', N'會計系', 84)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (185, N'大學', N'臺灣大學', N'會計系', 85)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (186, N'大學', N'臺灣大學', N'會計系', 86)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (187, N'大學', N'臺灣大學', N'會計系', 87)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (188, N'大學', N'臺灣大學', N'會計系', 88)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (189, N'大學', N'臺灣大學', N'會計系', 89)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (190, N'大學', N'臺灣大學', N'會計系', 90)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (191, N'大學', N'國立臺北商業大學', N'會計系', 91)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (192, N'大學', N'國立臺北商業大學', N'會計系', 92)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (193, N'大學', N'國立臺北商業大學', N'會計系', 93)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (194, N'大學', N'國立臺北商業大學', N'會計系', 94)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (195, N'大學', N'國立臺北商業大學', N'會計系', 95)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (196, N'大學', N'國立臺北商業大學', N'會計系', 96)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (197, N'大學', N'國立臺北商業大學', N'會計系', 97)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (198, N'大學', N'國立臺北商業大學', N'會計系', 98)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (199, N'大學', N'國立臺北商業大學', N'會計系', 99)
GO
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (200, N'大學', N'國立臺北商業大學', N'會計系', 100)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (201, N'高中', N'新北市立新莊高級中學', N'普通科', 101)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (202, N'大學', N'輔仁大學', N'醫學系', 101)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (203, N'高中', N'新北市立新莊高級中學', N'普通科', 102)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (204, N'大學', N'輔仁大學', N'醫學系', 102)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (205, N'高中', N'新北市立新莊高級中學', N'普通科', 103)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (206, N'大學', N'輔仁大學', N'醫學系', 103)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (207, N'高中', N'新北市立新莊高級中學', N'普通科', 104)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (208, N'大學', N'輔仁大學', N'醫學系', 104)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (209, N'高中', N'新北市立新莊高級中學', N'普通科', 105)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (210, N'大學', N'輔仁大學', N'醫學系', 105)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (211, N'高中', N'新北市立新莊高級中學', N'普通科', 106)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (212, N'大學', N'輔仁大學', N'醫學系', 106)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (213, N'高中', N'新北市立新莊高級中學', N'普通科', 107)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (214, N'大學', N'輔仁大學', N'醫學系', 107)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (215, N'高中', N'新北市立新莊高級中學', N'普通科', 108)
INSERT [dbo].[education] ([id], [degree], [school], [department], [basicInformationID]) VALUES (216, N'大學', N'輔仁大學', N'醫學系', 108)
SET IDENTITY_INSERT [dbo].[education] OFF
GO
SET IDENTITY_INSERT [dbo].[experience] ON 

INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (1, N'聯電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 1)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (2, N'聯電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 2)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (3, N'聯電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 3)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (4, N'聯電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 4)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (5, N'聯電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 5)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (6, N'聯電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 6)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (7, N'聯電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 7)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (8, N'聯電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 8)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (9, N'聯電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 9)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (10, N'聯電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 10)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (11, N'聯電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 11)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (12, N'聯電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 12)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (13, N'聯電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 13)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (14, N'聯電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 14)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (15, N'聯電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 15)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (16, N'台積電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 16)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (17, N'台積電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 17)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (18, N'台積電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 18)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (19, N'台積電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 19)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (20, N'台積電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 20)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (21, N'台積電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 21)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (22, N'台積電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 22)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (23, N'台積電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 23)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (24, N'台積電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 24)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (25, N'台積電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 25)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (26, N'台積電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 26)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (27, N'台積電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 27)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (28, N'台積電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 28)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (29, N'台積電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 29)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (30, N'台積電', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 30)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (31, N'華碩', N'前端工程師', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 31)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (32, N'華碩', N'前端工程師', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 32)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (33, N'華碩', N'前端工程師', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 33)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (34, N'華碩', N'前端工程師', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 34)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (35, N'華碩', N'前端工程師', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 35)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (36, N'華碩', N'前端工程師', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 36)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (37, N'華碩', N'前端工程師', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 37)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (38, N'華碩', N'前端工程師', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 38)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (39, N'華碩', N'前端工程師', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 39)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (40, N'華碩', N'前端工程師', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 40)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (41, N'華碩', N'前端工程師', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 41)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (42, N'華碩', N'前端工程師', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 42)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (43, N'華碩', N'前端工程師', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 43)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (44, N'華碩', N'前端工程師', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 44)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (45, N'華碩', N'前端工程師', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 45)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (46, N'南科', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 46)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (47, N'南科', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 47)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (48, N'南科', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 48)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (49, N'南科', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 49)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (50, N'南科', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 50)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (51, N'南科', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 51)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (52, N'南科', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 52)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (53, N'南科', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 53)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (54, N'南科', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 54)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (55, N'南科', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 55)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (56, N'南科', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 56)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (57, N'南科', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 57)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (58, N'南科', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 58)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (59, N'南科', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 59)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (60, N'南科', N'技術員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 60)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (61, N'國賓', N'櫃員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 61)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (62, N'國賓', N'櫃員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 62)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (63, N'國賓', N'櫃員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 63)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (64, N'國賓', N'櫃員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 64)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (65, N'國賓', N'櫃員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 65)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (66, N'國賓', N'櫃員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 66)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (67, N'國賓', N'櫃員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 67)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (68, N'國賓', N'櫃員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 68)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (69, N'國賓', N'櫃員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 69)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (70, N'國賓', N'櫃員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 70)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (71, N'國賓', N'櫃員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 71)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (72, N'國賓', N'櫃員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 72)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (73, N'國賓', N'櫃員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 73)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (74, N'國賓', N'櫃員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 74)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (75, N'國賓', N'櫃員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 75)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (76, N'統一超商', N'收銀員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 76)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (77, N'統一超商', N'收銀員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 77)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (78, N'統一超商', N'收銀員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 78)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (79, N'統一超商', N'收銀員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 79)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (80, N'統一超商', N'收銀員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 80)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (81, N'統一超商', N'收銀員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 81)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (82, N'統一超商', N'收銀員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 82)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (83, N'統一超商', N'收銀員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 83)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (84, N'統一超商', N'收銀員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 84)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (85, N'統一超商', N'收銀員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 85)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (86, N'統一超商', N'收銀員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 86)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (87, N'統一超商', N'收銀員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 87)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (88, N'統一超商', N'收銀員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 88)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (89, N'統一超商', N'收銀員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 89)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (90, N'統一超商', N'收銀員', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 90)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (91, N'中視', N'導演', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 91)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (92, N'中視', N'導演', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 92)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (93, N'中視', N'導演', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 93)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (94, N'中視', N'導演', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 94)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (95, N'中視', N'導演', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 95)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (96, N'中視', N'導演', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 96)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (97, N'中視', N'導演', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 97)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (98, N'中視', N'導演', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 98)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (99, N'中視', N'導演', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 99)
GO
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (100, N'中視', N'導演', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 100)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (101, N'中視', N'導演', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 101)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (102, N'中視', N'導演', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 102)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (103, N'中視', N'導演', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 103)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (104, N'中視', N'導演', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 104)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (105, N'中視', N'導演', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 105)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (106, N'中視', N'導演', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 106)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (107, N'中視', N'導演', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 107)
INSERT [dbo].[experience] ([id], [serviceUnit], [title], [jobDescription], [start], [finish], [basicInformationID]) VALUES (108, N'中視', N'導演', N'完成主管交辦任務', N'2021-01-30', N'2021-03-01', 108)
SET IDENTITY_INSERT [dbo].[experience] OFF
GO
SET IDENTITY_INSERT [dbo].[supervisor] ON 

INSERT [dbo].[supervisor] ([id], [name], [department], [title]) VALUES (1, N'鄭花花', 1, N'經理')
INSERT [dbo].[supervisor] ([id], [name], [department], [title]) VALUES (2, N'鄭一方', 1, N'副理')
INSERT [dbo].[supervisor] ([id], [name], [department], [title]) VALUES (3, N'陳發發', 2, N'經理')
INSERT [dbo].[supervisor] ([id], [name], [department], [title]) VALUES (4, N'林黃依', 2, N'副理')
INSERT [dbo].[supervisor] ([id], [name], [department], [title]) VALUES (5, N'蔡黃如', 3, N'經理')
INSERT [dbo].[supervisor] ([id], [name], [department], [title]) VALUES (6, N'賴旺宏', 3, N'副理')
INSERT [dbo].[supervisor] ([id], [name], [department], [title]) VALUES (7, N'林依芳', 4, N'經理')
INSERT [dbo].[supervisor] ([id], [name], [department], [title]) VALUES (8, N'陳芳瑜', 4, N'副理')
SET IDENTITY_INSERT [dbo].[supervisor] OFF
GO
USE [master]
GO
ALTER DATABASE [hr] SET  READ_WRITE 
GO
