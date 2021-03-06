USE [master]
GO
/****** Object:  Database [CountryCityManagement]    Script Date: 1/25/2017 1:38:02 AM ******/
CREATE DATABASE [CountryCityManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CountryCityManagement', FILENAME = N'C:\Users\MrWEED\CountryCityManagement.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CountryCityManagement_log', FILENAME = N'C:\Users\MrWEED\CountryCityManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CountryCityManagement] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CountryCityManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CountryCityManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CountryCityManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CountryCityManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CountryCityManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CountryCityManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [CountryCityManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CountryCityManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CountryCityManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CountryCityManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CountryCityManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CountryCityManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CountryCityManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CountryCityManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CountryCityManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CountryCityManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CountryCityManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CountryCityManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CountryCityManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CountryCityManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CountryCityManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CountryCityManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CountryCityManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CountryCityManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CountryCityManagement] SET  MULTI_USER 
GO
ALTER DATABASE [CountryCityManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CountryCityManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CountryCityManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CountryCityManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CountryCityManagement]
GO
/****** Object:  Table [dbo].[City]    Script Date: 1/25/2017 1:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[About] [varchar](max) NOT NULL,
	[Dwellers] [bigint] NOT NULL,
	[Location] [varchar](50) NOT NULL,
	[Weather] [varchar](50) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 1/25/2017 1:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[About] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[CountryInfo]    Script Date: 1/25/2017 1:38:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CountryInfo] as SELECT Country.Name as name, Country.About as about, COUNT(City.Name) as totalCity, COALESCE(SUM(City.Dwellers),0) as totalDwellers FROM City
Right outer JOIN Country
ON City.CountryId=Country.Id
GROUP BY Country.About, Country.Name;
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [Name], [About], [Dwellers], [Location], [Weather], [CountryId]) VALUES (1, N'Dhaka', N'<p>Dhaka is the most populated city</p>', 786, N'Center', N'hot', 1)
INSERT [dbo].[City] ([Id], [Name], [About], [Dwellers], [Location], [Weather], [CountryId]) VALUES (2, N'Khulna', N'<p>Sundarban is here</p>', 567, N'South', N'Cool & healthy', 1)
INSERT [dbo].[City] ([Id], [Name], [About], [Dwellers], [Location], [Weather], [CountryId]) VALUES (1002, N'Brasilia', N'<p>beautiful one</p>', 532132, N'Center', N'Cool & healthy', 1003)
INSERT [dbo].[City] ([Id], [Name], [About], [Dwellers], [Location], [Weather], [CountryId]) VALUES (1003, N'London', N'<p><img src="https://www.google.com/search?q=images&amp;tbm=isch&amp;imgil=Gd_Suvvlpe2UbM%253A%253B-DSnI9QBUXjbbM%253Bhttp%25253A%25252F%25252Fwww.gettyimages.ca%25252F&amp;source=iu&amp;pf=m&amp;fir=Gd_Suvvlpe2UbM%253A%252C-DSnI9QBUXjbbM%252C_&amp;usg=__e7twfJ3WkbiiANqODeUMEPJcDOM%3D&amp;biw=1093&amp;bih=457&amp;ved=0ahUKEwjAuuPn8oTMAhXHNJQKHceLDgAQyjcILg&amp;ei=07UKV4CFOMfp0ATHlzo#imgdii=Gd_Suvvlpe2UbM%3A%3BGd_Suvvlpe2UbM%3A%3B8Jbs_I_mYavzJM%3A&amp;imgrc=Gd_Suvvlpe2UbM%3A" alt="nothing" width="400" height="250" /></p>', 546465, N'54654', N'546+', 4)
INSERT [dbo].[City] ([Id], [Name], [About], [Dwellers], [Location], [Weather], [CountryId]) VALUES (1004, N'Sydney', N'<p><img src="https://www.google.com/search?q=images&amp;tbm=isch&amp;imgil=Gd_Suvvlpe2UbM%253A%253B-DSnI9QBUXjbbM%253Bhttp%25253A%25252F%25252Fwww.gettyimages.ca%25252F&amp;source=iu&amp;pf=m&amp;fir=Gd_Suvvlpe2UbM%253A%252C-DSnI9QBUXjbbM%252C_&amp;usg=__e7twfJ3WkbiiANqODeUMEPJcDOM%3D&amp;biw=1093&amp;bih=457&amp;ved=0ahUKEwjAuuPn8oTMAhXHNJQKHceLDgAQyjcILg&amp;ei=07UKV4CFOMfp0ATHlzo#imgrc=fiJ-HZc0KFC-WM%3A" alt="" width="400" height="250" /></p>', 546546, N'5463', N'546', 1)
INSERT [dbo].[City] ([Id], [Name], [About], [Dwellers], [Location], [Weather], [CountryId]) VALUES (1005, N'Melbourne', N'<p><img src="http://www.gettyimages.ca/gi-resources/images/Homepage/Hero/UK/CMS_Creative_164657191_Kingfisher.jpg" alt="" width="518" height="250" /></p>', 56654, N'north', N'Cool & healthy', 3)
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [Name], [About]) VALUES (1, N'Bangladesh', N'<p>Contains bay of bengal, is the most beautiful country in the word.</p>')
INSERT [dbo].[Country] ([Id], [Name], [About]) VALUES (2, N'India', N'<p>fkjgj</p>')
INSERT [dbo].[Country] ([Id], [Name], [About]) VALUES (3, N'Australia', N'<p>fjhfjgj</p>')
INSERT [dbo].[Country] ([Id], [Name], [About]) VALUES (4, N'England', N'<p>ioghnjhjfgh</p>')
INSERT [dbo].[Country] ([Id], [Name], [About]) VALUES (5, N'South Africa', N'<p>fhjgfj</p>')
INSERT [dbo].[Country] ([Id], [Name], [About]) VALUES (6, N'USA', N'<p>USAfghjfdj</p>')
INSERT [dbo].[Country] ([Id], [Name], [About]) VALUES (1002, N'Colombia', N'<p>fkjkjl</p>')
INSERT [dbo].[Country] ([Id], [Name], [About]) VALUES (1003, N'Brazil', N'<p>fdghf</p>')
INSERT [dbo].[Country] ([Id], [Name], [About]) VALUES (1004, N'Bolivia', N'<p>don''t know</p>')
SET IDENTITY_INSERT [dbo].[Country] OFF
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Country]
GO
USE [master]
GO
ALTER DATABASE [CountryCityManagement] SET  READ_WRITE 
GO
