USE [master]
GO
/****** Object:  Database [Website]    Script Date: 5/29/2021 4:33:21 PM ******/
CREATE DATABASE [Website]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Website', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Website.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Website_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Website_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Website] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Website].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Website] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Website] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Website] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Website] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Website] SET ARITHABORT OFF 
GO
ALTER DATABASE [Website] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Website] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Website] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Website] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Website] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Website] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Website] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Website] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Website] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Website] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Website] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Website] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Website] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Website] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Website] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Website] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Website] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Website] SET RECOVERY FULL 
GO
ALTER DATABASE [Website] SET  MULTI_USER 
GO
ALTER DATABASE [Website] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Website] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Website] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Website] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Website] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Website] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Website', N'ON'
GO
ALTER DATABASE [Website] SET QUERY_STORE = OFF
GO
USE [Website]
GO
/****** Object:  Table [dbo].[Categorys]    Script Date: 5/29/2021 4:33:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorys](
	[IDCategory] [bigint] NOT NULL,
	[Title] [varchar](75) NOT NULL,
	[Contents] [text] NULL,
 CONSTRAINT [PK_Categorys] PRIMARY KEY CLUSTERED 
(
	[IDCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pro_Cate]    Script Date: 5/29/2021 4:33:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pro_Cate](
	[IDProduct] [bigint] NOT NULL,
	[IDCategory] [bigint] NOT NULL,
 CONSTRAINT [PK_Pro_Cate] PRIMARY KEY CLUSTERED 
(
	[IDProduct] ASC,
	[IDCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/29/2021 4:33:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[IDProducts] [bigint] NOT NULL,
	[IDVendor] [bigint] NOT NULL,
	[Title] [varchar](55) NOT NULL,
	[Summary] [text] NULL,
	[Type] [smallint] NOT NULL,
	[Price] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Shop] [tinyint] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[UpdateAt] [datetime] NULL,
	[PublishedAt] [datetime] NULL,
	[StartsAt] [datetime] NULL,
	[EndsAt] [datetime] NULL,
	[Contents] [text] NULL,
	[Pictures] [bigint] NULL,
	[Pictures1] [bigint] NULL,
	[Pictures2] [bigint] NULL,
	[Pictures3] [bigint] NULL,
	[Pictures4] [bigint] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[IDProducts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 5/29/2021 4:33:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[IDReview] [bigint] NOT NULL,
	[IDProduct] [bigint] NOT NULL,
	[IDUser] [bigint] NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Rating] [smallint] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[Published] [bit] NOT NULL,
	[PublishedAt] [datetime] NULL,
	[Contents] [text] NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[IDReview] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/29/2021 4:33:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IDUser] [bigint] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Mobile] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RegisteredAt] [datetime] NOT NULL,
	[FistName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[LastLogin] [datetime] NULL,
	[Type] [tinyint] NOT NULL,
	[Intro] [text] NULL,
	[Profile] [text] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Categorys] ([IDCategory], [Title], [Contents]) VALUES (1, N'Computer', N'haha')
INSERT [dbo].[Categorys] ([IDCategory], [Title], [Contents]) VALUES (2, N'Tele', N'best')
GO
INSERT [dbo].[Pro_Cate] ([IDProduct], [IDCategory]) VALUES (1, 2)
INSERT [dbo].[Pro_Cate] ([IDProduct], [IDCategory]) VALUES (2, 1)
GO
INSERT [dbo].[Products] ([IDProducts], [IDVendor], [Title], [Summary], [Type], [Price], [Quantity], [Shop], [CreateAt], [UpdateAt], [PublishedAt], [StartsAt], [EndsAt], [Contents], [Pictures], [Pictures1], [Pictures2], [Pictures3], [Pictures4]) VALUES (1, 1, N'Maytam', N'haha', 1, 20, 20, 1, CAST(N'2019-03-06T11:13:33.970' AS DateTime), CAST(N'2019-03-06T11:13:33.970' AS DateTime), CAST(N'2019-03-06T11:13:33.970' AS DateTime), CAST(N'2019-03-06T11:13:33.970' AS DateTime), CAST(N'2022-03-06T11:13:33.970' AS DateTime), N'aha', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([IDProducts], [IDVendor], [Title], [Summary], [Type], [Price], [Quantity], [Shop], [CreateAt], [UpdateAt], [PublishedAt], [StartsAt], [EndsAt], [Contents], [Pictures], [Pictures1], [Pictures2], [Pictures3], [Pictures4]) VALUES (2, 2, N'Mayta', N'haha', 1, 20, 21, 1, CAST(N'2020-03-06T11:13:33.970' AS DateTime), CAST(N'2020-03-06T11:13:33.970' AS DateTime), CAST(N'2020-03-06T11:13:33.970' AS DateTime), CAST(N'2020-03-06T11:13:33.970' AS DateTime), CAST(N'2023-03-06T11:13:33.970' AS DateTime), N'hasadada', 2, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Reviews] ([IDReview], [IDProduct], [IDUser], [Title], [Rating], [CreateAt], [Published], [PublishedAt], [Contents]) VALUES (1, 2, 1, N'BESTA', 5, CAST(N'2020-03-06T11:13:33.970' AS DateTime), 1, CAST(N'2020-03-06T11:13:33.970' AS DateTime), N'xvsfsfsfsfefew')
GO
INSERT [dbo].[Users] ([IDUser], [Email], [Mobile], [Password], [RegisteredAt], [FistName], [LastName], [LastLogin], [Type], [Intro], [Profile]) VALUES (1, N'tinh@gmail.com', N'0373773172', N'a1231', CAST(N'2020-03-06T11:13:33.970' AS DateTime), N'duong', N'baTinh', CAST(N'2020-03-06T11:13:33.970' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[Users] ([IDUser], [Email], [Mobile], [Password], [RegisteredAt], [FistName], [LastName], [LastLogin], [Type], [Intro], [Profile]) VALUES (2, N'ba@gmail.com', N'0123456789', N'a123', CAST(N'2020-03-06T11:13:33.970' AS DateTime), N'duong', N'tinh', CAST(N'2020-03-06T11:13:33.970' AS DateTime), 1, N'hahafa', N'adsdrfewr')
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Type]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Pro_Cate]  WITH CHECK ADD  CONSTRAINT [FK_Pro_Cate_Categorys] FOREIGN KEY([IDCategory])
REFERENCES [dbo].[Categorys] ([IDCategory])
GO
ALTER TABLE [dbo].[Pro_Cate] CHECK CONSTRAINT [FK_Pro_Cate_Categorys]
GO
ALTER TABLE [dbo].[Pro_Cate]  WITH CHECK ADD  CONSTRAINT [FK_Pro_Cate_Products] FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Products] ([IDProducts])
GO
ALTER TABLE [dbo].[Pro_Cate] CHECK CONSTRAINT [FK_Pro_Cate_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Users] FOREIGN KEY([IDVendor])
REFERENCES [dbo].[Users] ([IDUser])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Users]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Products] FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Products] ([IDProducts])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Products]
GO
USE [master]
GO
ALTER DATABASE [Website] SET  READ_WRITE 
GO
