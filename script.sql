USE [master]
GO
/****** Object:  Database [Coffee]    Script Date: 7/24/2023 3:01:29 PM ******/
CREATE DATABASE [Coffee]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Coffee', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Data\Coffee.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Coffee_log', FILENAME = N'L:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Data\Coffee_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Coffee] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Coffee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Coffee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Coffee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Coffee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Coffee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Coffee] SET ARITHABORT OFF 
GO
ALTER DATABASE [Coffee] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Coffee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Coffee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Coffee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Coffee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Coffee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Coffee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Coffee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Coffee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Coffee] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Coffee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Coffee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Coffee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Coffee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Coffee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Coffee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Coffee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Coffee] SET RECOVERY FULL 
GO
ALTER DATABASE [Coffee] SET  MULTI_USER 
GO
ALTER DATABASE [Coffee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Coffee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Coffee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Coffee] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Coffee] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Coffee] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Coffee', N'ON'
GO
ALTER DATABASE [Coffee] SET QUERY_STORE = ON
GO
ALTER DATABASE [Coffee] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Coffee]
GO
/****** Object:  User [NYHOMES\NChilka]    Script Date: 7/24/2023 3:01:29 PM ******/
CREATE USER [NYHOMES\NChilka] FOR LOGIN [NYHOMES\NChilka] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [NYHOMES\NChilka]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NYHOMES\NChilka]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [NYHOMES\NChilka]
GO
/****** Object:  Table [dbo].[cart_item]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[session_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[modified_at] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedUserName] [varchar](50) NOT NULL,
	[ModifiedUserName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_cart_item] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_item_backup]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_item_backup](
	[backup_id] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NOT NULL,
	[session_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[modified_at] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedUserName] [varchar](50) NOT NULL,
	[ModifiedUserName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_cart_item_backup] PRIMARY KEY CLUSTERED 
(
	[backup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[Error_Message] [varchar](500) NULL,
	[created_at] [datetime] NULL,
	[AddedUserName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[total] [float] NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[AddedUserName] [varchar](50) NOT NULL,
	[ModifiedUserName] [varchar](50) NOT NULL,
	[payment_id] [int] NOT NULL,
 CONSTRAINT [PK_order_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details_backup]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details_backup](
	[backup_id] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[total] [float] NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[AddedUserName] [varchar](50) NOT NULL,
	[ModifiedUserName] [varchar](50) NOT NULL,
	[payment_id] [int] NOT NULL,
 CONSTRAINT [PK_order_details_backup] PRIMARY KEY CLUSTERED 
(
	[backup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_items]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_items](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[AddedUserName] [varchar](50) NOT NULL,
	[ModifiedUserName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_order_items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_items_backup]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_items_backup](
	[backup_id] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[AddedUserName] [varchar](50) NOT NULL,
	[ModifiedUserName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_order_items_backup] PRIMARY KEY CLUSTERED 
(
	[backup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_details]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[amount] [float] NOT NULL,
	[provider] [varchar](50) NULL,
	[status] [varchar](50) NULL,
	[created_at] [datetime] NOT NULL,
	[modified_at] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedUserName] [varchar](50) NOT NULL,
	[ModifiedUserName] [varchar](50) NOT NULL,
	[NameonCard] [varchar](100) NULL,
	[CardNumber] [varchar](50) NULL,
	[ExpiryDateMMYY] [varchar](10) NULL,
	[SecurityCode] [varchar](25) NULL,
	[zipCode] [varchar](25) NULL,
	[ShippingUserContactAddress] [bit] NOT NULL,
	[ShippingAddress] [varchar](600) NOT NULL,
 CONSTRAINT [PK_payment_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_details_backup]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_details_backup](
	[backup_id] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[amount] [float] NOT NULL,
	[provider] [varchar](50) NULL,
	[status] [varchar](50) NULL,
	[created_at] [datetime] NOT NULL,
	[modified_at] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedUserName] [varchar](50) NOT NULL,
	[ModifiedUserName] [varchar](50) NOT NULL,
	[NameonCard] [varchar](100) NULL,
	[CardNumber] [varchar](50) NULL,
	[ExpiryDateMMYY] [varchar](10) NULL,
	[SecurityCode] [varchar](25) NULL,
	[zipCode] [varchar](25) NULL,
	[ShippingUserContactAddress] [bit] NOT NULL,
	[ShippingAddress] [varchar](600) NOT NULL,
 CONSTRAINT [PK_payment_details_backup] PRIMARY KEY CLUSTERED 
(
	[backup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[SKU] [varchar](50) NULL,
	[category] [varchar](50) NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[amount] [float] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedUserName] [varchar](50) NOT NULL,
	[ModifiedUserName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_backup]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_backup](
	[backup_id] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[SKU] [varchar](50) NULL,
	[category] [varchar](50) NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[amount] [float] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedUserName] [varchar](50) NOT NULL,
	[ModifiedUserName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_product_backup] PRIMARY KEY CLUSTERED 
(
	[backup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shopping_session]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopping_session](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[total] [float] NULL,
	[created_at] [datetime] NOT NULL,
	[modified_at] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedUserName] [varchar](50) NOT NULL,
	[ModifiedUserName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_shopping_session] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shopping_session_backup]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopping_session_backup](
	[backup_id] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[total] [float] NULL,
	[created_at] [datetime] NOT NULL,
	[modified_at] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedUserName] [varchar](50) NOT NULL,
	[ModifiedUserName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_shopping_session_backup] PRIMARY KEY CLUSTERED 
(
	[backup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](110) NOT NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[address] [varchar](100) NULL,
	[telephone] [varchar](50) NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[AddedUserName] [varchar](50) NOT NULL,
	[ModifiedUserName] [varchar](50) NOT NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](2) NULL,
	[ZipCode] [varchar](10) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_backup]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_backup](
	[backup_id] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](110) NOT NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[address] [varchar](100) NULL,
	[telephone] [varchar](50) NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[AddedUserName] [varchar](50) NOT NULL,
	[ModifiedUserName] [varchar](50) NOT NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](2) NULL,
	[ZipCode] [varchar](10) NULL,
 CONSTRAINT [PK_user_backup] PRIMARY KEY CLUSTERED 
(
	[backup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cart_item] ADD  CONSTRAINT [DF_cart_item_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[cart_item] ADD  CONSTRAINT [DF_cart_item_modified_at]  DEFAULT (getdate()) FOR [modified_at]
GO
ALTER TABLE [dbo].[Log] ADD  CONSTRAINT [DF_Log_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[order_details] ADD  CONSTRAINT [DF_order_details_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[order_details] ADD  CONSTRAINT [DF_order_details_modified_at]  DEFAULT (getdate()) FOR [modified_at]
GO
ALTER TABLE [dbo].[payment_details] ADD  CONSTRAINT [DF_payment_details_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[payment_details] ADD  CONSTRAINT [DF_payment_details_modified_at]  DEFAULT (getdate()) FOR [modified_at]
GO
ALTER TABLE [dbo].[payment_details] ADD  DEFAULT ((1)) FOR [ShippingUserContactAddress]
GO
ALTER TABLE [dbo].[payment_details] ADD  DEFAULT (' ') FOR [ShippingAddress]
GO
ALTER TABLE [dbo].[payment_details_backup] ADD  DEFAULT ((1)) FOR [ShippingUserContactAddress]
GO
ALTER TABLE [dbo].[payment_details_backup] ADD  DEFAULT (' ') FOR [ShippingAddress]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_modified_at]  DEFAULT (getdate()) FOR [modified_at]
GO
ALTER TABLE [dbo].[shopping_session] ADD  CONSTRAINT [DF_shopping_sessions_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[shopping_session] ADD  CONSTRAINT [DF_shopping_session_modified_at]  DEFAULT (getdate()) FOR [modified_at]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF_user_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF_user_modified_at]  DEFAULT (getdate()) FOR [modified_at]
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD  CONSTRAINT [FK_cart_item_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[cart_item] CHECK CONSTRAINT [FK_cart_item_product]
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD  CONSTRAINT [FK_cart_item_shopping_session] FOREIGN KEY([session_id])
REFERENCES [dbo].[shopping_session] ([id])
GO
ALTER TABLE [dbo].[cart_item] CHECK CONSTRAINT [FK_cart_item_shopping_session]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK_order_details_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK_order_details_User]
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD  CONSTRAINT [FK_order_items_order_details] FOREIGN KEY([order_id])
REFERENCES [dbo].[order_details] ([id])
GO
ALTER TABLE [dbo].[order_items] CHECK CONSTRAINT [FK_order_items_order_details]
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD  CONSTRAINT [FK_order_items_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[order_items] CHECK CONSTRAINT [FK_order_items_product]
GO
ALTER TABLE [dbo].[shopping_session]  WITH CHECK ADD  CONSTRAINT [FK_shopping_session_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[shopping_session] CHECK CONSTRAINT [FK_shopping_session_user]
GO
/****** Object:  StoredProcedure [dbo].[usp_addCartItem]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/26/2023
-- Description:	Insert data into cart_item table
-- =============================================
CREATE PROCEDURE [dbo].[usp_addCartItem]
	@session_id int,
	@product_id int,
	@quantity int,
	@created_by varchar(50),
	@created_at datetime,
	@IsActive bit 
AS
	Declare	@RC int = 0
BEGIN
SET NOCOUNT ON;
	BEGIN TRY 
	BEGIN TRANSACTION 
		INSERT INTO [Coffee].[dbo].[cart_item]
		([session_id]
		,[product_id]
		,[quantity]
		,[created_at]
		,[modified_at]
		,[AddedUserName]
		,[ModifiedUserName]
		,[IsActive])
		VALUES
		(@session_id,
		@product_id,
		@quantity,
		@created_at,
		@created_at,
		@created_by,
		@created_by,
		@IsActive);
		SELECT @RC = @RC + @@ROWCOUNT;
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK 
	END CATCH
	Select @RC;
END


GO
/****** Object:  StoredProcedure [dbo].[usp_AddLog]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 06/06/2023
-- Description:	Insert data into Log table
-- =============================================
CREATE PROCEDURE [dbo].[usp_AddLog] 
	@username varchar(50),
	@Error_Message varchar(500),
	@AddedUserName varchar(50)
AS
	Declare	@RC int = 0
BEGIN
SET NOCOUNT ON;
	BEGIN TRY 
	BEGIN TRANSACTION 
		INSERT INTO [dbo].[Log]
		([username]
		,[Error_Message]
		,[AddedUserName])
		 VALUES
		(@username
		,@Error_Message
		,@AddedUserName);
		SELECT @RC = @RC + @@ROWCOUNT;
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK 
	END CATCH
	Select @RC;
END


GO
/****** Object:  StoredProcedure [dbo].[usp_addOrder_details]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	Insert data into order_details table with zero as payment_id, and grandtotal. 
--- First step is to create an order_details row with payment_id = 0
--- Second step is to Insert data into the order_items for the generated order_id.
--- Third step is to create a new row in the payment_details table
-- =============================================
CREATE PROCEDURE [dbo].[usp_addOrder_details]
@user_id int ,
@grandtotal float ,
@AddedUserName varchar(50)
AS
	Declare	@orderID int = 0
BEGIN
SET NOCOUNT ON;
	BEGIN TRY 
	BEGIN TRANSACTION 
	INSERT INTO [dbo].[order_details]
           ([user_id]
           ,[total]
           ,[payment_id]
           ,[created_at]
           ,[modified_at]
           ,[IsActive]
           ,[AddedUserName]
           ,[ModifiedUserName])
     VALUES
           (@user_id,
			@grandtotal,
			0,
			getdate(),
			getdate(),
			1,
			@AddedUserName ,
			@AddedUserName);
		SELECT @orderID =@@IDENTITY;
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK 
	END CATCH
	Select @orderID;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_addOrder_items]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	Insert data into order_items table
--- Second step is to Insert data into the order_items for the generated order_id.
-- =============================================
CREATE PROCEDURE [dbo].[usp_addOrder_items]
@order_id int ,
@product_id int,
@AddedUserName varchar(50) 
AS
	Declare	@RC int = 0
BEGIN
SET NOCOUNT ON;
	BEGIN TRY 
	BEGIN TRANSACTION 
	INSERT INTO [dbo].[order_items]
           ([order_id]
           ,[product_id]
           ,[created_at]
           ,[modified_at]
           ,[IsActive]
           ,[AddedUserName]
           ,[ModifiedUserName])
     VALUES
           (@order_id
           ,@product_id
           ,GETDATE()
           ,GETDATE()
           ,1
           ,@AddedUserName
           ,@AddedUserName);
		SELECT @RC = @RC + @@ROWCOUNT;
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK 
	END CATCH
	Select @RC;
END


GO
/****** Object:  StoredProcedure [dbo].[usp_addpayment_details]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	Insert data into payment_details table.
--- Third step is to create a new row in the payment_details table
-- =============================================
CREATE PROCEDURE [dbo].[usp_addpayment_details]
@OrderID int,
@GrandAmount float,
@provider varchar(50),
@status varchar(50),
@NameonCard varchar(100),
@CardNumber varchar(50),
@ExpiryDateMMYY varchar(10),
@SecurityCode varchar(25),
@zipCode varchar(25),
@ShippingUserContactAddress bit,
@ShippingAddress varchar(600),
@AddedUserName varchar(50)
AS
	Declare @NewPaymentID int = 0;
BEGIN
SET NOCOUNT ON;
	BEGIN TRY 
	BEGIN TRANSACTION 
	INSERT INTO [dbo].[payment_details]
           ([order_id]
           ,[amount]
           ,[provider]
           ,[status]
           ,[created_at]
           ,[modified_at]
           ,[IsActive]
           ,[AddedUserName]
           ,[ModifiedUserName]
		   ,NameonCard
       	   ,CardNumber
		   ,ExpiryDateMMYY
		   ,SecurityCode
		   ,zipCode
		    ,[ShippingUserContactAddress]
		   ,[ShippingAddress])
     VALUES
           (@OrderID
           ,@GrandAmount
           ,@provider
           ,@status
           ,GETDATE()
           ,GETDATE()
           ,1
           ,@AddedUserName
           ,@AddedUserName
		   ,@NameonCard
		   ,@CardNumber
		   ,@ExpiryDateMMYY
		   ,@SecurityCode
		   ,@zipCode
		   ,@ShippingUserContactAddress
		   ,@ShippingAddress);
		SELECT @NewPaymentID = @@IDENTITY;

		INSERT INTO order_details_backup
		SELECT * FROM order_details 
		WHERE id = @OrderID and IsActive = 1;

		Update order_details
		set payment_id = @NewPaymentID,
			modified_at = getdate(),
			ModifiedUserName = @AddedUserName
		WHERE
			IsActive = 1 and
			id = @OrderID;
		
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK 
	END CATCH
	Select @NewPaymentID;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_addshopping_session]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	Insert data into shopping_session table
-- =============================================
CREATE PROCEDURE [dbo].[usp_addshopping_session]
@user_id int,
@total float,
@AddedUserName varchar(50)
AS
	Declare	@LASTID int = 0
BEGIN
SET NOCOUNT ON;
	BEGIN TRY 
	BEGIN TRANSACTION 

	INSERT INTO [dbo].[shopping_session]
           ([user_id]
           ,[total]
           ,[created_at]
           ,[modified_at]
           ,[IsActive]
           ,[AddedUserName]
           ,[ModifiedUserName])
     VALUES
           (@user_id
           ,@total
           ,GETDATE()
           ,GETDATE()
           ,1
           ,@AddedUserName
           ,@AddedUserName)
		SET @LASTID = SCOPE_IDENTITY()
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK 
	END CATCH
	Select @LASTID;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AddUser]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	Insert data into user table
-- =============================================
CREATE PROCEDURE [dbo].[usp_AddUser] 
	@username varchar(50),
	@password varchar(110),
	@first_name varchar(50),
	@last_name varchar(50),
	@address varchar(100),
	@city varchar(100),
	@state varchar(2),
	@ZipCode varchar(10),
	@telephone varchar(50),
	@AddedUserName varchar(50),
	@ModifiedUserName varchar(50)
AS
	Declare	@RC int = 0
BEGIN
SET NOCOUNT ON;
	BEGIN TRY 
	BEGIN TRANSACTION 

	INSERT INTO [dbo].[user]
           ([username]
           ,[password]
           ,[first_name]
           ,[last_name]
           ,[address]
		   ,[city]
		   ,[state]
		   ,[ZipCode]
           ,[telephone]
           ,[created_at]
           ,[modified_at]
           ,[IsActive]
           ,[AddedUserName]
           ,[ModifiedUserName])
     VALUES
           (@username
           ,@password
           ,@first_name
           ,@last_name
           ,@address
		   ,@city
		   ,@state
		   ,@ZipCode
           ,@telephone
           ,GETDATE()
           ,GETDATE()
           ,1
           ,@AddedUserName
           ,@ModifiedUserName)
		SELECT @RC = @RC + @@ROWCOUNT;
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK 
	END CATCH
	Select @RC;
END


GO
/****** Object:  StoredProcedure [dbo].[usp_deleteCartItem]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/26/2023
-- Description:	Update data in the cart_item table for given id and set IsActive = 0
-- =============================================
CREATE PROCEDURE [dbo].[usp_deleteCartItem]
	@cartItemid int,
	@modified_by varchar(50)
AS
	Declare	@RC int = 0
BEGIN
SET NOCOUNT ON;
	BEGIN TRY 
		BEGIN TRANSACTION 
		INSERT INTO [Coffee].[dbo].[cart_item_backup]
		([id],
		 [session_id]
		,[product_id]
		,[quantity]
		,[created_at]
		,[modified_at]
		,[IsActive]
		,AddedUserName
		,ModifiedUserName)
		SELECT * FROM cart_item where [id] = @cartItemid and IsActive = 1;
		SELECT @RC = @RC + @@ROWCOUNT;

		UPDATE [Coffee].[dbo].[cart_item]
		SET IsActive = 0,
		modified_at = getdate(),
		modifiedUsername = @modified_by
		where 
			[id] = @cartItemid and 
			IsActive = 1;
		SELECT @RC = @RC + @@ROWCOUNT;

		COMMIT 
	END TRY
	BEGIN CATCH
		ROLLBACK 
	END CATCH
	Select @RC;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_deleteOrder_details]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	Delete data in order_details table for given order_details id
-- =============================================
CREATE PROCEDURE [dbo].[usp_deleteOrder_details]
@id int,
@ModifiedUserName varchar(50)
AS
	Declare	@RC int = 0
BEGIN
SET NOCOUNT ON;
	BEGIN TRY 
	BEGIN TRANSACTION 
	INSERT INTO [dbo].[order_details_backup]
           ([id]
		   ,[user_id]
           ,[total]
           ,[payment_id]
           ,[created_at]
           ,[modified_at]
           ,[IsActive]
           ,[AddedUserName]
           ,[ModifiedUserName])
     SELECT 
			[id]
		   ,[user_id]
           ,[total]
           ,[payment_id]
           ,[created_at]
           ,[modified_at]
           ,[IsActive]
           ,[AddedUserName]
           ,[ModifiedUserName]
	 FROM dbo.order_details where [id] = @id and isActive = 1;
	 SELECT @RC = @RC + @@ROWCOUNT;

	UPDATE [dbo].[order_details]
	   SET [IsActive] = 0
		  ,[modified_at] = GETDATE()
		  ,[ModifiedUserName] = @ModifiedUserName
	 where 
		[id] = @id and isActive = 1;
	SELECT @RC = @RC + @@ROWCOUNT;
	COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK 
	END CATCH
	Select @RC;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_deleteOrder_items]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	Delete data in the order_items table for given @order_id and set isActive = 0
-- =============================================
CREATE PROCEDURE [dbo].[usp_deleteOrder_items]
	@order_id int,
	@ModifiedUserName varchar(50)
AS
	Declare	@RC int = 0
BEGIN
SET NOCOUNT ON;
	BEGIN TRY 
		BEGIN TRANSACTION 
		INSERT INTO [dbo].[order_items_backup]
           ([id]
		   ,[order_id]
           ,[product_id]
           ,[created_at]
           ,[modified_at]
           ,[IsActive]
           ,[AddedUserName]
           ,[ModifiedUserName])
		SELECT * from order_items where IsActive = 1 and [order_id] = @order_id; 
		SELECT @RC = @RC + @@ROWCOUNT;
	
		UPDATE [dbo].[order_items]
	    SET [IsActive] = 0
		  ,[modified_at] = Getdate()
		  ,[ModifiedUserName] = @ModifiedUserName
		WHERE
			[order_id]= @order_id and IsActive = 1;
		SELECT @RC = @RC + @@ROWCOUNT;

		COMMIT 
	END TRY
	BEGIN CATCH
		ROLLBACK 
	END CATCH
	Select @RC;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_deletePayment_details]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	Delete data in the payment_details table for given id
-- =============================================
CREATE PROCEDURE [dbo].[usp_deletePayment_details]
	@id int,
	@ModifiedUserName varchar(50)
AS
	Declare	@RC int = 0
BEGIN
SET NOCOUNT ON;
	BEGIN TRY 
		BEGIN TRANSACTION 
		INSERT INTO [dbo].[payment_details_backup]
           ([id]
		   ,[order_id]
           ,[amount]
           ,[provider]
           ,[status]
		   ,NameonCard
       	   ,CardNumber
		   ,ExpiryDateMMYY
		   ,SecurityCode
		   ,zipCode
           ,[created_at]
           ,[modified_at]
           ,[IsActive]
           ,[AddedUserName]
           ,[ModifiedUserName])
		SELECT * from payment_details where IsActive = 1 and [id] = @id; 
		SELECT @RC = @RC + @@ROWCOUNT;

		UPDATE [dbo].[payment_details]
		SET	   [IsActive] = 0
			  ,[modified_at] = GETDATE()
			  ,[ModifiedUserName] = @ModifiedUserName
		WHERE
			[id]= @id and IsActive = 1;
		SELECT @RC = @RC + @@ROWCOUNT;
		COMMIT 
	END TRY
	BEGIN CATCH
		ROLLBACK 
	END CATCH
	Select @RC;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeletePayment_Order_Cart]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 06/27/2023
-- Description:	Delete data from cart_item SQL table for given sessionid. 
--              Delete data in the payment_details table for given paymentid.
-- =============================================
CREATE PROCEDURE [dbo].[usp_DeletePayment_Order_Cart]
	@paymentid int,
	@sessionid int,
	@ModifiedUserName varchar(50)
AS
	Declare @orderID int = 0;
	Declare	@RC int = 0;
	Declare @RC1 int = 0;
	Declare @RC2 int = 0;

BEGIN
SET NOCOUNT ON;
	BEGIN TRY 
		BEGIN TRANSACTION 
		--Delete Cart Items for session_id
		INSERT INTO [dbo].[cart_item_backup]
           ([id]
           ,[session_id]
           ,[product_id]
           ,[quantity]
           ,[created_at]
           ,[modified_at]
           ,[IsActive]
           ,[AddedUserName]
           ,[ModifiedUserName])
		SELECT * FROM cart_item where [session_id] = @sessionid and IsActive = 1;
		SELECT @RC = @RC + @@ROWCOUNT;

		UPDATE [Coffee].[dbo].[cart_item]
		SET IsActive = 0,
		modified_at = getdate(),
		modifiedUsername = @ModifiedUserName
		where 
			[session_id] = @sessionid  and 
			IsActive = 1;
		SELECT @RC = @RC + @@ROWCOUNT;

		SELECT 
			@orderID=order_id 
		From 
			payment_details 
		Where 
			IsActive = 1 and 
			[id] = @paymentid; 

		--Delete Order Items for OrderID
		EXECUTE @RC2 = [dbo].[usp_deleteOrder_items] 
		   @orderID
		  ,@ModifiedUserName;
		   SELECT @RC = @RC + @RC2;

		--Delete Order details for OrderID
		EXECUTE @RC1 = [dbo].[usp_deleteOrder_details] 
		   @orderID
		  ,@ModifiedUserName;
		  SELECT @RC = @RC + @RC1;

		-- Delete payment details for paymentID
		INSERT INTO [dbo].[payment_details_backup]
           ([id]
           ,[order_id]
           ,[amount]
           ,[provider]
           ,[status]
           ,[created_at]
           ,[modified_at]
           ,[IsActive]
           ,[AddedUserName]
           ,[ModifiedUserName]
           ,[NameonCard]
           ,[CardNumber]
           ,[ExpiryDateMMYY]
           ,[SecurityCode]
           ,[zipCode]
           ,[ShippingUserContactAddress]
           ,[ShippingAddress])
		SELECT * from payment_details where IsActive = 1 and [id] = @paymentid; 
		SELECT @RC = @RC + @@ROWCOUNT;

		UPDATE [dbo].[payment_details]
		SET	   [IsActive] = 0
			  ,[modified_at] = GETDATE()
			  ,[ModifiedUserName] = @ModifiedUserName
		WHERE
			[id]= @paymentid and IsActive = 1;
		SELECT @RC = @RC + @@ROWCOUNT;
		COMMIT 
	END TRY
	BEGIN CATCH
		ROLLBACK 
	END CATCH
	Select @RC;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_deleteShopping_session]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	delete data in shopping_session table for given @id
-- =============================================
CREATE PROCEDURE [dbo].[usp_deleteShopping_session]
@id int,
@ModifiedUserName varchar(50)
AS
	Declare	@RC int = 0
BEGIN
SET NOCOUNT ON;
	BEGIN TRY 
	BEGIN TRANSACTION 
		INSERT INTO [dbo].[shopping_session_backup]
			   ([id]
			   ,[user_id]
			   ,[total]
			   ,[created_at]
			   ,[modified_at]
			   ,[IsActive]
			   ,[AddedUserName]
			   ,[ModifiedUserName])
		 SELECT * FROM [dbo].[shopping_session] where [id] = @id and IsActive = 1;
		 SELECT @RC = @RC + @@ROWCOUNT;

		UPDATE [dbo].[shopping_session]
		SET [IsActive] = 0
		  ,[modified_at] = GETDATE()
		  ,[ModifiedUserName] = @ModifiedUserName
		 WHERE [id] = @id and IsActive = 1;
		  SELECT @RC = @RC + @@ROWCOUNT;
	COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK 
	END CATCH
	Select @RC;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_deleteUser]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	delete data from user table for given @id
-- =============================================
CREATE PROCEDURE [dbo].[usp_deleteUser] 
	@id int,
	@username varchar(50),
	@password varchar(110),
	@first_name varchar(50),
	@last_name varchar(50),
	@address varchar(200),
	@telephone varchar(50),
	@ModifiedUserName varchar(50)
AS
	Declare	@RC int = 0
BEGIN
SET NOCOUNT ON;
	BEGIN TRY 
	BEGIN TRANSACTION 

		INSERT INTO [dbo].[user_backup]
			   ([id]
			   ,[username]
			   ,[password]
			   ,[first_name]
			   ,[last_name]
			   ,[address]
			   ,[telephone]
			   ,[created_at]
			   ,[modified_at]
			   ,[IsActive]
			   ,[AddedUserName]
			   ,[ModifiedUserName])
		 SELECT * FROM [dbo].[user] where IsActive = 1 and [id] = @id;
		SELECT @RC = @RC + @@ROWCOUNT;

		UPDATE [dbo].[user]
		   SET [IsActive] = 0
			  ,[modified_at] = GETDATE()
			  ,[ModifiedUserName] = @ModifiedUserName
		 where IsActive = 1 and [id] = @id;
		SELECT @RC = @RC + @@ROWCOUNT;
 
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK 
	END CATCH
	Select @RC;
END


GO
/****** Object:  StoredProcedure [dbo].[usp_SelectCartItem]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	Select data from cart_item table
-- =============================================
CREATE PROCEDURE [dbo].[usp_SelectCartItem]
AS
BEGIN
SET NOCOUNT ON;
SELECT [id]
      ,[session_id]
      ,[product_id]
      ,[quantity]
      ,[created_at]
      ,[modified_at]
      ,[IsActive]
      ,[AddedUserName]
      ,[ModifiedUserName]
  FROM [dbo].[cart_item]
  WHERE IsActive = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SelectCartItem_BySessionID]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 06/09/2023
-- Description:	Select data from cart_item table by session_id
------------------ Modifications List -------------------
---- SNO ----- Date ---------- Modified By -------------- Description ----------
---- 1         07/24/2023      Niveditha Chilka           convert TotalAmount to float datatype
-- =============================================
CREATE PROCEDURE [dbo].[usp_SelectCartItem_BySessionID]
@sessionID int
AS
BEGIN
SET NOCOUNT ON;
SELECT 
	ci.[id] as CartItemID
   ,ci.[session_id]
   ,ci.[product_id]
   ,p.[name]
   ,p.[description]
   ,p.category
   ,p.SKU
   ,p.[amount]
   ,ci.[quantity]
    ,concat('$', cast((ci.[quantity] * p.amount) as float)) as TotalAmount
FROM 
	[dbo].[cart_item] as ci inner join 
	[dbo].[product] as p on ci.product_id = p.id
WHERE 
	ci.IsActive = 1 and 
	p.IsActive = 1 and
	ci.session_id = @sessionID;		
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SelectCartItemGrandTotal_BySessionID]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 06/13/2023
-- Description:	Select grand total for cart_items by session_id
-- =============================================
CREATE PROCEDURE [dbo].[usp_SelectCartItemGrandTotal_BySessionID]
@sessionID int
AS
BEGIN
SET NOCOUNT ON;
SELECT
	cast(sum((ci.[quantity] * p.amount)) as decimal) as  Grand_Amount
FROM 
	[dbo].[cart_item] as ci inner join 
	[dbo].[product] as p on ci.product_id = p.id
WHERE 
	ci.IsActive = 1 and 
	p.IsActive = 1 and 
	session_id = @sessionID;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SelectOrder_details]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	Select data from order_details table
-- =============================================
CREATE PROCEDURE [dbo].[usp_SelectOrder_details]
AS
BEGIN
SET NOCOUNT ON;
SELECT [id]
      ,[user_id]
      ,[total]
      ,[payment_id]
      ,[created_at]
      ,[modified_at]
      ,[IsActive]
      ,[AddedUserName]
      ,[ModifiedUserName]
  FROM [dbo].[order_details]
  WHERE IsActive = 1;
END



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectOrder_items]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	Select data from order_items table
-- =============================================
CREATE PROCEDURE [dbo].[usp_SelectOrder_items]
AS
BEGIN
SET NOCOUNT ON;
SELECT [id]
      ,[order_id]
      ,[product_id]
      ,[created_at]
      ,[modified_at]
      ,[IsActive]
      ,[AddedUserName]
      ,[ModifiedUserName]
  FROM [dbo].[order_items]
  WHERE IsActive = 1;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_SelectPayment_details]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	Select data from payment_details table
-- =============================================
CREATE PROCEDURE [dbo].[usp_SelectPayment_details]
AS
BEGIN
SET NOCOUNT ON;
SELECT [id]
      ,[order_id]
      ,[amount]
      ,[provider]
      ,[status]
	  ,NameonCard
      ,CardNumber
	  ,ExpiryDateMMYY
	  ,SecurityCode
	  ,zipCode
	  ,[ShippingUserContactAddress]
      ,[ShippingAddress]
      ,[created_at]
      ,[modified_at]
      ,[IsActive]
      ,[AddedUserName]
      ,[ModifiedUserName]
  FROM [dbo].[payment_details]
  WHERE IsActive = 1;
END


GO
/****** Object:  StoredProcedure [dbo].[usp_SelectPayment_details_ById]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 06/20/2023
-- Description:	Select data from payment_details table
-- =============================================
CREATE PROCEDURE [dbo].[usp_SelectPayment_details_ById]
(@id int)
AS
BEGIN
SET NOCOUNT ON;
SELECT [id]
      ,[order_id]
      ,[amount]
      ,[provider]
      ,[status]
	  ,NameonCard
      ,CardNumber
	  ,ExpiryDateMMYY
	  ,SecurityCode
	  ,zipCode
	  ,[ShippingUserContactAddress]
      ,[ShippingAddress]
      ,[created_at]
      ,[modified_at]
      ,[IsActive]
      ,[AddedUserName]
      ,[ModifiedUserName]
  FROM 
	[dbo].[payment_details]
  WHERE 
	IsActive = 1 and
	id = @id;
END


GO
/****** Object:  StoredProcedure [dbo].[usp_SelectProduct]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	Select data from product table
-- =============================================
CREATE PROCEDURE [dbo].[usp_SelectProduct]
AS
BEGIN
SET NOCOUNT ON;

SELECT [id]
      ,[name]
      ,[description]
      ,[SKU]
      ,[category]
      ,[created_at]
      ,[modified_at]
      ,[IsActive]
      ,[AddedUserName]
      ,[ModifiedUserName]
  FROM [dbo].[product]
  WHERE IsActive = 1;
END


GO
/****** Object:  StoredProcedure [dbo].[usp_SelectProduct_Quanity_TotalAmount]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 07/17/2023
-- Description:	Select data for list of products, total amounts, users creating orders, and orders created
------------------------ Modifications List ------------------------------------------
--- SNO ----- Modified On --------- Modified By -------------- Description --------
--- 1           07/24/2023          Niveditha Chilka           Modified SQL statement
-- =============================================
CREATE PROCEDURE [dbo].[usp_SelectProduct_Quanity_TotalAmount]
AS
BEGIN
SET NOCOUNT ON;
--SELECT distinct
--		p.[name] as ProductName
--		,sum(cis.quantity) as TotalQuantity
--		,sum(od.total) as TotalAmount
--		,(cis.first_name + ' ' + cis.last_name) as FullName
--		,FORMAT (pd.created_at, 'MM/dd/yyyy') as orderCreated
--	   ,LTRIM(RTRIM(ISNULL(pd.shippingAddress, ''))) as ShippingAddress
	  
--FROM [Coffee].[dbo].[payment_details] as pd 
--	inner join order_details as od on  pd.id = od.payment_id
--	inner join order_items as oi on oi.order_id = od.id
--	inner join product as p on oi.product_id = p.id 
--	inner join (  select distinct  ci.quantity, 
--	 -- p.description, 
--	  FORMAT (ss.created_at, 'MM/dd/yyyy') created_at,
--	  u.first_name, u.last_name
--	  from cart_item as ci inner join product as p on ci.product_id = p.id
--	  inner join shopping_session as ss on ss.id = ci.session_id 
--	  INNER JOIN [user] as u on u.id = ss.user_id
--	  where  ss.IsActive = 1 and u.IsActive = 1) as cis on cis.created_at = FORMAT (pd.created_at, 'MM/dd/yyyy')
--GROUP BY 
-- p.[name]
--	,(cis.first_name + ' ' + cis.last_name)
--	,FORMAT (pd.created_at, 'MM/dd/yyyy')
--	,LTRIM(RTRIM(ISNULL(pd.shippingAddress, '')))
--order by 
--p.[name] desc,
--FORMAT (pd.created_at, 'MM/dd/yyyy') desc;

SELECT distinct
	p.[name] as ProductName
	,ci.quantity
	,(ci.quantity * p.amount) as total
	,sum(ci.quantity) as TotalQuantity
	,sum((ci.quantity * p.amount)) as TotalAmount
	,(u.first_name + ' ' +u.last_name) as FullName
	,FORMAT (pd.created_at, 'MM/dd/yyyy') as orderCreated
	,LTRIM(RTRIM(ISNULL(pd.shippingAddress, ''))) as ShippingAddress
FROM [Coffee].[dbo].[payment_details] as pd 
	inner join order_details as od on  pd.id = od.payment_id
	inner join order_items as oi on oi.order_id = od.id
	inner join product as p on oi.product_id = p.id 
	inner join cart_item as ci on ci.product_id = p.id 
	inner join shopping_session ss on ss.id = ci.session_id
	inner join  [user] as u on u.id = ss.[user_id]
WHERE
	ss.IsActive = 1 and 
	u.IsActive = 1
GROUP BY 
	p.[name]
	,ci.quantity
	,(ci.quantity * p.amount)
	,(u.first_name + ' ' +u.last_name)
	,FORMAT (pd.created_at, 'MM/dd/yyyy')
	,LTRIM(RTRIM(ISNULL(pd.shippingAddress, '')))
ORDER BY
	p.[name] desc,
	FORMAT (pd.created_at, 'MM/dd/yyyy') desc;
END


GO
/****** Object:  StoredProcedure [dbo].[usp_SelectUser]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	Select data from user table
-- =============================================
CREATE PROCEDURE [dbo].[usp_SelectUser]
AS
BEGIN
SET NOCOUNT ON;

SELECT [id]
      ,[username]
      ,[password]
      ,[first_name]
      ,[last_name]
      ,[address]
	  ,[city]
	  ,[state]
	  ,[ZipCode]
      ,[telephone]
      ,[created_at]
      ,[modified_at]
      ,[IsActive]
      ,[AddedUserName]
      ,[ModifiedUserName]
  FROM [dbo].[user]
  WHERE IsActive = 1;
END


GO
/****** Object:  StoredProcedure [dbo].[usp_SelectUser_Byid]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 06/21/2023
-- Description:	Select data from user table by UserID
-- =============================================
CREATE PROCEDURE [dbo].[usp_SelectUser_Byid]
	@id int
AS
BEGIN
SET NOCOUNT ON;

SELECT [id]
      ,[username]
      ,[password]
      ,[first_name]
      ,[last_name]
      ,[address]
	  ,[city]
	  ,[state]
	  ,[ZipCode]
      ,[telephone]
      ,[created_at]
      ,[modified_at]
      ,[IsActive]
      ,[AddedUserName]
      ,[ModifiedUserName]
  FROM 
	[dbo].[user]
  WHERE 
	IsActive = 1 and
	[id] = @id;
END


GO
/****** Object:  StoredProcedure [dbo].[usp_SelectUserValidYN]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/30/2023
-- Description:	Select data from user table for given @username and @password
-- =============================================
CREATE PROCEDURE [dbo].[usp_SelectUserValidYN]
	@username varchar(50),
	@password varchar(110)
AS
BEGIN
SET NOCOUNT ON;

SELECT [id]
      ,[username]
      ,[first_name]
      ,[last_name]
      ,[address]
      ,[telephone]
      ,[created_at]
      ,[modified_at]
      ,[IsActive]
      ,[AddedUserName]
      ,[ModifiedUserName]
  FROM 
	[dbo].[user]
  WHERE 
	IsActive = 1 and
	LTRIM(RTRIM(isnull([password],''))) = LTRIM(RTRIM(@password)) and
	LTRIM(RTRIM(isnull([username],''))) = LTRIM(RTRIM(@username));
END


GO
/****** Object:  StoredProcedure [dbo].[usp_shopping_session]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	Select data from shopping_session table
-- =============================================
CREATE PROCEDURE [dbo].[usp_shopping_session]
AS
BEGIN
SET NOCOUNT ON;

SELECT [id]
      ,[user_id]
      ,[total]
      ,[created_at]
      ,[modified_at]
      ,[IsActive]
      ,[AddedUserName]
      ,[ModifiedUserName]
  FROM [dbo].[shopping_session]
  WHERE IsActive = 1;
END


GO
/****** Object:  StoredProcedure [dbo].[usp_updateCartItem]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/26/2023
-- Description:	Update data in the cart_item table for given id
-- =============================================
CREATE PROCEDURE [dbo].[usp_updateCartItem]
	@cartitemid int,
	@quantity int,
	@modified_by varchar(50)
AS
	Declare	@RC int = 0
BEGIN
SET NOCOUNT ON;
	BEGIN TRY 
		BEGIN TRANSACTION 
		INSERT INTO [Coffee].[dbo].[cart_item_backup]
		([id],
		 [session_id]
		,[product_id]
		,[quantity]
		,[created_at]
		,[modified_at]
		,[IsActive]
		,AddedUserName
		,ModifiedUserName)
		SELECT 
			* 
		FROM 
			cart_item 
		where 
			[id] = @cartitemid and 
			IsActive = 1;
		SELECT @RC = @RC + @@ROWCOUNT;

		UPDATE [Coffee].[dbo].[cart_item]
		SET 
		quantity = @quantity,
		modified_at = getdate(),
		modifiedUsername = @modified_by
		where 
			[id] = @cartItemid and 
			IsActive = 1;
		SELECT @RC = @RC + @@ROWCOUNT;

		COMMIT 
	END TRY
	BEGIN CATCH
		ROLLBACK 
	END CATCH
	Select @RC;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_updateOrder_details]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	Update data in order_details table for given order_details id
-- =============================================
CREATE PROCEDURE [dbo].[usp_updateOrder_details]
@id int,
@user_id int ,
@total float ,
@payment_id int,
@ModifiedUserName varchar(50)
AS
	Declare	@RC int = 0
BEGIN
SET NOCOUNT ON;
	BEGIN TRY 
	BEGIN TRANSACTION 
	INSERT INTO [dbo].[order_details_backup]
           ([id]
		   ,[user_id]
           ,[total]
           ,[payment_id]
           ,[created_at]
           ,[modified_at]
           ,[IsActive]
           ,[AddedUserName]
           ,[ModifiedUserName])
     SELECT 
			[id]
		   ,[user_id]
           ,[total]
           ,[payment_id]
           ,[created_at]
           ,[modified_at]
           ,[IsActive]
           ,[AddedUserName]
           ,[ModifiedUserName]
	 FROM dbo.order_details where [id] = @id and isActive = 1;
	 SELECT @RC = @RC + @@ROWCOUNT;

	UPDATE [dbo].[order_details]
	   SET [user_id] = @user_id
		  ,[total] = @total
		  ,[modified_at] = GETDATE()
		  ,[ModifiedUserName] = @ModifiedUserName
		  ,[payment_id] = @payment_id
	 where [id] = @id and isActive = 1;
	  SELECT @RC = @RC + @@ROWCOUNT;

	COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK 
	END CATCH
	Select @RC;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_updateOrder_items]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	Update data in the order_items table for given id by setting existing order items to inactive
-- =============================================
CREATE PROCEDURE [dbo].[usp_updateOrder_items]
	@order_id int ,
	@ModifiedUserName varchar(50)
AS
	Declare	@RC int = 0
BEGIN
SET NOCOUNT ON;
	BEGIN TRY 
		BEGIN TRANSACTION 
		INSERT INTO [dbo].[order_items_backup]
           ([id]
		   ,[order_id]
           ,[product_id]
           ,[created_at]
           ,[modified_at]
           ,[IsActive]
           ,[AddedUserName]
           ,[ModifiedUserName])
		SELECT 
			[id]
		   ,[order_id]
           ,[product_id]
           ,[created_at]
           ,[modified_at]
           ,[IsActive]
           ,[AddedUserName]
           ,[ModifiedUserName]
		From 
			order_items 
		Where 
			IsActive = 1 and 
			order_id = @order_id; 

		SELECT @RC = @RC + @@ROWCOUNT;

	--- SET Existing order item(s) with IsActive = 0
		
		UPDATE [dbo].[order_items]
	    SET [IsActive] = 0
		  ,[modified_at] = Getdate()
		  ,[ModifiedUserName] = @ModifiedUserName
		WHERE
			order_id = @order_id and 
			IsActive = 1;
		
		SELECT @RC = @RC + @@ROWCOUNT;
		COMMIT 
	END TRY
	BEGIN CATCH
		ROLLBACK 
	END CATCH
	Select @RC;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_updatePayment_details]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	Update data in the payment_details table for given id
-- =============================================
CREATE PROCEDURE [dbo].[usp_updatePayment_details]
	@id int,
	@order_id int,
	@amount float,
	@provider varchar(50),
	@status varchar(50),
	@NameonCard varchar(100),
	@CardNumber varchar(50),
	@ExpiryDateMMYY varchar(10),
	@SecurityCode varchar(25),
	@zipCode varchar(25),
	@ShippingUserContactAddress bit,
    @ShippingAddress varchar(600),
	@ModifiedUserName varchar(50)
AS
	Declare	@RC int = 0
BEGIN
SET NOCOUNT ON;
	BEGIN TRY 
		BEGIN TRANSACTION 
		INSERT INTO [dbo].[payment_details_backup]
           ([id]
		   ,[order_id]
           ,[amount]
           ,[provider]
           ,[status]
		   ,NameonCard
       	   ,CardNumber
		   ,ExpiryDateMMYY
		   ,SecurityCode
		   ,zipCode
		   ,[ShippingUserContactAddress]
		   ,[ShippingAddress]
           ,[created_at]
           ,[modified_at]
           ,[IsActive]
           ,[AddedUserName]
           ,[ModifiedUserName])
		SELECT
			[id]
		   ,[order_id]
           ,[amount]
           ,[provider]
           ,[status]
		   ,NameonCard
       	   ,CardNumber
		   ,ExpiryDateMMYY
		   ,SecurityCode
		   ,zipCode
		   ,[ShippingUserContactAddress]
		   ,[ShippingAddress]
           ,[created_at]
           ,[modified_at]
           ,[IsActive]
           ,[AddedUserName]
           ,[ModifiedUserName]
		From 
			payment_details 
		where 
			IsActive = 1 and [id] = @id; 
		SELECT @RC = @RC + @@ROWCOUNT;

		UPDATE [dbo].[payment_details]
		SET	   [amount] = @amount
			  ,[provider] = @provider
			  ,[status] = @status
			  ,NameonCard = @NameonCard
       		  ,CardNumber = @CardNumber
		      ,ExpiryDateMMYY = @ExpiryDateMMYY
		      ,SecurityCode = @SecurityCode
		      ,zipCode = @zipCode
			  ,[ShippingUserContactAddress] = @ShippingUserContactAddress
			  ,[ShippingAddress] = @ShippingAddress
			  ,[modified_at] = GETDATE()
			  ,[ModifiedUserName] = @ModifiedUserName
		WHERE
			[id]= @id and 
			[order_id] = @order_id and 
			IsActive = 1;
		SELECT @RC = @RC + @@ROWCOUNT;
		COMMIT 
	END TRY
	BEGIN CATCH
		ROLLBACK 
	END CATCH
	Select @RC;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateUser]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	Update data in user table for given @id
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdateUser] 
	@id int,
	@username varchar(50),
	@password varchar(110),
	@first_name varchar(50),
	@last_name varchar(50),
	@address varchar(100),
	@city varchar(100),
	@state varchar(2),
	@ZipCode varchar(10),
	@telephone varchar(50),
	@ModifiedUserName varchar(50)
AS
	Declare	@RC int = 0
BEGIN
SET NOCOUNT ON;
	BEGIN TRY 
	BEGIN TRANSACTION 

		INSERT INTO [dbo].[user_backup]
			   ([id]
			   ,[username]
			   ,[password]
			   ,[first_name]
			   ,[last_name]
			   ,[address]
			   ,[city]
			   ,[state]
			   ,[ZipCode]
			   ,[telephone]
			   ,[created_at]
			   ,[modified_at]
			   ,[IsActive]
			   ,[AddedUserName]
			   ,[ModifiedUserName])
		 SELECT [id]
			   ,[username]
			   ,[password]
			   ,[first_name]
			   ,[last_name]
			   ,[address]
			   ,[city]
			   ,[state]
			   ,[ZipCode]
			   ,[telephone]
			   ,[created_at]
			   ,[modified_at]
			   ,[IsActive]
			   ,[AddedUserName]
			   ,[ModifiedUserName]
		FROM [dbo].[user]
		where 
			IsActive = 1 and 
			[id] = @id;
		SELECT @RC = @RC + @@ROWCOUNT;

		UPDATE [dbo].[user]
		   SET [username] = @username
			  ,[password] = @password
			  ,[first_name] = @first_name
			  ,[last_name] = @last_name
			  ,[address] = @address
			  ,[city] = @city
			  ,[state] = @state
			  ,[ZipCode] = @ZipCode
			  ,[telephone] = @telephone
			  ,[modified_at] = GETDATE()
			  ,[ModifiedUserName] = @ModifiedUserName
		 where IsActive = 1 and [id] = @id;
		SELECT @RC = @RC + @@ROWCOUNT;
 
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK 
	END CATCH
	Select @RC;
END


GO
/****** Object:  StoredProcedure [dbo].[usp_updatShopping_session]    Script Date: 7/24/2023 3:01:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niveditha Chilka
-- Create date: 05/29/2023
-- Description:	update data in shopping_session table for given @id
-- =============================================
CREATE PROCEDURE [dbo].[usp_updatShopping_session]
@id int,
@user_id int,
@total float,
@provider varchar(100),
@status varchar(50),
@ModifiedUserName varchar(50)
AS
	Declare	@RC int = 0
BEGIN
SET NOCOUNT ON;
	BEGIN TRY 
	BEGIN TRANSACTION 
		INSERT INTO [dbo].[shopping_session_backup]
			   ([id]
			   ,[user_id]
			   ,[total]
			   ,[created_at]
			   ,[modified_at]
			   ,[IsActive]
			   ,[AddedUserName]
			   ,[ModifiedUserName])
		 SELECT * FROM [dbo].[shopping_session] where [id] = @id and IsActive = 1;
		 SELECT @RC = @RC + @@ROWCOUNT;

		UPDATE [dbo].[shopping_session]
		SET [user_id] = @user_id
		  ,[total] = @total
		  ,[modified_at] = GETDATE()
		  ,[ModifiedUserName] = @ModifiedUserName
		 WHERE [id] = @id and IsActive = 1;
		  SELECT @RC = @RC + @@ROWCOUNT;
	COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK 
	END CATCH
	Select @RC;
END
GO
USE [master]
GO
ALTER DATABASE [Coffee] SET  READ_WRITE 
GO
