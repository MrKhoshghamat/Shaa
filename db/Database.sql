USE [master]
GO
/****** Object:  Database [Shaa]    Script Date: 12/23/2022 3:19:31 PM ******/
CREATE DATABASE [Shaa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sha', FILENAME = N'E:\Database\Shaa\Sha.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sha_log', FILENAME = N'E:\Database\Shaa\Sha_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Shaa] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shaa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shaa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shaa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shaa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shaa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shaa] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shaa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shaa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shaa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shaa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shaa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shaa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shaa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shaa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shaa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shaa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Shaa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shaa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shaa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shaa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shaa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shaa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shaa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shaa] SET RECOVERY FULL 
GO
ALTER DATABASE [Shaa] SET  MULTI_USER 
GO
ALTER DATABASE [Shaa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shaa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shaa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shaa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Shaa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shaa] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Shaa', N'ON'
GO
ALTER DATABASE [Shaa] SET QUERY_STORE = OFF
GO
USE [Shaa]
GO
/****** Object:  Schema [Lab]    Script Date: 12/23/2022 3:19:31 PM ******/
CREATE SCHEMA [Lab]
GO
/****** Object:  Schema [organization]    Script Date: 12/23/2022 3:19:31 PM ******/
CREATE SCHEMA [organization]
GO
/****** Object:  Schema [Req]    Script Date: 12/23/2022 3:19:31 PM ******/
CREATE SCHEMA [Req]
GO
/****** Object:  Schema [share]    Script Date: 12/23/2022 3:19:31 PM ******/
CREATE SCHEMA [share]
GO
/****** Object:  Table [dbo].[Attachment]    Script Date: 12/23/2022 3:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attachment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EntityName] [varchar](255) NOT NULL,
	[EntityRecordId] [varchar](255) NOT NULL,
	[FileType] [varchar](255) NULL,
	[FileSize] [varchar](255) NOT NULL,
	[FileName] [varchar](255) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[DeletedDate] [datetime] NULL,
	[RegisterTime] [datetime] NULL,
	[UserId] [uniqueidentifier] NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Attachment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttachmentContent]    Script Date: 12/23/2022 3:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachmentContent](
	[Id] [bigint] NOT NULL,
	[FileContent] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_AttachmentContent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 12/23/2022 3:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varbinary](255) NOT NULL,
	[Description] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/23/2022 3:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolePermission]    Script Date: 12/23/2022 3:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermission](
	[PermissionId] [int] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/23/2022 3:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [varchar](11) NULL,
	[Email] [varchar](50) NULL,
	[NationalNo] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](4000) NULL,
	[Password] [varchar](255) NOT NULL,
	[BirthDate] [datetime] NULL,
	[CountryId] [int] NULL,
	[CityId] [int] NULL,
	[IsEmailConfirmed] [bit] NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[IsBanned] [bit] NOT NULL,
	[EmailActivationCode] [varchar](255) NULL,
	[DepartmentId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NULL,
	[CreationDate] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 12/23/2022 3:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Lab].[Ability]    Script Date: 12/23/2022 3:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lab].[Ability](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [int] NOT NULL,
	[LaboratoryId] [uniqueidentifier] NOT NULL,
	[FurtherDetailsAndProcedure] [nvarchar](1000) NULL,
	[DescriptionOfConsumables] [nvarchar](1000) NULL,
	[ConsumableCost] [bigint] NULL,
	[HumanResourceCost] [bigint] NULL,
	[OtherCost] [bigint] NULL,
	[ImplementationCost] [bigint] NULL,
	[ImplementationTime] [datetime] NULL,
	[FileAttachment] [varchar](255) NULL,
 CONSTRAINT [PK_Ability] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lab].[Equipment]    Script Date: 12/23/2022 3:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lab].[Equipment](
	[Id] [uniqueidentifier] NOT NULL,
	[LaboratoryId] [uniqueidentifier] NULL,
	[EquipmentTypeId] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[PersianTitle] [nvarchar](255) NULL,
	[GeneralTechnicalSpecification] [nvarchar](255) NULL,
	[EquipmentUsage] [nvarchar](255) NULL,
	[UsageTypeId] [int] NOT NULL,
	[CountryId] [int] NULL,
	[CompanyName] [nvarchar](255) NULL,
	[Model] [varchar](100) NULL,
	[SerialNumber] [varchar](100) NULL,
	[InstallationDate] [datetime] NULL,
	[ExploitationDate] [datetime] NULL,
	[SupplyTypeId] [int] NULL,
	[WardId] [uniqueidentifier] NULL,
	[EquipmentCost] [bigint] NULL,
	[EquipmentImage] [varchar](255) NULL,
	[RelatedSectionId] [int] NULL,
	[Baitul-Mal No] [varchar](255) NULL,
	[EquipmentStatusId] [int] NULL,
	[EmploymentStatusId] [int] NULL,
	[PurchasePrice/Construction] [nvarchar](50) NULL,
	[IsNeededToCalibrate] [bit] NULL,
	[LastCalibrationDate] [datetime] NULL,
	[WarrantyExpirationDate] [datetime] NULL,
	[InsuranceExpirationDate] [datetime] NULL,
	[SpecialCharacteristic] [nvarchar](255) NULL,
	[TitlesAttachedToEquipment] [nvarchar](255) NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lab].[EquipmentAbility]    Script Date: 12/23/2022 3:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lab].[EquipmentAbility](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AbilityId] [uniqueidentifier] NOT NULL,
	[EquipmentId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_EquipmentAbility] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lab].[Laboratory]    Script Date: 12/23/2022 3:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lab].[Laboratory](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[LaboratoryTypeId] [int] NOT NULL,
	[PassiveDefenceId] [int] NOT NULL,
	[ApprovalAuthorityId] [int] NULL,
	[StandardStatusId] [int] NULL,
	[ResearchCenterId] [int] NULL,
	[PhoneNumber] [varchar](50) NULL,
	[ImagePath] [nvarchar](1000) NULL,
	[Address] [nvarchar](4000) NULL,
	[Description] [nvarchar](4000) NULL,
 CONSTRAINT [PK_Laboratory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lab].[Request]    Script Date: 12/23/2022 3:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lab].[Request](
	[Id] [uniqueidentifier] NOT NULL,
	[LaboratoryId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[IndicatorNo] [nvarchar](255) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[RequestTypeId] [int] NOT NULL,
	[LetterPath] [varchar](255) NULL,
	[RequestDate] [datetime] NOT NULL,
	[TraceCode] [nvarchar](255) NOT NULL,
	[Status] [int] NULL,
	[DescForCheck] [nvarchar](max) NULL,
	[RequestAttachmentId] [bigint] NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Lab].[RequestIndicator]    Script Date: 12/23/2022 3:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lab].[RequestIndicator](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[IndicatorNo] [nvarchar](255) NOT NULL,
	[TraceCode] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_RequestIndicator] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lab].[RequestService]    Script Date: 12/23/2022 3:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lab].[RequestService](
	[Id] [uniqueidentifier] NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[ServiceId] [int] NOT NULL,
	[TotalCost] [bigint] NULL,
	[RecievedPayment] [bigint] NULL,
	[SampleCount] [int] NULL,
	[SampleTitle] [nvarchar](255) NULL,
 CONSTRAINT [PK_RequestService] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lab].[Ward]    Script Date: 12/23/2022 3:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lab].[Ward](
	[Id] [uniqueidentifier] NOT NULL,
	[LaboratoryId] [uniqueidentifier] NULL,
	[Title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Ward] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [organization].[Department]    Script Date: 12/23/2022 3:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [organization].[Department](
	[Id] [uniqueidentifier] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[DepartmentTypeId] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [share].[BaseInfo]    Script Date: 12/23/2022 3:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [share].[BaseInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BaseTableTypeId] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_BaseInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [share].[BaseTableType]    Script Date: 12/23/2022 3:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [share].[BaseTableType](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_BaseTableType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [PhoneNumber], [Email], [NationalNo], [Description], [Password], [BirthDate], [CountryId], [CityId], [IsEmailConfirmed], [IsAdmin], [IsBanned], [EmailActivationCode], [DepartmentId], [IsDeleted], [CreationDate]) VALUES (N'cb1b8f1a-f101-4244-882d-e12eb607f8cd', N'محمدرضا', N'خوش قامت', NULL, NULL, N'0019525400', NULL, N'64-A0-4B-6F-D5-F0-29-5C-62-23-92-72-AA-89-A5-48', NULL, NULL, NULL, 0, 0, 0, N'5ca8cd624cdf41798823da3a66df1402', NULL, NULL, NULL)
GO
INSERT [Lab].[Ability] ([Id], [Title], [LaboratoryId], [FurtherDetailsAndProcedure], [DescriptionOfConsumables], [ConsumableCost], [HumanResourceCost], [OtherCost], [ImplementationCost], [ImplementationTime], [FileAttachment]) VALUES (N'36ac5520-e110-4dde-b5ef-a952e570b6e2', 40, N'09e877a9-6159-47fa-87ff-5ad88084dc89', NULL, N'مواد اولیه', 5000000000, 500000000, 5000000000, 500000000000, CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'/content/lab/')
GO
INSERT [Lab].[Equipment] ([Id], [LaboratoryId], [EquipmentTypeId], [Title], [PersianTitle], [GeneralTechnicalSpecification], [EquipmentUsage], [UsageTypeId], [CountryId], [CompanyName], [Model], [SerialNumber], [InstallationDate], [ExploitationDate], [SupplyTypeId], [WardId], [EquipmentCost], [EquipmentImage], [RelatedSectionId], [Baitul-Mal No], [EquipmentStatusId], [EmploymentStatusId], [PurchasePrice/Construction], [IsNeededToCalibrate], [LastCalibrationDate], [WarrantyExpirationDate], [InsuranceExpirationDate], [SpecialCharacteristic], [TitlesAttachedToEquipment]) VALUES (N'96c768e9-69a0-4300-9791-ad2650c5826b', N'09e877a9-6159-47fa-87ff-5ad88084dc89', 18, N'English', N'تجهیز یک', N'باند پایه', N'کاربرد خاصی ندارد', 23, 27, N'پوگقد', N'6556419', N'1234567890asdgsadg', CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-05T00:00:00.000' AS DateTime), 46, N'07b05681-4ad0-4289-bb10-077374cfe95c', 50000000, N'/content/lab/', NULL, N'2564782364966', 59, 66, N'65,465,445,644', 1, CAST(N'2022-12-28T00:00:00.000' AS DateTime), CAST(N'2022-12-27T00:00:00.000' AS DateTime), CAST(N'2022-12-28T00:00:00.000' AS DateTime), N'شصل', N'')
GO
SET IDENTITY_INSERT [Lab].[EquipmentAbility] ON 

INSERT [Lab].[EquipmentAbility] ([Id], [AbilityId], [EquipmentId]) VALUES (20010, N'36ac5520-e110-4dde-b5ef-a952e570b6e2', N'96c768e9-69a0-4300-9791-ad2650c5826b')
SET IDENTITY_INSERT [Lab].[EquipmentAbility] OFF
GO
INSERT [Lab].[Laboratory] ([Id], [Title], [LaboratoryTypeId], [PassiveDefenceId], [ApprovalAuthorityId], [StandardStatusId], [ResearchCenterId], [PhoneNumber], [ImagePath], [Address], [Description]) VALUES (N'09e877a9-6159-47fa-87ff-5ad88084dc89', N'آزمایشگاه مدار منطقی', 12, 1, 5, 14, 7, N'(021) 77 47 5644', N'DefaultLabImage.png', N'تهران', N'')
INSERT [Lab].[Laboratory] ([Id], [Title], [LaboratoryTypeId], [PassiveDefenceId], [ApprovalAuthorityId], [StandardStatusId], [ResearchCenterId], [PhoneNumber], [ImagePath], [Address], [Description]) VALUES (N'5149e57e-ddbe-4bb6-a06a-fdd20161b34c', N'آزمایشگاه اول', 11, 1, 4, 14, 6, N'(021) 77 47 5647', N'DefaultLabImage.png', N'تهران', N'')
GO
INSERT [Lab].[Request] ([Id], [LaboratoryId], [UserId], [UserName], [IndicatorNo], [Title], [Description], [RequestTypeId], [LetterPath], [RequestDate], [TraceCode], [Status], [DescForCheck], [RequestAttachmentId]) VALUES (N'a8b6b949-35d3-47f4-a5ee-00a55fc1f203', N'5149e57e-ddbe-4bb6-a06a-fdd20161b34c', N'cb1b8f1a-f101-4244-882d-e12eb607f8cd', N'محمدرضا خوش قامت', N'43756', N'ششسیلشس', N'شسیلشسلیشسل', 70, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'1401100243756', 1, NULL, NULL)
INSERT [Lab].[Request] ([Id], [LaboratoryId], [UserId], [UserName], [IndicatorNo], [Title], [Description], [RequestTypeId], [LetterPath], [RequestDate], [TraceCode], [Status], [DescForCheck], [RequestAttachmentId]) VALUES (N'5c07b2b4-86a1-4bfd-9917-1ad1359fb8ea', N'5149e57e-ddbe-4bb6-a06a-fdd20161b34c', N'cb1b8f1a-f101-4244-882d-e12eb607f8cd', N'محمدرضا خوش قامت', N'45874', N'ششسیلشس', N'شسیلشسلیشسل', 70, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'1401100245874', 1, NULL, NULL)
INSERT [Lab].[Request] ([Id], [LaboratoryId], [UserId], [UserName], [IndicatorNo], [Title], [Description], [RequestTypeId], [LetterPath], [RequestDate], [TraceCode], [Status], [DescForCheck], [RequestAttachmentId]) VALUES (N'1ba24e7a-46c4-44fb-970e-4d77415a7ce9', N'5149e57e-ddbe-4bb6-a06a-fdd20161b34c', N'cb1b8f1a-f101-4244-882d-e12eb607f8cd', N'محمدرضا خوش قامت', N'48858756', N'ششسیلشس', N'شسیلشسلیشسل', 70, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'1401100248858756', 1, NULL, NULL)
INSERT [Lab].[Request] ([Id], [LaboratoryId], [UserId], [UserName], [IndicatorNo], [Title], [Description], [RequestTypeId], [LetterPath], [RequestDate], [TraceCode], [Status], [DescForCheck], [RequestAttachmentId]) VALUES (N'ee8d50d0-716f-4ba4-8359-a71b366eb58b', N'5149e57e-ddbe-4bb6-a06a-fdd20161b34c', N'cb1b8f1a-f101-4244-882d-e12eb607f8cd', N'محمدرضا خوش قامت', N'43726', N'ششسیلشس', N'شسیلشسلیشسل', 70, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'1401100243726', 1, NULL, NULL)
INSERT [Lab].[Request] ([Id], [LaboratoryId], [UserId], [UserName], [IndicatorNo], [Title], [Description], [RequestTypeId], [LetterPath], [RequestDate], [TraceCode], [Status], [DescForCheck], [RequestAttachmentId]) VALUES (N'652ba4ce-148e-4446-bc77-e8d9debc9360', N'5149e57e-ddbe-4bb6-a06a-fdd20161b34c', N'cb1b8f1a-f101-4244-882d-e12eb607f8cd', N'محمدرضا خوش قامت', N'458756', N'ششسیلشس', N'شسیلشسلیشسل', 70, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'14011002458756', 1, NULL, NULL)
GO
SET IDENTITY_INSERT [Lab].[RequestIndicator] ON 

INSERT [Lab].[RequestIndicator] ([Id], [RequestId], [IndicatorNo], [TraceCode]) VALUES (20029, N'ee8d50d0-716f-4ba4-8359-a71b366eb58b', N'43726', N'1401100243726')
SET IDENTITY_INSERT [Lab].[RequestIndicator] OFF
GO
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'07b05681-4ad0-4289-bb10-077374cfe95c', N'09e877a9-6159-47fa-87ff-5ad88084dc89', N'بخش 1')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'88f2d538-da09-482c-9b93-9fe824b08081', N'09e877a9-6159-47fa-87ff-5ad88084dc89', N'بخش 2')
GO
SET IDENTITY_INSERT [share].[BaseInfo] ON 

INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (1, 1, N'دارد')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (2, 1, N'ندارد')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (3, 1, N'در حال اقدام')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (4, 2, N'مورد نیاز')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (5, 2, N'معاونت تحقیقات')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (6, 3, N'مرکز تحقیقاتی اول')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (7, 3, N'مرکز تحقیقاتی دوم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (8, 3, N'مرکز تحقیقاتی سوم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (9, 3, N'مرکز تحقیقاتی چهارم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (10, 3, N'مرکز تحقیقاتی پنجم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (11, 4, N'عادی')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (12, 4, N'مرجع')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (13, 4, N'تخصصی')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (14, 5, N'دارد')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (15, 5, N'ندارد')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (16, 5, N'در حال اقدام')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (17, 6, N'نوع تجهیز اول')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (18, 6, N'نوع تجهیز دوم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (19, 6, N'نوع تجهیز سوم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (20, 6, N'نوع تجهیز چهارم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (21, 6, N'نوع تجهیز پنجم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (22, 7, N'نوع کاربری اول')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (23, 7, N'نوع کاربری دوم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (24, 7, N'نوع کاربری سوم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (25, 7, N'نوع کاربری چهارم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (26, 7, N'نوع کاربری پنجم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (27, 8, N'ایران')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (28, 8, N'آلمان')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (29, 8, N'آمریکا')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (30, 8, N'انگیس')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (31, 8, N'ایتالیا')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (32, 8, N'فرانسه')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (33, 8, N'روسیه')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (34, 8, N'اوکراین')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (35, 8, N'کانادا')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (36, 8, N'آرژانتین')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (37, 8, N'مکزیک')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (38, 8, N'شیلی')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (39, 8, N'استرالیا')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (40, 9, N'عنوان توانمندی اول')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (41, 9, N'عنوان توانمندی دوم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (42, 9, N'عنوان توانمندی سوم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (43, 9, N'عنوان توانمندی چهارم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (44, 9, N'عنوان توانمندی پنجم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (45, 10, N'خرید داخلی')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (46, 10, N'خرید خارجی')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (47, 10, N'طراحی و ساخت')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (58, 11, N'وضعیت تجهیز یک')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (59, 11, N'وضعیت تجهیز دو')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (60, 11, N'وضعیت تجهیز سه')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (61, 11, N'وضعیت تجهیز چهار')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (64, 12, N'وضعیت بکارگیری یک')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (65, 12, N'وضعیت بکارگیری دو')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (66, 12, N'وضعیت بکارگیری سه')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (67, 12, N'وضعیت بکارگیری چهار')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (68, 12, N'وضعیت بکارگیری پنج')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (69, 13, N'پروژه ای')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (70, 13, N'غیر پروژه ای')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (71, 8, N'برزیل')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (72, 8, N'پرتغال')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (73, 3, N'مرکز تحقیقاتی ششم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (82, 14, N'پروژه اول')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (83, 14, N'پروژه دوم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (84, 14, N'پروژه سوم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (85, 14, N'پروژه چهارم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (86, 14, N'پروژه پنجم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (87, 1, N'تستی')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (1077, 15, N'عنوان خدمت اول')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (1078, 15, N'عنوان خدمت دوم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (1079, 15, N'عنوان خدمت سوم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (1080, 15, N'عنوان خدمت چهارم')
INSERT [share].[BaseInfo] ([Id], [BaseTableTypeId], [Title]) VALUES (1081, 15, N'عنوان خدمت پنجم')
SET IDENTITY_INSERT [share].[BaseInfo] OFF
GO
INSERT [share].[BaseTableType] ([Id], [Title]) VALUES (1, N'نوع پدافند')
INSERT [share].[BaseTableType] ([Id], [Title]) VALUES (2, N'نوع مرجع تصویب')
INSERT [share].[BaseTableType] ([Id], [Title]) VALUES (3, N'مرکز تحقیقاتی')
INSERT [share].[BaseTableType] ([Id], [Title]) VALUES (4, N'نوع آزمایشگاه')
INSERT [share].[BaseTableType] ([Id], [Title]) VALUES (5, N'وضعیت استاندارد')
INSERT [share].[BaseTableType] ([Id], [Title]) VALUES (6, N'نوع تجهیز')
INSERT [share].[BaseTableType] ([Id], [Title]) VALUES (7, N'نوع کاربری')
INSERT [share].[BaseTableType] ([Id], [Title]) VALUES (8, N'کشور سازنده')
INSERT [share].[BaseTableType] ([Id], [Title]) VALUES (9, N'عنوان توانمندی')
INSERT [share].[BaseTableType] ([Id], [Title]) VALUES (10, N'نوع تامین دستگاه')
INSERT [share].[BaseTableType] ([Id], [Title]) VALUES (11, N'وضعیت تجهیز')
INSERT [share].[BaseTableType] ([Id], [Title]) VALUES (12, N'وضعیت بکارگیری')
INSERT [share].[BaseTableType] ([Id], [Title]) VALUES (13, N'نوع درخواست')
INSERT [share].[BaseTableType] ([Id], [Title]) VALUES (14, N'پروژه')
INSERT [share].[BaseTableType] ([Id], [Title]) VALUES (15, N'عنوان خدمات ارائه شده')
GO
ALTER TABLE [dbo].[Attachment] ADD  CONSTRAINT [DF__Attachmen__Uniqu__73FA27A5]  DEFAULT (newid()) FOR [UniqueId]
GO
ALTER TABLE [dbo].[AttachmentContent]  WITH CHECK ADD  CONSTRAINT [FK_AttachmentContent_Attachment] FOREIGN KEY([Id])
REFERENCES [dbo].[Attachment] ([Id])
GO
ALTER TABLE [dbo].[AttachmentContent] CHECK CONSTRAINT [FK_AttachmentContent_Attachment]
GO
ALTER TABLE [dbo].[RolePermission]  WITH CHECK ADD  CONSTRAINT [FK_RolePermission_Permission] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permission] ([Id])
GO
ALTER TABLE [dbo].[RolePermission] CHECK CONSTRAINT [FK_RolePermission_Permission]
GO
ALTER TABLE [dbo].[RolePermission]  WITH CHECK ADD  CONSTRAINT [FK_RolePermission_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[RolePermission] CHECK CONSTRAINT [FK_RolePermission_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_BaseInfo] FOREIGN KEY([CountryId])
REFERENCES [share].[BaseInfo] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_BaseInfo]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_BaseInfo1] FOREIGN KEY([CityId])
REFERENCES [share].[BaseInfo] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_BaseInfo1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Department] FOREIGN KEY([DepartmentId])
REFERENCES [organization].[Department] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Department]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
ALTER TABLE [Lab].[Ability]  WITH CHECK ADD  CONSTRAINT [FK_Ability_BaseInfo] FOREIGN KEY([Title])
REFERENCES [share].[BaseInfo] ([Id])
GO
ALTER TABLE [Lab].[Ability] CHECK CONSTRAINT [FK_Ability_BaseInfo]
GO
ALTER TABLE [Lab].[Ability]  WITH CHECK ADD  CONSTRAINT [FK_Ability_Laboratory] FOREIGN KEY([LaboratoryId])
REFERENCES [Lab].[Laboratory] ([Id])
GO
ALTER TABLE [Lab].[Ability] CHECK CONSTRAINT [FK_Ability_Laboratory]
GO
ALTER TABLE [Lab].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_BaseInfo] FOREIGN KEY([EquipmentTypeId])
REFERENCES [share].[BaseInfo] ([Id])
GO
ALTER TABLE [Lab].[Equipment] CHECK CONSTRAINT [FK_Equipment_BaseInfo]
GO
ALTER TABLE [Lab].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_BaseInfo1] FOREIGN KEY([UsageTypeId])
REFERENCES [share].[BaseInfo] ([Id])
GO
ALTER TABLE [Lab].[Equipment] CHECK CONSTRAINT [FK_Equipment_BaseInfo1]
GO
ALTER TABLE [Lab].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_BaseInfo2] FOREIGN KEY([CountryId])
REFERENCES [share].[BaseInfo] ([Id])
GO
ALTER TABLE [Lab].[Equipment] CHECK CONSTRAINT [FK_Equipment_BaseInfo2]
GO
ALTER TABLE [Lab].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_BaseInfo3] FOREIGN KEY([SupplyTypeId])
REFERENCES [share].[BaseInfo] ([Id])
GO
ALTER TABLE [Lab].[Equipment] CHECK CONSTRAINT [FK_Equipment_BaseInfo3]
GO
ALTER TABLE [Lab].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_BaseInfo4] FOREIGN KEY([RelatedSectionId])
REFERENCES [share].[BaseInfo] ([Id])
GO
ALTER TABLE [Lab].[Equipment] CHECK CONSTRAINT [FK_Equipment_BaseInfo4]
GO
ALTER TABLE [Lab].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_BaseInfo5] FOREIGN KEY([EquipmentStatusId])
REFERENCES [share].[BaseInfo] ([Id])
GO
ALTER TABLE [Lab].[Equipment] CHECK CONSTRAINT [FK_Equipment_BaseInfo5]
GO
ALTER TABLE [Lab].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_BaseInfo6] FOREIGN KEY([EmploymentStatusId])
REFERENCES [share].[BaseInfo] ([Id])
GO
ALTER TABLE [Lab].[Equipment] CHECK CONSTRAINT [FK_Equipment_BaseInfo6]
GO
ALTER TABLE [Lab].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Laboratory] FOREIGN KEY([LaboratoryId])
REFERENCES [Lab].[Laboratory] ([Id])
GO
ALTER TABLE [Lab].[Equipment] CHECK CONSTRAINT [FK_Equipment_Laboratory]
GO
ALTER TABLE [Lab].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Ward] FOREIGN KEY([WardId])
REFERENCES [Lab].[Ward] ([Id])
GO
ALTER TABLE [Lab].[Equipment] CHECK CONSTRAINT [FK_Equipment_Ward]
GO
ALTER TABLE [Lab].[EquipmentAbility]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentAbility_Ability] FOREIGN KEY([AbilityId])
REFERENCES [Lab].[Ability] ([Id])
GO
ALTER TABLE [Lab].[EquipmentAbility] CHECK CONSTRAINT [FK_EquipmentAbility_Ability]
GO
ALTER TABLE [Lab].[EquipmentAbility]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentAbility_Equipment] FOREIGN KEY([EquipmentId])
REFERENCES [Lab].[Equipment] ([Id])
GO
ALTER TABLE [Lab].[EquipmentAbility] CHECK CONSTRAINT [FK_EquipmentAbility_Equipment]
GO
ALTER TABLE [Lab].[Laboratory]  WITH CHECK ADD  CONSTRAINT [FK_Laboratory_BaseInfo] FOREIGN KEY([LaboratoryTypeId])
REFERENCES [share].[BaseInfo] ([Id])
GO
ALTER TABLE [Lab].[Laboratory] CHECK CONSTRAINT [FK_Laboratory_BaseInfo]
GO
ALTER TABLE [Lab].[Laboratory]  WITH CHECK ADD  CONSTRAINT [FK_Laboratory_BaseInfo1] FOREIGN KEY([PassiveDefenceId])
REFERENCES [share].[BaseInfo] ([Id])
GO
ALTER TABLE [Lab].[Laboratory] CHECK CONSTRAINT [FK_Laboratory_BaseInfo1]
GO
ALTER TABLE [Lab].[Laboratory]  WITH CHECK ADD  CONSTRAINT [FK_Laboratory_BaseInfo2] FOREIGN KEY([ApprovalAuthorityId])
REFERENCES [share].[BaseInfo] ([Id])
GO
ALTER TABLE [Lab].[Laboratory] CHECK CONSTRAINT [FK_Laboratory_BaseInfo2]
GO
ALTER TABLE [Lab].[Laboratory]  WITH CHECK ADD  CONSTRAINT [FK_Laboratory_BaseInfo3] FOREIGN KEY([StandardStatusId])
REFERENCES [share].[BaseInfo] ([Id])
GO
ALTER TABLE [Lab].[Laboratory] CHECK CONSTRAINT [FK_Laboratory_BaseInfo3]
GO
ALTER TABLE [Lab].[Laboratory]  WITH CHECK ADD  CONSTRAINT [FK_Laboratory_BaseInfo4] FOREIGN KEY([ResearchCenterId])
REFERENCES [share].[BaseInfo] ([Id])
GO
ALTER TABLE [Lab].[Laboratory] CHECK CONSTRAINT [FK_Laboratory_BaseInfo4]
GO
ALTER TABLE [Lab].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Attachment] FOREIGN KEY([Id])
REFERENCES [Lab].[Request] ([Id])
GO
ALTER TABLE [Lab].[Request] CHECK CONSTRAINT [FK_Request_Attachment]
GO
ALTER TABLE [Lab].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Attachment1] FOREIGN KEY([RequestAttachmentId])
REFERENCES [dbo].[Attachment] ([Id])
GO
ALTER TABLE [Lab].[Request] CHECK CONSTRAINT [FK_Request_Attachment1]
GO
ALTER TABLE [Lab].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_BaseInfo] FOREIGN KEY([RequestTypeId])
REFERENCES [share].[BaseInfo] ([Id])
GO
ALTER TABLE [Lab].[Request] CHECK CONSTRAINT [FK_Request_BaseInfo]
GO
ALTER TABLE [Lab].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Laboratory] FOREIGN KEY([LaboratoryId])
REFERENCES [Lab].[Laboratory] ([Id])
GO
ALTER TABLE [Lab].[Request] CHECK CONSTRAINT [FK_Request_Laboratory]
GO
ALTER TABLE [Lab].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [Lab].[Request] CHECK CONSTRAINT [FK_Request_User]
GO
ALTER TABLE [Lab].[RequestIndicator]  WITH CHECK ADD  CONSTRAINT [FK_RequestIndicator_Request] FOREIGN KEY([RequestId])
REFERENCES [Lab].[Request] ([Id])
GO
ALTER TABLE [Lab].[RequestIndicator] CHECK CONSTRAINT [FK_RequestIndicator_Request]
GO
ALTER TABLE [Lab].[RequestService]  WITH CHECK ADD  CONSTRAINT [FK_RequestService_BaseInfo] FOREIGN KEY([ServiceId])
REFERENCES [share].[BaseInfo] ([Id])
GO
ALTER TABLE [Lab].[RequestService] CHECK CONSTRAINT [FK_RequestService_BaseInfo]
GO
ALTER TABLE [Lab].[RequestService]  WITH CHECK ADD  CONSTRAINT [FK_RequestService_Request] FOREIGN KEY([RequestId])
REFERENCES [Lab].[Request] ([Id])
GO
ALTER TABLE [Lab].[RequestService] CHECK CONSTRAINT [FK_RequestService_Request]
GO
ALTER TABLE [Lab].[Ward]  WITH CHECK ADD  CONSTRAINT [FK_Ward_Laboratory] FOREIGN KEY([LaboratoryId])
REFERENCES [Lab].[Laboratory] ([Id])
GO
ALTER TABLE [Lab].[Ward] CHECK CONSTRAINT [FK_Ward_Laboratory]
GO
ALTER TABLE [organization].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_BaseInfo] FOREIGN KEY([DepartmentTypeId])
REFERENCES [share].[BaseInfo] ([Id])
GO
ALTER TABLE [organization].[Department] CHECK CONSTRAINT [FK_Department_BaseInfo]
GO
ALTER TABLE [organization].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Department] FOREIGN KEY([ParentId])
REFERENCES [organization].[Department] ([Id])
GO
ALTER TABLE [organization].[Department] CHECK CONSTRAINT [FK_Department_Department]
GO
ALTER TABLE [share].[BaseInfo]  WITH CHECK ADD  CONSTRAINT [FK_BaseInfo_BaseTableType] FOREIGN KEY([BaseTableTypeId])
REFERENCES [share].[BaseTableType] ([Id])
GO
ALTER TABLE [share].[BaseInfo] CHECK CONSTRAINT [FK_BaseInfo_BaseTableType]
GO
USE [master]
GO
ALTER DATABASE [Shaa] SET  READ_WRITE 
GO
