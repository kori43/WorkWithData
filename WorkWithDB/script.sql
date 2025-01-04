USE [master]
GO
/****** Object:  Database [SchoolDB]    Script Date: 04.01.2025 23:20:08 ******/
CREATE DATABASE [SchoolDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SchoolDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SchoolDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SchoolDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SchoolDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SchoolDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SchoolDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SchoolDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SchoolDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SchoolDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SchoolDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SchoolDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SchoolDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SchoolDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SchoolDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SchoolDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SchoolDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SchoolDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SchoolDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SchoolDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SchoolDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SchoolDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SchoolDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SchoolDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SchoolDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SchoolDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SchoolDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SchoolDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SchoolDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SchoolDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SchoolDB] SET  MULTI_USER 
GO
ALTER DATABASE [SchoolDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SchoolDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SchoolDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SchoolDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SchoolDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SchoolDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SchoolDB', N'ON'
GO
ALTER DATABASE [SchoolDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [SchoolDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SchoolDB]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 04.01.2025 23:20:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessons](
	[Name] [nvarchar](50) NOT NULL,
	[Details] [nvarchar](max) NULL,
 CONSTRAINT [PK_Lessons] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 04.01.2025 23:20:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Gender] [nchar](3) NOT NULL,
	[Born] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 04.01.2025 23:20:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Gender] [nchar](3) NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeachersAndLessons]    Script Date: 04.01.2025 23:20:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachersAndLessons](
	[TeachId] [bigint] NOT NULL,
	[LessonName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TeachersAndLessons] PRIMARY KEY CLUSTERED 
(
	[TeachId] ASC,
	[LessonName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeachersAndLessons]  WITH CHECK ADD  CONSTRAINT [FK_TeachersAndLessons_Lessons] FOREIGN KEY([LessonName])
REFERENCES [dbo].[Lessons] ([Name])
GO
ALTER TABLE [dbo].[TeachersAndLessons] CHECK CONSTRAINT [FK_TeachersAndLessons_Lessons]
GO
ALTER TABLE [dbo].[TeachersAndLessons]  WITH CHECK ADD  CONSTRAINT [FK_TeachersAndLessons_Teachers] FOREIGN KEY([TeachId])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[TeachersAndLessons] CHECK CONSTRAINT [FK_TeachersAndLessons_Teachers]
GO
USE [master]
GO
ALTER DATABASE [SchoolDB] SET  READ_WRITE 
GO
