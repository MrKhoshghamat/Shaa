USE [master]
GO
/****** Object:  Database [Shaa]    Script Date: 11/19/2022 9:22:17 PM ******/
CREATE DATABASE [Shaa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sha', FILENAME = N'E:\Database\Shaa\Sha.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sha_log', FILENAME = N'E:\Database\Shaa\Sha_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Schema [Lab]    Script Date: 11/19/2022 9:22:18 PM ******/
CREATE SCHEMA [Lab]
GO
/****** Object:  Schema [organization]    Script Date: 11/19/2022 9:22:18 PM ******/
CREATE SCHEMA [organization]
GO
/****** Object:  Schema [Req]    Script Date: 11/19/2022 9:22:18 PM ******/
CREATE SCHEMA [Req]
GO
/****** Object:  Schema [share]    Script Date: 11/19/2022 9:22:18 PM ******/
CREATE SCHEMA [share]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/19/2022 9:22:18 PM ******/
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
/****** Object:  Table [Lab].[Ability]    Script Date: 11/19/2022 9:22:18 PM ******/
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
/****** Object:  Table [Lab].[Equipment]    Script Date: 11/19/2022 9:22:18 PM ******/
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
	[Row] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lab].[EquipmentAbility]    Script Date: 11/19/2022 9:22:18 PM ******/
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
/****** Object:  Table [Lab].[Laboratory]    Script Date: 11/19/2022 9:22:18 PM ******/
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
	[Row] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Laboratory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lab].[Request]    Script Date: 11/19/2022 9:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lab].[Request](
	[Id] [uniqueidentifier] NOT NULL,
	[LaboratoryId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[IndicatorNo] [nvarchar](255) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[RequestTypeId] [int] NOT NULL,
	[LetterPath] [varchar](255) NULL,
	[RequestDate] [datetime] NOT NULL,
	[TraceCode] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Lab].[RequestIndicator]    Script Date: 11/19/2022 9:22:18 PM ******/
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
/****** Object:  Table [Lab].[Ward]    Script Date: 11/19/2022 9:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lab].[Ward](
	[Id] [uniqueidentifier] NOT NULL,
	[LaboratoryId] [uniqueidentifier] NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Row] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Ward] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [organization].[Department]    Script Date: 11/19/2022 9:22:18 PM ******/
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
/****** Object:  Table [share].[BaseInfo]    Script Date: 11/19/2022 9:22:18 PM ******/
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
/****** Object:  Table [share].[BaseTableType]    Script Date: 11/19/2022 9:22:18 PM ******/
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
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [PhoneNumber], [Email], [NationalNo], [Description], [Password], [BirthDate], [CountryId], [CityId], [IsEmailConfirmed], [IsAdmin], [IsBanned], [EmailActivationCode], [DepartmentId], [IsDeleted], [CreationDate]) VALUES (N'8e152918-6dc6-422e-9c68-9d3f83cb0327', N'محمد', N'پیرعلی', NULL, NULL, N'0019525401', NULL, N'2F-38-5E-55-2E-46-88-43-9B-49-8E-36-84-29-70-F5', NULL, NULL, NULL, 0, 0, 0, N'bb950f5587a144c1bf87ce3f1061994e', NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [PhoneNumber], [Email], [NationalNo], [Description], [Password], [BirthDate], [CountryId], [CityId], [IsEmailConfirmed], [IsAdmin], [IsBanned], [EmailActivationCode], [DepartmentId], [IsDeleted], [CreationDate]) VALUES (N'60a3387f-a29d-4ca3-b5cd-f91a7449e905', N'محمدرضا', N'خوش قامت', NULL, NULL, N'0019525400', NULL, N'2F-38-5E-55-2E-46-88-43-9B-49-8E-36-84-29-70-F5', NULL, NULL, NULL, 0, 0, 0, N'3c4d8d2fe01d407d81ef22e3f64ac1f0', NULL, NULL, NULL)
GO
INSERT [Lab].[Ability] ([Id], [Title], [LaboratoryId], [FurtherDetailsAndProcedure], [DescriptionOfConsumables], [ConsumableCost], [HumanResourceCost], [OtherCost], [ImplementationCost], [ImplementationTime], [FileAttachment]) VALUES (N'78b7e8ad-1c47-4576-afe6-05d3ed75ae76', N'44', N'bffcb778-f05a-4e2f-a5a4-05ad2d9c91a4', NULL, N'مواد اولیه', 5000000000, 50000000, 5000000000, 500000000000, CAST(N'2022-10-26T00:00:00.000' AS DateTime), N'/content/lab/')
INSERT [Lab].[Ability] ([Id], [Title], [LaboratoryId], [FurtherDetailsAndProcedure], [DescriptionOfConsumables], [ConsumableCost], [HumanResourceCost], [OtherCost], [ImplementationCost], [ImplementationTime], [FileAttachment]) VALUES (N'c2c8ba82-667b-4e1e-ab2e-0ecbded4eb45', N'41', N'd680cd7e-f149-4126-9983-0c0020c422e0', NULL, N'مواد اولیه', 5000000000, 500000000, 5000000000, 500000000000, CAST(N'2022-10-25T00:00:00.000' AS DateTime), N'/content/lab/')
INSERT [Lab].[Ability] ([Id], [Title], [LaboratoryId], [FurtherDetailsAndProcedure], [DescriptionOfConsumables], [ConsumableCost], [HumanResourceCost], [OtherCost], [ImplementationCost], [ImplementationTime], [FileAttachment]) VALUES (N'5419eb90-c3cc-4dd9-a1f6-3b4b285c4562', N'41', N'bffcb778-f05a-4e2f-a5a4-05ad2d9c91a4', NULL, N'مواد اولیه', 5000000000, 500000000, 5000000000, 500000000000, CAST(N'2022-11-06T00:00:00.000' AS DateTime), N'/content/lab/')
INSERT [Lab].[Ability] ([Id], [Title], [LaboratoryId], [FurtherDetailsAndProcedure], [DescriptionOfConsumables], [ConsumableCost], [HumanResourceCost], [OtherCost], [ImplementationCost], [ImplementationTime], [FileAttachment]) VALUES (N'5bce30bb-c9e5-44f9-8bdc-8c8762795530', N'40', N'a72e2c7a-c740-4de3-a7d1-a0683b44a741', NULL, N'مواد اولیه', 5000000000, 500000000, 5000000000, 500000000000, CAST(N'2022-10-24T00:00:00.000' AS DateTime), N'/content/lab/')
INSERT [Lab].[Ability] ([Id], [Title], [LaboratoryId], [FurtherDetailsAndProcedure], [DescriptionOfConsumables], [ConsumableCost], [HumanResourceCost], [OtherCost], [ImplementationCost], [ImplementationTime], [FileAttachment]) VALUES (N'4f226ac2-8461-4a24-a9d7-97f8d4bc8d7f', N'43', N'bffcb778-f05a-4e2f-a5a4-05ad2d9c91a4', NULL, N'مواد اولیه', 5000000000, 500000000, 5000000000, 500000000000, CAST(N'2022-10-25T00:00:00.000' AS DateTime), N'/content/lab/')
INSERT [Lab].[Ability] ([Id], [Title], [LaboratoryId], [FurtherDetailsAndProcedure], [DescriptionOfConsumables], [ConsumableCost], [HumanResourceCost], [OtherCost], [ImplementationCost], [ImplementationTime], [FileAttachment]) VALUES (N'84206181-d883-4026-a662-b052aac0ba83', N'41', N'b455da73-dbab-4092-b356-2068b4a5de8a', NULL, N'مواد اولیه', 5000000000, 500000000, 5000000000, 500000000000, CAST(N'2022-10-26T00:00:00.000' AS DateTime), N'/content/lab/')
INSERT [Lab].[Ability] ([Id], [Title], [LaboratoryId], [FurtherDetailsAndProcedure], [DescriptionOfConsumables], [ConsumableCost], [HumanResourceCost], [OtherCost], [ImplementationCost], [ImplementationTime], [FileAttachment]) VALUES (N'1adaa709-0dfa-4cb6-845b-ee4323c05ebb', N'40', N'bffcb778-f05a-4e2f-a5a4-05ad2d9c91a4', NULL, N'مواد اولیه', 5000000000, NULL, 5000000000, 500000000000, CAST(N'2022-10-25T00:00:00.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [Lab].[Equipment] ON 

INSERT [Lab].[Equipment] ([Id], [LaboratoryId], [EquipmentTypeId], [Title], [PersianTitle], [GeneralTechnicalSpecification], [EquipmentUsage], [UsageTypeId], [CountryId], [CompanyName], [Model], [SerialNumber], [InstallationDate], [ExploitationDate], [SupplyTypeId], [WardId], [EquipmentCost], [EquipmentImage], [RelatedSectionId], [Baitul-Mal No], [EquipmentStatusId], [EmploymentStatusId], [PurchasePrice/Construction], [IsNeededToCalibrate], [LastCalibrationDate], [WarrantyExpirationDate], [InsuranceExpirationDate], [SpecialCharacteristic], [TitlesAttachedToEquipment], [Row]) VALUES (N'2034e4ee-d6f9-4e7c-a319-2ef09a8d90b2', N'b455da73-dbab-4092-b356-2068b4a5de8a', 17, N'تجهیز یک', N'فارسی', N'مشخصات', N'کاربرد', 26, 27, N'پوگقد', N'asdg', N'1258224569877702245', CAST(N'2022-11-16T00:00:00.000' AS DateTime), CAST(N'2022-11-02T00:00:00.000' AS DateTime), 46, N'fb919d3a-813a-4f89-adbe-137580ac79cb', 50000000, N'/content/lab/', 27, N'465466', 59, 65, N'65,465,445,644', 1, CAST(N'2022-11-03T00:00:00.000' AS DateTime), CAST(N'2022-10-26T00:00:00.000' AS DateTime), CAST(N'2022-10-26T00:00:00.000' AS DateTime), N'شسیبال', N'شسیل', 4)
INSERT [Lab].[Equipment] ([Id], [LaboratoryId], [EquipmentTypeId], [Title], [PersianTitle], [GeneralTechnicalSpecification], [EquipmentUsage], [UsageTypeId], [CountryId], [CompanyName], [Model], [SerialNumber], [InstallationDate], [ExploitationDate], [SupplyTypeId], [WardId], [EquipmentCost], [EquipmentImage], [RelatedSectionId], [Baitul-Mal No], [EquipmentStatusId], [EmploymentStatusId], [PurchasePrice/Construction], [IsNeededToCalibrate], [LastCalibrationDate], [WarrantyExpirationDate], [InsuranceExpirationDate], [SpecialCharacteristic], [TitlesAttachedToEquipment], [Row]) VALUES (N'eb4d06fd-b892-4578-b386-47c96857d0d2', N'9145a574-3cb2-494f-bcdc-34f4807e3c00', 18, N'English', N'فارسی', N'مشخصات', N'کاربرد', 25, 30, N'asgasg', N'asdg', N'asgsags', CAST(N'2022-11-02T00:00:00.000' AS DateTime), CAST(N'2022-11-01T00:00:00.000' AS DateTime), 46, N'b9474747-6030-4f5e-a361-8d4907356223', 50000000, N'/content/lab/', 19, N'465466', 58, 65, N'65,465,445,644', 0, CAST(N'2022-11-09T00:00:00.000' AS DateTime), CAST(N'2022-11-03T00:00:00.000' AS DateTime), CAST(N'2022-10-25T00:00:00.000' AS DateTime), N'asdg', N'asfg', 1)
INSERT [Lab].[Equipment] ([Id], [LaboratoryId], [EquipmentTypeId], [Title], [PersianTitle], [GeneralTechnicalSpecification], [EquipmentUsage], [UsageTypeId], [CountryId], [CompanyName], [Model], [SerialNumber], [InstallationDate], [ExploitationDate], [SupplyTypeId], [WardId], [EquipmentCost], [EquipmentImage], [RelatedSectionId], [Baitul-Mal No], [EquipmentStatusId], [EmploymentStatusId], [PurchasePrice/Construction], [IsNeededToCalibrate], [LastCalibrationDate], [WarrantyExpirationDate], [InsuranceExpirationDate], [SpecialCharacteristic], [TitlesAttachedToEquipment], [Row]) VALUES (N'5a400c9b-4c32-48bb-a0f7-5123f99c92f8', N'd680cd7e-f149-4126-9983-0c0020c422e0', 20, N'Englishoiii', N'تجهیز یک', N'مشخصات', N'کاربرد خاصی ندارد', 25, 32, N'sagas', N'KM456GH', N'1234567890asdgsadg', CAST(N'2022-11-09T00:00:00.000' AS DateTime), CAST(N'2022-11-02T00:00:00.000' AS DateTime), 46, N'a50685f9-8ec5-4f66-b1c2-fb6573732fd7', 50000000, N'/content/lab/', 34, N'2564782364966', 61, 68, N'65,465,445,644', 1, CAST(N'2022-11-02T00:00:00.000' AS DateTime), CAST(N'2022-11-09T00:00:00.000' AS DateTime), CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'خاص', N'', 7)
INSERT [Lab].[Equipment] ([Id], [LaboratoryId], [EquipmentTypeId], [Title], [PersianTitle], [GeneralTechnicalSpecification], [EquipmentUsage], [UsageTypeId], [CountryId], [CompanyName], [Model], [SerialNumber], [InstallationDate], [ExploitationDate], [SupplyTypeId], [WardId], [EquipmentCost], [EquipmentImage], [RelatedSectionId], [Baitul-Mal No], [EquipmentStatusId], [EmploymentStatusId], [PurchasePrice/Construction], [IsNeededToCalibrate], [LastCalibrationDate], [WarrantyExpirationDate], [InsuranceExpirationDate], [SpecialCharacteristic], [TitlesAttachedToEquipment], [Row]) VALUES (N'30a7d54e-5939-4b5d-84c2-68ee902d5496', N'9145a574-3cb2-494f-bcdc-34f4807e3c00', 17, N'Englishoiii', N'فارسی', N'مشخصات', N'کاربرد', 25, 32, N'asgasg', N'asdg', N'adgasgasgasgasg', CAST(N'2022-10-26T00:00:00.000' AS DateTime), CAST(N'2022-10-25T00:00:00.000' AS DateTime), 47, N'b9474747-6030-4f5e-a361-8d4907356223', 50000000, N'/content/lab/', 19, N'465466', 58, 64, N'65,465,445,644', 1, CAST(N'2022-11-02T00:00:00.000' AS DateTime), CAST(N'2022-11-02T00:00:00.000' AS DateTime), CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'ascgasg', N'', 3)
INSERT [Lab].[Equipment] ([Id], [LaboratoryId], [EquipmentTypeId], [Title], [PersianTitle], [GeneralTechnicalSpecification], [EquipmentUsage], [UsageTypeId], [CountryId], [CompanyName], [Model], [SerialNumber], [InstallationDate], [ExploitationDate], [SupplyTypeId], [WardId], [EquipmentCost], [EquipmentImage], [RelatedSectionId], [Baitul-Mal No], [EquipmentStatusId], [EmploymentStatusId], [PurchasePrice/Construction], [IsNeededToCalibrate], [LastCalibrationDate], [WarrantyExpirationDate], [InsuranceExpirationDate], [SpecialCharacteristic], [TitlesAttachedToEquipment], [Row]) VALUES (N'd9167035-eae5-42a8-b25f-8b5ddb66c7ad', N'bffcb778-f05a-4e2f-a5a4-05ad2d9c91a4', 17, N'Equip One', N'تجهیز یک', N'مشخصات', N'کاربرد', 25, 32, N'پوگقد', N'asdg', N'1234567890', CAST(N'2022-11-09T00:00:00.000' AS DateTime), CAST(N'2022-10-25T00:00:00.000' AS DateTime), 47, N'770742dc-13f4-46ca-8c9f-6a5e1c8ba17f', 50000000, N'/content/lab/', 23, N'465466', 58, 64, N'65,465,445,644', 1, CAST(N'2022-10-31T00:00:00.000' AS DateTime), CAST(N'2022-11-02T00:00:00.000' AS DateTime), CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'xdcbnv', N'', 2)
INSERT [Lab].[Equipment] ([Id], [LaboratoryId], [EquipmentTypeId], [Title], [PersianTitle], [GeneralTechnicalSpecification], [EquipmentUsage], [UsageTypeId], [CountryId], [CompanyName], [Model], [SerialNumber], [InstallationDate], [ExploitationDate], [SupplyTypeId], [WardId], [EquipmentCost], [EquipmentImage], [RelatedSectionId], [Baitul-Mal No], [EquipmentStatusId], [EmploymentStatusId], [PurchasePrice/Construction], [IsNeededToCalibrate], [LastCalibrationDate], [WarrantyExpirationDate], [InsuranceExpirationDate], [SpecialCharacteristic], [TitlesAttachedToEquipment], [Row]) VALUES (N'464075ce-6818-4c19-9005-dfda9d939ea7', N'a72e2c7a-c740-4de3-a7d1-a0683b44a741', 17, N'English Gireh', N'گیره', N'باند پایه', N'کاربرد خاصی ندارد', 24, 28, N'Benz', N'KM456GH', N'125469325468522456', CAST(N'2022-10-24T00:00:00.000' AS DateTime), CAST(N'2022-11-09T00:00:00.000' AS DateTime), 46, N'8836ddf9-fbd8-4c7f-a56a-51300860b3b1', 50000000, N'/content/lab/', 30, N'2564782364966', 59, 65, N'65,465,445,644', 1, CAST(N'2022-11-02T00:00:00.000' AS DateTime), CAST(N'2022-11-03T00:00:00.000' AS DateTime), CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'ویژگی خاصی ندارد', N'', 6)
INSERT [Lab].[Equipment] ([Id], [LaboratoryId], [EquipmentTypeId], [Title], [PersianTitle], [GeneralTechnicalSpecification], [EquipmentUsage], [UsageTypeId], [CountryId], [CompanyName], [Model], [SerialNumber], [InstallationDate], [ExploitationDate], [SupplyTypeId], [WardId], [EquipmentCost], [EquipmentImage], [RelatedSectionId], [Baitul-Mal No], [EquipmentStatusId], [EmploymentStatusId], [PurchasePrice/Construction], [IsNeededToCalibrate], [LastCalibrationDate], [WarrantyExpirationDate], [InsuranceExpirationDate], [SpecialCharacteristic], [TitlesAttachedToEquipment], [Row]) VALUES (N'317aa35f-ac4f-43e8-980b-e128d8c3303e', N'b455da73-dbab-4092-b356-2068b4a5de8a', 18, N'Equip Two', N'تجهیز دو', N'مشخصات', N'کاربرد', 26, 28, N'پوگقد', N'6556419', N'kasgfvbibasigfkasdkjgfajsg', CAST(N'2022-11-02T00:00:00.000' AS DateTime), CAST(N'2022-10-31T00:00:00.000' AS DateTime), 46, N'52cdf934-a61b-47ae-927a-e3facbafb67e', 50000000, N'/content/lab/', 28, N'465466', 60, 67, N'65,465,445,644', 1, CAST(N'2022-11-09T00:00:00.000' AS DateTime), CAST(N'2022-11-09T00:00:00.000' AS DateTime), CAST(N'2022-11-09T00:00:00.000' AS DateTime), N'ویژگی', N'', 5)
SET IDENTITY_INSERT [Lab].[Equipment] OFF
GO
SET IDENTITY_INSERT [Lab].[EquipmentAbility] ON 

INSERT [Lab].[EquipmentAbility] ([Id], [AbilityId], [EquipmentId]) VALUES (1, N'1adaa709-0dfa-4cb6-845b-ee4323c05ebb', N'eb4d06fd-b892-4578-b386-47c96857d0d2')
INSERT [Lab].[EquipmentAbility] ([Id], [AbilityId], [EquipmentId]) VALUES (2, N'5419eb90-c3cc-4dd9-a1f6-3b4b285c4562', N'eb4d06fd-b892-4578-b386-47c96857d0d2')
INSERT [Lab].[EquipmentAbility] ([Id], [AbilityId], [EquipmentId]) VALUES (3, N'4f226ac2-8461-4a24-a9d7-97f8d4bc8d7f', N'eb4d06fd-b892-4578-b386-47c96857d0d2')
INSERT [Lab].[EquipmentAbility] ([Id], [AbilityId], [EquipmentId]) VALUES (4, N'78b7e8ad-1c47-4576-afe6-05d3ed75ae76', N'30a7d54e-5939-4b5d-84c2-68ee902d5496')
INSERT [Lab].[EquipmentAbility] ([Id], [AbilityId], [EquipmentId]) VALUES (5, N'84206181-d883-4026-a662-b052aac0ba83', N'2034e4ee-d6f9-4e7c-a319-2ef09a8d90b2')
INSERT [Lab].[EquipmentAbility] ([Id], [AbilityId], [EquipmentId]) VALUES (6, N'5bce30bb-c9e5-44f9-8bdc-8c8762795530', N'464075ce-6818-4c19-9005-dfda9d939ea7')
INSERT [Lab].[EquipmentAbility] ([Id], [AbilityId], [EquipmentId]) VALUES (7, N'c2c8ba82-667b-4e1e-ab2e-0ecbded4eb45', N'5a400c9b-4c32-48bb-a0f7-5123f99c92f8')
SET IDENTITY_INSERT [Lab].[EquipmentAbility] OFF
GO
SET IDENTITY_INSERT [Lab].[Laboratory] ON 

INSERT [Lab].[Laboratory] ([Id], [Title], [LaboratoryTypeId], [PassiveDefenceId], [ApprovalAuthorityId], [StandardStatusId], [ResearchCenterId], [PhoneNumber], [ImagePath], [Address], [Description], [Row]) VALUES (N'bffcb778-f05a-4e2f-a5a4-05ad2d9c91a4', N'آزمایشگاه سوم', 12, 2, 4, 15, 6, N'09212440217', N'DefaultLabImage.png', N'تهران', N'توضیحات', 52)
INSERT [Lab].[Laboratory] ([Id], [Title], [LaboratoryTypeId], [PassiveDefenceId], [ApprovalAuthorityId], [StandardStatusId], [ResearchCenterId], [PhoneNumber], [ImagePath], [Address], [Description], [Row]) VALUES (N'd680cd7e-f149-4126-9983-0c0020c422e0', N'آزمایشگاه خوش', 13, 3, 5, 16, 8, N'09212434583', N'DefaultLabImage.png', N'تهران', N'', 56)
INSERT [Lab].[Laboratory] ([Id], [Title], [LaboratoryTypeId], [PassiveDefenceId], [ApprovalAuthorityId], [StandardStatusId], [ResearchCenterId], [PhoneNumber], [ImagePath], [Address], [Description], [Row]) VALUES (N'b455da73-dbab-4092-b356-2068b4a5de8a', N'آزمایشگاه هشتم', 13, 1, 4, 16, 7, N'(021) 77 47 5047', N'DefaultLabImage.png', N'تهران', N'توضیحات', 54)
INSERT [Lab].[Laboratory] ([Id], [Title], [LaboratoryTypeId], [PassiveDefenceId], [ApprovalAuthorityId], [StandardStatusId], [ResearchCenterId], [PhoneNumber], [ImagePath], [Address], [Description], [Row]) VALUES (N'9145a574-3cb2-494f-bcdc-34f4807e3c00', N'آزمایشگاه اول', 11, 1, 4, 15, 6, N'(021) 77 47 5647', N'DefaultLabImage.png', N'asdg', N'', 49)
INSERT [Lab].[Laboratory] ([Id], [Title], [LaboratoryTypeId], [PassiveDefenceId], [ApprovalAuthorityId], [StandardStatusId], [ResearchCenterId], [PhoneNumber], [ImagePath], [Address], [Description], [Row]) VALUES (N'09334c01-665a-4df0-9021-5610760128f9', N'آزمایشگاه دوم', 11, 1, 4, 14, 6, N'09212440317', N'DefaultLabImage.png', N'jhghgfh', N'', 50)
INSERT [Lab].[Laboratory] ([Id], [Title], [LaboratoryTypeId], [PassiveDefenceId], [ApprovalAuthorityId], [StandardStatusId], [ResearchCenterId], [PhoneNumber], [ImagePath], [Address], [Description], [Row]) VALUES (N'a72e2c7a-c740-4de3-a7d1-a0683b44a741', N'آزمایشگاه آکوستیک سیگنال', 13, 2, 5, 15, 8, N'02133745654', N'DefaultLabImage.png', N'تهران', N'توضیحات تستی', 55)
INSERT [Lab].[Laboratory] ([Id], [Title], [LaboratoryTypeId], [PassiveDefenceId], [ApprovalAuthorityId], [StandardStatusId], [ResearchCenterId], [PhoneNumber], [ImagePath], [Address], [Description], [Row]) VALUES (N'b6eeeeb1-7fea-458e-983e-f1eeb7d816a5', N'آزمایشگاه سوم', 12, 1, 4, 14, 6, N'09212440319', N'DefaultLabImage.png', N'تتهرانمن', N'', 51)
SET IDENTITY_INSERT [Lab].[Laboratory] OFF
GO
INSERT [Lab].[Request] ([Id], [LaboratoryId], [UserName], [IndicatorNo], [Title], [Description], [RequestTypeId], [LetterPath], [RequestDate], [TraceCode]) VALUES (N'f3567d22-d5e9-473a-8b75-9b28fd8b2eb4', N'a72e2c7a-c740-4de3-a7d1-a0683b44a741', N'محمدرضا خوش قامت', N'91011', N'شسیلشسیل', N'شسیلشسل', 70, N'DefaultRequestPath.docs', CAST(N'2022-10-26T00:00:00.000' AS DateTime), N'1401082791011')
INSERT [Lab].[Request] ([Id], [LaboratoryId], [UserName], [IndicatorNo], [Title], [Description], [RequestTypeId], [LetterPath], [RequestDate], [TraceCode]) VALUES (N'28aa8d46-decc-485d-976c-d89ffe3d6ade', N'a72e2c7a-c740-4de3-a7d1-a0683b44a741', N'محمدرضا خوش قامت', N'60592', N'asdgasg', N'asdgsagsg', 70, N'DefaultRequestPath.docs', CAST(N'2022-11-09T00:00:00.000' AS DateTime), N'1401082760592')
INSERT [Lab].[Request] ([Id], [LaboratoryId], [UserName], [IndicatorNo], [Title], [Description], [RequestTypeId], [LetterPath], [RequestDate], [TraceCode]) VALUES (N'e8fbc772-2584-42ef-baf5-fc562127e07e', N'a72e2c7a-c740-4de3-a7d1-a0683b44a741', N'محمدرضا خوش قامت', N'52825', N'شسلسشلسشل', N'شسیلشسلشسلش', 70, N'DefaultRequestPath.docs', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'1401082752825')
GO
SET IDENTITY_INSERT [Lab].[RequestIndicator] ON 

INSERT [Lab].[RequestIndicator] ([Id], [RequestId], [IndicatorNo], [TraceCode]) VALUES (18, N'f3567d22-d5e9-473a-8b75-9b28fd8b2eb4', N'91011', N'1401082791011')
INSERT [Lab].[RequestIndicator] ([Id], [RequestId], [IndicatorNo], [TraceCode]) VALUES (19, N'e8fbc772-2584-42ef-baf5-fc562127e07e', N'52825', N'1401082752825')
INSERT [Lab].[RequestIndicator] ([Id], [RequestId], [IndicatorNo], [TraceCode]) VALUES (20, N'28aa8d46-decc-485d-976c-d89ffe3d6ade', N'60592', N'1401082760592')
SET IDENTITY_INSERT [Lab].[RequestIndicator] OFF
GO
SET IDENTITY_INSERT [Lab].[Ward] ON 

INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title], [Row]) VALUES (N'969aed84-2dcd-472b-9a7d-1125b70f74e6', N'd680cd7e-f149-4126-9983-0c0020c422e0', N'بخش 2', 33)
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title], [Row]) VALUES (N'13aae373-c2c3-46ca-a2f3-12ff4f60921e', N'bffcb778-f05a-4e2f-a5a4-05ad2d9c91a4', N'بخش 5', 21)
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title], [Row]) VALUES (N'fb919d3a-813a-4f89-adbe-137580ac79cb', N'b455da73-dbab-4092-b356-2068b4a5de8a', N'بخش اول', 27)
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title], [Row]) VALUES (N'1754cfe5-c8d1-4cf5-a985-1757c37392c8', N'a72e2c7a-c740-4de3-a7d1-a0683b44a741', N'بخش 1', 29)
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title], [Row]) VALUES (N'8a08f9f3-879b-4595-b5a1-1824cf8c4d11', N'b6eeeeb1-7fea-458e-983e-f1eeb7d816a5', N'بخش 1', 20)
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title], [Row]) VALUES (N'84a77d39-5df7-4241-80d4-34f750ee0634', N'd680cd7e-f149-4126-9983-0c0020c422e0', N'بخش 1', 32)
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title], [Row]) VALUES (N'4b108b32-2aa2-4867-8220-3e4afd350c79', N'bffcb778-f05a-4e2f-a5a4-05ad2d9c91a4', N'بخش 10', 25)
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title], [Row]) VALUES (N'ff59b42e-2424-4227-acd8-4727f0e4e554', N'd680cd7e-f149-4126-9983-0c0020c422e0', N'بخش 4', 35)
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title], [Row]) VALUES (N'93289d26-17ab-423f-8ac0-4ab47c1d2ddb', N'b455da73-dbab-4092-b356-2068b4a5de8a', N'بخش چهارم', 26)
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title], [Row]) VALUES (N'8836ddf9-fbd8-4c7f-a56a-51300860b3b1', N'a72e2c7a-c740-4de3-a7d1-a0683b44a741', N'بخش 2', 30)
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title], [Row]) VALUES (N'3aa1ae98-310c-49a4-8994-5c067213897c', N'a72e2c7a-c740-4de3-a7d1-a0683b44a741', N'بخش 3', 31)
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title], [Row]) VALUES (N'28df5828-e97a-4085-99e3-648381297342', N'bffcb778-f05a-4e2f-a5a4-05ad2d9c91a4', N'بخش 6', 22)
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title], [Row]) VALUES (N'770742dc-13f4-46ca-8c9f-6a5e1c8ba17f', N'bffcb778-f05a-4e2f-a5a4-05ad2d9c91a4', N'بخش 8', 23)
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title], [Row]) VALUES (N'b9474747-6030-4f5e-a361-8d4907356223', N'9145a574-3cb2-494f-bcdc-34f4807e3c00', N'بخش 2', 19)
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title], [Row]) VALUES (N'ce764907-a48d-4847-8719-da5a7cbb64e1', N'9145a574-3cb2-494f-bcdc-34f4807e3c00', N'بخش 1', 18)
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title], [Row]) VALUES (N'52cdf934-a61b-47ae-927a-e3facbafb67e', N'b455da73-dbab-4092-b356-2068b4a5de8a', N'بخش دوم', 28)
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title], [Row]) VALUES (N'2426073e-2383-411f-9bcc-e40c73275804', N'bffcb778-f05a-4e2f-a5a4-05ad2d9c91a4', N'بخش 9', 24)
INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title], [Row]) VALUES (N'a50685f9-8ec5-4f66-b1c2-fb6573732fd7', N'd680cd7e-f149-4126-9983-0c0020c422e0', N'بخش 3', 34)
SET IDENTITY_INSERT [Lab].[Ward] OFF
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
ALTER TABLE [Lab].[RequestIndicator]  WITH CHECK ADD  CONSTRAINT [FK_RequestIndicator_Request] FOREIGN KEY([RequestId])
REFERENCES [Lab].[Request] ([Id])
GO
ALTER TABLE [Lab].[RequestIndicator] CHECK CONSTRAINT [FK_RequestIndicator_Request]
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
