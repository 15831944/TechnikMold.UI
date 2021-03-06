USE [master]
GO
/****** Object:  Database [Mold]    Script Date: 07/08/2016 11:11:11 ******/
CREATE DATABASE [Mold] ON  PRIMARY 
( NAME = N'Mold', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Mold.mdf' , SIZE = 11264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Mold_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Mold_log.ldf' , SIZE = 18240KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Mold] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Mold].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Mold] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Mold] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Mold] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Mold] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Mold] SET ARITHABORT OFF
GO
ALTER DATABASE [Mold] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Mold] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Mold] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Mold] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Mold] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Mold] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Mold] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Mold] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Mold] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Mold] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Mold] SET  DISABLE_BROKER
GO
ALTER DATABASE [Mold] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Mold] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Mold] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Mold] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Mold] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Mold] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Mold] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Mold] SET  READ_WRITE
GO
ALTER DATABASE [Mold] SET RECOVERY FULL
GO
ALTER DATABASE [Mold] SET  MULTI_USER
GO
ALTER DATABASE [Mold] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Mold] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Mold', N'ON'
GO
USE [Mold]
GO
/****** Object:  Table [dbo].[WarehouseStocks]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WarehouseStocks](
	[WarehouseStockID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Specification] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[SafeQuantity] [int] NOT NULL,
	[WarehouseID] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_WarehouseStocks] PRIMARY KEY CLUSTERED 
(
	[WarehouseStockID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Warehouses]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Warehouses](
	[WarehouseID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Memo] [varchar](50) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Warehouses] PRIMARY KEY CLUSTERED 
(
	[WarehouseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WarehouseRecords]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WarehouseRecords](
	[WarehouseRecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RecordType] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PurchaseOrderID] [int] NOT NULL,
	[POContentID] [int] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[Memo] [varchar](50) NULL,
	[Name] [varchar](100) NULL,
	[Specification] [varchar](100) NULL,
 CONSTRAINT [PK_WarehouseRecords] PRIMARY KEY CLUSTERED 
(
	[WarehouseRecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[LogonName] [varchar](20) NOT NULL,
	[FullName] [varchar](20) NOT NULL,
	[Email] [varchar](40) NOT NULL,
	[Extension] [varchar](10) NULL,
	[Mobile] [varchar](20) NULL,
	[DepartmentID] [int] NOT NULL,
	[Enabled] [bit] NULL,
	[EmailUser] [varchar](40) NULL,
	[EmailPassword] [varchar](20) NULL,
	[PositionID] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tasks](
	[TaskID] [int] IDENTITY(1,1) NOT NULL,
	[DrawingFile] [varchar](100) NOT NULL,
	[TaskName] [varchar](50) NOT NULL,
	[Version] [int] NOT NULL,
	[ProcessName] [varchar](50) NOT NULL,
	[Model] [varchar](20) NOT NULL,
	[R] [int] NOT NULL,
	[F] [int] NOT NULL,
	[HRC] [varchar](20) NOT NULL,
	[Material] [varchar](20) NOT NULL,
	[Time] [float] NOT NULL,
	[Raw] [varchar](50) NOT NULL,
	[Prepared] [bit] NOT NULL,
	[Priority] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ForecastTime] [datetime2](7) NOT NULL,
	[AcceptTime] [datetime2](7) NOT NULL,
	[CreateTime] [datetime2](7) NOT NULL,
	[PlanTime] [datetime2](7) NOT NULL,
	[StartTime] [datetime2](7) NULL,
	[Memo] [varchar](50) NOT NULL,
	[StateMemo] [varchar](50) NOT NULL,
	[State] [int] NULL,
	[ProjectID] [int] NOT NULL,
	[CADUser] [int] NULL,
	[Creator] [int] NULL,
	[CAMUser] [int] NULL,
	[WorkshopUser] [int] NULL,
	[QCUser] [int] NULL,
	[TaskType] [int] NOT NULL,
	[ReleaseTime] [datetime2](7) NULL,
	[FinishTime] [datetime2](7) NULL,
	[PositionFinish] [bit] NULL,
	[QCInfoFinish] [bit] NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaskHours]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskHours](
	[TaskHourID] [int] IDENTITY(1,1) NOT NULL,
	[TaskID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[FinishTime] [datetime] NOT NULL,
	[RecordType] [int] NOT NULL,
 CONSTRAINT [PK_TaskHours] PRIMARY KEY CLUSTERED 
(
	[TaskHourID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskHourCosts]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskHourCosts](
	[TaskHourCostID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[PeopleCost] [float] NOT NULL,
	[DeviceCost] [float] NULL,
 CONSTRAINT [PK_TaskHourCosts] PRIMARY KEY CLUSTERED 
(
	[TaskHourCostID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[FullName] [varchar](100) NOT NULL,
	[Contact] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[Type] [int] NULL,
	[Enabled] [bit] NOT NULL,
	[FirstSupply] [datetime2](7) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockParts]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockParts](
	[StockPartID] [int] IDENTITY(1,1) NOT NULL,
	[PartID] [int] NULL,
	[PartName] [varchar](50) NOT NULL,
	[Specification] [varchar](50) NOT NULL,
	[InStockQty] [int] NOT NULL,
	[SafeQty] [int] NOT NULL,
	[ReserveQty] [int] NULL,
	[PartTypeID] [int] NOT NULL,
 CONSTRAINT [PK_StockParts] PRIMARY KEY CLUSTERED 
(
	[StockPartID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockChanges]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockChanges](
	[StockChangeID] [int] NOT NULL,
	[StockPartID] [int] NOT NULL,
	[ChangeType] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[PurchaseRequestID] [int] NULL,
	[ChangeDate] [datetime] NULL,
	[Operator] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[PartName] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sequences]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sequences](
	[SequenceID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Current] [int] NOT NULL,
	[NameConvension] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Sequences] PRIMARY KEY CLUSTERED 
(
	[SequenceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[ProjectBased] [bit] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuotationRequests]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuotationRequests](
	[QuotationRequestID] [int] IDENTITY(1,1) NOT NULL,
	[QuotationNumber] [varchar](50) NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[RequestDate] [datetime2](7) NULL,
	[PurchaseUserID] [int] NOT NULL,
	[DueDate] [datetime2](7) NULL,
	[Enabled] [bit] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[State] [int] NOT NULL,
	[PurchaseRequestID] [int] NOT NULL,
 CONSTRAINT [PK_QuotationRequests] PRIMARY KEY CLUSTERED 
(
	[QuotationRequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QRSuppliers]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QRSuppliers](
	[QRSupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [varchar](20) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[QuotationRequestID] [int] NOT NULL,
	[RequestDate] [datetime2](7) NULL,
	[QuotationState] [bit] NULL,
	[QuotationDate] [datetime2](7) NULL,
	[ValidDate] [datetime2](7) NULL,
 CONSTRAINT [PK_PRSuppliers] PRIMARY KEY CLUSTERED 
(
	[QRSupplierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QRQuotations]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QRQuotations](
	[QRQuotationID] [int] IDENTITY(1,1) NOT NULL,
	[QRContentID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[QuotationRequestID] [int] NOT NULL,
	[UnitPrice] [float] NULL,
	[TotalPrice] [float] NULL,
	[Quantity] [int] NULL,
	[QuotationDate] [datetime2](7) NULL,
	[Enabled] [bit] NULL,
 CONSTRAINT [PK_PRQuotations] PRIMARY KEY CLUSTERED 
(
	[QRQuotationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QRContents]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QRContents](
	[QRContentID] [int] IDENTITY(1,1) NOT NULL,
	[PRContentID] [int] NOT NULL,
	[PartID] [int] NULL,
	[PartName] [varchar](50) NULL,
	[PartNumber] [varchar](50) NULL,
	[PartSpecification] [varchar](100) NULL,
	[Quantity] [int] NOT NULL,
	[PurchaseRequestID] [int] NOT NULL,
	[QuotationRequestID] [int] NOT NULL,
	[MaterialName] [varchar](20) NULL,
	[Hardness] [varchar](20) NULL,
	[BrandName] [varchar](20) NULL,
	[PurchaseDrawing] [bit] NULL,
	[Memo] [varchar](50) NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_QRContents] PRIMARY KEY CLUSTERED 
(
	[QRContentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QCInfoes]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QCInfoes](
	[QCInfoID] [int] IDENTITY(1,1) NOT NULL,
	[TaskID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[QCPoints] [varchar](200) NOT NULL,
 CONSTRAINT [PK_QCInfo] PRIMARY KEY CLUSTERED 
(
	[QCInfoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseRequests]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseRequests](
	[PurchaseRequestID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseRequestNumber] [varchar](20) NOT NULL,
	[State] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Responsible] [int] NOT NULL,
	[Approval] [int] NULL,
	[ProjectID] [int] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[AcceptDate] [datetime2](7) NULL,
	[ApprovalDate] [datetime2](7) NULL,
	[TotalPrice] [float] NULL,
	[SupplierID] [int] NULL,
	[Memo] [varchar](100) NULL,
	[Enabled] [bit] NOT NULL,
	[DueDate] [datetime2](7) NULL,
 CONSTRAINT [PK_PurchaseRequests] PRIMARY KEY CLUSTERED 
(
	[PurchaseRequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseOrders]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseOrders](
	[PurchaseOrderID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseRequestID] [int] NOT NULL,
	[PurchaseOrderNumber] [varchar](20) NOT NULL,
	[State] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Responsible] [int] NOT NULL,
	[Approval] [int] NULL,
	[ProjectID] [int] NOT NULL,
	[ReleaseDate] [datetime2](7) NOT NULL,
	[FinishDate] [datetime2](7) NULL,
	[TotalPrice] [float] NULL,
	[SupplierID] [int] NULL,
	[Memo] [varchar](50) NULL,
 CONSTRAINT [PK_PurchaseOrders] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRStatus]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRStatus](
	[PRStatusID] [int] IDENTITY(1,1) NOT NULL,
	[PRStatusName] [varchar](10) NOT NULL,
	[PRStatusSequence] [int] NOT NULL,
 CONSTRAINT [PK_PRStatus] PRIMARY KEY CLUSTERED 
(
	[PRStatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRProcesses]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRProcesses](
	[PRProcessID] [int] NOT NULL,
	[PurchaseRequestID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[ResponseType] [int] NOT NULL,
	[Memo] [varchar](100) NULL,
	[ProcessData] [datetime2](7) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectNumber] [varchar](20) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Type] [int] NOT NULL,
	[MoldNumber] [varchar](20) NULL,
	[CustomerID] [int] NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[ProjectStatus] [int] NOT NULL,
	[Memo] [varchar](100) NULL,
	[ParentID] [int] NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectRoles]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProjectRoles](
	[ProjectRoleID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProjectRoles] PRIMARY KEY CLUSTERED 
(
	[ProjectRoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectPhases]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectPhases](
	[ProjectPhaseID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[PhaseID] [int] NOT NULL,
	[PlanFinish] [datetime2](7) NULL,
	[PlanCFinish] [datetime2](7) NULL,
	[ActualFinish] [datetime2](7) NULL,
 CONSTRAINT [PK_ProjectPhases] PRIMARY KEY CLUSTERED 
(
	[ProjectPhaseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessRecords]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProcessRecords](
	[ProcessRecordID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessType] [int] NOT NULL,
	[ProcessID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Message] [varchar](200) NOT NULL,
	[RecordDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessRecord] PRIMARY KEY CLUSTERED 
(
	[ProcessRecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRContents]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRContents](
	[PRContentID] [int] IDENTITY(1,1) NOT NULL,
	[PartID] [int] NULL,
	[PartName] [varchar](50) NULL,
	[PartNumber] [varchar](50) NULL,
	[PartSpecification] [varchar](100) NULL,
	[Quantity] [int] NOT NULL,
	[PartTypeID] [int] NOT NULL,
	[PurchaseRequestID] [int] NOT NULL,
	[UnitPrice] [float] NULL,
	[SubTotal] [float] NULL,
	[MaterialName] [varchar](20) NULL,
	[Hardness] [varchar](20) NULL,
	[JobNo] [varchar](10) NULL,
	[BrandName] [varchar](20) NULL,
	[PurchaseDrawing] [bit] NULL,
	[Memo] [varchar](50) NULL,
	[EstimatePrice] [float] NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_PRContents] PRIMARY KEY CLUSTERED 
(
	[PRContentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Positions](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[POContents]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[POContents](
	[POContentID] [int] IDENTITY(1,1) NOT NULL,
	[PRContentID] [int] NOT NULL,
	[PartName] [varchar](50) NULL,
	[PartNumber] [varchar](50) NULL,
	[PartSpecification] [varchar](100) NULL,
	[Quantity] [int] NOT NULL,
	[PurchaseOrderID] [int] NOT NULL,
	[UnitPrice] [float] NULL,
	[SubTotal] [float] NULL,
	[BrandName] [varchar](20) NULL,
	[Memo] [varchar](50) NULL,
	[ReceivedQty] [int] NULL,
	[State] [int] NULL,
 CONSTRAINT [PK_POContents] PRIMARY KEY CLUSTERED 
(
	[POContentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Phases]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Phases](
	[PhaseID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Sequence] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Phases] PRIMARY KEY CLUSTERED 
(
	[PhaseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhaseModifications]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhaseModifications](
	[PhaseModificationID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectPhaseID] [int] NOT NULL,
	[ModifyDate] [datetime] NOT NULL,
	[User] [varchar](50) NOT NULL,
	[BeforeModify] [datetime] NOT NULL,
	[AfterModify] [datetime] NOT NULL,
	[Reason] [int] NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_PhaseModifications] PRIMARY KEY CLUSTERED 
(
	[PhaseModificationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PartTypes]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PartTypes](
	[PartTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Parent] [int] NOT NULL,
 CONSTRAINT [PK_PartTypes] PRIMARY KEY CLUSTERED 
(
	[PartTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Parts]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parts](
	[PartID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[PartNumber] [varchar](50) NOT NULL,
	[Specification] [varchar](100) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[MaterialName] [varchar](50) NOT NULL,
	[Hardness] [varchar](50) NOT NULL,
	[BrandID] [int] NOT NULL,
	[BrandName] [varchar](50) NOT NULL,
	[SupplierName] [varchar](50) NULL,
	[SupplierID] [int] NULL,
	[DetailDrawing] [bit] NULL,
	[BriefDrawing] [bit] NULL,
	[PurchaseDrawing] [bit] NULL,
	[ExtraMaching] [bit] NULL,
	[Memo] [varchar](100) NULL,
	[CreateDate] [datetime2](7) NULL,
	[ReleaseDate] [datetime2](7) NULL,
	[Quantity] [int] NOT NULL,
	[Version] [varchar](5) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[ModelPath] [varchar](100) NULL,
	[DrawingPath] [varchar](100) NULL,
	[CatalogSpec] [varchar](50) NULL,
	[Status] [int] NULL,
	[JobNo] [varchar](20) NULL,
	[AppendQty] [int] NULL,
	[TotalQty] [int] NULL,
 CONSTRAINT [PK_Parts] PRIMARY KEY CLUSTERED 
(
	[PartID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PartImportRecords]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PartImportRecords](
	[PartImportRecordID] [int] IDENTITY(1,1) NOT NULL,
	[ImportDate] [datetime2](7) NOT NULL,
	[DataContent] [varchar](1000) NOT NULL,
	[PartID] [int] NOT NULL,
 CONSTRAINT [PK_PartImportRecord] PRIMARY KEY CLUSTERED 
(
	[PartImportRecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PartCodes]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PartCodes](
	[PartCodeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ShortName] [varchar](50) NOT NULL,
	[Code] [varchar](20) NOT NULL,
 CONSTRAINT [PK_PartCodes] PRIMARY KEY CLUSTERED 
(
	[PartCodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Materials](
	[MaterialID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MACH_TOTAL]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MACH_TOTAL](
	[NAME] [varchar](50) NULL,
	[TOTAL] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MACH_CAMDrawing]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MACH_CAMDrawing](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DrawingName] [varchar](200) NOT NULL,
	[MoldName] [varchar](100) NOT NULL,
	[lock] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateBy] [varchar](50) NOT NULL,
	[ReleaseDate] [datetime] NULL,
	[ReleaseBy] [varchar](50) NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_MACH_CAMDrawing] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ListValues]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ListValues](
	[ListValueID] [int] IDENTITY(1,1) NOT NULL,
	[ListTypeID] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Enabled] [bit] NULL,
 CONSTRAINT [PK_ListValues] PRIMARY KEY CLUSTERED 
(
	[ListValueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ListTypes]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ListTypes](
	[ListTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_ListTypes] PRIMARY KEY CLUSTERED 
(
	[ListTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hardnesses]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hardnesses](
	[HardnessID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [varchar](50) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Enabled] [bit] NULL,
 CONSTRAINT [PK_Hardness] PRIMARY KEY CLUSTERED 
(
	[HardnessID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EquipmentTypes]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EquipmentTypes](
	[EquipmentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_EquipmentType] PRIMARY KEY CLUSTERED 
(
	[EquipmentTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Equipments]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Equipments](
	[EquipmentID] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentType] [varchar](20) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Devices] PRIMARY KEY CLUSTERED 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ELE_GENERAL_TABLE]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ELE_GENERAL_TABLE](
	[ELE_NAME] [varchar](30) NOT NULL,
	[FACT_NAME] [varchar](30) NOT NULL,
	[ELE_DRAW_INDEX] [bigint] NOT NULL,
	[MOLD_NAME] [char](40) NOT NULL,
	[DRAW_REV] [smallint] NOT NULL,
	[ELE_REV] [smallint] NOT NULL,
	[DESIGNER] [varchar](20) NOT NULL,
	[PROGRAMMER] [varchar](20) NOT NULL,
	[RAW_SIZE] [varchar](40) NOT NULL,
	[MATERIAL] [varchar](10) NOT NULL,
	[SURFACE] [varchar](10) NOT NULL,
	[OBIT_TYPE] [varchar](10) NOT NULL,
	[ELE_POS] [varchar](1000) NOT NULL,
	[ROUGH_PIECES] [smallint] NOT NULL,
	[FINISH_PIECES] [smallint] NOT NULL,
	[EDM_STOCK] [varchar](10) NOT NULL,
	[ROUGH_GAP] [varchar](10) NOT NULL,
	[FINISH_GAP] [varchar](10) NOT NULL,
	[NC_FINISH_NAME] [varchar](600) NULL,
	[NC_ROUGH_NAME] [varchar](600) NULL,
	[NC_FINISH_COUNT] [smallint] NOT NULL,
	[NC_ROUGH_COUNT] [smallint] NOT NULL,
	[RoughMillTime] [float] NULL,
	[FinishMillTime] [float] NULL,
	[MACH_TYPE] [varchar](10) NOT NULL,
	[ELE_3D_REV] [smallint] NULL,
	[ELE_3D_NAME] [varchar](50) NULL,
	[ELE_DATE] [varchar](20) NOT NULL,
	[ELE_DRAW_LOCK] [smallint] NOT NULL,
	[ELE_OLD_REV] [smallint] NOT NULL,
	[CNC_MACH_TYPE] [smallint] NULL,
	[ChildEleNum] [smallint] NULL,
	[ChildEleName] [varchar](500) NULL,
	[Create_date] [datetime] NOT NULL,
	[Delete_time] [datetime] NULL,
	[Delete_person] [varchar](50) NULL,
	[Issue_date] [datetime] NULL,
	[Issue_person] [varchar](50) NULL,
	[Undo_person] [varchar](50) NULL,
	[Undo_date] [datetime] NULL,
	[SaftyHeight] [float] NULL,
	[PosCheck] [bit] NULL,
	[CNCMachMethod] [smallint] NULL,
	[EDMMachMethod] [smallint] NULL,
	[QCPoint] [bit] NULL,
	[AppendMethod] [smallint] NULL,
 CONSTRAINT [PK_ELE_GENERAL_TABLE] PRIMARY KEY CLUSTERED 
(
	[ELE_DRAW_INDEX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EDMItems]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EDMItems](
	[EDMItemID] [int] IDENTITY(1,1) NOT NULL,
	[TaskID] [int] NOT NULL,
	[LabelName] [varchar](50) NULL,
	[Gap] [float] NULL,
	[OffsetX] [float] NULL,
	[OffsetY] [float] NULL,
	[OffsetZ] [float] NULL,
	[OffsetC] [float] NULL,
	[GapCompensate] [float] NULL,
	[ZCompensate] [float] NULL,
	[ElePosition] [int] NULL,
	[Surface] [varchar](10) NULL,
	[Material] [varchar](20) NULL,
	[Obit] [varchar](20) NULL,
	[EleType] [int] NULL,
	[CncMethod] [int] NULL,
	[InQueue] [bit] NOT NULL,
 CONSTRAINT [PK_EDMParameter] PRIMARY KEY CLUSTERED 
(
	[EDMItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contacts](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[ContactType] [int] NOT NULL,
	[OrganizationID] [int] NOT NULL,
	[Telephone] [varchar](20) NULL,
	[Mobile] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[Memo] [varchar](50) NULL,
	[Enabled] [bit] NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CNCParameters]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CNCParameters](
	[CNCParameterID] [int] IDENTITY(1,1) NOT NULL,
	[TaskID] [int] NOT NULL,
	[Surface] [varchar](20) NOT NULL,
	[Preserve] [int] NOT NULL,
	[RoughGap] [float] NOT NULL,
	[FinishGap] [float] NOT NULL,
	[Position] [varchar](500) NOT NULL,
	[ObitType] [varchar](10) NOT NULL,
	[NCRoughName] [varchar](500) NOT NULL,
	[NCFinishName] [varchar](500) NOT NULL,
 CONSTRAINT [PK_CNCParameter] PRIMARY KEY CLUSTERED 
(
	[CNCParameterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CNCItems]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CNCItems](
	[CNCItemID] [int] IDENTITY(1,1) NOT NULL,
	[LabelName] [varchar](50) NOT NULL,
	[TaskID] [int] NOT NULL,
	[RoughGap] [float] NULL,
	[FinishGap] [float] NULL,
	[Position] [varchar](200) NULL,
	[NCRoughName] [varchar](200) NULL,
	[OBitType] [varchar](10) NULL,
	[NCFinishName] [varchar](200) NULL,
 CONSTRAINT [PK_CNCParameters] PRIMARY KEY CLUSTERED 
(
	[CNCItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BarCodes]    Script Date: 07/08/2016 11:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BarCodes](
	[BarCodeID] [int] IDENTITY(1,1) NOT NULL,
	[PartID] [int] NOT NULL,
	[TaskID] [int] NOT NULL,
	[Value] [varchar](20) NOT NULL,
	[Printed] [bit] NOT NULL,
	[PrintTime] [datetime] NOT NULL,
	[Sequence] [int] NOT NULL,
 CONSTRAINT [PK_BarCodes] PRIMARY KEY CLUSTERED 
(
	[BarCodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_WarehouseStocks_Quantity]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[WarehouseStocks] ADD  CONSTRAINT [DF_WarehouseStocks_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
/****** Object:  Default [DF_WarehouseStocks_SafeQuantity]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[WarehouseStocks] ADD  CONSTRAINT [DF_WarehouseStocks_SafeQuantity]  DEFAULT ((0)) FOR [SafeQuantity]
GO
/****** Object:  Default [DF_WarehouseStocks_Enabled]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[WarehouseStocks] ADD  CONSTRAINT [DF_WarehouseStocks_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
/****** Object:  Default [DF__Users__EmailUser__4E88ABD4]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('') FOR [EmailUser]
GO
/****** Object:  Default [DF__Users__EmailPass__4F7CD00D]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('') FOR [EmailPassword]
GO
/****** Object:  Default [DF__Users__PositionI__02FC7413]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [PositionID]
GO
/****** Object:  Default [DF_Tasks_R]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_R]  DEFAULT ((0)) FOR [R]
GO
/****** Object:  Default [DF_Tasks_F]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_F]  DEFAULT ((0)) FOR [F]
GO
/****** Object:  Default [DF_Tasks_Time]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_Time]  DEFAULT ((0)) FOR [Time]
GO
/****** Object:  Default [DF_Tasks_Prepare]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_Prepare]  DEFAULT ((0)) FOR [Prepared]
GO
/****** Object:  Default [DF_Tasks_Priority]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_Priority]  DEFAULT ((0)) FOR [Priority]
GO
/****** Object:  Default [DF_Tasks_Quantity]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
/****** Object:  Default [DF_Tasks_Memo]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_Memo]  DEFAULT (' ') FOR [Memo]
GO
/****** Object:  Default [DF_Tasks_PositionFinish]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_PositionFinish]  DEFAULT ((0)) FOR [PositionFinish]
GO
/****** Object:  Default [DF__Suppliers__First__5812160E]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[Suppliers] ADD  DEFAULT ('1-1-1') FOR [FirstSupply]
GO
/****** Object:  Default [DF_QuotationRequests_Enabled]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[QuotationRequests] ADD  CONSTRAINT [DF_QuotationRequests_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
/****** Object:  Default [DF__Quotation__Proje__17F790F9]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[QuotationRequests] ADD  DEFAULT ((0)) FOR [ProjectID]
GO
/****** Object:  Default [DF__Quotation__State__18EBB532]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[QuotationRequests] ADD  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF__Quotation__Purch__19DFD96B]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[QuotationRequests] ADD  DEFAULT ((0)) FOR [PurchaseRequestID]
GO
/****** Object:  Default [DF__QRContent__Enabl__17036CC0]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[QRContents] ADD  DEFAULT ((1)) FOR [Enabled]
GO
/****** Object:  Default [DF__QCInfoes__QCPoin__59063A47]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[QCInfoes] ADD  DEFAULT ('') FOR [QCPoints]
GO
/****** Object:  Default [DF__PurchaseRe__Memo__0F624AF8]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[PurchaseRequests] ADD  DEFAULT ('') FOR [Memo]
GO
/****** Object:  Default [DF__PurchaseR__Enabl__10566F31]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[PurchaseRequests] ADD  DEFAULT ((1)) FOR [Enabled]
GO
/****** Object:  Default [DF__Projects__Enable__6B24EA82]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[Projects] ADD  DEFAULT ((1)) FOR [Enabled]
GO
/****** Object:  Default [DF__PRContent__Estim__5AEE82B9]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[PRContents] ADD  DEFAULT ((0)) FOR [EstimatePrice]
GO
/****** Object:  Default [DF__PRContent__Enabl__778AC167]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[PRContents] ADD  DEFAULT ((1)) FOR [Enabled]
GO
/****** Object:  Default [DF_Positions_Enabled]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[Positions] ADD  CONSTRAINT [DF_Positions_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
/****** Object:  Default [DF__POContent__Recei__5BE2A6F2]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[POContents] ADD  DEFAULT ((0)) FOR [ReceivedQty]
GO
/****** Object:  Default [DF__POContent__State__5CD6CB2B]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[POContents] ADD  DEFAULT ((1)) FOR [State]
GO
/****** Object:  Default [DF__Parts__TotalQty__5DCAEF64]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[Parts] ADD  DEFAULT ((0)) FOR [TotalQty]
GO
/****** Object:  Default [DF__PartImpor__PartI__0C85DE4D]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[PartImportRecords] ADD  DEFAULT ((0)) FOR [PartID]
GO
/****** Object:  Default [DF_EDMParameter_Gap]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[EDMItems] ADD  CONSTRAINT [DF_EDMParameter_Gap]  DEFAULT ((0)) FOR [Gap]
GO
/****** Object:  Default [DF_EDMParameter_OffsetX]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[EDMItems] ADD  CONSTRAINT [DF_EDMParameter_OffsetX]  DEFAULT ((0)) FOR [OffsetX]
GO
/****** Object:  Default [DF_EDMParameter_OffsetY]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[EDMItems] ADD  CONSTRAINT [DF_EDMParameter_OffsetY]  DEFAULT ((0)) FOR [OffsetY]
GO
/****** Object:  Default [DF_EDMParameter_OffsetC]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[EDMItems] ADD  CONSTRAINT [DF_EDMParameter_OffsetC]  DEFAULT ((0)) FOR [OffsetC]
GO
/****** Object:  Default [DF_EDMParameter_GapCompensate]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[EDMItems] ADD  CONSTRAINT [DF_EDMParameter_GapCompensate]  DEFAULT ((0)) FOR [GapCompensate]
GO
/****** Object:  Default [DF_EDMParameter_ZCompensate]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[EDMItems] ADD  CONSTRAINT [DF_EDMParameter_ZCompensate]  DEFAULT ((0)) FOR [ZCompensate]
GO
/****** Object:  Default [DF_EDMParameter_ElePosition]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[EDMItems] ADD  CONSTRAINT [DF_EDMParameter_ElePosition]  DEFAULT ((0)) FOR [ElePosition]
GO
/****** Object:  Default [DF_EDMParameter_EleType]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[EDMItems] ADD  CONSTRAINT [DF_EDMParameter_EleType]  DEFAULT ((0)) FOR [EleType]
GO
/****** Object:  Default [DF_EDMParameter_CncMethod]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[EDMItems] ADD  CONSTRAINT [DF_EDMParameter_CncMethod]  DEFAULT ((0)) FOR [CncMethod]
GO
/****** Object:  Default [DF__EDMItems__InQueu__6754599E]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[EDMItems] ADD  DEFAULT ((0)) FOR [InQueue]
GO
/****** Object:  Default [DF_CNCParameters_RoughGap]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[CNCItems] ADD  CONSTRAINT [DF_CNCParameters_RoughGap]  DEFAULT ((0)) FOR [RoughGap]
GO
/****** Object:  Default [DF_CNCParameters_FinishGap]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[CNCItems] ADD  CONSTRAINT [DF_CNCParameters_FinishGap]  DEFAULT ((0)) FOR [FinishGap]
GO
/****** Object:  Default [DF__CNCItems__NCFini__6A30C649]    Script Date: 07/08/2016 11:11:11 ******/
ALTER TABLE [dbo].[CNCItems] ADD  DEFAULT ('') FOR [NCFinishName]
GO

---------------Added 2016/7/9 18:00
alter table PurchaseOrders alter column Memo varchar(100);
alter table POContents add Enabled bit default 1;
alter table PurchaseOrders add DueDate datetime2(7) NOT NULL

-----------------Added 2016/7/10 2:00
alter table PurchaseOrders add  QuotationRequestID int not null default 0


USE [Mold]
GO

/****** Object:  Table [dbo].[ELEItems]    Script Date: 07/13/2016 16:37:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ELEItems](
	[ELEItemID] [int] IDENTITY(1,1) NOT NULL,
	[TaskID] [int] NOT NULL,
	[EDMItemID] [int] NOT NULL,
	[LabelName] [varchar](50) NOT NULL,
	[Raw] [varchar](100) NULL,
	[Ready] [bit] NULL,
	[Required] [bit] NULL,
	[PartPosition] [varchar](20) NULL,
	[Finished] [bit] NULL,
 CONSTRAINT [PK_ELEItems] PRIMARY KEY CLUSTERED 
(
	[ELEItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ELEItems] ADD  CONSTRAINT [DF_ELEItems_Finished]  DEFAULT ((0)) FOR [Finished]
GO


