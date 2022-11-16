USE [master]
GO
/****** Object:  Database [Shaa]    Script Date: 11/16/2022 7:06:34 AM ******/
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
/****** Object:  Schema [Lab]    Script Date: 11/16/2022 7:06:34 AM ******/
CREATE SCHEMA [Lab]
GO
/****** Object:  Schema [organization]    Script Date: 11/16/2022 7:06:34 AM ******/
CREATE SCHEMA [organization]
GO
/****** Object:  Schema [Req]    Script Date: 11/16/2022 7:06:34 AM ******/
CREATE SCHEMA [Req]
GO
/****** Object:  Schema [share]    Script Date: 11/16/2022 7:06:34 AM ******/
CREATE SCHEMA [share]
GO
/****** Object:  Table [dbo].[Indicator]    Script Date: 11/16/2022 7:06:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Indicator](
	[Id] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[FromNo] [int] NOT NULL,
	[ToNo] [int] NOT NULL,
	[Increment] [int] NOT NULL,
	[Template] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Indicator] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IndicatorNo]    Script Date: 11/16/2022 7:06:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndicatorNo](
	[Id] [nvarchar](255) NOT NULL,
	[IndicatorId] [int] NOT NULL,
	[IndicatorDate] [datetime] NOT NULL,
	[IndicatedNumber] [int] NOT NULL,
	[ReqInfo] [nvarchar](1000) NULL,
	[ReqId] [varchar](100) NULL,
 CONSTRAINT [PK_IndicatorNo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/16/2022 7:06:34 AM ******/
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
/****** Object:  Table [Lab].[Ability]    Script Date: 11/16/2022 7:06:34 AM ******/
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
/****** Object:  Table [Lab].[Equipment]    Script Date: 11/16/2022 7:06:34 AM ******/
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
/****** Object:  Table [Lab].[EquipmentAbility]    Script Date: 11/16/2022 7:06:34 AM ******/
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
/****** Object:  Table [Lab].[Laboratory]    Script Date: 11/16/2022 7:06:34 AM ******/
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
/****** Object:  Table [Lab].[Request]    Script Date: 11/16/2022 7:06:34 AM ******/
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
	[TraceCode] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Lab].[Ward]    Script Date: 11/16/2022 7:06:34 AM ******/
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
/****** Object:  Table [organization].[Department]    Script Date: 11/16/2022 7:06:34 AM ******/
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
/****** Object:  Table [share].[BaseInfo]    Script Date: 11/16/2022 7:06:34 AM ******/
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
/****** Object:  Table [share].[BaseTableType]    Script Date: 11/16/2022 7:06:34 AM ******/
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
ALTER TABLE [dbo].[IndicatorNo]  WITH CHECK ADD  CONSTRAINT [FK_IndicatorNo_Indicator] FOREIGN KEY([IndicatorId])
REFERENCES [dbo].[Indicator] ([Id])
GO
ALTER TABLE [dbo].[IndicatorNo] CHECK CONSTRAINT [FK_IndicatorNo_Indicator]
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
ALTER TABLE [Lab].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_IndicatorNo] FOREIGN KEY([IndicatorNo])
REFERENCES [dbo].[IndicatorNo] ([Id])
GO
ALTER TABLE [Lab].[Request] CHECK CONSTRAINT [FK_Request_IndicatorNo]
GO
ALTER TABLE [Lab].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Laboratory] FOREIGN KEY([LaboratoryId])
REFERENCES [Lab].[Laboratory] ([Id])
GO
ALTER TABLE [Lab].[Request] CHECK CONSTRAINT [FK_Request_Laboratory]
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
