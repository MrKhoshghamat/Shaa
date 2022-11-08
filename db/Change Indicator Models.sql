USE [ShaaDataBase]
GO
/****** Object:  Table [dbo].[Indicator]    Script Date: 11/8/2022 10:44:09 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IndicatorNo]    Script Date: 11/8/2022 10:44:09 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lab].[Laboratory]    Script Date: 11/8/2022 10:44:09 PM ******/
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
	[ResearchCenterId] [int] NULL,
	[StandardStatusId] [int] NULL,
	[PhoneNumber] [varchar](50) NULL,
	[ImagePath] [nvarchar](1000) NULL,
	[Address] [nvarchar](4000) NULL,
	[Description] [nvarchar](4000) NULL,
	[Row] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Laboratory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lab].[Request]    Script Date: 11/8/2022 10:44:09 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[IndicatorNo]  WITH CHECK ADD  CONSTRAINT [FK_IndicatorNo_Indicator] FOREIGN KEY([IndicatorId])
REFERENCES [dbo].[Indicator] ([Id])
GO
ALTER TABLE [dbo].[IndicatorNo] CHECK CONSTRAINT [FK_IndicatorNo_Indicator]
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
ALTER TABLE [Lab].[Laboratory]  WITH CHECK ADD  CONSTRAINT [FK_Laboratory_BaseInfo3] FOREIGN KEY([ResearchCenterId])
REFERENCES [share].[BaseInfo] ([Id])
GO
ALTER TABLE [Lab].[Laboratory] CHECK CONSTRAINT [FK_Laboratory_BaseInfo3]
GO
ALTER TABLE [Lab].[Laboratory]  WITH CHECK ADD  CONSTRAINT [FK_Laboratory_BaseInfo4] FOREIGN KEY([StandardStatusId])
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
