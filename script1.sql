USE [master]
GO
/*/
/****** Object:  Database [ManageRestaurant]    Script Date: 10/30/2024 9:27:55 PM ******/
CREATE DATABASE [ManageRestaurant]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ManageRestaurant', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\ManageRestaurant.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ManageRestaurant_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\ManageRestaurant_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ManageRestaurant] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ManageRestaurant].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ManageRestaurant] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ManageRestaurant] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ManageRestaurant] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ManageRestaurant] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ManageRestaurant] SET ARITHABORT OFF 
GO
ALTER DATABASE [ManageRestaurant] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ManageRestaurant] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ManageRestaurant] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ManageRestaurant] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ManageRestaurant] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ManageRestaurant] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ManageRestaurant] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ManageRestaurant] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ManageRestaurant] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ManageRestaurant] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ManageRestaurant] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ManageRestaurant] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ManageRestaurant] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ManageRestaurant] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ManageRestaurant] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ManageRestaurant] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ManageRestaurant] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ManageRestaurant] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ManageRestaurant] SET  MULTI_USER 
GO
ALTER DATABASE [ManageRestaurant] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ManageRestaurant] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ManageRestaurant] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ManageRestaurant] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ManageRestaurant] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ManageRestaurant] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ManageRestaurant] SET QUERY_STORE = ON
GO
ALTER DATABASE [ManageRestaurant] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ManageRestaurant]
GO
/****** Object:  Table [dbo].[BookingRequest]    Script Date: 10/30/2024 9:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingRequest](
	[booking_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[table_id] [int] NULL,
	[reservation_date] [datetime] NOT NULL,
	[number_of_guests] [int] NOT NULL,
	[status] [nvarchar](50) NULL,
	[note] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 10/30/2024 9:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[menu_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](255) NULL,
	[price] [decimal](10, 2) NOT NULL,
	[image_url] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/30/2024 9:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[menu_id] [int] NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[totalPrice] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/30/2024 9:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime] NULL,
	[table_id] [int] NULL,
	[checkout_time] [datetime] NULL,
	[status] [nvarchar](50) NULL,
	[createdBy] [int] NULL,
	[deletedAt] [datetime] NULL,
	[deletedBy] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserved]    Script Date: 10/30/2024 9:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserved](
	[ReservedId] [int] IDENTITY(1,1) NOT NULL,
	[ReservedDate] [datetime] NOT NULL,
	[table_id] [int] NULL,
	[booking_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tables]    Script Date: 10/30/2024 9:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tables](
	[table_id] [int] IDENTITY(1,1) NOT NULL,
	[table_number] [int] NOT NULL,
	[capacity] [int] NOT NULL,
	[status] [nvarchar](50) NULL,
	[description] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[table_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 10/30/2024 9:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[transaction_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[payment_date] [datetime] NULL,
	[price] [decimal](10, 2) NOT NULL,
	[payment_method] [nvarchar](50) NULL,
	[description] [nvarchar](1000) NULL,
	[status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/30/2024 9:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[balance] [float] NULL,
	[phone] [nvarchar](20) NULL,
	[role] [nvarchar](50) NULL,
	[createdAt] [datetime] NULL,
	[createdBy] [nvarchar](100) NOT NULL,
	[updateAt] [datetime] NULL,
	[updateBy] [nvarchar](100) NULL,
	[deletedAt] [datetime] NULL,
	[deletedBy] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BookingRequest] ON 

INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (16, 1, 2, CAST(N'2024-07-15T19:00:00.000' AS DateTime), 4, N'completed', N'Birthday party')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (17, 2, 5, CAST(N'2024-07-16T20:00:00.000' AS DateTime), 2, N'canceled', N'Anniversary dinner')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (18, 3, 3, CAST(N'2024-07-17T18:00:00.000' AS DateTime), 6, N'cancelled', N'Team meeting')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (19, 4, 2, CAST(N'2024-07-18T21:00:00.000' AS DateTime), 3, N'completed', N'Casual dinner')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (20, 7, 4, CAST(N'2024-07-19T22:00:00.000' AS DateTime), 8, N'completed', N'Family gathering')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (31, 3, 1, CAST(N'2024-07-20T18:00:00.000' AS DateTime), 4, N'completed', N'Family dinner')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (32, 4, 2, CAST(N'2024-07-20T19:00:00.000' AS DateTime), 5, N'canceled', N'Business meeting')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (33, 2, 3, CAST(N'2024-07-20T20:00:00.000' AS DateTime), 3, N'completed', N'Dinner with friends')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (34, 1, 4, CAST(N'2024-07-20T21:00:00.000' AS DateTime), 6, N'canceled', N'Anniversary celebration')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (35, 4, 4, CAST(N'2024-07-20T22:00:00.000' AS DateTime), 2, N'canceled', N'Birthday party')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (36, 1, 2, CAST(N'2024-07-21T18:00:00.000' AS DateTime), 4, N'canceled', N'Casual dinner')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (37, 2, 3, CAST(N'2024-07-21T19:00:00.000' AS DateTime), 5, N'completed', N'Team outing')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (38, 3, 4, CAST(N'2024-07-21T20:00:00.000' AS DateTime), 3, N'completed', N'Family gathering')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (39, 4, 4, CAST(N'2024-07-21T21:00:00.000' AS DateTime), 6, N'canceled', N'Wedding dinner')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (40, 4, 1, CAST(N'2024-07-21T22:00:00.000' AS DateTime), 2, N'canceled', N'Business meeting')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (41, 1, 3, CAST(N'2024-07-22T18:00:00.000' AS DateTime), 4, N'approved', N'Conference dinner')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (42, 2, 4, CAST(N'2024-07-22T19:00:00.000' AS DateTime), 5, N'canceled', N'Dinner with clients')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (43, 3, 4, CAST(N'2024-07-22T20:00:00.000' AS DateTime), 3, N'approved', N'Family outing')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (44, 4, 1, CAST(N'2024-07-22T21:00:00.000' AS DateTime), 6, N'completed', N'Graduation dinner')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (45, 1, 1, CAST(N'2024-07-23T18:00:00.000' AS DateTime), 4, N'canceled', N'Event 1')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (46, 2, 2, CAST(N'2024-07-23T19:00:00.000' AS DateTime), 5, N'completed', N'Event 2')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (47, 3, 3, CAST(N'2024-07-23T20:00:00.000' AS DateTime), 3, N'completed', N'Event 3')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (48, 4, 4, CAST(N'2024-07-23T21:00:00.000' AS DateTime), 6, N'completed', N'Event 4')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (49, 1, 5, CAST(N'2024-07-23T22:00:00.000' AS DateTime), 2, N'completed', N'Event 5')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (50, 2, 1, CAST(N'2024-07-24T18:00:00.000' AS DateTime), 4, N'canceled', N'Event 6')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (51, 3, 2, CAST(N'2024-07-24T19:00:00.000' AS DateTime), 5, N'pending', N'Event 7')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (52, 4, 3, CAST(N'2024-07-24T20:00:00.000' AS DateTime), 3, N'pending', N'Event 8')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (53, 1, 4, CAST(N'2024-07-24T21:00:00.000' AS DateTime), 6, N'pending', N'Event 9')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (54, 2, 5, CAST(N'2024-07-24T22:00:00.000' AS DateTime), 2, N'pending', N'Event 10')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (55, 3, 1, CAST(N'2024-07-25T18:00:00.000' AS DateTime), 4, N'pending', N'Event 11')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (56, 4, 2, CAST(N'2024-07-25T19:00:00.000' AS DateTime), 5, N'approved', N'Event 12')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (57, 1, 3, CAST(N'2024-07-25T20:00:00.000' AS DateTime), 3, N'completed', N'Event 13')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (58, 2, 4, CAST(N'2024-07-25T21:00:00.000' AS DateTime), 6, N'canceled', N'Event 14')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (59, 3, 5, CAST(N'2024-07-25T22:00:00.000' AS DateTime), 2, N'completed', N'Event 15')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (60, 4, 1, CAST(N'2024-07-26T18:00:00.000' AS DateTime), 4, N'completed', N'Event 16')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (61, 1, 2, CAST(N'2024-07-26T19:00:00.000' AS DateTime), 5, N'approved', N'Event 17')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (62, 2, 3, CAST(N'2024-07-26T20:00:00.000' AS DateTime), 3, N'completed', N'Event 18')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (63, 3, 4, CAST(N'2024-07-26T21:00:00.000' AS DateTime), 6, N'canceled', N'Event 19')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (64, 4, 5, CAST(N'2024-07-26T22:00:00.000' AS DateTime), 2, N'canceled', N'Event 20')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (65, 1, 1, CAST(N'2024-07-27T18:00:00.000' AS DateTime), 4, N'canceled', N'Event 21')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (66, 2, 2, CAST(N'2024-07-27T19:00:00.000' AS DateTime), 5, N'approved', N'Event 22')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (67, 3, 3, CAST(N'2024-07-27T20:00:00.000' AS DateTime), 3, N'completed', N'Event 23')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (68, 4, 4, CAST(N'2024-07-27T21:00:00.000' AS DateTime), 6, N'canceled', N'Event 24')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (69, 1, 5, CAST(N'2024-07-27T22:00:00.000' AS DateTime), 2, N'canceled', N'Event 25')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (70, 1, 2, CAST(N'2024-07-15T17:44:00.000' AS DateTime), 2, N'pending', N'kjansd')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (71, 1, 2, CAST(N'2024-07-15T17:44:00.000' AS DateTime), 2, N'pending', N'kjansd')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (72, 3, 2, CAST(N'2024-07-15T17:46:00.000' AS DateTime), 2, N'pending', N'sdfsd')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (73, 3, 2, CAST(N'2024-07-15T17:46:00.000' AS DateTime), 2, N'pending', N'sdfsd')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (74, 4, 2, CAST(N'2024-07-18T16:07:00.000' AS DateTime), 2, N'pending', N'12321asdas')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (75, 4, 2, CAST(N'2024-07-18T16:07:00.000' AS DateTime), 2, N'pending', N'12321asdas')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (76, 4, 2, CAST(N'2024-07-19T20:08:00.000' AS DateTime), 2, N'new', N'3234. Deposit: True. Amounut: 2')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (77, 4, 2, CAST(N'2024-07-19T20:08:00.000' AS DateTime), 2, N'new', N'1231232. Deposit: True. Amounut: 2')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (78, 4, 2, CAST(N'2024-07-19T20:08:00.000' AS DateTime), 2, N'new', N'231123. Deposit: True. Amounut: 123123')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (79, 4, 2, CAST(N'2024-07-19T20:08:00.000' AS DateTime), 2, N'new', N'231123. Deposit: True. Amounut: 123123')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (80, 4, 2, CAST(N'2030-08-18T21:25:00.000' AS DateTime), 2, N'new', N'none. Deposit: True. Amounut: 200000')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (81, 4, 3, CAST(N'2024-08-05T21:27:00.000' AS DateTime), 6, N'new', N'none. Deposit: True. Amounut: 200000')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (82, 4, 2, CAST(N'2027-07-19T21:30:02.047' AS DateTime), 2, N'string', N'string. Deposit: True. Amounut: 220000')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (83, 4, 2, CAST(N'2030-08-18T21:25:00.000' AS DateTime), 2, N'new', N'none. Deposit: True. Amounut: 300000')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (84, 4, 2, CAST(N'2030-08-18T21:25:00.000' AS DateTime), 2, N'new', N'. Deposit: True. Amounut: 20900')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (86, 4, 3, CAST(N'2030-08-18T21:25:00.000' AS DateTime), 6, N'new', N'none. Deposit: True. Amounut: 200000')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (87, 4, 2, CAST(N'2026-07-19T21:49:26.517' AS DateTime), 2, N'string', N'string. Deposit: True. Amounut: 20300000')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (88, 4, 2, CAST(N'2024-07-19T20:08:00.000' AS DateTime), 2, N'new', N'2. Deposit: True. Amounut: 2222222')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (89, 4, 2, CAST(N'2024-08-05T21:27:00.000' AS DateTime), 2, N'new', N'. Deposit: True. Amounut: 2222222')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (90, 4, 2, CAST(N'2024-07-19T20:08:00.000' AS DateTime), 2, N'new', N'. Deposit: True. Amounut: 222222')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (91, 4, 2, CAST(N'2030-08-18T21:25:00.000' AS DateTime), 2, N'new', N'e. Deposit: True. Amounut: 23232323')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (92, 4, 2, CAST(N'2030-08-18T21:25:00.000' AS DateTime), 2, N'new', N'. Deposit: True. Amounut: 200000')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (93, 12, 2, CAST(N'2030-08-18T21:25:00.000' AS DateTime), 2, N'pending', N'Toi muon dat ban. Deposit: True. Amounut: 234234')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (94, 12, 2, CAST(N'2030-08-18T21:25:00.000' AS DateTime), 2, N'new', N'test dat lan 2. Deposit: True. Amounut: 234234')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (95, 12, 1, CAST(N'2030-08-18T21:25:00.000' AS DateTime), 4, N'new', N'. Deposit: True. Amounut: 200000')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (96, 12, 1, CAST(N'2030-08-18T21:25:00.000' AS DateTime), 4, N'pending', N'. Deposit: True. Amounut: 200000')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (97, 4, 2, CAST(N'2030-08-18T21:25:00.000' AS DateTime), 2, N'new', N'123. Deposit: True. Amounut: 1234')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (98, 4, 2, CAST(N'2030-08-18T21:25:00.000' AS DateTime), 2, N'new', N'123. Deposit: True. Amounut: 213215')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (99, 16, 2, CAST(N'2030-08-18T21:25:00.000' AS DateTime), 2, N'new', N'sdf. Deposit: True. Amounut: 12345')
INSERT [dbo].[BookingRequest] ([booking_id], [user_id], [table_id], [reservation_date], [number_of_guests], [status], [note]) VALUES (100, 16, 2, CAST(N'2030-08-18T21:25:00.000' AS DateTime), 2, N'new', N'sdf. Deposit: True. Amounut: 12345')
SET IDENTITY_INSERT [dbo].[BookingRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (1, N'Pasta', N'Delicious Italian pasta', CAST(12.99 AS Decimal(10, 2)), N'url_to_image1')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (2, N'Steak', N'Juicy grilled steak', CAST(24.99 AS Decimal(10, 2)), N'url_to_image2')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (3, N'Salad', N'Fresh garden salad', CAST(8.99 AS Decimal(10, 2)), N'url_to_image3')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (4, N'Soup', N'Warm and hearty soup', CAST(5.99 AS Decimal(10, 2)), N'url_to_image4')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (5, N'Burger', N'Tasty beef burger', CAST(10.99 AS Decimal(10, 2)), N'url_to_image5')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (6, N'Pasta', N'Delicious Italian pasta', CAST(12.99 AS Decimal(10, 2)), N'url_to_image1')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (7, N'Steak', N'Juicy grilled steak', CAST(24.99 AS Decimal(10, 2)), N'url_to_image2')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (8, N'Salad', N'Fresh garden salad', CAST(8.99 AS Decimal(10, 2)), N'url_to_image3')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (9, N'Soup', N'Warm and hearty soup', CAST(5.99 AS Decimal(10, 2)), N'url_to_image4')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (10, N'Burger', N'Tasty beef burger', CAST(10.99 AS Decimal(10, 2)), N'url_to_image5')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (11, N'th', N'11.21', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (12, N'Name', N'Description', CAST(0.00 AS Decimal(10, 2)), N'ImageUrl')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (14, N'bim bim', N'đo ăn vat', CAST(12.00 AS Decimal(10, 2)), N'12')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (15, N'Name', N'Description', CAST(0.00 AS Decimal(10, 2)), N'ImageUrl')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (16, N'tao', N'trai cay', CAST(11.21 AS Decimal(10, 2)), N'asd')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (17, N'bim bim', N'đo ăn vat', CAST(12.00 AS Decimal(10, 2)), N'12')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (18, N'Name', N'Description', CAST(0.00 AS Decimal(10, 2)), N'ImageUrl')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (21, N'Name', N'Description', CAST(0.00 AS Decimal(10, 2)), N'ImageUrl')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (24, N'Name', N'Description', CAST(0.00 AS Decimal(10, 2)), N'ImageUrl')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (25, N'tao', N'trai cay', CAST(11.21 AS Decimal(10, 2)), N'asd')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (26, N'bim bim', N'đo ăn vat', CAST(12.00 AS Decimal(10, 2)), N'12')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (27, N'Name', N'Description', CAST(0.00 AS Decimal(10, 2)), N'ImageUrl')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (28, N'tao', N'trai cay', CAST(11.21 AS Decimal(10, 2)), N'asd')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (29, N'bim bim', N'đo ăn vat', CAST(12.00 AS Decimal(10, 2)), N'12')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (30, N'Name', N'Description', CAST(0.00 AS Decimal(10, 2)), N'ImageUrl')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (31, N'tao', N'trai cay', CAST(11.21 AS Decimal(10, 2)), N'asd')
INSERT [dbo].[Menus] ([menu_id], [name], [description], [price], [image_url]) VALUES (32, N'bim bim', N'đo ăn vat', CAST(12.00 AS Decimal(10, 2)), N'12')
SET IDENTITY_INSERT [dbo].[Menus] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([OrderDetail_id], [order_id], [menu_id], [quantity], [price], [totalPrice]) VALUES (3, 16, 1, 2, CAST(12.99 AS Decimal(10, 2)), CAST(25.98 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [order_id], [menu_id], [quantity], [price], [totalPrice]) VALUES (4, 17, 2, 1, CAST(24.99 AS Decimal(10, 2)), CAST(24.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [order_id], [menu_id], [quantity], [price], [totalPrice]) VALUES (5, 18, 3, 3, CAST(8.99 AS Decimal(10, 2)), CAST(26.97 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [order_id], [menu_id], [quantity], [price], [totalPrice]) VALUES (6, 19, 4, 2, CAST(5.99 AS Decimal(10, 2)), CAST(11.98 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([OrderDetail_id], [order_id], [menu_id], [quantity], [price], [totalPrice]) VALUES (7, 20, 5, 4, CAST(10.99 AS Decimal(10, 2)), CAST(43.96 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [createdAt], [table_id], [checkout_time], [status], [createdBy], [deletedAt], [deletedBy]) VALUES (16, CAST(N'2024-07-13T22:03:05.253' AS DateTime), 2, CAST(N'2024-07-15T21:00:00.000' AS DateTime), N'completed', 1, NULL, NULL)
INSERT [dbo].[Orders] ([order_id], [createdAt], [table_id], [checkout_time], [status], [createdBy], [deletedAt], [deletedBy]) VALUES (17, CAST(N'2024-07-13T22:03:05.253' AS DateTime), 5, CAST(N'2024-07-16T22:00:00.000' AS DateTime), N'completed', 2, NULL, NULL)
INSERT [dbo].[Orders] ([order_id], [createdAt], [table_id], [checkout_time], [status], [createdBy], [deletedAt], [deletedBy]) VALUES (18, CAST(N'2024-07-13T22:03:05.253' AS DateTime), 3, CAST(N'2024-07-17T20:00:00.000' AS DateTime), N'cancelled', 3, NULL, NULL)
INSERT [dbo].[Orders] ([order_id], [createdAt], [table_id], [checkout_time], [status], [createdBy], [deletedAt], [deletedBy]) VALUES (19, CAST(N'2024-07-13T22:03:05.253' AS DateTime), 1, CAST(N'2024-07-18T23:00:00.000' AS DateTime), N'completed', 4, NULL, NULL)
INSERT [dbo].[Orders] ([order_id], [createdAt], [table_id], [checkout_time], [status], [createdBy], [deletedAt], [deletedBy]) VALUES (20, CAST(N'2024-07-13T22:03:05.253' AS DateTime), 4, CAST(N'2024-07-19T23:00:00.000' AS DateTime), N'pending', 7, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Reserved] ON 

INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (1, CAST(N'2024-07-20T19:00:00.000' AS DateTime), 1, 32)
INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (2, CAST(N'2024-07-20T20:00:00.000' AS DateTime), 2, 32)
INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (3, CAST(N'2024-07-20T21:00:00.000' AS DateTime), 3, 32)
INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (4, CAST(N'2024-07-20T22:00:00.000' AS DateTime), 4, 32)
INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (5, CAST(N'2024-07-20T23:00:00.000' AS DateTime), 5, 32)
INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (6, CAST(N'2024-07-21T19:00:00.000' AS DateTime), 1, 33)
INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (7, CAST(N'2024-07-21T20:00:00.000' AS DateTime), 2, 33)
INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (8, CAST(N'2024-07-21T21:00:00.000' AS DateTime), 3, 33)
INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (9, CAST(N'2024-07-21T22:00:00.000' AS DateTime), 4, 33)
INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (10, CAST(N'2024-07-21T23:00:00.000' AS DateTime), 5, 33)
INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (11, CAST(N'2024-07-21T19:00:00.000' AS DateTime), 5, 32)
INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (12, CAST(N'2024-07-21T19:00:00.000' AS DateTime), 2, 33)
INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (13, CAST(N'2024-07-21T19:00:00.000' AS DateTime), 3, 32)
INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (14, CAST(N'2024-07-21T19:00:00.000' AS DateTime), 4, 32)
INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (15, CAST(N'2024-07-21T19:00:00.000' AS DateTime), 6, 32)
INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (16, CAST(N'2024-07-21T19:00:00.000' AS DateTime), 7, 37)
INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (17, CAST(N'2024-07-22T21:00:00.000' AS DateTime), 6, 44)
INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (18, CAST(N'2024-07-20T20:00:00.000' AS DateTime), 4, 33)
INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (19, CAST(N'2024-07-20T18:00:00.000' AS DateTime), 6, 31)
INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (20, CAST(N'2024-07-23T19:00:00.000' AS DateTime), 7, 46)
INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (21, CAST(N'2024-07-23T21:00:00.000' AS DateTime), 1, 48)
INSERT [dbo].[Reserved] ([ReservedId], [ReservedDate], [table_id], [booking_id]) VALUES (22, CAST(N'2024-07-23T22:00:00.000' AS DateTime), 2, 49)
SET IDENTITY_INSERT [dbo].[Reserved] OFF
GO
SET IDENTITY_INSERT [dbo].[Tables] ON 

INSERT [dbo].[Tables] ([table_id], [table_number], [capacity], [status], [description]) VALUES (1, 1, 4, N'available', N'Near window')
INSERT [dbo].[Tables] ([table_id], [table_number], [capacity], [status], [description]) VALUES (2, 2, 2, N'reserved', N'Near entrance')
INSERT [dbo].[Tables] ([table_id], [table_number], [capacity], [status], [description]) VALUES (3, 3, 6, N'available', N'In the corner')
INSERT [dbo].[Tables] ([table_id], [table_number], [capacity], [status], [description]) VALUES (4, 4, 8, N'maintenance', N'Under repair')
INSERT [dbo].[Tables] ([table_id], [table_number], [capacity], [status], [description]) VALUES (5, 5, 4, N'reserved', N'Near bar')
INSERT [dbo].[Tables] ([table_id], [table_number], [capacity], [status], [description]) VALUES (6, 1, 4, N'available', N'Near window')
INSERT [dbo].[Tables] ([table_id], [table_number], [capacity], [status], [description]) VALUES (7, 2, 2, N'reserved', N'Near entrance')
INSERT [dbo].[Tables] ([table_id], [table_number], [capacity], [status], [description]) VALUES (8, 3, 6, N'available', N'In the corner')
INSERT [dbo].[Tables] ([table_id], [table_number], [capacity], [status], [description]) VALUES (9, 4, 8, N'maintenance', N'Under repair')
INSERT [dbo].[Tables] ([table_id], [table_number], [capacity], [status], [description]) VALUES (10, 5, 4, N'reserved', N'Near bar')
SET IDENTITY_INSERT [dbo].[Tables] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([transaction_id], [order_id], [payment_date], [price], [payment_method], [description], [status]) VALUES (2, 16, CAST(N'2024-07-15T21:10:00.000' AS DateTime), CAST(25.98 AS Decimal(10, 2)), N'credit card', N'Payment for order 1', N'completed')
INSERT [dbo].[Transactions] ([transaction_id], [order_id], [payment_date], [price], [payment_method], [description], [status]) VALUES (3, 17, CAST(N'2024-07-16T22:10:00.000' AS DateTime), CAST(24.99 AS Decimal(10, 2)), N'cash', N'Payment for order 2', N'completed')
INSERT [dbo].[Transactions] ([transaction_id], [order_id], [payment_date], [price], [payment_method], [description], [status]) VALUES (4, 18, CAST(N'2024-07-17T20:10:00.000' AS DateTime), CAST(26.97 AS Decimal(10, 2)), N'credit card', N'Payment for order 3', N'cancelled')
INSERT [dbo].[Transactions] ([transaction_id], [order_id], [payment_date], [price], [payment_method], [description], [status]) VALUES (5, 19, CAST(N'2024-07-18T23:10:00.000' AS DateTime), CAST(11.98 AS Decimal(10, 2)), N'credit card', N'Payment for order 4', N'completed')
INSERT [dbo].[Transactions] ([transaction_id], [order_id], [payment_date], [price], [payment_method], [description], [status]) VALUES (6, 20, CAST(N'2024-07-19T23:10:00.000' AS DateTime), CAST(43.96 AS Decimal(10, 2)), N'cash', N'Payment for order 5', N'pending')
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [userName], [email], [password], [balance], [phone], [role], [createdAt], [createdBy], [updateAt], [updateBy], [deletedAt], [deletedBy]) VALUES (1, N'123', N'123@gmail.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL, NULL, N'Staff', CAST(N'2024-07-12T14:25:28.343' AS DateTime), N'System', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([user_id], [userName], [email], [password], [balance], [phone], [role], [createdAt], [createdBy], [updateAt], [updateBy], [deletedAt], [deletedBy]) VALUES (2, N'Admin', N'admin@gmail.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL, NULL, N'Admin', CAST(N'2024-07-12T14:39:42.570' AS DateTime), N'System', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([user_id], [userName], [email], [password], [balance], [phone], [role], [createdAt], [createdBy], [updateAt], [updateBy], [deletedAt], [deletedBy]) VALUES (3, N'1234', N'manhvv15@gmail.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL, NULL, N'User', CAST(N'2024-07-12T15:40:31.583' AS DateTime), N'System', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([user_id], [userName], [email], [password], [balance], [phone], [role], [createdAt], [createdBy], [updateAt], [updateBy], [deletedAt], [deletedBy]) VALUES (4, N'123', N'12@gmail.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL, NULL, N'User', CAST(N'2024-07-12T16:07:29.240' AS DateTime), N'System', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([user_id], [userName], [email], [password], [balance], [phone], [role], [createdAt], [createdBy], [updateAt], [updateBy], [deletedAt], [deletedBy]) VALUES (7, N'123', N'12345@gmail.com', N'd48ff4b2f68a10fd7c86f185a6ccede0dc0f2c48538d697cb33b6ada3f1e85db', NULL, NULL, N'User', CAST(N'2024-07-12T16:11:26.690' AS DateTime), N'System', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([user_id], [userName], [email], [password], [balance], [phone], [role], [createdAt], [createdBy], [updateAt], [updateBy], [deletedAt], [deletedBy]) VALUES (9, N'123', N'1@gmail.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL, NULL, N'User', CAST(N'2024-07-12T16:36:53.860' AS DateTime), N'System', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([user_id], [userName], [email], [password], [balance], [phone], [role], [createdAt], [createdBy], [updateAt], [updateBy], [deletedAt], [deletedBy]) VALUES (11, N'agb@gmail.com', N'agb@gmail.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL, NULL, N'User', CAST(N'2024-07-19T17:07:45.090' AS DateTime), N'System', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([user_id], [userName], [email], [password], [balance], [phone], [role], [createdAt], [createdBy], [updateAt], [updateBy], [deletedAt], [deletedBy]) VALUES (12, N'manh', N'manhvu152k2@gmail.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL, NULL, N'User', CAST(N'2024-07-20T01:59:57.523' AS DateTime), N'System', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([user_id], [userName], [email], [password], [balance], [phone], [role], [createdAt], [createdBy], [updateAt], [updateBy], [deletedAt], [deletedBy]) VALUES (14, N'manh1234', N'manhvvv@gmail.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL, NULL, N'User', CAST(N'2024-10-29T16:40:21.637' AS DateTime), N'System', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([user_id], [userName], [email], [password], [balance], [phone], [role], [createdAt], [createdBy], [updateAt], [updateBy], [deletedAt], [deletedBy]) VALUES (15, N'thanh123', N'thanhlvt298@gmai.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL, NULL, N'User', CAST(N'2024-10-29T16:42:11.523' AS DateTime), N'System', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([user_id], [userName], [email], [password], [balance], [phone], [role], [createdAt], [createdBy], [updateAt], [updateBy], [deletedAt], [deletedBy]) VALUES (16, N'thanh12', N'thanhlvt298@gmail.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL, NULL, N'User', CAST(N'2024-10-29T16:42:35.597' AS DateTime), N'System', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E616450CD563E]    Script Date: 10/30/2024 9:27:56 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT (getdate()) FOR [payment_date]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[BookingRequest]  WITH CHECK ADD FOREIGN KEY([table_id])
REFERENCES [dbo].[Tables] ([table_id])
GO
ALTER TABLE [dbo].[BookingRequest]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([menu_id])
REFERENCES [dbo].[Menus] ([menu_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([createdBy])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([table_id])
REFERENCES [dbo].[Tables] ([table_id])
GO
ALTER TABLE [dbo].[Reserved]  WITH CHECK ADD FOREIGN KEY([booking_id])
REFERENCES [dbo].[BookingRequest] ([booking_id])
GO
ALTER TABLE [dbo].[Reserved]  WITH CHECK ADD FOREIGN KEY([table_id])
REFERENCES [dbo].[Tables] ([table_id])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
USE [master]
GO
ALTER DATABASE [ManageRestaurant] SET  READ_WRITE 
GO
