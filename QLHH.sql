USE [master]
GO
/****** Object:  Database [QLHH]    Script Date: 5/8/2024 1:16:58 AM ******/
CREATE DATABASE [QLHH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLHH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLHH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLHH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLHH_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLHH] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLHH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLHH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLHH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLHH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLHH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLHH] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLHH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLHH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLHH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLHH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLHH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLHH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLHH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLHH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLHH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLHH] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLHH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLHH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLHH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLHH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLHH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLHH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLHH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLHH] SET RECOVERY FULL 
GO
ALTER DATABASE [QLHH] SET  MULTI_USER 
GO
ALTER DATABASE [QLHH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLHH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLHH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLHH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLHH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLHH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLHH', N'ON'
GO
ALTER DATABASE [QLHH] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLHH] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLHH]
GO
/****** Object:  Table [dbo].[tblHanghoa1]    Script Date: 5/8/2024 1:16:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHanghoa1](
	[HH_ID] [uniqueidentifier] NOT NULL,
	[HH_NHH_ID] [uniqueidentifier] NULL,
	[HH_MA] [nvarchar](255) NOT NULL,
	[HH_TEN] [nvarchar](255) NOT NULL,
	[HH_GIANHAP] [decimal](10, 2) NOT NULL,
	[HH_GIABAN] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HH_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNhomhanghoa1]    Script Date: 5/8/2024 1:16:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhomhanghoa1](
	[NHH_ID] [uniqueidentifier] NOT NULL,
	[NHH_MA] [nvarchar](255) NOT NULL,
	[NHH_TEN] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NHH_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblHanghoa1] ADD  DEFAULT (newid()) FOR [HH_ID]
GO
ALTER TABLE [dbo].[tblNhomhanghoa1] ADD  DEFAULT (newid()) FOR [NHH_ID]
GO
ALTER TABLE [dbo].[tblHanghoa1]  WITH CHECK ADD FOREIGN KEY([HH_NHH_ID])
REFERENCES [dbo].[tblNhomhanghoa1] ([NHH_ID])
GO
USE [master]
GO
ALTER DATABASE [QLHH] SET  READ_WRITE 
GO
