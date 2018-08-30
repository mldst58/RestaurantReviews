USE [master]
GO
/****** Object:  Database [RestaurantReview]    Script Date: 8/1/2018 11:10:50 PM ******/
CREATE DATABASE [RestaurantReview]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RestaurantReview].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RestaurantReview] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RestaurantReview] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RestaurantReview] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RestaurantReview] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RestaurantReview] SET ARITHABORT OFF 
GO
ALTER DATABASE [RestaurantReview] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RestaurantReview] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RestaurantReview] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RestaurantReview] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RestaurantReview] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RestaurantReview] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RestaurantReview] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RestaurantReview] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RestaurantReview] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RestaurantReview] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RestaurantReview] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [RestaurantReview] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RestaurantReview] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [RestaurantReview] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RestaurantReview] SET  MULTI_USER 
GO
ALTER DATABASE [RestaurantReview] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RestaurantReview] SET ENCRYPTION ON
GO
ALTER DATABASE [RestaurantReview] SET QUERY_STORE = ON
GO
ALTER DATABASE [RestaurantReview] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [RestaurantReview]
GO
/****** Object:  User [ReviewUser]    Script Date: 8/1/2018 11:10:50 PM ******/
CREATE USER [ReviewUser] WITH DEFAULT_SCHEMA=[db_owner]
GO
ALTER ROLE [db_owner] ADD MEMBER [ReviewUser]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 8/1/2018 11:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[IDAddress] [int] IDENTITY(1,1) NOT NULL,
	[Line1] [nvarchar](250) NULL,
	[Line2] [nvarchar](250) NULL,
	[Line3] [nvarchar](250) NULL,
	[City] [nvarchar](250) NULL,
	[County] [nvarchar](250) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[Country] [nvarchar](250) NULL,
	[AddressDetails] [nvarchar](250) NULL,
	[AddressType] [varchar](100) NULL,
	[DateCreated] [datetime] NULL,
	[IDUserCreated] [int] NULL,
	[DateUpdated] [datetime] NULL,
	[IDUserUpdated] [int] NULL,
 CONSTRAINT [Pk_Address_IDAddress] PRIMARY KEY CLUSTERED 
(
	[IDAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/1/2018 11:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/1/2018 11:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/1/2018 11:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/1/2018 11:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/1/2018 11:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Restaurant]    Script Date: 8/1/2018 11:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurant](
	[IDRestaurant] [int] IDENTITY(1,1) NOT NULL,
	[RestaurantName] [varchar](500) NOT NULL,
	[RestaurantDescription] [varchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DateCreated] [datetime] NULL,
	[IDUserCreated] [int] NULL,
	[DateUpdated] [datetime] NULL,
	[IDUserUpdated] [int] NULL,
 CONSTRAINT [Pk_Restaurant_IDRestaurant] PRIMARY KEY CLUSTERED 
(
	[IDRestaurant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Restaurant_Address]    Script Date: 8/1/2018 11:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurant_Address](
	[IDRestaurantAddress] [int] IDENTITY(1,1) NOT NULL,
	[IDRestaurant] [int] NULL,
	[IDAddress] [int] NULL,
 CONSTRAINT [Pk_Restaurant_Address_IDRestaurantAddress] PRIMARY KEY CLUSTERED 
(
	[IDRestaurantAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 8/1/2018 11:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[IDReview] [int] IDENTITY(1,1) NOT NULL,
	[ReviewText] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[Deleted] [bit] NULL,
	[IDRestaurant] [int] NULL,
	[IDUser] [int] NULL,
	[DateCreated] [datetime] NULL,
	[IDUserCreated] [int] NULL,
 CONSTRAINT [Pk_Reviews_IDReview] PRIMARY KEY CLUSTERED 
(
	[IDReview] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[User_Address]    Script Date: 8/1/2018 11:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Address](
	[IDUserAddress] [int] IDENTITY(1,1) NOT NULL,
	[IDUser] [int] NULL,
	[IDAddress] [int] NULL,
 CONSTRAINT [Pk_User_Address_IDUserAddress] PRIMARY KEY CLUSTERED 
(
	[IDUserAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/1/2018 11:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IDUser] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[MiddleName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](150) NULL,
	[CellPhone] [nvarchar](20) NULL,
	[HomePhone] [nvarchar](20) NULL,
	[Email] [nvarchar](1000) NULL,
	[AspNetUserId] [nvarchar](128) NULL,
	[IsActive] [bit] NULL,
	[Deleted] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[IDUserCreated] [int] NULL,
	[DateUpdated] [datetime] NULL,
	[IDUserUpdated] [int] NULL,
 CONSTRAINT [Pk_Users_IDUser] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Index [Idx_Restaurant_Address_IDAddress]    Script Date: 8/1/2018 11:10:52 PM ******/
CREATE NONCLUSTERED INDEX [Idx_Restaurant_Address_IDAddress] ON [dbo].[Restaurant_Address]
(
	[IDAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Idx_Restaurant_Address_IDRestaurant]    Script Date: 8/1/2018 11:10:52 PM ******/
CREATE NONCLUSTERED INDEX [Idx_Restaurant_Address_IDRestaurant] ON [dbo].[Restaurant_Address]
(
	[IDRestaurant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Idx_Reviews_IDUser]    Script Date: 8/1/2018 11:10:52 PM ******/
CREATE NONCLUSTERED INDEX [Idx_Reviews_IDUser] ON [dbo].[Reviews]
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Idx_User_Address_IDAddress]    Script Date: 8/1/2018 11:10:52 PM ******/
CREATE NONCLUSTERED INDEX [Idx_User_Address_IDAddress] ON [dbo].[User_Address]
(
	[IDAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Idx_User_Address_IDUser]    Script Date: 8/1/2018 11:10:52 PM ******/
CREATE NONCLUSTERED INDEX [Idx_User_Address_IDUser] ON [dbo].[User_Address]
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
ALTER TABLE [dbo].[Restaurant] ADD  CONSTRAINT [defo_Restaurant_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Restaurant] ADD  CONSTRAINT [defo_Restaurant_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [defo_Users_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [defo_Users_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Restaurant_Address]  WITH CHECK ADD  CONSTRAINT [fk_restaurant_address] FOREIGN KEY([IDRestaurant])
REFERENCES [dbo].[Restaurant] ([IDRestaurant])
GO
ALTER TABLE [dbo].[Restaurant_Address] CHECK CONSTRAINT [fk_restaurant_address]
GO
ALTER TABLE [dbo].[Restaurant_Address]  WITH CHECK ADD  CONSTRAINT [fk_restaurant_address_address] FOREIGN KEY([IDAddress])
REFERENCES [dbo].[Address] ([IDAddress])
GO
ALTER TABLE [dbo].[Restaurant_Address] CHECK CONSTRAINT [fk_restaurant_address_address]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [fk_reviews_users] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([IDUser])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [fk_reviews_users]
GO
ALTER TABLE [dbo].[User_Address]  WITH CHECK ADD  CONSTRAINT [fk_user_address_address] FOREIGN KEY([IDAddress])
REFERENCES [dbo].[Address] ([IDAddress])
GO
ALTER TABLE [dbo].[User_Address] CHECK CONSTRAINT [fk_user_address_address]
GO
ALTER TABLE [dbo].[User_Address]  WITH CHECK ADD  CONSTRAINT [fk_user_address_users] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([IDUser])
GO
ALTER TABLE [dbo].[User_Address] CHECK CONSTRAINT [fk_user_address_users]
GO
USE [master]
GO
ALTER DATABASE [RestaurantReview] SET  READ_WRITE 
GO
