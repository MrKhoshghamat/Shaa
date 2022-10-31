USE [master]
GO
/****** Object:  Database [Shaa]    Script Date: 10/31/2022 11:06:47 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Shaa')
BEGIN
CREATE DATABASE [Shaa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sha', FILENAME = N'E:\Database\Shaa\Sha.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sha_log', FILENAME = N'E:\Database\Shaa\Sha_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
END
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
/****** Object:  Schema [Lab]    Script Date: 10/31/2022 11:06:47 PM ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Lab')
EXEC sys.sp_executesql N'CREATE SCHEMA [Lab]'
GO
/****** Object:  Schema [organization]    Script Date: 10/31/2022 11:06:47 PM ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'organization')
EXEC sys.sp_executesql N'CREATE SCHEMA [organization]'
GO
/****** Object:  Schema [share]    Script Date: 10/31/2022 11:06:47 PM ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'share')
EXEC sys.sp_executesql N'CREATE SCHEMA [share]'
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/31/2022 11:06:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [Lab].[Ability]    Script Date: 10/31/2022 11:06:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Lab].[Ability]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [Lab].[Equipment]    Script Date: 10/31/2022 11:06:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Lab].[Equipment]') AND type in (N'U'))
BEGIN
CREATE TABLE [Lab].[Equipment](
	[Id] [uniqueidentifier] NOT NULL,
	[LaboratoryId] [uniqueidentifier] NOT NULL,
	[EquipmentTypeId] [int] NOT NULL,
	[Title] [varchar](255) NOT NULL,
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
END
GO
/****** Object:  Table [Lab].[EquipmentAbility]    Script Date: 10/31/2022 11:06:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Lab].[EquipmentAbility]') AND type in (N'U'))
BEGIN
CREATE TABLE [Lab].[EquipmentAbility](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AbilityId] [uniqueidentifier] NOT NULL,
	[EquipmentId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_EquipmentAbility] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Lab].[Laboratory]    Script Date: 10/31/2022 11:06:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Lab].[Laboratory]') AND type in (N'U'))
BEGIN
CREATE TABLE [Lab].[Laboratory](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[LaboratoryTypeId] [int] NOT NULL,
	[PassiveDefenceId] [int] NOT NULL,
	[ApprovalAuthorityId] [int] NULL,
	[ResearchCenterId] [uniqueidentifier] NULL,
	[StandardStatusId] [int] NULL,
	[PhoneNumber] [varchar](50) NULL,
	[ImagePath] [nvarchar](1000) NULL,
	[Address] [nvarchar](4000) NULL,
	[Description] [nvarchar](4000) NULL,
 CONSTRAINT [PK_Laboratory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Lab].[Ward]    Script Date: 10/31/2022 11:06:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Lab].[Ward]') AND type in (N'U'))
BEGIN
CREATE TABLE [Lab].[Ward](
	[Id] [uniqueidentifier] NOT NULL,
	[LaboratoryId] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Row] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Ward] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [organization].[Department]    Script Date: 10/31/2022 11:06:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[organization].[Department]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [share].[BaseInfo]    Script Date: 10/31/2022 11:06:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[share].[BaseInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [share].[BaseInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BaseTableTypeId] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_BaseInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [share].[BaseTableType]    Script Date: 10/31/2022 11:06:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[share].[BaseTableType]') AND type in (N'U'))
BEGIN
CREATE TABLE [share].[BaseTableType](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_BaseTableType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [PhoneNumber], [Email], [NationalNo], [Description], [Password], [BirthDate], [CountryId], [CityId], [IsEmailConfirmed], [IsAdmin], [IsBanned], [EmailActivationCode], [DepartmentId], [IsDeleted], [CreationDate]) VALUES (N'8e152918-6dc6-422e-9c68-9d3f83cb0327', N'محمد', N'پیرعلی', NULL, NULL, N'0019525401', NULL, N'2F-38-5E-55-2E-46-88-43-9B-49-8E-36-84-29-70-F5', NULL, NULL, NULL, 0, 0, 0, N'bb950f5587a144c1bf87ce3f1061994e', NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [PhoneNumber], [Email], [NationalNo], [Description], [Password], [BirthDate], [CountryId], [CityId], [IsEmailConfirmed], [IsAdmin], [IsBanned], [EmailActivationCode], [DepartmentId], [IsDeleted], [CreationDate]) VALUES (N'60a3387f-a29d-4ca3-b5cd-f91a7449e905', N'محمدرضا', N'خوش قامت', NULL, NULL, N'0019525400', NULL, N'2F-38-5E-55-2E-46-88-43-9B-49-8E-36-84-29-70-F5', NULL, NULL, NULL, 0, 0, 0, N'3c4d8d2fe01d407d81ef22e3f64ac1f0', NULL, NULL, NULL)
GO
INSERT [Lab].[Ability] ([Id], [Title], [LaboratoryId], [FurtherDetailsAndProcedure], [DescriptionOfConsumables], [ConsumableCost], [HumanResourceCost], [OtherCost], [ImplementationCost], [ImplementationTime], [FileAttachment]) VALUES (N'18d74cff-2540-4af9-b8a1-69105fd93058', N'40', N'ad355704-85b8-4a5e-8d8c-0f29e7adcaa7', NULL, N'مواد اولیه', 5000000000, 500000000, 5000000000, 500000000000, CAST(N'2022-10-18T00:00:00.000' AS DateTime), NULL)
GO
INSERT [Lab].[Equipment] ([Id], [LaboratoryId], [EquipmentTypeId], [Title], [PersianTitle], [GeneralTechnicalSpecification], [EquipmentUsage], [UsageTypeId], [CountryId], [CompanyName], [Model], [SerialNumber], [InstallationDate], [ExploitationDate], [SupplyTypeId], [WardId], [EquipmentCost], [EquipmentImage], [RelatedSectionId], [Baitul-Mal No], [EquipmentStatusId], [EmploymentStatusId], [PurchasePrice/Construction], [IsNeededToCalibrate], [LastCalibrationDate], [WarrantyExpirationDate], [InsuranceExpirationDate], [SpecialCharacteristic], [TitlesAttachedToEquipment]) VALUES (N'935e57c6-739a-4a04-a083-3273a3c31181', N'ad355704-85b8-4a5e-8d8c-0f29e7adcaa7', 17, N'????? ??', NULL, NULL, NULL, 24, 27, N'پوگقد', N'?????', N'1234567890', CAST(N'2022-09-23T00:00:00.000' AS DateTime), CAST(N'2022-10-04T00:00:00.000' AS DateTime), NULL, N'ccc8d20f-7e2c-4c07-ac3b-1057eb583fee', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Lab].[Laboratory] ([Id], [Title], [LaboratoryTypeId], [PassiveDefenceId], [ApprovalAuthorityId], [ResearchCenterId], [StandardStatusId], [PhoneNumber], [ImagePath], [Address], [Description]) VALUES (N'ad355704-85b8-4a5e-8d8c-0f29e7adcaa7', N'آزمایشگاه اول', 11, 1, 5, NULL, NULL, N'(021) 77 47 5647', NULL, N'تهران', N'')
GO
SET IDENTITY_INSERT [Lab].[Ward] ON 

INSERT [Lab].[Ward] ([Id], [LaboratoryId], [Title], [Row]) VALUES (N'ccc8d20f-7e2c-4c07-ac3b-1057eb583fee', N'ad355704-85b8-4a5e-8d8c-0f29e7adcaa7', N'تستی', 1)
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
INSERT [share].[BaseTableType] ([Id], [Title]) VALUES (13, N'تستی')
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_BaseInfo]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_BaseInfo] FOREIGN KEY([CountryId])
REFERENCES [share].[BaseInfo] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_BaseInfo]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_BaseInfo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_BaseInfo1]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_BaseInfo1] FOREIGN KEY([CityId])
REFERENCES [share].[BaseInfo] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_BaseInfo1]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_BaseInfo1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Department]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Department] FOREIGN KEY([DepartmentId])
REFERENCES [organization].[Department] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Department]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Department]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Ability_Laboratory]') AND parent_object_id = OBJECT_ID(N'[Lab].[Ability]'))
ALTER TABLE [Lab].[Ability]  WITH CHECK ADD  CONSTRAINT [FK_Ability_Laboratory] FOREIGN KEY([LaboratoryId])
REFERENCES [Lab].[Laboratory] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Ability_Laboratory]') AND parent_object_id = OBJECT_ID(N'[Lab].[Ability]'))
ALTER TABLE [Lab].[Ability] CHECK CONSTRAINT [FK_Ability_Laboratory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Equipment_BaseInfo]') AND parent_object_id = OBJECT_ID(N'[Lab].[Equipment]'))
ALTER TABLE [Lab].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_BaseInfo] FOREIGN KEY([EquipmentTypeId])
REFERENCES [share].[BaseInfo] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Equipment_BaseInfo]') AND parent_object_id = OBJECT_ID(N'[Lab].[Equipment]'))
ALTER TABLE [Lab].[Equipment] CHECK CONSTRAINT [FK_Equipment_BaseInfo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Equipment_BaseInfo1]') AND parent_object_id = OBJECT_ID(N'[Lab].[Equipment]'))
ALTER TABLE [Lab].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_BaseInfo1] FOREIGN KEY([UsageTypeId])
REFERENCES [share].[BaseInfo] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Equipment_BaseInfo1]') AND parent_object_id = OBJECT_ID(N'[Lab].[Equipment]'))
ALTER TABLE [Lab].[Equipment] CHECK CONSTRAINT [FK_Equipment_BaseInfo1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Equipment_BaseInfo2]') AND parent_object_id = OBJECT_ID(N'[Lab].[Equipment]'))
ALTER TABLE [Lab].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_BaseInfo2] FOREIGN KEY([CountryId])
REFERENCES [share].[BaseInfo] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Equipment_BaseInfo2]') AND parent_object_id = OBJECT_ID(N'[Lab].[Equipment]'))
ALTER TABLE [Lab].[Equipment] CHECK CONSTRAINT [FK_Equipment_BaseInfo2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Equipment_BaseInfo3]') AND parent_object_id = OBJECT_ID(N'[Lab].[Equipment]'))
ALTER TABLE [Lab].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_BaseInfo3] FOREIGN KEY([SupplyTypeId])
REFERENCES [share].[BaseInfo] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Equipment_BaseInfo3]') AND parent_object_id = OBJECT_ID(N'[Lab].[Equipment]'))
ALTER TABLE [Lab].[Equipment] CHECK CONSTRAINT [FK_Equipment_BaseInfo3]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Equipment_BaseInfo4]') AND parent_object_id = OBJECT_ID(N'[Lab].[Equipment]'))
ALTER TABLE [Lab].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_BaseInfo4] FOREIGN KEY([RelatedSectionId])
REFERENCES [share].[BaseInfo] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Equipment_BaseInfo4]') AND parent_object_id = OBJECT_ID(N'[Lab].[Equipment]'))
ALTER TABLE [Lab].[Equipment] CHECK CONSTRAINT [FK_Equipment_BaseInfo4]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Equipment_BaseInfo5]') AND parent_object_id = OBJECT_ID(N'[Lab].[Equipment]'))
ALTER TABLE [Lab].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_BaseInfo5] FOREIGN KEY([EquipmentStatusId])
REFERENCES [share].[BaseInfo] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Equipment_BaseInfo5]') AND parent_object_id = OBJECT_ID(N'[Lab].[Equipment]'))
ALTER TABLE [Lab].[Equipment] CHECK CONSTRAINT [FK_Equipment_BaseInfo5]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Equipment_BaseInfo6]') AND parent_object_id = OBJECT_ID(N'[Lab].[Equipment]'))
ALTER TABLE [Lab].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_BaseInfo6] FOREIGN KEY([EmploymentStatusId])
REFERENCES [share].[BaseInfo] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Equipment_BaseInfo6]') AND parent_object_id = OBJECT_ID(N'[Lab].[Equipment]'))
ALTER TABLE [Lab].[Equipment] CHECK CONSTRAINT [FK_Equipment_BaseInfo6]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Equipment_Laboratory]') AND parent_object_id = OBJECT_ID(N'[Lab].[Equipment]'))
ALTER TABLE [Lab].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Laboratory] FOREIGN KEY([LaboratoryId])
REFERENCES [Lab].[Laboratory] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Equipment_Laboratory]') AND parent_object_id = OBJECT_ID(N'[Lab].[Equipment]'))
ALTER TABLE [Lab].[Equipment] CHECK CONSTRAINT [FK_Equipment_Laboratory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Equipment_Ward]') AND parent_object_id = OBJECT_ID(N'[Lab].[Equipment]'))
ALTER TABLE [Lab].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Ward] FOREIGN KEY([WardId])
REFERENCES [Lab].[Ward] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Equipment_Ward]') AND parent_object_id = OBJECT_ID(N'[Lab].[Equipment]'))
ALTER TABLE [Lab].[Equipment] CHECK CONSTRAINT [FK_Equipment_Ward]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_EquipmentAbility_Ability]') AND parent_object_id = OBJECT_ID(N'[Lab].[EquipmentAbility]'))
ALTER TABLE [Lab].[EquipmentAbility]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentAbility_Ability] FOREIGN KEY([AbilityId])
REFERENCES [Lab].[Ability] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_EquipmentAbility_Ability]') AND parent_object_id = OBJECT_ID(N'[Lab].[EquipmentAbility]'))
ALTER TABLE [Lab].[EquipmentAbility] CHECK CONSTRAINT [FK_EquipmentAbility_Ability]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_EquipmentAbility_Equipment]') AND parent_object_id = OBJECT_ID(N'[Lab].[EquipmentAbility]'))
ALTER TABLE [Lab].[EquipmentAbility]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentAbility_Equipment] FOREIGN KEY([EquipmentId])
REFERENCES [Lab].[Equipment] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_EquipmentAbility_Equipment]') AND parent_object_id = OBJECT_ID(N'[Lab].[EquipmentAbility]'))
ALTER TABLE [Lab].[EquipmentAbility] CHECK CONSTRAINT [FK_EquipmentAbility_Equipment]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Laboratory_BaseInfo]') AND parent_object_id = OBJECT_ID(N'[Lab].[Laboratory]'))
ALTER TABLE [Lab].[Laboratory]  WITH CHECK ADD  CONSTRAINT [FK_Laboratory_BaseInfo] FOREIGN KEY([LaboratoryTypeId])
REFERENCES [share].[BaseInfo] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Laboratory_BaseInfo]') AND parent_object_id = OBJECT_ID(N'[Lab].[Laboratory]'))
ALTER TABLE [Lab].[Laboratory] CHECK CONSTRAINT [FK_Laboratory_BaseInfo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Laboratory_BaseInfo1]') AND parent_object_id = OBJECT_ID(N'[Lab].[Laboratory]'))
ALTER TABLE [Lab].[Laboratory]  WITH CHECK ADD  CONSTRAINT [FK_Laboratory_BaseInfo1] FOREIGN KEY([PassiveDefenceId])
REFERENCES [share].[BaseInfo] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Laboratory_BaseInfo1]') AND parent_object_id = OBJECT_ID(N'[Lab].[Laboratory]'))
ALTER TABLE [Lab].[Laboratory] CHECK CONSTRAINT [FK_Laboratory_BaseInfo1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Laboratory_BaseInfo2]') AND parent_object_id = OBJECT_ID(N'[Lab].[Laboratory]'))
ALTER TABLE [Lab].[Laboratory]  WITH CHECK ADD  CONSTRAINT [FK_Laboratory_BaseInfo2] FOREIGN KEY([ApprovalAuthorityId])
REFERENCES [share].[BaseInfo] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Laboratory_BaseInfo2]') AND parent_object_id = OBJECT_ID(N'[Lab].[Laboratory]'))
ALTER TABLE [Lab].[Laboratory] CHECK CONSTRAINT [FK_Laboratory_BaseInfo2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Laboratory_Department]') AND parent_object_id = OBJECT_ID(N'[Lab].[Laboratory]'))
ALTER TABLE [Lab].[Laboratory]  WITH CHECK ADD  CONSTRAINT [FK_Laboratory_Department] FOREIGN KEY([ResearchCenterId])
REFERENCES [organization].[Department] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Laboratory_Department]') AND parent_object_id = OBJECT_ID(N'[Lab].[Laboratory]'))
ALTER TABLE [Lab].[Laboratory] CHECK CONSTRAINT [FK_Laboratory_Department]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Ward_Laboratory]') AND parent_object_id = OBJECT_ID(N'[Lab].[Ward]'))
ALTER TABLE [Lab].[Ward]  WITH CHECK ADD  CONSTRAINT [FK_Ward_Laboratory] FOREIGN KEY([LaboratoryId])
REFERENCES [Lab].[Laboratory] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Lab].[FK_Ward_Laboratory]') AND parent_object_id = OBJECT_ID(N'[Lab].[Ward]'))
ALTER TABLE [Lab].[Ward] CHECK CONSTRAINT [FK_Ward_Laboratory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[organization].[FK_Department_BaseInfo]') AND parent_object_id = OBJECT_ID(N'[organization].[Department]'))
ALTER TABLE [organization].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_BaseInfo] FOREIGN KEY([DepartmentTypeId])
REFERENCES [share].[BaseInfo] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[organization].[FK_Department_BaseInfo]') AND parent_object_id = OBJECT_ID(N'[organization].[Department]'))
ALTER TABLE [organization].[Department] CHECK CONSTRAINT [FK_Department_BaseInfo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[organization].[FK_Department_Department]') AND parent_object_id = OBJECT_ID(N'[organization].[Department]'))
ALTER TABLE [organization].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Department] FOREIGN KEY([ParentId])
REFERENCES [organization].[Department] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[organization].[FK_Department_Department]') AND parent_object_id = OBJECT_ID(N'[organization].[Department]'))
ALTER TABLE [organization].[Department] CHECK CONSTRAINT [FK_Department_Department]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[share].[FK_BaseInfo_BaseTableType]') AND parent_object_id = OBJECT_ID(N'[share].[BaseInfo]'))
ALTER TABLE [share].[BaseInfo]  WITH CHECK ADD  CONSTRAINT [FK_BaseInfo_BaseTableType] FOREIGN KEY([BaseTableTypeId])
REFERENCES [share].[BaseTableType] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[share].[FK_BaseInfo_BaseTableType]') AND parent_object_id = OBJECT_ID(N'[share].[BaseInfo]'))
ALTER TABLE [share].[BaseInfo] CHECK CONSTRAINT [FK_BaseInfo_BaseTableType]
GO
USE [master]
GO
ALTER DATABASE [Shaa] SET  READ_WRITE 
GO
