USE [master]
GO
/****** Object:  Database [Group2_CompRepair]    Script Date: 4/10/2022 3:00:10 PM ******/
CREATE DATABASE [Group2_CompRepair]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Group2_CompRepair', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Group2_CompRepair.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Group2_CompRepair_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Group2_CompRepair_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Group2_CompRepair] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Group2_CompRepair].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Group2_CompRepair] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Group2_CompRepair] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Group2_CompRepair] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Group2_CompRepair] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Group2_CompRepair] SET ARITHABORT OFF 
GO
ALTER DATABASE [Group2_CompRepair] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Group2_CompRepair] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Group2_CompRepair] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Group2_CompRepair] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Group2_CompRepair] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Group2_CompRepair] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Group2_CompRepair] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Group2_CompRepair] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Group2_CompRepair] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Group2_CompRepair] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Group2_CompRepair] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Group2_CompRepair] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Group2_CompRepair] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Group2_CompRepair] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Group2_CompRepair] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Group2_CompRepair] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Group2_CompRepair] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Group2_CompRepair] SET RECOVERY FULL 
GO
ALTER DATABASE [Group2_CompRepair] SET  MULTI_USER 
GO
ALTER DATABASE [Group2_CompRepair] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Group2_CompRepair] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Group2_CompRepair] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Group2_CompRepair] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Group2_CompRepair] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Group2_CompRepair] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Group2_CompRepair', N'ON'
GO
ALTER DATABASE [Group2_CompRepair] SET QUERY_STORE = OFF
GO
USE [Group2_CompRepair]
GO
/****** Object:  Table [dbo].[Computer_Parts]    Script Date: 4/10/2022 3:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Computer_Parts](
	[Computer_Parts_Id] [int] IDENTITY(1,1) NOT NULL,
	[Part_Name] [char](100) NULL,
	[Part_Description] [varchar](max) NULL,
	[Parts_in_Stock] [int] NULL,
	[Part_Type] [varchar](50) NULL,
	[Part_Price] [decimal](19, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Computer_Parts_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 4/10/2022 3:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Customer_Id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Firstname] [char](50) NULL,
	[Customer_Lastname] [char](50) NULL,
	[Customer_Phone] [char](12) NULL,
	[Customer_Email] [varchar](50) NULL,
	[Customer_Address] [char](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 4/10/2022 3:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Employee_Id] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Firstname] [char](50) NULL,
	[Employee_Lastname] [char](50) NULL,
	[Employee_Phone] [char](12) NULL,
	[Employee_Email] [varchar](50) NULL,
	[Employee_Address] [char](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Employee_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/10/2022 3:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_Id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Id] [int] NOT NULL,
	[Employee_Id] [int] NOT NULL,
	[Order_total] [decimal](19, 2) NULL,
	[Order_Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parts_Orders_Linking]    Script Date: 4/10/2022 3:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parts_Orders_Linking](
	[Parts_Orders_Id] [int] IDENTITY(1,1) NOT NULL,
	[Order_Id] [int] NOT NULL,
	[Computer_Parts_Id] [int] NOT NULL,
	[Qty_Of_Parts] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Parts_Orders_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Software]    Script Date: 4/10/2022 3:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Software](
	[Software_Id] [int] IDENTITY(1,1) NOT NULL,
	[Software_Name] [varchar](50) NULL,
	[Software_Description] [varchar](max) NULL,
	[Licenses_In_Stock] [int] NULL,
	[Software_Type] [varchar](50) NULL,
	[Software_Price] [decimal](19, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Software_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Software_Orders_Linking]    Script Date: 4/10/2022 3:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Software_Orders_Linking](
	[Software_Orders_Id] [int] IDENTITY(1,1) NOT NULL,
	[Order_Id] [int] NOT NULL,
	[Software_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Software_Orders_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Id] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Customers] ([Customer_Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Customer_Id]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Id] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employees] ([Employee_Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Employee_Id]
GO
ALTER TABLE [dbo].[Parts_Orders_Linking]  WITH CHECK ADD  CONSTRAINT [FK_Computer_Parts_Id] FOREIGN KEY([Computer_Parts_Id])
REFERENCES [dbo].[Computer_Parts] ([Computer_Parts_Id])
GO
ALTER TABLE [dbo].[Parts_Orders_Linking] CHECK CONSTRAINT [FK_Computer_Parts_Id]
GO
ALTER TABLE [dbo].[Parts_Orders_Linking]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Id] FOREIGN KEY([Order_Id])
REFERENCES [dbo].[Orders] ([Order_Id])
GO
ALTER TABLE [dbo].[Parts_Orders_Linking] CHECK CONSTRAINT [FK_Orders_Id]
GO
ALTER TABLE [dbo].[Software_Orders_Linking]  WITH CHECK ADD  CONSTRAINT [FK_Order_Id] FOREIGN KEY([Order_Id])
REFERENCES [dbo].[Orders] ([Order_Id])
GO
ALTER TABLE [dbo].[Software_Orders_Linking] CHECK CONSTRAINT [FK_Order_Id]
GO
ALTER TABLE [dbo].[Software_Orders_Linking]  WITH CHECK ADD  CONSTRAINT [FK_Software_Id] FOREIGN KEY([Software_Id])
REFERENCES [dbo].[Software] ([Software_Id])
GO
ALTER TABLE [dbo].[Software_Orders_Linking] CHECK CONSTRAINT [FK_Software_Id]
GO
USE [master]
GO
ALTER DATABASE [Group2_CompRepair] SET  READ_WRITE 
GO
