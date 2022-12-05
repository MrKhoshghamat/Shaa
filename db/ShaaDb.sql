USE [master]
GO
/****** Object:  Database [Shaa]    Script Date: 12/5/2022 8:39:32 PM ******/
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
/****** Object:  Schema [Lab]    Script Date: 12/5/2022 8:39:32 PM ******/
CREATE SCHEMA [Lab]
GO
/****** Object:  Schema [organization]    Script Date: 12/5/2022 8:39:32 PM ******/
CREATE SCHEMA [organization]
GO
/****** Object:  Schema [Req]    Script Date: 12/5/2022 8:39:32 PM ******/
CREATE SCHEMA [Req]
GO
/****** Object:  Schema [share]    Script Date: 12/5/2022 8:39:32 PM ******/
CREATE SCHEMA [share]
GO
/****** Object:  Table [dbo].[Attachment]    Script Date: 12/5/2022 8:39:32 PM ******/
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
/****** Object:  Table [dbo].[AttachmentContent]    Script Date: 12/5/2022 8:39:32 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 12/5/2022 8:39:32 PM ******/
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
/****** Object:  Table [Lab].[Ability]    Script Date: 12/5/2022 8:39:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lab].[Ability](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
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
/****** Object:  Table [Lab].[Equipment]    Script Date: 12/5/2022 8:39:32 PM ******/
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
/****** Object:  Table [Lab].[EquipmentAbility]    Script Date: 12/5/2022 8:39:32 PM ******/
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
/****** Object:  Table [Lab].[Laboratory]    Script Date: 12/5/2022 8:39:32 PM ******/
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
/****** Object:  Table [Lab].[Request]    Script Date: 12/5/2022 8:39:32 PM ******/
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
/****** Object:  Table [Lab].[RequestIndicator]    Script Date: 12/5/2022 8:39:32 PM ******/
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
/****** Object:  Table [Lab].[RequestService]    Script Date: 12/5/2022 8:39:32 PM ******/
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
/****** Object:  Table [Lab].[Ward]    Script Date: 12/5/2022 8:39:32 PM ******/
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
/****** Object:  Table [organization].[Department]    Script Date: 12/5/2022 8:39:32 PM ******/
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
/****** Object:  Table [share].[BaseInfo]    Script Date: 12/5/2022 8:39:32 PM ******/
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
/****** Object:  Table [share].[BaseTableType]    Script Date: 12/5/2022 8:39:32 PM ******/
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
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [PhoneNumber], [Email], [NationalNo], [Description], [Password], [BirthDate], [CountryId], [CityId], [IsEmailConfirmed], [IsAdmin], [IsBanned], [EmailActivationCode], [DepartmentId], [IsDeleted], [CreationDate]) VALUES (N'82a76dd9-370b-4e5c-a687-90b8ea6375ca', N'نسترن', N'پورموسی', NULL, NULL, N'0020074271', NULL, N'2F-38-5E-55-2E-46-88-43-9B-49-8E-36-84-29-70-F5', NULL, NULL, NULL, 0, 0, 0, N'5dc5b1d10be24325a313f614a122d4f7', NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [PhoneNumber], [Email], [NationalNo], [Description], [Password], [BirthDate], [CountryId], [CityId], [IsEmailConfirmed], [IsAdmin], [IsBanned], [EmailActivationCode], [DepartmentId], [IsDeleted], [CreationDate]) VALUES (N'8e152918-6dc6-422e-9c68-9d3f83cb0327', N'محمد', N'پیرعلی', NULL, NULL, N'0019525401', NULL, N'2F-38-5E-55-2E-46-88-43-9B-49-8E-36-84-29-70-F5', NULL, NULL, NULL, 0, 0, 0, N'bb950f5587a144c1bf87ce3f1061994e', NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [PhoneNumber], [Email], [NationalNo], [Description], [Password], [BirthDate], [CountryId], [CityId], [IsEmailConfirmed], [IsAdmin], [IsBanned], [EmailActivationCode], [DepartmentId], [IsDeleted], [CreationDate]) VALUES (N'60a3387f-a29d-4ca3-b5cd-f91a7449e905', N'محمدرضا', N'خوش قامت', NULL, NULL, N'0019525400', NULL, N'2F-38-5E-55-2E-46-88-43-9B-49-8E-36-84-29-70-F5', NULL, NULL, NULL, 0, 0, 0, N'3c4d8d2fe01d407d81ef22e3f64ac1f0', NULL, NULL, NULL)
GO
INSERT [Lab].[Ability] ([Id], [Title], [LaboratoryId], [FurtherDetailsAndProcedure], [DescriptionOfConsumables], [ConsumableCost], [HumanResourceCost], [OtherCost], [ImplementationCost], [ImplementationTime], [FileAttachment]) VALUES (N'66463d41-c9f7-4895-bbe8-152971c4163d', N'42', N'bffcb778-f05a-4e2f-a5a4-05ad2d9c91a4', NULL, N'مواد اولیه', 5000000000, 500000000, 5000000000, 500000000000, CAST(N'2022-11-24T00:00:00.000' AS DateTime), N'/content/lab/')
INSERT [Lab].[Ability] ([Id], [Title], [LaboratoryId], [FurtherDetailsAndProcedure], [DescriptionOfConsumables], [ConsumableCost], [HumanResourceCost], [OtherCost], [ImplementationCost], [ImplementationTime], [FileAttachment]) VALUES (N'b27fdcdf-f8c1-4c8b-87d0-d46467994c37', N'43', N'bffcb778-f05a-4e2f-a5a4-05ad2d9c91a4', NULL, N'مواد اولیه', 5000000000, 500000000, 5000000000, 500000000000, CAST(N'2022-11-23T00:00:00.000' AS DateTime), N'/content/lab/')
INSERT [Lab].[Ability] ([Id], [Title], [LaboratoryId], [FurtherDetailsAndProcedure], [DescriptionOfConsumables], [ConsumableCost], [HumanResourceCost], [OtherCost], [ImplementationCost], [ImplementationTime], [FileAttachment]) VALUES (N'30817d2a-61e9-4d41-a51a-fe54929b07bb', N'40', N'b455da73-dbab-4092-b356-2068b4a5de8a', NULL, N'مواد اولیه', 5000000000, 500000000, 5000000000, 500000000000, CAST(N'2022-12-21T00:00:00.000' AS DateTime), N'/content/lab/')
GO
INSERT [Lab].[Equipment] ([Id], [LaboratoryId], [EquipmentTypeId], [Title], [PersianTitle], [GeneralTechnicalSpecification], [EquipmentUsage], [UsageTypeId], [CountryId], [CompanyName], [Model], [SerialNumber], [InstallationDate], [ExploitationDate], [SupplyTypeId], [WardId], [EquipmentCost], [EquipmentImage], [RelatedSectionId], [Baitul-Mal No], [EquipmentStatusId], [EmploymentStatusId], [PurchasePrice/Construction], [IsNeededToCalibrate], [LastCalibrationDate], [WarrantyExpirationDate], [InsuranceExpirationDate], [SpecialCharacteristic], [TitlesAttachedToEquipment]) VALUES (N'f559b4aa-e91b-4b7d-ae8a-0d31ead0260a', N'bffcb778-f05a-4e2f-a5a4-05ad2d9c91a4', 20, N'Giri', N'گیری', N'مشخصات', N'بدون کاربرد', 25, 28, N'asgasg', N'khijigug', N'1234567890asdgsadg???????', CAST(N'2022-11-29T00:00:00.000' AS DateTime), CAST(N'2022-12-07T00:00:00.000' AS DateTime), 47, N'770742dc-13f4-46ca-8c9f-6a5e1c8ba17f', 50000000, N'/content/lab/', 23, N'2564782364966', 59, 65, N'65,465,445,644', 1, CAST(N'2022-11-29T00:00:00.000' AS DateTime), CAST(N'2022-11-29T00:00:00.000' AS DateTime), CAST(N'2022-11-22T00:00:00.000' AS DateTime), N'شسیلشسیل', N'')
INSERT [Lab].[Equipment] ([Id], [LaboratoryId], [EquipmentTypeId], [Title], [PersianTitle], [GeneralTechnicalSpecification], [EquipmentUsage], [UsageTypeId], [CountryId], [CompanyName], [Model], [SerialNumber], [InstallationDate], [ExploitationDate], [SupplyTypeId], [WardId], [EquipmentCost], [EquipmentImage], [RelatedSectionId], [Baitul-Mal No], [EquipmentStatusId], [EmploymentStatusId], [PurchasePrice/Construction], [IsNeededToCalibrate], [LastCalibrationDate], [WarrantyExpirationDate], [InsuranceExpirationDate], [SpecialCharacteristic], [TitlesAttachedToEquipment]) VALUES (N'2034e4ee-d6f9-4e7c-a319-2ef09a8d90b2', N'b455da73-dbab-4092-b356-2068b4a5de8a', 17, N'تجهیز یک', N'فارسی', N'مشخصات', N'کاربرد', 26, 27, N'پوگقد', N'asdg', N'1258224569877702245', CAST(N'2022-11-16T00:00:00.000' AS DateTime), CAST(N'2022-11-02T00:00:00.000' AS DateTime), 46, N'fb919d3a-813a-4f89-adbe-137580ac79cb', 50000000, N'/content/lab/', 27, N'465466', 59, 65, N'65,465,445,644', 1, CAST(N'2022-11-03T00:00:00.000' AS DateTime), CAST(N'2022-10-26T00:00:00.000' AS DateTime), CAST(N'2022-10-26T00:00:00.000' AS DateTime), N'شسیبال', N'شسیل')
INSERT [Lab].[Equipment] ([Id], [LaboratoryId], [EquipmentTypeId], [Title], [PersianTitle], [GeneralTechnicalSpecification], [EquipmentUsage], [UsageTypeId], [CountryId], [CompanyName], [Model], [SerialNumber], [InstallationDate], [ExploitationDate], [SupplyTypeId], [WardId], [EquipmentCost], [EquipmentImage], [RelatedSectionId], [Baitul-Mal No], [EquipmentStatusId], [EmploymentStatusId], [PurchasePrice/Construction], [IsNeededToCalibrate], [LastCalibrationDate], [WarrantyExpirationDate], [InsuranceExpirationDate], [SpecialCharacteristic], [TitlesAttachedToEquipment]) VALUES (N'eb4d06fd-b892-4578-b386-47c96857d0d2', N'9145a574-3cb2-494f-bcdc-34f4807e3c00', 18, N'English', N'فارسی', N'مشخصات', N'کاربرد', 25, 30, N'asgasg', N'asdg', N'asgsags', CAST(N'2022-11-02T00:00:00.000' AS DateTime), CAST(N'2022-11-01T00:00:00.000' AS DateTime), 46, N'b9474747-6030-4f5e-a361-8d4907356223', 50000000, N'/content/lab/', 19, N'465466', 58, 65, N'65,465,445,644', 0, CAST(N'2022-11-09T00:00:00.000' AS DateTime), CAST(N'2022-11-03T00:00:00.000' AS DateTime), CAST(N'2022-10-25T00:00:00.000' AS DateTime), N'asdg', N'asfg')
INSERT [Lab].[Equipment] ([Id], [LaboratoryId], [EquipmentTypeId], [Title], [PersianTitle], [GeneralTechnicalSpecification], [EquipmentUsage], [UsageTypeId], [CountryId], [CompanyName], [Model], [SerialNumber], [InstallationDate], [ExploitationDate], [SupplyTypeId], [WardId], [EquipmentCost], [EquipmentImage], [RelatedSectionId], [Baitul-Mal No], [EquipmentStatusId], [EmploymentStatusId], [PurchasePrice/Construction], [IsNeededToCalibrate], [LastCalibrationDate], [WarrantyExpirationDate], [InsuranceExpirationDate], [SpecialCharacteristic], [TitlesAttachedToEquipment]) VALUES (N'5a400c9b-4c32-48bb-a0f7-5123f99c92f8', N'd680cd7e-f149-4126-9983-0c0020c422e0', 20, N'Englishoiii', N'تجهیز یک', N'مشخصات', N'کاربرد خاصی ندارد', 25, 32, N'sagas', N'KM456GH', N'1234567890asdgsadg', CAST(N'2022-11-09T00:00:00.000' AS DateTime), CAST(N'2022-11-02T00:00:00.000' AS DateTime), 46, N'a50685f9-8ec5-4f66-b1c2-fb6573732fd7', 50000000, N'/content/lab/', 34, N'2564782364966', 61, 68, N'65,465,445,644', 1, CAST(N'2022-11-02T00:00:00.000' AS DateTime), CAST(N'2022-11-09T00:00:00.000' AS DateTime), CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'خاص', N'')
INSERT [Lab].[Equipment] ([Id], [LaboratoryId], [EquipmentTypeId], [Title], [PersianTitle], [GeneralTechnicalSpecification], [EquipmentUsage], [UsageTypeId], [CountryId], [CompanyName], [Model], [SerialNumber], [InstallationDate], [ExploitationDate], [SupplyTypeId], [WardId], [EquipmentCost], [EquipmentImage], [RelatedSectionId], [Baitul-Mal No], [EquipmentStatusId], [EmploymentStatusId], [PurchasePrice/Construction], [IsNeededToCalibrate], [LastCalibrationDate], [WarrantyExpirationDate], [InsuranceExpirationDate], [SpecialCharacteristic], [TitlesAttachedToEquipment]) VALUES (N'd1d18f09-4811-49cd-b35c-679d4b3cccf6', N'd680cd7e-f149-4126-9983-0c0020c422e0', 18, N'Equip Twoasdgas', N'تجهیز یک', N'باند پایه', N'asdgsag', 24, 32, N'asgasg', N'6556419asdgas', N'asdgasgasgasgasgsagasgasgsagasgasg', CAST(N'2022-11-22T00:00:00.000' AS DateTime), CAST(N'2022-11-30T00:00:00.000' AS DateTime), 46, N'ff59b42e-2424-4227-acd8-4727f0e4e554', 50000000, N'/content/lab/', NULL, N'2564782364966asdgsag', 60, 66, N'65,465,445,644', 1, CAST(N'2022-11-29T00:00:00.000' AS DateTime), CAST(N'2022-11-30T00:00:00.000' AS DateTime), CAST(N'2022-12-07T00:00:00.000' AS DateTime), N'asdgsag', N'')
INSERT [Lab].[Equipment] ([Id], [LaboratoryId], [EquipmentTypeId], [Title], [PersianTitle], [GeneralTechnicalSpecification], [EquipmentUsage], [UsageTypeId], [CountryId], [CompanyName], [Model], [SerialNumber], [InstallationDate], [ExploitationDate], [SupplyTypeId], [WardId], [EquipmentCost], [EquipmentImage], [RelatedSectionId], [Baitul-Mal No], [EquipmentStatusId], [EmploymentStatusId], [PurchasePrice/Construction], [IsNeededToCalibrate], [LastCalibrationDate], [WarrantyExpirationDate], [InsuranceExpirationDate], [SpecialCharacteristic], [TitlesAttachedToEquipment]) VALUES (N'30a7d54e-5939-4b5d-84c2-68ee902d5496', N'9145a574-3cb2-494f-bcdc-34f4807e3c00', 17, N'Englishoiii', N'فارسی', N'مشخصات', N'کاربرد', 25, 32, N'asgasg', N'asdg', N'adgasgasgasgasg', CAST(N'2022-10-26T00:00:00.000' AS DateTime), CAST(N'2022-10-25T00:00:00.000' AS DateTime), 47, N'b9474747-6030-4f5e-a361-8d4907356223', 50000000, N'/content/lab/', 19, N'465466', 58, 64, N'65,465,445,644', 1, CAST(N'2022-11-02T00:00:00.000' AS DateTime), CAST(N'2022-11-02T00:00:00.000' AS DateTime), CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'ascgasg', N'')
INSERT [Lab].[Equipment] ([Id], [LaboratoryId], [EquipmentTypeId], [Title], [PersianTitle], [GeneralTechnicalSpecification], [EquipmentUsage], [UsageTypeId], [CountryId], [CompanyName], [Model], [SerialNumber], [InstallationDate], [ExploitationDate], [SupplyTypeId], [WardId], [EquipmentCost], [EquipmentImage], [RelatedSectionId], [Baitul-Mal No], [EquipmentStatusId], [EmploymentStatusId], [PurchasePrice/Construction], [IsNeededToCalibrate], [LastCalibrationDate], [WarrantyExpirationDate], [InsuranceExpirationDate], [SpecialCharacteristic], [TitlesAttachedToEquipment]) VALUES (N'd9167035-eae5-42a8-b25f-8b5ddb66c7ad', N'bffcb778-f05a-4e2f-a5a4-05ad2d9c91a4', 17, N'Equip One', N'تجهیز یک', N'مشخصات', N'کاربرد', 25, 32, N'پوگقد', N'asdg', N'1234567890', CAST(N'2022-11-09T00:00:00.000' AS DateTime), CAST(N'2022-10-25T00:00:00.000' AS DateTime), 47, N'770742dc-13f4-46ca-8c9f-6a5e1c8ba17f', 50000000, N'/content/lab/', 23, N'465466', 58, 64, N'65,465,445,644', 1, CAST(N'2022-10-31T00:00:00.000' AS DateTime), CAST(N'2022-11-02T00:00:00.000' AS DateTime), CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'xdcbnv', N'')
INSERT [Lab].[Equipment] ([Id], [LaboratoryId], [EquipmentTypeId], [Title], [PersianTitle], [GeneralTechnicalSpecification], [EquipmentUsage], [UsageTypeId], [CountryId], [CompanyName], [Model], [SerialNumber], [InstallationDate], [ExploitationDate], [SupplyTypeId], [WardId], [EquipmentCost], [EquipmentImage], [RelatedSectionId], [Baitul-Mal No], [EquipmentStatusId], [EmploymentStatusId], [PurchasePrice/Construction], [IsNeededToCalibrate], [LastCalibrationDate], [WarrantyExpirationDate], [InsuranceExpirationDate], [SpecialCharacteristic], [TitlesAttachedToEquipment]) VALUES (N'464075ce-6818-4c19-9005-dfda9d939ea7', N'a72e2c7a-c740-4de3-a7d1-a0683b44a741', 17, N'English Gireh', N'گیره', N'باند پایه', N'کاربرد خاصی ندارد', 24, 28, N'Benz', N'KM456GH', N'125469325468522456', CAST(N'2022-10-24T00:00:00.000' AS DateTime), CAST(N'2022-11-09T00:00:00.000' AS DateTime), 46, N'8836ddf9-fbd8-4c7f-a56a-51300860b3b1', 50000000, N'/content/lab/', 30, N'2564782364966', 59, 65, N'65,465,445,644', 1, CAST(N'2022-11-02T00:00:00.000' AS DateTime), CAST(N'2022-11-03T00:00:00.000' AS DateTime), CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'ویژگی خاصی ندارد', N'')
INSERT [Lab].[Equipment] ([Id], [LaboratoryId], [EquipmentTypeId], [Title], [PersianTitle], [GeneralTechnicalSpecification], [EquipmentUsage], [UsageTypeId], [CountryId], [CompanyName], [Model], [SerialNumber], [InstallationDate], [ExploitationDate], [SupplyTypeId], [WardId], [EquipmentCost], [EquipmentImage], [RelatedSectionId], [Baitul-Mal No], [EquipmentStatusId], [EmploymentStatusId], [PurchasePrice/Construction], [IsNeededToCalibrate], [LastCalibrationDate], [WarrantyExpirationDate], [InsuranceExpirationDate], [SpecialCharacteristic], [TitlesAttachedToEquipment]) VALUES (N'317aa35f-ac4f-43e8-980b-e128d8c3303e', N'b455da73-dbab-4092-b356-2068b4a5de8a', 18, N'Equip Two', N'تجهیز دو', N'مشخصات', N'کاربرد', 26, 28, N'پوگقد', N'6556419', N'kasgfvbibasigfkasdkjgfajsg', CAST(N'2022-11-02T00:00:00.000' AS DateTime), CAST(N'2022-10-31T00:00:00.000' AS DateTime), 46, N'52cdf934-a61b-47ae-927a-e3facbafb67e', 50000000, N'/content/lab/', 28, N'465466', 60, 67, N'65,465,445,644', 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), CAST(N'2022-11-09T00:00:00.000' AS DateTime), CAST(N'2022-11-09T00:00:00.000' AS DateTime), N'ویژگی', N'')
GO
SET IDENTITY_INSERT [Lab].[EquipmentAbility] ON 

INSERT [Lab].[EquipmentAbility] ([Id], [AbilityId], [EquipmentId]) VALUES (8, N'b27fdcdf-f8c1-4c8b-87d0-d46467994c37', N'f559b4aa-e91b-4b7d-ae8a-0d31ead0260a')
INSERT [Lab].[EquipmentAbility] ([Id], [AbilityId], [EquipmentId]) VALUES (9, N'66463d41-c9f7-4895-bbe8-152971c4163d', N'd9167035-eae5-42a8-b25f-8b5ddb66c7ad')
INSERT [Lab].[EquipmentAbility] ([Id], [AbilityId], [EquipmentId]) VALUES (10008, N'30817d2a-61e9-4d41-a51a-fe54929b07bb', N'2034e4ee-d6f9-4e7c-a319-2ef09a8d90b2')
SET IDENTITY_INSERT [Lab].[EquipmentAbility] OFF
GO
INSERT [Lab].[Laboratory] ([Id], [Title], [LaboratoryTypeId], [PassiveDefenceId], [ApprovalAuthorityId], [StandardStatusId], [ResearchCenterId], [PhoneNumber], [ImagePath], [Address], [Description]) VALUES (N'bffcb778-f05a-4e2f-a5a4-05ad2d9c91a4', N'آزمایشگاه سوم', 12, 2, 4, 15, 6, N'09212440217', N'DefaultLabImage.png', N'تهران', N'توضیحات')
INSERT [Lab].[Laboratory] ([Id], [Title], [LaboratoryTypeId], [PassiveDefenceId], [ApprovalAuthorityId], [StandardStatusId], [ResearchCenterId], [PhoneNumber], [ImagePath], [Address], [Description]) VALUES (N'd680cd7e-f149-4126-9983-0c0020c422e0', N'آزمایشگاه خوش', 13, 3, 5, 16, 8, N'09212434583', N'DefaultLabImage.png', N'تهران', N'')
INSERT [Lab].[Laboratory] ([Id], [Title], [LaboratoryTypeId], [PassiveDefenceId], [ApprovalAuthorityId], [StandardStatusId], [ResearchCenterId], [PhoneNumber], [ImagePath], [Address], [Description]) VALUES (N'b455da73-dbab-4092-b356-2068b4a5de8a', N'آزمایشگاه هشتم', 13, 1, 4, 16, 7, N'(021) 77 47 5047', N'DefaultLabImage.png', N'تهران', N'توضیحات')
INSERT [Lab].[Laboratory] ([Id], [Title], [LaboratoryTypeId], [PassiveDefenceId], [ApprovalAuthorityId], [StandardStatusId], [ResearchCenterId], [PhoneNumber], [ImagePath], [Address], [Description]) VALUES (N'9cdba302-1364-4167-b510-2e7c20b77c72', N'آزمایشگاه مدار ECU', 13, 1, 4, 15, 7, N'09212440325', N'DefaultLabImage.png', N'تهران', N'')
INSERT [Lab].[Laboratory] ([Id], [Title], [LaboratoryTypeId], [PassiveDefenceId], [ApprovalAuthorityId], [StandardStatusId], [ResearchCenterId], [PhoneNumber], [ImagePath], [Address], [Description]) VALUES (N'9145a574-3cb2-494f-bcdc-34f4807e3c00', N'آزمایشگاه اول', 11, 1, 4, 15, 6, N'(021) 77 47 5647', N'DefaultLabImage.png', N'asdg', N'')
INSERT [Lab].[Laboratory] ([Id], [Title], [LaboratoryTypeId], [PassiveDefenceId], [ApprovalAuthorityId], [StandardStatusId], [ResearchCenterId], [PhoneNumber], [ImagePath], [Address], [Description]) VALUES (N'09334c01-665a-4df0-9021-5610760128f9', N'آزمایشگاه دوم', 11, 1, 4, 14, 6, N'09212440317', N'DefaultLabImage.png', N'jhghgfh', N'')
INSERT [Lab].[Laboratory] ([Id], [Title], [LaboratoryTypeId], [PassiveDefenceId], [ApprovalAuthorityId], [StandardStatusId], [ResearchCenterId], [PhoneNumber], [ImagePath], [Address], [Description]) VALUES (N'a72e2c7a-c740-4de3-a7d1-a0683b44a741', N'آزمایشگاه آکوستیک سیگنال', 13, 2, 5, 15, 8, N'02133745654', N'DefaultLabImage.png', N'تهران', N'توضیحات تستی')
INSERT [Lab].[Laboratory] ([Id], [Title], [LaboratoryTypeId], [PassiveDefenceId], [ApprovalAuthorityId], [StandardStatusId], [ResearchCenterId], [PhoneNumber], [ImagePath], [Address], [Description]) VALUES (N'243a2188-1daa-4573-b7a6-e76d56b14068', N'آزمایشگاه جدید', 13, 2, 4, 16, 7, N'09212456821', N'DefaultLabImage.png', N'تهران', N'')
INSERT [Lab].[Laboratory] ([Id], [Title], [LaboratoryTypeId], [PassiveDefenceId], [ApprovalAuthorityId], [StandardStatusId], [ResearchCenterId], [PhoneNumber], [ImagePath], [Address], [Description]) VALUES (N'b6eeeeb1-7fea-458e-983e-f1eeb7d816a5', N'آزمایشگاه سوم', 12, 1, 4, 14, 6, N'09212440319', N'DefaultLabImage.png', N'تتهرانمن', N'')
GO
INSERT [Lab].[Request] ([Id], [LaboratoryId], [UserId], [UserName], [IndicatorNo], [Title], [Description], [RequestTypeId], [LetterPath], [RequestDate], [TraceCode], [Status], [DescForCheck], [RequestAttachmentId]) VALUES (N'a1268588-8480-47ef-874d-1b30c8648034', N'9145a574-3cb2-494f-bcdc-34f4807e3c00', N'60a3387f-a29d-4ca3-b5cd-f91a7449e905', N'محمدرضا خوش قامت', N'32323', N'saasfsa', N'asfasf', 70, N'DefaultRequestPath.docs', CAST(N'2022-11-26T00:00:00.000' AS DateTime), N'1401090532323', 1, NULL, NULL)
INSERT [Lab].[Request] ([Id], [LaboratoryId], [UserId], [UserName], [IndicatorNo], [Title], [Description], [RequestTypeId], [LetterPath], [RequestDate], [TraceCode], [Status], [DescForCheck], [RequestAttachmentId]) VALUES (N'279f5ef0-55a8-4431-9216-3af6d5868809', N'9cdba302-1364-4167-b510-2e7c20b77c72', N'82a76dd9-370b-4e5c-a687-90b8ea6375ca', N'نسترن پورموسی', N'21334', N'تست ترانزیستور کوئل', N'لطفا پس از بررسی های مربوطه تست را انجام دهید', 70, N'DefaultRequestPath.docs', CAST(N'2022-10-26T00:00:00.000' AS DateTime), N'1401090621334', 3, N'بررسی انجام گردید و تست مربوطه در اسرع وقت به فاز عملیاتی منتقل میگردد', NULL)
INSERT [Lab].[Request] ([Id], [LaboratoryId], [UserId], [UserName], [IndicatorNo], [Title], [Description], [RequestTypeId], [LetterPath], [RequestDate], [TraceCode], [Status], [DescForCheck], [RequestAttachmentId]) VALUES (N'341db4d3-398a-4a0d-8e6a-4b483b71aa19', N'b455da73-dbab-4092-b356-2068b4a5de8a', N'60a3387f-a29d-4ca3-b5cd-f91a7449e905', N'محمدرضا خوش قامت', N'45856', N'asvsv', N'savsav', 70, N'DefaultRequestPath.docs', CAST(N'2022-11-26T00:00:00.000' AS DateTime), N'1401090545856', 1, NULL, NULL)
INSERT [Lab].[Request] ([Id], [LaboratoryId], [UserId], [UserName], [IndicatorNo], [Title], [Description], [RequestTypeId], [LetterPath], [RequestDate], [TraceCode], [Status], [DescForCheck], [RequestAttachmentId]) VALUES (N'e621ddbd-63f5-4cd0-a274-51e954b1325d', N'243a2188-1daa-4573-b7a6-e76d56b14068', N'82a76dd9-370b-4e5c-a687-90b8ea6375ca', N'نسترن پورموسی', N'45874', N'ssvsvsv', N'svsvsv', 70, N'DefaultRequestPath.docs', CAST(N'2022-11-26T00:00:00.000' AS DateTime), N'1401090545874', 4, N'vsdbsdb', NULL)
INSERT [Lab].[Request] ([Id], [LaboratoryId], [UserId], [UserName], [IndicatorNo], [Title], [Description], [RequestTypeId], [LetterPath], [RequestDate], [TraceCode], [Status], [DescForCheck], [RequestAttachmentId]) VALUES (N'39959453-2705-4170-99e3-8ee3b0746a83', N'9cdba302-1364-4167-b510-2e7c20b77c72', N'82a76dd9-370b-4e5c-a687-90b8ea6375ca', N'نسترن پورموسی', N'45887', N'تست ترانزیستور', N'ترانزیستور ', 70, N'DefaultRequestPath.docs', CAST(N'2022-10-26T00:00:00.000' AS DateTime), N'1401091145887', 2, N'با توجه به توانمتدیهای آزمایشگاه انجام میگردد', NULL)
GO
SET IDENTITY_INSERT [Lab].[RequestIndicator] ON 

INSERT [Lab].[RequestIndicator] ([Id], [RequestId], [IndicatorNo], [TraceCode]) VALUES (20021, N'e621ddbd-63f5-4cd0-a274-51e954b1325d', N'45874', N'1401090545874')
INSERT [Lab].[RequestIndicator] ([Id], [RequestId], [IndicatorNo], [TraceCode]) VALUES (20022, N'a1268588-8480-47ef-874d-1b30c8648034', N'32323', N'1401090532323')
INSERT [Lab].[RequestIndicator] ([Id], [RequestId], [IndicatorNo], [TraceCode]) VALUES (20023, N'341db4d3-398a-4a0d-8e6a-4b483b71aa19', N'45856', N'1401090545856')
INSERT [Lab].[RequestIndicator] ([Id], [RequestId], [IndicatorNo], [TraceCode]) VALUES (20024, N'279f5ef0-55a8-4431-9216-3af6d5868809', N'21334', N'1401090621334')
INSERT [Lab].[RequestIndicator] ([Id], [RequestId], [IndicatorNo], [TraceCode]) VALUES (20025, N'39959453-2705-4170-99e3-8ee3b0746a83', N'45887', N'1401091145887')
SET IDENTITY_INSERT [Lab].[RequestIndicator] OFF
GO
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'969aed84-2dcd-472b-9a7d-1125b70f74e6', N'd680cd7e-f149-4126-9983-0c0020c422e0', N'بخش 2')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'f7c64f4f-e77a-4487-8616-11c81de8bb34', N'9cdba302-1364-4167-b510-2e7c20b77c72', N'بخش 1')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'13aae373-c2c3-46ca-a2f3-12ff4f60921e', N'bffcb778-f05a-4e2f-a5a4-05ad2d9c91a4', N'بخش 5')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'fb919d3a-813a-4f89-adbe-137580ac79cb', N'b455da73-dbab-4092-b356-2068b4a5de8a', N'بخش اول')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'1754cfe5-c8d1-4cf5-a985-1757c37392c8', N'a72e2c7a-c740-4de3-a7d1-a0683b44a741', N'بخش 1')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'8a08f9f3-879b-4595-b5a1-1824cf8c4d11', N'b6eeeeb1-7fea-458e-983e-f1eeb7d816a5', N'بخش 1')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'84a77d39-5df7-4241-80d4-34f750ee0634', N'd680cd7e-f149-4126-9983-0c0020c422e0', N'بخش 1')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'4b108b32-2aa2-4867-8220-3e4afd350c79', N'bffcb778-f05a-4e2f-a5a4-05ad2d9c91a4', N'بخش 10')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'ff59b42e-2424-4227-acd8-4727f0e4e554', N'd680cd7e-f149-4126-9983-0c0020c422e0', N'بخش 4')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'93289d26-17ab-423f-8ac0-4ab47c1d2ddb', N'b455da73-dbab-4092-b356-2068b4a5de8a', N'بخش چهارم')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'8836ddf9-fbd8-4c7f-a56a-51300860b3b1', N'a72e2c7a-c740-4de3-a7d1-a0683b44a741', N'بخش 2')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'3aa1ae98-310c-49a4-8994-5c067213897c', N'a72e2c7a-c740-4de3-a7d1-a0683b44a741', N'بخش 3')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'25a85860-1354-4b08-9c42-615a13eddd36', N'243a2188-1daa-4573-b7a6-e76d56b14068', N'بخش 1')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'28df5828-e97a-4085-99e3-648381297342', N'bffcb778-f05a-4e2f-a5a4-05ad2d9c91a4', N'بخش 6')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'770742dc-13f4-46ca-8c9f-6a5e1c8ba17f', N'bffcb778-f05a-4e2f-a5a4-05ad2d9c91a4', N'بخش 8')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'fbe35fd9-414b-4364-8635-7b15ad9cbc03', N'243a2188-1daa-4573-b7a6-e76d56b14068', N'بخش 2')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'b9474747-6030-4f5e-a361-8d4907356223', N'9145a574-3cb2-494f-bcdc-34f4807e3c00', N'بخش 2')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'5f78c25d-98e7-4cf9-aa87-d7bfbb0d0738', N'9cdba302-1364-4167-b510-2e7c20b77c72', N'ساخت برد')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'ce764907-a48d-4847-8719-da5a7cbb64e1', N'9145a574-3cb2-494f-bcdc-34f4807e3c00', N'بخش 1')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'52cdf934-a61b-47ae-927a-e3facbafb67e', N'b455da73-dbab-4092-b356-2068b4a5de8a', N'بخش دوم')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'2426073e-2383-411f-9bcc-e40c73275804', N'bffcb778-f05a-4e2f-a5a4-05ad2d9c91a4', N'بخش 9')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'3b6ab069-b94f-4019-b875-f1793c85cbb8', N'9cdba302-1364-4167-b510-2e7c20b77c72', N'تست ایسو')
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title]) VALUES (N'a50685f9-8ec5-4f66-b1c2-fb6573732fd7', N'd680cd7e-f149-4126-9983-0c0020c422e0', N'بخش 3')
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
