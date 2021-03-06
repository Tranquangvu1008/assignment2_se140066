USE [master]
GO
/****** Object:  Database [Assignment2_TranQuangVu]    Script Date: 3/18/2021 8:02:28 AM ******/
CREATE DATABASE [Assignment2_TranQuangVu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment2_TranQuangVu', FILENAME = N'E:\App\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment2_TranQuangVu.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment2_TranQuangVu_log', FILENAME = N'E:\App\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment2_TranQuangVu_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment2_TranQuangVu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET QUERY_STORE = OFF
GO
USE [Assignment2_TranQuangVu]
GO
/****** Object:  Table [dbo].[tblHistory]    Script Date: 3/18/2021 8:02:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHistory](
	[historyID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](50) NOT NULL,
	[content] [varchar](100) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[questionID] [int] NOT NULL,
 CONSTRAINT [PK_tblHistory] PRIMARY KEY CLUSTERED 
(
	[historyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuestion]    Script Date: 3/18/2021 8:02:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuestion](
	[questionID] [int] IDENTITY(1,1) NOT NULL,
	[questionContent] [nvarchar](300) NOT NULL,
	[answerA] [nvarchar](100) NOT NULL,
	[answerB] [nvarchar](100) NOT NULL,
	[answerC] [nvarchar](100) NOT NULL,
	[answerD] [nvarchar](100) NOT NULL,
	[answerCorrect] [nvarchar](100) NOT NULL,
	[createDate] [date] NULL,
	[subjectID] [varchar](10) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblQuestion] PRIMARY KEY CLUSTERED 
(
	[questionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuiz]    Script Date: 3/18/2021 8:02:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuiz](
	[quizID] [int] IDENTITY(1,1) NOT NULL,
	[quizName] [varchar](50) NOT NULL,
	[questionID] [int] NOT NULL,
	[scoreID] [int] NOT NULL,
	[answer] [nvarchar](100) NOT NULL,
	[score] [float] NOT NULL,
 CONSTRAINT [PK_tblQuiz] PRIMARY KEY CLUSTERED 
(
	[quizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 3/18/2021 8:02:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[roleID] [varchar](10) NOT NULL,
	[roleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblScore]    Script Date: 3/18/2021 8:02:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblScore](
	[scoreID] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[totalScore] [float] NOT NULL,
	[userID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblScore_1] PRIMARY KEY CLUSTERED 
(
	[scoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubject]    Script Date: 3/18/2021 8:02:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubject](
	[subjectID] [varchar](10) NOT NULL,
	[subjectName] [varchar](100) NOT NULL,
	[limitTime] [int] NULL,
	[numOfQues] [int] NULL,
 CONSTRAINT [PK_tblSubject] PRIMARY KEY CLUSTERED 
(
	[subjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 3/18/2021 8:02:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](50) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[password] [varchar](200) NOT NULL,
	[roleID] [varchar](10) NOT NULL,
	[phoneNumber] [varchar](15) NULL,
	[email] [varchar](50) NULL,
	[address] [nvarchar](100) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblHistory] ON 

INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (1, N'admin', N'admin add new question 1', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (2, N'admin', N'admin add new question 2', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (3, N'admin', N'admin add new question 3', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (4, N'admin', N'admin add new question 4', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (5, N'admin', N'admin add new question 5', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (6, N'admin', N'admin add new question 6', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (7, N'admin', N'admin add new question 7', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (8, N'admin', N'admin add new question 8', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (9, N'admin', N'admin update question 8', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (10, N'admin', N'admin add new question 9', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (11, N'admin', N'admin add new question 10', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (12, N'admin', N'admin add new question 11', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 11)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (13, N'admin', N'admin add new question 12', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (14, N'admin', N'admin add new question 13', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (15, N'admin', N'admin add new question 14', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 14)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (16, N'admin', N'admin update question 10', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (17, N'admin', N'admin add new question 14', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 14)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (18, N'admin', N'admin add new question 14', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 14)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (19, N'admin', N'admin update question 15', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 15)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (20, N'admin', N'admin update question 15', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 15)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (21, N'admin', N'admin update question 16', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 16)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (22, N'admin', N'admin update question 16', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 16)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (23, N'admin', N'admin add new question 17', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 17)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (24, N'admin', N'admin add new question 18', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 18)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (25, N'admin', N'admin add new question 19', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 19)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (26, N'admin', N'admin add new question 20', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 20)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (27, N'admin', N'admin add new question 21', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 21)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (28, N'admin', N'admin add new question 22', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 22)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (29, N'admin', N'admin add new question 23', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 23)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (30, N'admin', N'admin add new question 24', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 24)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (31, N'admin', N'admin add new question 25', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 25)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (32, N'admin', N'admin add new question 26', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 26)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (33, N'admin', N'admin add new question 27', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 27)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (34, N'admin', N'admin add new question 28', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 28)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (35, N'admin', N'admin add new question 29', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 29)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (36, N'admin', N'admin add new question 30', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 30)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (37, N'admin', N'admin add new question 31', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 31)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (38, N'admin', N'admin add new question 32', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 32)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (39, N'admin', N'admin add new question 33', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 33)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (40, N'admin', N'admin add new question 34', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 34)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (41, N'admin', N'admin add new question 35', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 35)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (42, N'admin', N'admin add new question 36', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 36)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (43, N'admin', N'admin add new question 37', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 37)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (44, N'admin', N'admin add new question 38', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 38)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (45, N'admin', N'admin add new question 39', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 39)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (46, N'admin', N'admin add new question 40', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 40)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (47, N'admin', N'admin add new question 41', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 41)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (48, N'admin', N'admin add new question 42', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 42)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (49, N'admin', N'admin add new question 43', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 43)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (50, N'admin', N'admin add new question 44', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 44)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (51, N'admin', N'admin add new question 45', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 45)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (52, N'admin', N'admin add new question 46', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 46)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (53, N'admin', N'admin add new question 47', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 47)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (54, N'admin', N'admin add new question 48', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 48)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (55, N'admin', N'admin add new question 49', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 49)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (56, N'admin', N'admin add new question 50', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 50)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (57, N'admin', N'admin update question 1', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (58, N'admin', N'admin update question 1', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (59, N'admin', N'admin update question 1', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (60, N'admin', N'admin update question 1', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (61, N'admin', N'admin update question 1', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (62, N'admin', N'admin add new question 51', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 51)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (63, N'admin', N'admin add new question 52', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 52)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (64, N'admin', N'admin add new question 53', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 53)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (65, N'admin', N'admin add new question 54', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 54)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (66, N'admin', N'admin add new question 55', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 55)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (67, N'admin', N'admin add new question 56', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 56)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (68, N'admin', N'admin add new question 57', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 57)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (69, N'admin', N'admin add new question 58', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 58)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (70, N'admin', N'admin add new question 59', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 59)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (71, N'admin', N'admin add new question 60', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 60)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (72, N'admin', N'admin add new question 61', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 61)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (73, N'admin', N'admin add new question 62', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 62)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (74, N'admin', N'admin update question 62', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 62)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (75, N'admin', N'admin add new question 63', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 63)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (76, N'admin', N'admin add new question 64', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 64)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (77, N'admin', N'admin add new question 65', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 65)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (78, N'admin', N'admin add new question 66', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 66)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (79, N'admin', N'admin add new question 67', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 67)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (80, N'admin', N'admin add new question 68', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 68)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (81, N'admin', N'admin add new question 69', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 69)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (82, N'admin', N'admin add new question 70', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 70)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (83, N'admin', N'admin add new question 71', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 71)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (84, N'admin', N'admin add new question 72', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 72)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (85, N'admin', N'admin add new question 73', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 73)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (86, N'admin', N'admin add new question 74', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 74)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (87, N'admin', N'admin add new question 75', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 75)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (88, N'admin', N'admin add new question 76', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 76)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (89, N'admin', N'admin add new question 77', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 77)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (90, N'admin', N'admin add new question 78', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 78)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (91, N'admin', N'admin add new question 79', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 79)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (92, N'admin', N'admin add new question 60', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 60)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (93, N'admin', N'admin add new question 81', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 81)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (94, N'admin', N'admin add new question 59', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 59)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (95, N'admin', N'admin add new question 71', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 71)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (96, N'admin', N'admin add new question 84', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 84)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (97, N'admin', N'admin add new question 85', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 85)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (98, N'admin', N'admin add new question 86', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 86)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (99, N'admin', N'admin add new question 66', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 66)
GO
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (100, N'admin', N'admin add new question 88', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 88)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (101, N'admin', N'admin add new question 89', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 89)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (102, N'admin', N'admin add new question 90', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 90)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (103, N'admin', N'admin add new question 91', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 91)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (104, N'admin', N'admin add new question 92', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 92)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (105, N'admin', N'admin add new question 93', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 93)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (106, N'admin', N'admin add new question 94', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 94)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (107, N'admin', N'admin add new question 95', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 95)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (108, N'admin', N'admin add new question 96', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 96)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (109, N'admin', N'admin add new question 68', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 68)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (110, N'admin', N'admin add new question 98', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 98)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (111, N'admin', N'admin add new question 64', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 64)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (112, N'admin', N'admin add new question 100', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 100)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (113, N'admin', N'admin add new question 101', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 101)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (114, N'admin', N'admin add new question 102', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 102)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (115, N'admin', N'admin add new question 103', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 103)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (116, N'admin', N'admin add new question 104', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 104)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (117, N'admin', N'admin add new question 105', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 105)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (118, N'admin', N'admin add new question 106', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 106)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (119, N'admin', N'admin add new question 107', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 107)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (120, N'admin', N'admin add new question 108', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 108)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (121, N'admin', N'admin add new question 109', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 109)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (122, N'admin', N'admin add new question 110', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 110)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (123, N'admin', N'admin add new question 111', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 111)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (124, N'admin', N'admin add new question 112', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 112)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (126, N'admin', N'admin update question 112', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 112)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (127, N'admin', N'admin update question 112', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 112)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (128, N'admin', N'admin add new question 114', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 114)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (129, N'admin', N'admin add new question 115', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 115)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (130, N'admin', N'admin add new question 116', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 116)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (131, N'admin', N'admin add new question 117', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 117)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (132, N'admin', N'admin add new question 118', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 118)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (133, N'admin', N'admin update question 118', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 118)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (134, N'admin', N'admin add new question 119', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 119)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (135, N'admin', N'admin add new question 120', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 120)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (136, N'admin', N'admin add new question 121', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 121)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (137, N'admin', N'admin update question 121', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 121)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (138, N'admin', N'admin add new question 122', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 122)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (139, N'admin', N'admin add new question 123', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 123)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (141, N'admin', N'admin add new question 125', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 125)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (142, N'admin', N'admin add new question 126', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 126)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (143, N'admin', N'admin add new question 127', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 127)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (144, N'admin', N'admin add new question 128', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 128)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (145, N'admin', N'admin add new question 129', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 129)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (146, N'admin', N'admin add new question 130', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 130)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (148, N'admin', N'admin add new question 132', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 132)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (149, N'admin', N'admin add new question 133', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 133)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (150, N'admin', N'admin add new question 134', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 134)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (151, N'admin', N'admin add new question 135', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 135)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (152, N'admin', N'admin add new question 136', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 136)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (154, N'admin', N'admin add new question 138', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 138)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (155, N'admin', N'admin add new question 138', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 138)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (156, N'admin', N'admin add new question 140', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 140)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (157, N'admin', N'admin update question 140', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 140)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (158, N'admin', N'admin add new question 141', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 141)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (159, N'admin', N'admin add new question 142', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 142)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (160, N'admin', N'admin add new question 143', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 143)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (161, N'admin', N'admin add new question 143', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 143)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (162, N'admin', N'admin add new question 145', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 145)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (163, N'admin', N'admin add new question 146', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 146)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (164, N'admin', N'admin add new question 147', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 147)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (165, N'admin', N'admin update question 147', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 147)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (166, N'admin', N'admin add new question 148', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 148)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (167, N'admin', N'admin add new question 149', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 149)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (169, N'admin', N'admin update question 122', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 122)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (170, N'admin', N'admin update question 19', CAST(N'2021-02-15T00:00:00.000' AS DateTime), 19)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (171, N'admin', N'admin update question 7', CAST(N'2021-02-15T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[tblHistory] ([historyID], [userID], [content], [createDate], [questionID]) VALUES (172, N'admin', N'admin update question 1', CAST(N'2021-03-18T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblQuestion] ON 

INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (1, N'The cache is responsible for...?', N'speeding up the operation and processing of the computer', N'the cache is responsible for slowing down computer operations and processing.', N'storing most of the computer''s data', N'restoring the original settings of the computer', N'speeding up the operation and processing of the computer', CAST(N'2021-01-23' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (2, N'Choose the wrong answer Method of Accessing Units of Data have...?', N' Memory is organized into units of data called records', N'Access time is variable', N'Access time is fixed', N' Access must be made in a specific linear sequence', N'Access time is fixed', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (3, N'Design constraints on a computer''s memory can be summed up by three questions:', N'How much? How fast? How expensive?', N'How much? How far? How expensive?', N'How much? How long? How expensive?', N'How many? How fast? How expensive?', N'How much? How fast? How expensive?', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (4, N'We was learned about diagram Memory Hierarchy. In inboard memory have:', N'Registers, cache, DVD-RAM', N'Registers, cache, main memory', N'CD-ROM, cache, main memory', N'Registers, cache, magnetic tape', N'Registers, cache, main memory', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (5, N'What is RA mean?', N'Read Address', N'Read Assignments', N'Remember Address', N'Remember Assignments', N'Read Address', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (6, N'A portion of main memory used as a buffer to hold data temporarily that is to be read out to disk is referred to as a _________.', N'Disk cache', N'Latency', N'Virtual address', N' Miss', N'Disk cache', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (7, N'A line includes a _________ that identifies which particular block is currently being stored.', N'Cache', N'Hit', N'Tag', N' Locality', N' Tag', CAST(N'2021-02-02' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (8, N'The key advantage of the __________ design is that it eliminates contention for the cache between the instruction fetch/decode unit and the execution unit', N'Logical cache', N'Split cache', N'Unified cache', N'Physical ', N'Logical cache', CAST(N'2021-02-02' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (9, N'A logical cache stores data using __________', N'Physical addresses', N'Virtual addresses', N'Random addresses', N' None of the above', N'Virtual addresses', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (10, N'In reference to access time to a two-level memory, a _________ occurs if an accessed word is not found in the faster memory?', N'Miss', N'Hit', N'Line', N'Tag', N'Miss', CAST(N'2021-02-02' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (11, N'When using the __________ technique all write operations made to main memory are made to the cache as well.', N'Write back', N'LRU', N' Write through', N'Unified cache', N' Write through', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (12, N'__________ is the simplest mapping technique and maps each block of main memory into only one possible cache line.', N'Direct mapping', N'Associative mapping', N'Set associative mapping', N' None of the above', N'Direct mapping', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (13, N'The ________ consists of the access time plus any additional time required before a second access can commence.', N'Latency', N'Memory cycle time', N' Direct access', N'Transfer rate', N'Memory cycle time', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (14, N'The transfer between CPU and Cache is ______________', N'Block transfer', N'Word transfer', N'Set transfer', N'Associative transfer', N'Word transfer', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (15, N'For random-access memory, __________ is the time from the instant that an address is presented to the memory to the instant that data have been stored or made available for use.', N'Memory cycle time', N'Direct access', N'Transfer rate', N'Access time', N'Access time', CAST(N'2021-01-31' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (16, N'individual blocks or records have a unique address based on physical location with', N'Associative', N'Physical access', N' Direct access', N'Sequential access', N' Direct access', CAST(N'2021-01-31' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (17, N'Internal memory capacity is typically expressed in terms of ______', N'Hertz', N'Nanos', N'Bytes', N'LOR', N'Bytes', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (18, N'The ________ enables the RAM chip to preposition bits to be placed on the databus as rapidly as possible.', N'Flash memory', N'Hamming code', N'RamBus', N'Buffer', N'Buffer', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (19, N'A DDR3 module transfers data at a clock rate of __________ MHz.', N'600 to 1200', N'800 to 1600', N'1000 to 2000', N' 1500 to 3000', N'800 to 1600', CAST(N'2021-02-02' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (20, N'Theoretically, a DDR module can transfer data at a clock rate in the range of __________ MHz.', N' 200 to 600', N'400 to 1066', N' 600 to 1400', N'800 to 1600', N' 200 to 600', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (21, N'Which access time RAM is fastest?', N' SDRAM', N' DDR', N'RDRAM', N'ROM', N'RDRAM', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (22, N'Compare transfer rate of SDRAM, RDRAM, DDR.', N'SDRAM > RDRAM > DDR', N'SDRAM > DDR > RDRAM', N'RDRAM > DDR > SDRAM', N'RDRAM > SDRAM > DDR', N'RDRAM > DDR > SDRAM', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (23, N'________ increases the prefetch buffer size to 8 bits.', N'CDRAM', N'RDRAM', N'DDR3', N'All of the above', N'DDR3', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (24, N'_______ can send data to the processor twice per clock cycle', N'CDRAM', N'SDRAM', N'DDR-DRAM', N'RDRAM', N'DDR-DRAM', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (25, N'_________ can be caused by power supply problems or alpha particles.', N'Soft errors', N'AGT errors', N'Hard errors', N'SEC errors', N'Soft errors', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (26, N'__________ can be caused by harsh environmental abuse, manufacturing defects, and wear.', N'SEC errors', N'Hard errors', N'Syndrome errors', N'Soft errors', N'Hard errors', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (27, N'With _________ the microchip is organized so that a section of memory cells are erased in a single action', N'Flash memory', N'SDRAM', N'DRAM', N'EEPROM', N'Flash memory', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (28, N'In a _________, binary values are stored using traditional flip-flop logic-gate configurations.', N'ROM', N'SRAM', N'DRAM', N'RAM', N'SRAM', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (29, N'Which of the following memory types are nonvolatile?', N' Erasable PROM', N' Programmable ROM', N' Flash memory', N'All of the above', N'All of the above', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (30, N'One distinguishing characteristic of memory that is designated as _________ is that it is possible to both to read data from the memory and to write new data into the memory easily and rapidly.', N'RAM', N' ROM', N'EPROM', N'EEPROM', N'EPROM', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (31, N'Which properties do all semiconductor memory cells share?', N'They exhibit two stable states which can be used to represent binary 1 and 0', N' They are capable of being written into to set the state', N'They are capable of being read to sense the state', N'. All of the above', N'. All of the above', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (32, N'The basic element of a semiconductor memory is the................', N'Memory cell', N'RAM', N'DRAM', N' ROM', N'Memory cell', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (33, N'A characteristic of ....... is that it is volatile', N'ROM', N'RAM', N'SRAM', N'cylinders', N'RAM', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (34, N'The traditional forms of RAM used in computers are...........', N'DRAM', N'SRAM', N'DDR SRAM', N' DRAM and SRAM', N' DRAM and SRAM', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (35, N'The areas between pits are called _________.', N'lands', N' sectors', N' cylinders', N'strips', N'lands', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (36, N'Two different parity calculations are carried out and stored in separate blocks on different disks', N'RAID level 6 disadvantage', N'RAID level 6 characteristics', N'RAID level 2 advantage', N'RAID level 0 applications', N'RAID level 6 characteristics', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (37, N'Frequently used in applications that require high bandwidth but not high I/O rates.', N'RAID level 6 disadvantage', N' RAID level 3 application', N' RAID level 2 advantage', N'RAID level 0 disadvantage', N' RAID level 3 application', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (38, N'Contiguous blocks data are read and written in', N' Physical records', N'Magnetic disk', N'RAID level 0 advantage', N'Parallel Recording', N' Physical records', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (39, N'The sum of the seek and the rotational delay; the time it takes to get into position to read/write.', N'Seek time', N' CAV advantage', N'Striping', N'Access time', N'Access time', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (40, N'Data are laid out as a sequence of bits along each track.', N'Inter-record gaps', N'Serial Recording', N'Parallel Recording', N'Track length can be...', N'Serial Recording', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (41, N'Uses twice as many disks as a non-redundant disk array.', N'RAID level 2 advantage', N' RAID level 4 disadvantage', N'RAID level 6 disadvantage', N'RAID level 1 disadvantage', N'RAID level 1 disadvantage', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (42, N'Set of physical disk drives viewed by the OS as a single logical drive', N'With RAID level 2, if a disk fails', N' Rotational delay (latency)', N'. Redundant array of independent disks (RAID)', N'Non-redundant RAID (RAID level 0)', N'. Redundant array of independent disks (RAID)', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (43, N'Individual blocks of data can be directly addressed by track and sector', N'Physical records', N'Magnetic disk', N'MZR disadvantage', N'CAV advantage', N'CAV advantage', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (44, N'Which is not a magnetic disk?', N'Floppy', N' HDD', N' SSD', N' A&C', N' SSD', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (45, N'Data are transferred to and from the disk in __________.', N'Tracks', N'Gaps', N'Sectors', N'Pits', N'Sectors', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (46, N'The hard disk in a personal computer is a ________.', N'Movable-head disk', N'Double sided disk', N'Removable disk', N'Movable-head disk', N'Movable-head disk', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (47, N'The set of all the tracks in the same relative position on the platter is referred to as a', N'Floppy disk', N'Single-sided disk', N'Sector', N'Cylinder', N'Floppy disk', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (48, N'Scanning information at the same rate by rotating the disk at a fixed speed is known as the _________.', N'Constant angular velocity', N'Magnetoresistive', N'Rotational delay', N'Constant linear velocity', N'Constant angular velocity', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (49, N'Gaps that separate blocks on the tape', N'Serial Recording', N'RAID level 5 advantage', N'Parallel Recording', N' Inter-record gap', N' Inter-record gap', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (50, N'Technique of segmenting logically sequential data so that consecutive segments are stored on different storage devices', N' Serial Recording', N'Seek time', N' Striping', N'Acess time', N' Striping', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (51, N'Which is not a programming language?', N'WinZip', N'C++', N'Java', N'Visual Basic', N'WinZip', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (52, N'Most computers theses days use the ...................... bus', N' ASI', N'VLSI', N'ACM', N'PCI', N'PCI', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (53, N'Today, Microsoft considers its major competition in operating systems to be what system?', N'Linux operating system', N'Mac OS X', N'Sega Game OS', N' Lotus 1-2-3', N'Linux operating system', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (54, N'IBM has some of its origins in what 1890 event?', N'Vacuum tube was invented', N'The U.S. census', N'The Jacquard loom appeared in US', N'Ada Lovelace''s first program loop', N'The U.S. census', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (55, N'What important concept is attributed to John Von Neumann?', N' CPU concept', N'Stored program concept', N'Stored data and program concept', N'Stored data concept', N'Stored program concept', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (56, N'Which graphic format is best suited for displaying animated images?', N'TIF', N'JPG', N'BMP', N'GIF', N'GIF', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (57, N'Name 4 important elements of Babbage''s Engine that are components of today''s computer:', N'CPU, vacuum tube, input device, output device', N'Magnetic drum, memory, input device, output device', N'CPU, memory, input-output device, clock', N'CPU, memory, input device, output device', N'CPU, memory, input device, output device', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (58, N'The .............................. contains instructions and data that provide the startup program for a computer.', N'BIOS', N' CU', N'CPU', N'SRAM', N'BIOS', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (59, N'Which of the following define the display quantity of a monitor?', N'Resolution', N'Flip rate', N'Beam strength', N'Inversion', N'Resolution', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (60, N'Which is not a valid file compression format extension?', N'gz', N' tar', N'zip', N'None of the above', N' tar', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (61, N'Which of the following is used to create SRAM?', N'Flip-flop', N'Decoder', N' CRT', N'ROM', N'Flip-flop', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (62, N'Which method to transform a graphic is used to change the image so that it can be displayed on a document that is in landscape orientation?', N'Scaling', N'Format conversion', N'Rotation', N'Cropping', N'Rotation', CAST(N'2021-02-02' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (63, N'Which one of the following is not one of the bus signal groups?', N'Data', N'Control', N'Address', N'Fetch', N'Fetch', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (64, N'An OS method of allowing multiple processes to share the CPU is:', N'I/O', N'Time Slicing', N'Multiuser', N'Command line', N'Time Slicing', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (65, N'What numeric value in hexadecimal is equivalent to the binary number 1011 1110 1010 1101?', N' BEBD', N'CEAD', N'BEAC', N'BEAD', N'BEAD', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (66, N'The ________ portion of an OS remains in memory the entire time the computer is on.', N'Overlay', N' Interrupt', N' Kernel', N'CPU', N' Kernel', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (67, N'What is the ASCII code (in in the hexadecimal number) for the UPPERCASE letter A?', N'41', N'42', N'43', N'44', N'41', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (68, N'Command-Line switches are used to:', N'Remove folders', N'Disable the operating system', N'Modify the command''s operation', N'Enable the graphical interface', N'Modify the command''s operation', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (69, N'What part of the CPU is responsible for the mathematical operator?', N'RLU', N'ALU', N'CU', N' VLSI', N'ALU', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (70, N'High speed ..................................... is used to speed processing in a computer system?', N'ROM', N'Cache memory', N'CDROM', N'Mass storage', N'Cache memory', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (71, N'Most computers today are based on:', N'Von Neumann architecture', N' Tabulation basics', N'Upscale integration', N'Small-Scale Integration', N'Von Neumann architecture', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (72, N'The ________ layer is responsible for the process-to-process delivery of the entire message.', N'physical', N'transport', N'data link', N'network', N'transport', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (73, N'The ______ layer establishes, maintains, and synchronizes the interactions between communicating devices.', N'transport', N'network', N'session', N'physical', N'session', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (74, N'The Internet model consists of _______ layers.', N'Five', N'Eight', N'Seven', N'Three', N'Five', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (75, N'__________ provides full transport layer services to applications.', N'TCP', N'ARP', N'none of the above', N'UDP', N'TCP', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (76, N'The physical layer is concerned with the movement of _______ over the physical medium.', N'programs', N' bits', N'protocols', N'dialogs', N' bits', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (77, N'In the OSI model, as a data packet moves from the lower to the upper layers, headers are _______.', N'removed', N'rearranged', N'added', N'modified', N'removed', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (78, N'The _______ model shows how the network functions of a computer ought to be organized.', N'CCITT', N'ISO', N'OSI', N' ANSI', N'OSI', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (79, N'The ________ address, also known as the link address, is the address of a node as defined by its LAN or WAN.', N'logical', N'none of the above', N'physical', N'port', N'physical', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (80, N'Which is not a valid file compression format extension?', N' tar', N'gz', N'zip', N'None of the above', N' tar', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (81, N'What is a common use of spreadsheets?', N'Creating a resume', N'Managing a project''s milestones', N'Creating a budget', N' Creating a program', N'Creating a budget', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (82, N'Which of the following define the display quantity of a monitor?', N'Inversion', N'Resolution', N'Beam strength', N'Flip rate', N'Resolution', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (83, N'Most computers today are based on:', N'Upscale integration', N'Tabulation basics', N'Von Neumann architecture', N'Small-Scale Integration', N'Von Neumann architecture', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (84, N'The quality of a printer is measured by .......................', N'CU', N'PPM', N'DPI', N'RAM', N'DPI', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (85, N'Which of the following memory types is the fasted?', N'DRAM', N'SRAM', N'ROM', N'XOR', N'SRAM', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (86, N'How many different colors can be represented with a 24-bit pixel?', N'Less than 16 million different colors', N'Exactly 16 million different colors', N'More than 17 million different colors', N'More than 16 million different colors', N'More than 16 million different colors', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (87, N'The ________ portion of an OS remains in memory the entire time the computer is on.', N'Overlay', N'Kernel', N'Interrupt', N'CPU', N'Kernel', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (88, N'What is the binary result of adding the binary numbers 1001 + 1111?', N'11000', N'11010', N' 10100', N'11100', N'11000', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (89, N'How many unique characters does Extended ASCII allow?', N'127', N'256', N'128', N'255', N'256', CAST(N'2021-02-04' AS Date), N'CEA201', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (90, N'Before a disk can be used, it must be:', N'Enable and locked', N'Partitioned and formatted', N'Time sliced', N'Filled with folders and files', N'Partitioned and formatted', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (91, N'What numeric value in BASE 10 does the binary number 1010101 represent?', N'88', N'89', N'87', N'85', N'85', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (92, N'What is the binary equivalent of the decimal number 345?', N' 101011001', N'1010110011', N'10101101', N' 10101100', N' 101011001', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (93, N'DOS stands for:', N'Demand open sources', N'Device outer shell', N'Disk operating system', N'Direct operating system', N'Disk operating system', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (94, N'Which of the following IS NOT a multi-tasking OS?', N'Windows', N'UNIX', N'DOS', N'Linux', N'DOS', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (95, N'What BASE 10 value is equivalent to 1C4B?', N'8243', N'7244', N'7245', N'7243', N'7243', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (96, N'In Windows Explorer you can select multiple folders and files by using the left mouse button combined with which of the following:', N'Shift key', N'Double clicking', N'Alt key', N' Right mouse button', N'Shift key', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (97, N'Command-Line switches are used to:', N'Modify the command''s operation', N' Remove folders', N'Enable the graphical interface', N'Disable the operating system', N'Modify the command''s operation', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (98, N'The process of __________ arranges the disk''s surface into addressable areas and sets up the disk''s basic directory tree structure.', N'Booting', N'Formatting', N'Partitioning', N'Time slicing', N'Formatting', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (99, N'An OS method of allowing multiple processes to share the CPU is:', N'Command line', N' Time Slicing', N'I/O', N'Multiuser', N' Time Slicing', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
GO
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (100, N'Which type of I/O is most efficient?', N'Polling', N'Logic', N' Boolean', N'Interrupt', N'Interrupt', CAST(N'2021-02-04' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (101, N'A ____ is a logically coherent collection of data with some inherent meaning, representing some aspect of real world and being designed, built and populated with data for a specific purpose', N'Database', N'Database Instance', N'Schema', N'Schema Instance', N'Database', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (102, N'Choose the most correct statement.', N'Database is created and maintained by a DMBS', N' All of the others', N'Database is a collection of data that is managed by a DBMS', N'Database is a collection of information that exists over a long period of time', N' All of the others', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (103, N'Which of following is never used as a data model?', N'Hierarchical data model', N'None of the others', N' Graph-based data model', N'Tree-based data model', N'None of the others', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (104, N'A ____ is a relation name, together with the attributes of that relation.', N'schema', N'database', N'database instance', N'schema instance', N'schema', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (105, N'A ___ is a notation for describing the structure of the data in a database, along with the constraints on that data', N'data model', N'database management system', N'data operation', N' data manipulation', N'data model', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (106, N'A _____ is a language for defining data structures', N' DDL', N'DML', N'DCL', N'None of the others', N' DDL', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (107, N' Which statement is used to remove a relation named R?', N'DROP TABLE R;', N'REMOVE TABLE R;', N'DELETE TABLE R;', N'TRUNCATE TABLE R;', N'DROP TABLE R;', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (108, N' What is another term for a row in a relational table?', N' Attribute', N' Tuple', N'Field', N'Relation', N' Tuple', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (109, N'Given a relation R(A,B,C,D). Which of the followings is trivial?', N'A->AB', N'A->->AB', N'A->BCD', N'A->->BCD', N'A->->BCD', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (110, N'Let R(ABCD) be a relation with functional dependencies {A -> B, C -> B, B -> D} What is the key for R (choose one)', N'AB', N'AC', N'AD', N'BD', N'AC', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (111, N'Suppose R is a relation with attributes A1, A2, A3, A4. The only key of R is {A1, A2}. So, how many super-keys do R have?', N'4', N'8', N'12', N'16', N'4', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (112, N'What is the benefit of de-normalization?', N'De-normalization means allowing redundancy in a table', N'De-normalization means allowing duplicate columns appeared in a table', N'De-normalization means allowing a table to have more than 3 columns', N'De-normalization means allowing a table to have more than 1024 columns', N'De-normalization means allowing redundancy in a table', CAST(N'2021-02-01' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (114, N'The key for a weak entity set E is .........', N' Zero or more attributes of E', N' The set of attributes of supporting relationships for E', N'The set of attributes of supporting entity sets', N' Zero or more attributes of E and key attributes from supporting entity sets', N' Zero or more attributes of E and key attributes from supporting entity sets', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (115, N' A class in UML is similar to...........', N'An entity set in E/R model', N'An attribute in E/R model', N' A Relationship in E/R model', N'None of the others', N'An entity set in E/R model', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (116, N'Which of the following is NOT a standard aggregation operator?', N'GROUP', N'SUM', N'COUNT', N'AVG', N'GROUP', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (117, N'How many JOIN conditions are necessary to combine five tables based on common attributes?', N'1', N'2', N'3', N'4', N'4', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (118, N'What operator tests column for the absence of data?', N'IS BLANK operator', N' IS ZERO operator', N'IS NULL operator', N'ISNULL operator', N'IS NULL operator', CAST(N'2021-02-03' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (119, N'What does NULL mean?', N'The value NULL means UNKNOWN', N'The value NULL means '''' (empty string)', N'The value NULL means '' '' (space character)', N' The value NULL means ZERO', N'The value NULL means UNKNOWN', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (120, N'Which SQL keyword is used to sort the result-set?', N'ORDER BY', N' SORT BY', N'ORDER', N' SORT', N'ORDER BY', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (121, N'A(an) _____ asserts that a value appearing in one relation must also appear in the primary-key component(s) of another relation', N'Unique key constraint', N'Primary key constraint', N' Foreign key constraint', N'Candidate key constraint', N' Foreign key constraint', CAST(N'2021-02-03' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (122, N' What is difference between PRIMARY KEY and UNIQUE KEY ?', N'. A table can have more than one UNIQUE KEY constraint but only one PRIMARY KEY', N'A table can have more than one PRIMARY KEY constraint but only one UNIQUE KEY', N'UNIQUE KEY and PRIMARY KEY are the same', N'None of the others  a', N'. A table can have more than one UNIQUE KEY constraint but only one PRIMARY KEY', CAST(N'2021-02-03' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (123, N'A/An _____ is a data structure that makes it efficient to find those tuples that have a fixed value for an attribute', N'Index', N'Trigger', N' stored-procedure', N'View ', N'Index', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (125, N'___ allow the database application to find data fast, without reading the whole table', N' Indexes', N'Views', N'Triggers', N'Store-procedures', N' Indexes', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (126, N'Well-designed ____ can reduce disk I/O operations and consume fewer system resources therefore improving query performance', N'Triggers', N'Indexes', N' Views', N'Stored Procedures', N'Indexes', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (127, N'Which of the following statements is the most correct?', N'Using Stored procedures reduces network traffic', N' Using Stored procedures improves security', N'Using Stored procedures improves performance', N'All of the others', N'All of the others', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (128, N'A ____ table is a table that is embedded within another table', N' Nested', N'Primitive', N'Parent', N'Child', N' Nested', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (129, N' A database of _____ data model is a collection of nodes, each node is either a leaf or', N'semi-structured', N'relational', N'network', N'object-relational', N'semi-structured', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (130, N' In _____ Data Model, the data and relations between them are organized in tables', N'Relational', N'Network', N'Flat-file', N'Object-oriented', N'Relational', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (132, N'Schema-altering commands are known as _________ commands.', N'Data Definition Language', N'Data Manipulation Language', N'Data Controlling Language', N'None of the others', N'Data Definition Language', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (133, N'Which one of the following is NOT a DML command? a. DELETE', N'DELETE', N' ALTER TABLE', N' INSERT', N' UPDATE', N' ALTER TABLE', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (134, N' Which of the following statements is correct?', N' All relations in 3NF are also in BCNF', N' For any relation schema, there is a dependency-preserving decomposition into 3NF', N'All relations in 2NF are also in BCNF', N'None of the others', N' For any relation schema, there is a dependency-preserving decomposition into 3NF', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (135, N'Which of the following statements is true?', N'BCNF condition guarantees the non existence of the anomalies.', N' In BCNF condition, the left side of every non trivial FD must be a super key.', N' In BCNF condition, the left side of every non trivial FD must be a super key.', N' All of the others.', N' All of the others.', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (136, N' How to eliminate anomalies when we design a database?', N'We should decompose relation to eliminate anomalies', N'We should join relations to eliminate anomalies', N'We should union relations to eliminate anomalies', N'None of the others', N'We should decompose relation to eliminate anomalies', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (138, N'The ER Diagram uses three principle element types:', N'Entity sets, Attributes and Constraints', N'Entity sets, Attributes, and Relationships', N' Attributes, Constraints, and Relationships', N'Entity sets, Constraints, and Relationships  c', N'Entity sets, Attributes, and Relationships', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (139, N'The ER Diagram uses three principle element types:', N'Entity sets, Attributes and Constraints', N'Entity sets, Attributes, and Relationships', N' Attributes, Constraints, and Relationships', N'Entity sets, Constraints, and Relationships  c', N'Entity sets, Attributes, and Relationships', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (140, N'The binary relationship between classes in UML is called ...', N' Aggregation', N'Composition', N' Association', N'Relation', N' Association', CAST(N'2021-02-03' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (141, N' A tuple which fails to participate in a join is called:', N'dangling tuple', N'child tuple', N' parent tuple', N'neighbor tuple  a', N'dangling tuple', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (142, N' (TRUE OR NULL) return:', N' TRUE', N'FALSE', N'NULL', N'None of the others', N' TRUE', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (143, N'Choose one correct statement:', N'Two null values are equal', N'Comparisons between two null values, or between a NULL and any other value, return unknown', N'Comparisons between two null values, or between a NULL and any other value, return FALSE', N'None of the others', N'Comparisons between two null values, or between a NULL and any other value, return unknown', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (144, N'Choose one correct statement:', N' No two null values are equal', N' Two null values are equal', N'Comparisons between two null values, or between a NULL and any other value, return FALSE', N'None of the others', N' No two null values are equal', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (145, N'Foreign key constraints are created by using "_____" keyword to refer to the primary key of another table', N'REFERENCES', N'POINT TO', N'REFER', N'None of the others', N'REFERENCES', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (146, N'The SQL operations that are performed while a connection is active form a ____', N'Session', N'Catalog', N'Module', N'None of the others', N'Session', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (147, N'In PSM, the difference between a stored procedure and a function is that:', N' A function has the return statement', N'We can declare local variables in a function', N'Loops are not allowed in a function', N'All of the others', N' A function has the return statement', CAST(N'2021-02-03' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (148, N'A ____ document defines the XML document structure with a list of legal elements and attributes', N'XML', N'DTD', N' XSLT', N'SGML', N'DTD', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (149, N'A ____ is the framework under which data may exist and SQL operations on data may be executed', N' SQL Environment', N' SQL Statement', N'SQL Parser', N'SQL Optimizer', N' SQL Environment', CAST(N'2021-02-05' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (151, N'____ functions as erasable, rewritable ROM memory.', N'Flash memory', N' Speech recognition', N' Natural language processing', N' Machine learning

', N'Flash memory', CAST(N'2021-03-18' AS Date), N'CSI101', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (152, N'Which of the following are guidelines for designing the relational schema ?', N'Reduce the redundant values in tuples', N'Reduce the NULL values in tuples', N'Always make relations 3NF', N'All of the others', N'All of the others', CAST(N'2021-03-18' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (153, N'Regardless of whatever any other transaction is doing, a transaction must be able to continue with the exact same data set it started with.
The above describes which property of a transaction?', N'Atomic', N'Isolation', N'Consistency', N'Durability', N'Isolation', CAST(N'2021-03-18' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (155, N'Referential integrity Constraints control relationships between ....', N'attributes in a table', N'operations of an object', N'database instances', N'tables in a database', N'tables in a database', CAST(N'2021-03-18' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (156, N'What structure can you implement for the database to speed up table reads?', N'indexes', N'triggers', N'store-procedures', N'synonyms', N'indexes', CAST(N'2021-03-18' AS Date), N'DBI202', 1)
INSERT [dbo].[tblQuestion] ([questionID], [questionContent], [answerA], [answerB], [answerC], [answerD], [answerCorrect], [createDate], [subjectID], [status]) VALUES (157, N'Often, a DBMS allows us to build a single index on ____ attribute(s)', N'only one', N'two', N' three', N'multiple', N'only one', CAST(N'2021-03-18' AS Date), N'DBI202', 1)
SET IDENTITY_INSERT [dbo].[tblQuestion] OFF
GO
SET IDENTITY_INSERT [dbo].[tblQuiz] ON 

INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (1, N'CEA201_1379722343', 32, 1, N'DRAM', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (2, N'CEA201_1379722343', 14, 1, N'Associative transfer', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (3, N'CEA201_1379722343', 15, 1, N'Memory cycle time', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (4, N'CEA201_1379722343', 28, 1, N'DRAM', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (5, N'CEA201_1379722343', 13, 1, N'Memory cycle time', 1.6666666269302368)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (6, N'CEA201_1379722343', 1, 1, N'restoring the original settings of the computer', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (7, N'CEA201_1460068283', 44, 2, N' HDD', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (8, N'CEA201_1460068283', 39, 2, N'Access time', 1)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (9, N'CEA201_1460068283', 33, 2, N'ROM', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (10, N'CEA201_1460068283', 23, 2, N'All of the above', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (11, N'CEA201_1460068283', 22, 2, N'SDRAM > RDRAM > DDR', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (12, N'CEA201_1460068283', 21, 2, N'RDRAM', 1)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (13, N'CEA201_1460068283', 35, 2, N' sectors', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (14, N'CEA201_1460068283', 1, 2, N'restoring the original settings of the computer', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (15, N'CEA201_1460068283', 30, 2, N'EPROM', 1)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (16, N'CEA201_1460068283', 36, 2, N'RAID level 0 applications', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (17, N'CEA201_-2075285867', 38, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (18, N'CEA201_-2075285867', 23, 3, N'All of the above', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (19, N'CEA201_-2075285867', 10, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (20, N'CEA201_-2075285867', 15, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (21, N'CEA201_-2075285867', 28, 3, N'DRAM', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (22, N'CEA201_-2075285867', 41, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (23, N'CEA201_-2075285867', 89, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (24, N'CEA201_-2075285867', 20, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (25, N'CEA201_-2075285867', 27, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (26, N'CEA201_-2075285867', 3, 3, N'How many? How fast? How expensive?', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (27, N'CEA201_-2075285867', 18, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (28, N'CEA201_-2075285867', 46, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (29, N'CEA201_-2075285867', 45, 3, N'Gaps', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (30, N'CEA201_-2075285867', 13, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (31, N'CEA201_-2075285867', 36, 3, N'RAID level 0 applications', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (32, N'CEA201_-2075285867', 40, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (33, N'CEA201_-2075285867', 1, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (34, N'CEA201_-2075285867', 14, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (35, N'CEA201_-2075285867', 25, 3, N'Soft errors', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (36, N'CEA201_-2075285867', 17, 3, N'Hertz', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (37, N'CEA201_-2075285867', 29, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (38, N'CEA201_-2075285867', 7, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (39, N'CEA201_-2075285867', 47, 3, N'Cylinder', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (40, N'CEA201_-2075285867', 26, 3, N'Syndrome errors', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (41, N'CEA201_-2075285867', 2, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (42, N'CEA201_-2075285867', 22, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (43, N'CEA201_-2075285867', 37, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (44, N'CEA201_-2075285867', 49, 3, N' Inter-record gap', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (45, N'CEA201_-2075285867', 34, 3, N'DRAM', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (46, N'CEA201_-2075285867', 35, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (47, N'CEA201_-2075285867', 5, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (48, N'CEA201_-2075285867', 39, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (49, N'CEA201_-2075285867', 48, 3, N'Constant angular velocity', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (50, N'CEA201_-2075285867', 8, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (51, N'CEA201_-2075285867', 50, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (52, N'CEA201_-2075285867', 42, 3, N'Non-redundant RAID (RAID level 0)', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (53, N'CEA201_-2075285867', 44, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (54, N'CEA201_-2075285867', 9, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (55, N'CEA201_-2075285867', 32, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (56, N'CEA201_-2075285867', 21, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (57, N'CEA201_-2075285867', 6, 3, N'Virtual address', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (58, N'CEA201_-2075285867', 12, 3, N'Associative mapping', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (59, N'CEA201_-2075285867', 30, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (60, N'CEA201_-2075285867', 16, 3, N'Sequential access', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (61, N'CEA201_-2075285867', 43, 3, N'MZR disadvantage', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (62, N'CEA201_-2075285867', 11, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (63, N'CEA201_-2075285867', 33, 3, N'ROM', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (64, N'CEA201_-2075285867', 31, 3, N'. All of the above', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (65, N'CEA201_-2075285867', 24, 3, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (66, N'CEA201_-2075285867', 19, 3, N'1000 to 2000', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (67, N'CEA201_-2047514765', 7, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (68, N'CEA201_-2047514765', 32, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (69, N'CEA201_-2047514765', 25, 4, N'Soft errors', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (70, N'CEA201_-2047514765', 37, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (71, N'CEA201_-2047514765', 17, 4, N'Hertz', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (72, N'CEA201_-2047514765', 43, 4, N'MZR disadvantage', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (73, N'CEA201_-2047514765', 4, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (74, N'CEA201_-2047514765', 11, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (75, N'CEA201_-2047514765', 42, 4, N'Non-redundant RAID (RAID level 0)', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (76, N'CEA201_-2047514765', 21, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (77, N'CEA201_-2047514765', 30, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (78, N'CEA201_-2047514765', 34, 4, N'DRAM', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (79, N'CEA201_-2047514765', 27, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (80, N'CEA201_-2047514765', 28, 4, N'DRAM', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (81, N'CEA201_-2047514765', 36, 4, N'RAID level 0 applications', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (82, N'CEA201_-2047514765', 18, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (83, N'CEA201_-2047514765', 46, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (84, N'CEA201_-2047514765', 2, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (85, N'CEA201_-2047514765', 10, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (86, N'CEA201_-2047514765', 31, 4, N'. All of the above', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (87, N'CEA201_-2047514765', 16, 4, N'Sequential access', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (88, N'CEA201_-2047514765', 35, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (89, N'CEA201_-2047514765', 29, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (90, N'CEA201_-2047514765', 5, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (91, N'CEA201_-2047514765', 38, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (92, N'CEA201_-2047514765', 15, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (93, N'CEA201_-2047514765', 24, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (94, N'CEA201_-2047514765', 50, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (95, N'CEA201_-2047514765', 40, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (96, N'CEA201_-2047514765', 44, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (97, N'CEA201_-2047514765', 39, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (98, N'CEA201_-2047514765', 1, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (99, N'CEA201_-2047514765', 41, 4, N'Empty!', 0)
GO
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (100, N'CEA201_-2047514765', 23, 4, N'All of the above', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (101, N'CEA201_-2047514765', 48, 4, N'Constant angular velocity', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (102, N'CEA201_-2047514765', 3, 4, N'How many? How fast? How expensive?', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (103, N'CEA201_-2047514765', 49, 4, N' Inter-record gap', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (104, N'CEA201_-2047514765', 26, 4, N'Syndrome errors', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (105, N'CEA201_-2047514765', 12, 4, N'Associative mapping', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (106, N'CEA201_-2047514765', 13, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (107, N'CEA201_-2047514765', 47, 4, N'Cylinder', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (108, N'CEA201_-2047514765', 20, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (109, N'CEA201_-2047514765', 89, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (110, N'CEA201_-2047514765', 33, 4, N'ROM', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (111, N'CEA201_-2047514765', 19, 4, N'1000 to 2000', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (112, N'CEA201_-2047514765', 22, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (113, N'CEA201_-2047514765', 9, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (114, N'CEA201_-2047514765', 8, 4, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (115, N'CEA201_-2047514765', 6, 4, N'Virtual address', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (116, N'CEA201_-2047514765', 45, 4, N'Gaps', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (117, N'CEA201_-1913947935', 12, 7, N'Associative mapping', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (118, N'CEA201_-1913947935', 34, 7, N'DRAM', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (119, N'CEA201_-1913947935', 42, 7, N'Non-redundant RAID (RAID level 0)', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (120, N'CEA201_-1913947935', 26, 7, N'Syndrome errors', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (121, N'CEA201_-1913947935', 43, 7, N'MZR disadvantage', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (122, N'CEA201_-1913947935', 16, 7, N'Sequential access', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (123, N'CEA201_-1913947935', 36, 7, N'RAID level 0 applications', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (124, N'CEA201_-1913947935', 31, 7, N'. All of the above', 0.5)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (125, N'CEA201_-1913947935', 33, 7, N'ROM', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (126, N'CEA201_-1913947935', 28, 7, N'DRAM', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (127, N'CEA201_-1913947935', 19, 7, N'1000 to 2000', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (128, N'CEA201_-1913947935', 25, 7, N'Soft errors', 0.5)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (129, N'CEA201_-1913947935', 3, 7, N'How many? How fast? How expensive?', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (130, N'CEA201_-1913947935', 45, 7, N'Gaps', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (131, N'CEA201_-1913947935', 49, 7, N' Inter-record gap', 0.5)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (132, N'CEA201_-1913947935', 23, 7, N'All of the above', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (133, N'CEA201_-1913947935', 48, 7, N'Constant angular velocity', 0.5)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (134, N'CEA201_-1913947935', 6, 7, N'Virtual address', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (135, N'CEA201_-1913947935', 17, 7, N'Hertz', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (136, N'CEA201_-1913947935', 47, 7, N'Cylinder', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (137, N'CSI101_-1159957036', 54, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (138, N'CSI101_-1159957036', 94, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (139, N'CSI101_-1159957036', 88, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (140, N'CSI101_-1159957036', 91, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (141, N'CSI101_-1159957036', 93, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (142, N'CSI101_-1159957036', 87, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (143, N'CSI101_-1159957036', 83, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (144, N'CSI101_-1159957036', 96, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (145, N'CSI101_-1159957036', 53, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (146, N'CSI101_-1159957036', 57, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (147, N'CSI101_-1159957036', 67, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (148, N'CSI101_-1159957036', 55, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (149, N'CSI101_-1159957036', 51, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (150, N'CSI101_-1159957036', 60, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (151, N'CSI101_-1159957036', 151, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (152, N'CSI101_-1159957036', 56, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (153, N'CSI101_-1159957036', 100, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (154, N'CSI101_-1159957036', 61, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (155, N'CSI101_-1159957036', 76, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (156, N'CSI101_-1159957036', 97, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (157, N'CSI101_-1159957036', 82, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (158, N'CSI101_-1159957036', 80, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (159, N'CSI101_-1159957036', 52, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (160, N'CSI101_-1159957036', 99, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (161, N'CSI101_-1159957036', 74, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (162, N'CSI101_-1159957036', 78, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (163, N'CSI101_-1159957036', 81, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (164, N'CSI101_-1159957036', 71, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (165, N'CSI101_-1159957036', 95, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (166, N'CSI101_-1159957036', 98, 8, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (167, N'CEA201_1607845356', 35, 9, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (168, N'CEA201_1607845356', 22, 9, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (169, N'CEA201_1607845356', 50, 9, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (170, N'CEA201_1607845356', 2, 9, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (171, N'CEA201_1607845356', 28, 9, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (172, N'CEA201_1607845356', 30, 9, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (173, N'CEA201_1607845356', 7, 9, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (174, N'CEA201_1607845356', 16, 9, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (175, N'CEA201_1607845356', 31, 9, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (176, N'CEA201_1607845356', 47, 9, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (177, N'CEA201_1607845356', 19, 9, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (178, N'CEA201_1607845356', 89, 9, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (179, N'CEA201_1607845356', 46, 9, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (180, N'CEA201_1607845356', 39, 9, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (181, N'CEA201_1607845356', 37, 9, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (182, N'CEA201_1607845356', 43, 9, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (183, N'CEA201_1607845356', 5, 9, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (184, N'CEA201_1607845356', 13, 9, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (185, N'CEA201_1607845356', 26, 9, N'Empty!', 0)
INSERT [dbo].[tblQuiz] ([quizID], [quizName], [questionID], [scoreID], [answer], [score]) VALUES (186, N'CEA201_1607845356', 10, 9, N'Empty!', 0)
SET IDENTITY_INSERT [dbo].[tblQuiz] OFF
GO
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'Ad', N'Administrator')
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'Us', N'User')
GO
SET IDENTITY_INSERT [dbo].[tblScore] ON 

INSERT [dbo].[tblScore] ([scoreID], [date], [totalScore], [userID]) VALUES (1, CAST(N'2021-02-05T00:00:00.000' AS DateTime), 1.6666666269302368, N'user')
INSERT [dbo].[tblScore] ([scoreID], [date], [totalScore], [userID]) VALUES (2, CAST(N'2021-02-15T00:00:00.000' AS DateTime), 3, N'user')
INSERT [dbo].[tblScore] ([scoreID], [date], [totalScore], [userID]) VALUES (3, CAST(N'2021-02-23T00:00:00.000' AS DateTime), 0, N'user')
INSERT [dbo].[tblScore] ([scoreID], [date], [totalScore], [userID]) VALUES (4, CAST(N'2021-03-04T00:00:00.000' AS DateTime), 0, N'user')
INSERT [dbo].[tblScore] ([scoreID], [date], [totalScore], [userID]) VALUES (5, CAST(N'2021-03-18T00:00:00.000' AS DateTime), 0, N'user')
INSERT [dbo].[tblScore] ([scoreID], [date], [totalScore], [userID]) VALUES (6, CAST(N'2021-03-18T00:00:00.000' AS DateTime), 0, N'user')
INSERT [dbo].[tblScore] ([scoreID], [date], [totalScore], [userID]) VALUES (7, CAST(N'2021-03-18T00:00:00.000' AS DateTime), 2, N'user')
INSERT [dbo].[tblScore] ([scoreID], [date], [totalScore], [userID]) VALUES (8, CAST(N'2021-03-18T00:00:00.000' AS DateTime), 0, N'user')
INSERT [dbo].[tblScore] ([scoreID], [date], [totalScore], [userID]) VALUES (9, CAST(N'2021-03-18T00:00:00.000' AS DateTime), 0, N'user')
SET IDENTITY_INSERT [dbo].[tblScore] OFF
GO
INSERT [dbo].[tblSubject] ([subjectID], [subjectName], [limitTime], [numOfQues]) VALUES (N'CEA201', N'Computer Organization and Architecture', 30, 20)
INSERT [dbo].[tblSubject] ([subjectID], [subjectName], [limitTime], [numOfQues]) VALUES (N'CSI101', N'Connecting to Computer Science', 40, 30)
INSERT [dbo].[tblSubject] ([subjectID], [subjectName], [limitTime], [numOfQues]) VALUES (N'DBI202', N'Introduction to Databases', 50, 40)
GO
INSERT [dbo].[tblUsers] ([userID], [userName], [password], [roleID], [phoneNumber], [email], [address], [status]) VALUES (N'admin', N'Admin', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Ad', N'', N'', N'', 1)
INSERT [dbo].[tblUsers] ([userID], [userName], [password], [roleID], [phoneNumber], [email], [address], [status]) VALUES (N'slimvu', N'Tran Quang Vu', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Us', N'012365478912547', N'', N'dong nai', 1)
INSERT [dbo].[tblUsers] ([userID], [userName], [password], [roleID], [phoneNumber], [email], [address], [status]) VALUES (N'user', N'User', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'Us', N'', N'', N'', 1)
GO
ALTER TABLE [dbo].[tblHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblHistory_tblQuestion] FOREIGN KEY([questionID])
REFERENCES [dbo].[tblQuestion] ([questionID])
GO
ALTER TABLE [dbo].[tblHistory] CHECK CONSTRAINT [FK_tblHistory_tblQuestion]
GO
ALTER TABLE [dbo].[tblHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblHistory_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblHistory] CHECK CONSTRAINT [FK_tblHistory_tblUsers]
GO
ALTER TABLE [dbo].[tblQuestion]  WITH CHECK ADD  CONSTRAINT [FK_tblQuestion_tblSubject] FOREIGN KEY([subjectID])
REFERENCES [dbo].[tblSubject] ([subjectID])
GO
ALTER TABLE [dbo].[tblQuestion] CHECK CONSTRAINT [FK_tblQuestion_tblSubject]
GO
ALTER TABLE [dbo].[tblQuiz]  WITH CHECK ADD  CONSTRAINT [FK_tblQuiz_tblQuestion] FOREIGN KEY([questionID])
REFERENCES [dbo].[tblQuestion] ([questionID])
GO
ALTER TABLE [dbo].[tblQuiz] CHECK CONSTRAINT [FK_tblQuiz_tblQuestion]
GO
ALTER TABLE [dbo].[tblQuiz]  WITH CHECK ADD  CONSTRAINT [FK_tblQuiz_tblScore] FOREIGN KEY([scoreID])
REFERENCES [dbo].[tblScore] ([scoreID])
GO
ALTER TABLE [dbo].[tblQuiz] CHECK CONSTRAINT [FK_tblQuiz_tblScore]
GO
ALTER TABLE [dbo].[tblScore]  WITH CHECK ADD  CONSTRAINT [FK_tblScore_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblScore] CHECK CONSTRAINT [FK_tblScore_tblUsers]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRole] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRole] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRole]
GO
USE [master]
GO
ALTER DATABASE [Assignment2_TranQuangVu] SET  READ_WRITE 
GO
