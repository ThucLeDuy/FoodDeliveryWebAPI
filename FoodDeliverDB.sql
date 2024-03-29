/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2017 (14.0.2027)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [dbDeliveryFood]    Script Date: 8/7/2019 7:09:07 AM ******/
CREATE DATABASE [dbDeliveryFood]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbDeliveryFood', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\dbDeliveryFood.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbDeliveryFood_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\dbDeliveryFood_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbDeliveryFood] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbDeliveryFood].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbDeliveryFood] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbDeliveryFood] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbDeliveryFood] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbDeliveryFood] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbDeliveryFood] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbDeliveryFood] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbDeliveryFood] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbDeliveryFood] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbDeliveryFood] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbDeliveryFood] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbDeliveryFood] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbDeliveryFood] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbDeliveryFood] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbDeliveryFood] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbDeliveryFood] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbDeliveryFood] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbDeliveryFood] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbDeliveryFood] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbDeliveryFood] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbDeliveryFood] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbDeliveryFood] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbDeliveryFood] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbDeliveryFood] SET RECOVERY FULL 
GO
ALTER DATABASE [dbDeliveryFood] SET  MULTI_USER 
GO
ALTER DATABASE [dbDeliveryFood] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbDeliveryFood] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbDeliveryFood] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbDeliveryFood] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbDeliveryFood] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbDeliveryFood', N'ON'
GO
ALTER DATABASE [dbDeliveryFood] SET QUERY_STORE = OFF
GO
USE [dbDeliveryFood]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [dbDeliveryFood]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 8/7/2019 7:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] NOT NULL,
	[hire_date] [date] NOT NULL,
	[base_salary] [money] NULL,
	[role] [varchar](55) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 8/7/2019 7:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[id] [int] NOT NULL,
	[invoice_date] [datetime] NOT NULL,
	[Adress] [nvarchar](255) NULL,
	[id_employee] [int] NULL,
	[id_user] [int] NULL,
	[total] [money] NULL,
	[status] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice_Detail]    Script Date: 8/7/2019 7:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice_Detail](
	[id] [int] NOT NULL,
	[id_product] [int] NOT NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 8/7/2019 7:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] NOT NULL,
	[categoryId] [int] NULL,
	[name] [nvarchar](255) NOT NULL,
	[image] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[salePrice] [money] NULL,
	[timesBooked] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Category]    Script Date: 8/7/2019 7:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Category](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store_Users]    Script Date: 8/7/2019 7:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store_Users](
	[id] [int] NOT NULL,
	[email] [varchar](40) NULL,
	[password] [varchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[gender] [int] NULL,
	[dob] [date] NULL,
	[phonenumber] [char](12) NULL,
	[address] [varchar](255) NULL,
	[image] [varchar](255) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Employee] ([id], [hire_date], [base_salary], [role]) VALUES (1, CAST(N'2018-10-20' AS Date), 2000000.0000, N'deliver')
INSERT [dbo].[Employee] ([id], [hire_date], [base_salary], [role]) VALUES (2, CAST(N'2018-10-21' AS Date), 2000000.0000, N'deliver')
INSERT [dbo].[Employee] ([id], [hire_date], [base_salary], [role]) VALUES (3, CAST(N'2018-10-22' AS Date), 2500000.0000, N'deliver')
INSERT [dbo].[Employee] ([id], [hire_date], [base_salary], [role]) VALUES (4, CAST(N'2018-11-12' AS Date), 123.0000, N'q')
INSERT [dbo].[Invoice] ([id], [invoice_date], [Adress], [id_employee], [id_user], [total], [status]) VALUES (1, CAST(N'2018-01-02T00:00:00.000' AS DateTime), N'235 Nguyen Oanh Q.GoVap', 1, 5, 74.0000, N'Ordered')
INSERT [dbo].[Invoice] ([id], [invoice_date], [Adress], [id_employee], [id_user], [total], [status]) VALUES (2, CAST(N'2018-02-03T00:00:00.000' AS DateTime), N'40 Pham Van Dong', 2, 6, 56.0000, N'Ordered')
INSERT [dbo].[Invoice] ([id], [invoice_date], [Adress], [id_employee], [id_user], [total], [status]) VALUES (3, CAST(N'2018-12-14T09:18:07.747' AS DateTime), N'Quan 1', NULL, 3, 44.0000, N'Ordered')
INSERT [dbo].[Invoice] ([id], [invoice_date], [Adress], [id_employee], [id_user], [total], [status]) VALUES (4, CAST(N'2018-12-14T09:23:29.420' AS DateTime), N'Quan 7', NULL, 3, 88.0000, N'Ordered')
INSERT [dbo].[Invoice] ([id], [invoice_date], [Adress], [id_employee], [id_user], [total], [status]) VALUES (5, CAST(N'2018-12-14T09:30:33.860' AS DateTime), N'Quan 4', NULL, 4, 88.0000, N'Ordered')
INSERT [dbo].[Invoice] ([id], [invoice_date], [Adress], [id_employee], [id_user], [total], [status]) VALUES (6, CAST(N'2018-12-14T09:37:48.343' AS DateTime), N'Quan 4', NULL, 5, 88.0000, N'Ordered')
INSERT [dbo].[Invoice] ([id], [invoice_date], [Adress], [id_employee], [id_user], [total], [status]) VALUES (7, CAST(N'2018-12-14T09:41:38.147' AS DateTime), N'Quan 4', NULL, 7, 593.6000, N'Ordered')
INSERT [dbo].[Invoice_Detail] ([id], [id_product], [quantity]) VALUES (1, 7, 4)
INSERT [dbo].[Invoice_Detail] ([id], [id_product], [quantity]) VALUES (2, 1, 1)
INSERT [dbo].[Invoice_Detail] ([id], [id_product], [quantity]) VALUES (2, 5, 2)
INSERT [dbo].[Invoice_Detail] ([id], [id_product], [quantity]) VALUES (3, 1, 1)
INSERT [dbo].[Invoice_Detail] ([id], [id_product], [quantity]) VALUES (3, 2, 1)
INSERT [dbo].[Invoice_Detail] ([id], [id_product], [quantity]) VALUES (4, 1, 2)
INSERT [dbo].[Invoice_Detail] ([id], [id_product], [quantity]) VALUES (4, 2, 1)
INSERT [dbo].[Invoice_Detail] ([id], [id_product], [quantity]) VALUES (4, 3, 2)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (1, 1, N'Ebi tempura (5 pcs)', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/ebi-tempura2.png', N'Tôm chiên giòn và sốt Tempura', 179.8000, 72)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (2, 1, N'Crazy salmon set', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/crazy-salmon-set.png', N'4 Nigiri cá hồi, 3 sashimi cá hồi, 6 cuộn cá hồi', 179.0000, 27)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (3, 1, N'Sake lover', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/sake-lover.png', N'3 Sashimi cá hồi, 4 cuộn cá hồi, 3 nigiri', 117.0000, 188)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (4, 2, N'Aburi salmon set', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/aburi-salmon-set-179k.png', N'3 pcs aburi sashimi, 3 aburi nigiri, 4 avokado salmon maki', 129.8000, 203)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (5, 2, N'Salmon set', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/salmon-set-185k.png', N'2 pcs salmon sashimi, 2 nigiri, 4 salmon maki, 4 California roll.', 199.0000, 311)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (6, 2, N'Harasu shioyaki', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/harasu-shioyaki.png', N'4 Miếng bụng cá hồi nướng và sốt đặc biệt', 229.0000, 318)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (7, 2, N'Maguro combo set', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/maguro-combo-set.png', N'3pcs maguro, 2pcs nigiri, 2pcs gunkan, 1 temaki, 6 roll', 74.0000, 103)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (8, 2, N'Sake combo set', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/sake-combo-set.png', N'3pcs sashimi, 2pcs nigiri, 2pcs gunkan, 1 temaki, 6 roll', 159.0000, 205)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (9, 2, N'Tuna avokado maki', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/tuna-avokado-maki.png', N'', 155.0000, 318)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (10, 2, N'Maguro Don', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/maguro-don.png', N'', 165.0000, 240)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (11, 2, N'Spicy maguro Don', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/spicy-maguro-don-155.png', N'Cá ngừ, bơ, sốt cay, cơm sushi', 169.0000, 337)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (12, 2, N'Spicy salmon Don', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/spicy-maguro-don-165.png', N'Cá hồi, bơ, sốt cay, cơm sushi', 135.0000, 250)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (13, 2, N'Ikura Don', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/ikura-don.png', N'Trứng cá hồi, bơ, trứng, cơm sushi', 89.0000, 205)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (14, 3, N'Salmon salad', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/salmon-salad.png', N'Cá hồi, bơ, cà chua, trứng cá chuồn, rong biển', 149.0000, 271)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (15, 3, N'Avocado salad', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/avocado-salad.png', N'Bơ, cà chua, salad xanh', 118.0000, 230)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (16, 3, N'Hokkai salad', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/hokkai-salad.png', N'Hải sản, salad xanh, bơ, cà chua, rong biển', 28.0000, 208)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (17, 3, N'Yakiniku salad', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/yakiniku-salad.png', N'Lát thịt bò, salad xanh, cà chua, dưa leo, cà rốt cắt lát,', 118.8000, 222)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (18, 3, N'Edamame', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/edamame.png', N'Đậu nành luộc, muối', 15.0000, 20)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (19, 3, N'Prawn salad', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/prawn-salad-new.png', N'Salad rau trộn với tôm và sốt Nhật', 58.0000, 73)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (20, 4, N'Miso soup', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/miso-soup.png', N'Miso, tàu hủ, rong biển, hành lá, nước dùng', 118.0000, 15)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (21, 5, N'Agedashi tofu', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/agedashi-tofu.png', N'Đậu hủ chiên giòn, sốt', 95.0000, 201)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (22, 5, N'Ebi tempura (5 pcs)', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/ebi-tempura2.png', N'Tôm chiên giòn và sốt Tempura', 75.8000, 146)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (23, 5, N'Ika tempura (7pcs)', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/ika-tempura2.png', N'', 179.8000, 334)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (24, 5, N'Deep fried chicken katsu', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/deep-fried-chicken-katsu-new.png', N'Gà không xương chiên xù', 129.0000, 174)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (25, 6, N'Lover set', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/lover-set.png', N'Nigiri: 2 cá hồi, 2 cá ngừ, Cuộn: 3 cá hồi, 3 cá ngừ Sashimi: 2 cá hồi, 2 cá ngừ', 119.0000, 4)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (26, 6, N'Satsuki A', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/satsuki-a.png', N'5 Nigiri, 3 cuộn cá hồi, 3 cuộn cá ngừ', 88.0000, 307)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (27, 6, N'Double tuna', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/double-tuna.png', N'Cá ngừ, sốt cay, bơ, cơm Nhật', 169.0000, 234)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (28, 6, N'California roll', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/california-roll.png', N'Dưa chuột, bơ, sốt mayonnaise, thanh cua, trứng cá chuồng', 129.0000, 273)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (29, 6, N'Sake lover', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/sake-lover.png', N'3 Sashimi cá hồi, 4 cuộn cá hồi, 3 nigiri', 168.8000, 114)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (30, 6, N'Mix maki set', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/mix-maki-set.png', N'6 cuộn cá hồi, cá ngừ, thanh cua', 179.0000, 141)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (31, 6, N'Satsuki B', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/satsuki-b.png', N'7 Nigiri, 4 maki', 169.0000, 346)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (32, 6, N'Crazy salmon set', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/crazy-salmon-set.png', N'4 Nigiri cá hồi, 3 sashimi cá hồi, 6 cuộn cá hồi', 169.0000, 13)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (33, 6, N'Crazy maguro set', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/crazy-maguro-set.png', N'4 Nigiri cá ngừ, 3 Sashimi cá ngừ, 6 cuộn cá ngừ', 118.0000, 205)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (34, 6, N'Mix salmon sushi', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/6-1-2018-2.png', N'6 miếng nigiri cá hồi, 6 miếng cuộn cá hồi', 109.0000, 99)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (35, 7, N'Sake sashimi', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/sake-sashimi.png', N'Sashimi cá hồi 6 miếng', 89.0000, 271)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (36, 7, N'Maguro sashimi', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/maguro-sashimi-new.png', N'Sashimi cá ngừ 6 miếng', 89.0000, 63)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (37, 7, N'Ika sashimi', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/ika-sashimi.png', N'Sashimi mực 6 miếng', 145.0000, 56)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (38, 7, N'Tako sashimi', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/tako-sashimi.png', N'Sashimi bạch tuộc 6 miếng', 189.0000, 169)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (39, 7, N'Salmon toro sashimi', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/salmon-toro-sashimi.png', N'Sashimi b?ng cá h?i 6 mi?ng', 288.0000, 175)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (40, 7, N'Mix sake sashimi', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/mix-sake-sashimi.png', N'3 miếng cá hồi, 3 miếng bụng cá hồi, miếng dưa chuột trứng cá hồi', 125.0000, 338)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (41, 7, N'Associated sashimi plater', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/associated-sashimi-plater.png', N'2 miếng: cá hồi, cá ngừ, mực, tôm, bụng cá hồi', 155.0000, 183)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (42, 7, N'Sashimi Set 2', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/6-1-2018.png', N'Sashimi 2 loại: 3 miếng cá ngừ và 3 miếng cá hồi', 45.0000, 211)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (43, 7, N'Sashimi set 3', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/crazy-salmon.png', N'Sashimi 3 loại: 3 miếng cá ngừ và 3 miếng cá hồi và 3 miếng mực', 45.0000, 101)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (44, 8, N'Sake aburi', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/sake-aburi.png', N'Cá hồi', 142.0000, 1)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (45, 8, N'Maguro aburi', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/maguro-aburi.png', N'Cá ngừ', 48.0000, 123)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (46, 8, N'Aburi salmon maki', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/aburi-salmon-maki.png', N'', 45.0000, 137)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (47, 9, N'Sake roll', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/salmon-roll.png', N'', 35.0000, 285)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (48, 9, N'Maguro roll', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/maguro-roll.png', N'', 168.0000, 11)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (49, 9, N'Kani roll', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/kani-roll.png', N'', 39.8000, 269)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (50, 9, N'Unagi roll', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/unagi-roll.png', N'', 78.0000, 179)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (51, 9, N'Avocado maki', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/avocado-maki.png', N'Cuộn cơm với bơ trái', 145.0000, 333)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (52, 9, N'Salmon maki roll', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/salmon-maki-roll.png', N'Cá hồi cuộn bơ, hạt mè sốt mayonnaise', 268.0000, 234)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (53, 9, N'Double salmon maki', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/double-salmon-maki.png', N'Cá hồi gấp đôi cuộn bơ, hạt mè sốt mayonnaise', 128.8000, 255)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (54, 9, N'Lucky Roll', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/lucky-roll.png', N'dưa leo và trứng cuộn với gạo Nhật, cá heo nướng và nước sốt đặc biệt', 55.8000, 71)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (55, 9, N'Aburi double tuna maki', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/aburi-double-tuna-maki.png', N'Cá ngừ cuộn với bơ, mè', 55.8000, 64)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (56, 9, N'Deep fried salmon roll', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/deep-fried-salmon-roll.png', N'Cuộn cá hồi chiên giòn', 51.8000, 327)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (57, 9, N'Deep fried tuna roll', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/deep-fried-tuna-roll.png', N'Cuộn cá ngừ chiên giòn', 88.8000, 39)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (58, 9, N'Deep fried kani roll', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/deep-fried-kani-roll.png', N'Cuộn thanh cua chiên giòn', 58.0000, 297)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (59, 9, N'Ebi tem maki', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/ebi-tem-maki.png', N'Cuộn tôm chiên giòn', 58.0000, 257)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (60, 10, N'Sake temaki', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/sake-temaki.png', N'Cá hồi lát và cơm cuộn', 78.0000, 213)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (61, 10, N'Maguro temaki', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/maguro-temaki.png', N'Cá ngừ cuộn với cơm', 48.0000, 331)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (62, 10, N'Unagi temaki', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/unagi-temaki.png', N'Lươn cuộn với cơm', 45.0000, 47)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (63, 11, N'Sake gunkan', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/sake-gunkan.png', N'Gunkan cá hồi 2 miếng', 65.0000, 287)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (64, 11, N'Maguro gunkan', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/maguro-gunkan.png', N'Gunkan cá ngừ 2 miếng', 40.0000, 92)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (65, 11, N'Tobiko gunkan', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/tobiko-gunkan.png', N'Gunkan trứng cá 2 miếng', 45.0000, 65)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (66, 11, N'Kani gunkan', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/kani-gunkan.png', N'Gunkan thanh cua 2 miếng', 88.0000, 121)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (67, 11, N'Ebi gunkan', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/ebi-gunkan.png', N'Gunkan tôm 2 miếng', 45.0000, 22)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (68, 11, N'Sake roe gunkan', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/sake-roe-gunkan.png', N'Gunkan trứng cá hồi 2 miếng', 40.8000, 114)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (69, 11, N'Ika gunkan', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/ika-gunkan.png', N'Gunkan mực 2 miếng', 185.0000, 307)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (70, 11, N'Steamed tuna gunkan', N'https:', N'Gukan cá ng? h?p', 38.0000, 106)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (71, 11, N'Gunkan set', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/gunkan-set.png', N'Gunkan set: mực, cá hồi, cá ngừ, thanh cua, tôm, trứng cá, dưa chuột', 36.0000, 52)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (72, 12, N'Ebi nigiri', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/ebi-nigiri.png', N'Nigiri tôm 2 miếng', 38.0000, 184)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (73, 12, N'Tako nigiri', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/tako-nigiri.png', N'Nigiri bạch tuộc 2 miếng', 42.0000, 210)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (74, 12, N'Ika nigiri', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/ika-nigiri.png', N'Nigiri mực 2 miếng', 40.0000, 140)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (75, 12, N'Sake nigiri', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/sake-nigiri.png', N'Nigiri cá hồi 2 miếng', 28.0000, 157)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (76, 12, N'Maguro nigiri', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/maguro-nigiri.png', N'Nigiri cá ngừ 2 miếng', 75.0000, 267)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (77, 12, N'Tamago nigiri', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/tamago-nigiri.png', N'Nigiri trứng chiên 2 miếng', 28.0000, 261)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (78, 12, N'Unagi nigiri', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/unagi-nigiri.png', N'Nigiri lươn nướng BBQ 2 miếng', 169.0000, 167)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (79, 12, N'Kani nigiri', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/kani-nigiri.png', N'Nigiri thanh cua 2 miếng', 148.0000, 104)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (80, 12, N'Nigiri set', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/nigiri-set-new.png', N'1 miếng: cá hồi, cá ngừ, mực , bạch truộc, trứng, thanh cua, lương, tôm', 226.8000, 59)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (81, 13, N'Sake Don', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/saka-don.png', N'Cá hồi với cơm và sốt', 149.0000, 242)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (82, 13, N'Unagi Don', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/unagi-don.png', N'Lươn nướng với cơm', 117.0000, 329)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (83, 13, N'Yakiniku Don', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/yakiniku-don.png', N'Bò xào và cơm', 117.0000, 243)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (84, 13, N'Teriyaki chicken Don', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/teriyaki-chicken-don.png', N'Gà nướng và cơm', 168.8000, 337)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (85, 13, N'Katsu Don', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/chicken-katsu-don.png', N'Gà/heo chiên giòn với banh mì và cơm', 109.0000, 221)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (86, 13, N'Taka don', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/taka-don3.png', N'Cơm, cá hồi, cá ngừ, trứng ngọt, trứng cá chuồng, bơ, dưa leo', 166.0000, 260)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (87, 13, N'Oyako Don', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/oyako-don.png', N'Đùi gà, trứng và sốt Don buri', 165.0000, 219)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (88, 13, N'Beef Curry Don', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/beef-curry-don.png', N'Bò cắt lát, cà rốt, hành tây, sốt cà ri và cơm Nhật', 165.8000, 128)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (89, 13, N'Seafood Curry Don', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/seafood-curry-don.png', N'Tôm, mực, sốt cà ri cà cơm Nhật', 191.0000, 144)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (90, 13, N'Katsu Curry Don', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/chicken-katsu-curry-don.png', N'Gà/heo chiên giòn với vụn bánh mì, sốt cà ri và cơm Nhật', 181.0000, 87)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (91, 13, N'Seafood Curry Udon', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/seafood-curry-udon.png', N'Tôm, mực, sốt cà ri và mì Udon', 390.0000, 311)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (92, 13, N'Chicken Curry Udon', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/chicken-katsu-curry-udon.png', N'Thịt gà/heo chiên giòn với vụn bánh mì, sốt cà ri và mì Udon', 185.0000, 246)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (93, 13, N'Unagi kabayaki', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/unagi-kabayaki.png', N'', 188.0000, 346)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (94, 13, N'Beer Curry Udon', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/beer-curry-udon.png', N'', 89.0000, 63)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (95, 13, N'Ebi Tempura Curry Udon', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/ebi-tempura-curry-udon.png', N'3 miếng ebi, cà ri Nhật, mì udon', 118.0000, 125)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (96, 14, N'Chicken omurice', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/chicken-omurice.png', N'Cơm, hành, nấm, gà', 149.0000, 15)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (97, 14, N'Katsu omurice', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/katsu-omurice.png', N'Thịt gà/thịt heo chiên xù, cơm, sốt, rau củ', 167.8000, 226)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (98, 14, N'Unagi omlet rice', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/unagi-omlet-rice.png', N'Lươn nhật, cơm, rong biển, rau củ, sốt lươn', 149.0000, 82)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (99, 14, N'Katsu Curry Omurice', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/chicken-katsu-omurice.png', N'Thịt gà/thịt heo chiên xù, nấm, cơm chiên, sốt cà ri', 167.0000, 91)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (100, 14, N'Ebi Tempura Omurice', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/ebi-tempura-omurice-new.png', N'Tôm chiên xù, cơm chiên gà nấm, sốt teriyaki', 22.0000, 146)
GO
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (101, 14, N'Steamed rice', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/steamed-rice.png', N'Cơm trắng', 22.0000, 159)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (102, 15, N'Coke', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/coke.png', N'', 22.0000, 340)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (103, 15, N'7up', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/7up.png', N'', 22.0000, 137)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (104, 15, N'Lavies', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/lavies.png', N'', 20.0000, 209)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (105, 16, N'Sapporo', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/sapporo.png', N'', 38.0000, 222)
INSERT [dbo].[Product] ([id], [categoryId], [name], [image], [description], [salePrice], [timesBooked]) VALUES (106, 16, N'Tiger', N'https://static.vietnammm.com/images/restaurants/vn/NNON017/products/tiger.png', N'', 34.0000, 224)
INSERT [dbo].[Product_Category] ([id], [name], [description]) VALUES (1, N'Món được yêu thích', N'Món được yêu thích')
INSERT [dbo].[Product_Category] ([id], [name], [description]) VALUES (2, N'Món mới', N'Món mới')
INSERT [dbo].[Product_Category] ([id], [name], [description]) VALUES (3, N'Rau trộn', N'Rau trộn')
INSERT [dbo].[Product_Category] ([id], [name], [description]) VALUES (4, N'Súp', N'Súp')
INSERT [dbo].[Product_Category] ([id], [name], [description]) VALUES (5, N'Món chiên', N'Món chiên')
INSERT [dbo].[Product_Category] ([id], [name], [description]) VALUES (6, N'Sushi', N'Sushi')
INSERT [dbo].[Product_Category] ([id], [name], [description]) VALUES (7, N'Sashimi', N'Sashimi')
INSERT [dbo].[Product_Category] ([id], [name], [description]) VALUES (8, N'Aburi', N'Aburi')
INSERT [dbo].[Product_Category] ([id], [name], [description]) VALUES (9, N'Sushi roll', N'Sushi roll')
INSERT [dbo].[Product_Category] ([id], [name], [description]) VALUES (10, N'Temaki', N'Temaki')
INSERT [dbo].[Product_Category] ([id], [name], [description]) VALUES (11, N'Gunkan', N'Gunkan')
INSERT [dbo].[Product_Category] ([id], [name], [description]) VALUES (12, N'Nigiri', N'Nigiri')
INSERT [dbo].[Product_Category] ([id], [name], [description]) VALUES (13, N'Don', N'Don')
INSERT [dbo].[Product_Category] ([id], [name], [description]) VALUES (14, N'Món c?m Omurice', N'Món c?m Omurice')
INSERT [dbo].[Product_Category] ([id], [name], [description]) VALUES (15, N'Nước ngọt', N'Nước ngọt')
INSERT [dbo].[Product_Category] ([id], [name], [description]) VALUES (16, N'Bia', N'Bia')
INSERT [dbo].[Store_Users] ([id], [email], [password], [name], [gender], [dob], [phonenumber], [address], [image], [created_at], [updated_at]) VALUES (1, N'sample1@google', N'123d', N'Tạ Thảo', 2, CAST(N'2018-02-02' AS Date), N'56789       ', N'sample', N'scr', CAST(N'2018-02-02T00:00:00.000' AS DateTime), CAST(N'2018-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Store_Users] ([id], [email], [password], [name], [gender], [dob], [phonenumber], [address], [image], [created_at], [updated_at]) VALUES (2, N'sample2@google', N'456', N'Jonh Doe', 1, CAST(N'2018-02-02' AS Date), N'567890      ', N'sample', N'cr', CAST(N'2018-02-02T00:00:00.000' AS DateTime), CAST(N'2018-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Store_Users] ([id], [email], [password], [name], [gender], [dob], [phonenumber], [address], [image], [created_at], [updated_at]) VALUES (3, N'sample3@google', N'789', N'is null', 1, CAST(N'2018-02-02' AS Date), N'567         ', N'sample', N'xe', NULL, NULL)
INSERT [dbo].[Store_Users] ([id], [email], [password], [name], [gender], [dob], [phonenumber], [address], [image], [created_at], [updated_at]) VALUES (4, N'sample4@google', N'123d', N'Tạ Thảo Thảo', 2, CAST(N'2018-02-02' AS Date), N'56789       ', N'sampleHCM', N'scr..', NULL, NULL)
INSERT [dbo].[Store_Users] ([id], [email], [password], [name], [gender], [dob], [phonenumber], [address], [image], [created_at], [updated_at]) VALUES (5, N'customer1@google', N'123', N'Trúc', 2, CAST(N'2018-10-02' AS Date), N'34567       ', N'sampleHCM', N'null', NULL, NULL)
INSERT [dbo].[Store_Users] ([id], [email], [password], [name], [gender], [dob], [phonenumber], [address], [image], [created_at], [updated_at]) VALUES (6, N'customer2@google', N'123', N'Hai Thanh', 1, CAST(N'2018-10-02' AS Date), N'34567       ', N'sampleHCM', NULL, NULL, NULL)
INSERT [dbo].[Store_Users] ([id], [email], [password], [name], [gender], [dob], [phonenumber], [address], [image], [created_at], [updated_at]) VALUES (7, N'customer1@google', N'123', N'Trúc', 2, CAST(N'2018-10-02' AS Date), N'34567       ', N'sampleHCM', N'null', NULL, NULL)
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [timesBooked]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [fk_Invoice_Employee] FOREIGN KEY([id_employee])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [fk_Invoice_Employee]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [fk_Invoice_Store_Users] FOREIGN KEY([id_user])
REFERENCES [dbo].[Store_Users] ([id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [fk_Invoice_Store_Users]
GO
ALTER TABLE [dbo].[Invoice_Detail]  WITH CHECK ADD  CONSTRAINT [fk_InvoiceDetail_Invoice] FOREIGN KEY([id])
REFERENCES [dbo].[Invoice] ([id])
GO
ALTER TABLE [dbo].[Invoice_Detail] CHECK CONSTRAINT [fk_InvoiceDetail_Invoice]
GO
ALTER TABLE [dbo].[Invoice_Detail]  WITH CHECK ADD  CONSTRAINT [fk_InvoiceDetail_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Invoice_Detail] CHECK CONSTRAINT [fk_InvoiceDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [fk_Product_Product_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Product_Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [fk_Product_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [dbDeliveryFood] SET  READ_WRITE 
GO
