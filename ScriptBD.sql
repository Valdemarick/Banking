USE [BankingSystem]
GO

--Date:16.02.2022 20:57

CREATE TABLE [dbo].[Banks] (
	[BankId] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	CONSTRAINT [PK_Banks_BankId] PRIMARY KEY CLUSTERED (BankId),
	CONSTRAINT [UQ_Banks_Name] UNIQUE(Name),
	CONSTRAINT [CK_Banks_Name] CHECK (Name != '')
);
GO

--Date:16.02.2022 21:04
CREATE TABLE [dbo].[Filials] (
	[FilialId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[BankId] [int] NOT NULL,
	CONSTRAINT [PK_Filials_FilialId] PRIMARY KEY CLUSTERED (FilialId) 
);
GO

--Date:16.02.2022 21:06
CREATE TABLE [dbo].[Cities] (
	[CityId] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	CONSTRAINT [PK_Cities_CityId] PRIMARY KEY CLUSTERED (CityId),
	CONSTRAINT [UQ_Cities_Name] UNIQUE (Name),
	CONSTRAINT [CK_Cities_Name] CHECK (Name != '')
);
GO

--Date:16.02.2022 21:09
CREATE TABLE [dbo].[Cards] (
	[CardId] [int] NOT NULL,
	[AccountId] [int] NULL,
	[OwnerName] [nvarchar](30) NOT NULL,
	[Balance] [money] NOT NULL,
	[BankId] [int] NOT NULL,
	[SocialStatusId] [int] NOT NULL,
	CONSTRAINT [PK_Cards_CardId] PRIMARY KEY CLUSTERED (CardId),
	CONSTRAINT [CK_Cards_OwnerName] CHECK (OwnerName != '')
);
GO

--Date:16.02.2022 21:13
CREATE TABLE [dbo].[Accounts] (
	[AccountId] [int] NOT NULL,
	[CLientId] [int] NOT NULL,
	[Balance] [money] NOT NULL,
	CONSTRAINT [PK_Accounts_AccountId] PRIMARY KEY CLUSTERED (AccountId)
);
GO

--Date:16.02.2022 21:15
CREATE TABLE [dbo].[Clients] (
	[ClientId] [int] NOT NULL, 
	[Name] [nvarchar](30) NOT NULL,
	[Surname] [nvarchar](30) NOT NULL,
	[SocialStatusId] [int] NOT NULL,
	CONSTRAINT [PK_Clients_ClientId] PRIMARY KEY CLUSTERED (ClientId),
	CONSTRAINT [CK_Clients_Name] CHECK (Name != ''),
	CONSTRAINT [CK_Clients_Surname] CHECK (Surname != '')
);
GO

--Date:16.02.2022 21:20
CREATE TABLE [dbo].[SocialStatuses] (
	[SocialStatusId] [int] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	CONSTRAINT [PK_SocialStatuses_SocialStatusId] PRIMARY KEY CLUSTERED (SocialStatusId),
	CONSTRAINT [UQ_SocialStatuses_Name] UNIQUE (Name)
);
GO

--Date:16.02.2022 21:25
CREATE TABLE [dbo].[Clients_Statuses] (
	[ClientId] [int] NOT NULL,
	[SocialStatusId] [int] NOT NULL
);
GO

--Date:16.02.2022 22:10
INSERT [dbo].[Banks] ([BankId], [Name]) VALUES (1, 'MTB');
INSERT [dbo].[Banks] ([BankId], [Name]) VALUES (2, 'BelarusBank');
INSERT [dbo].[Banks] ([BankId], [Name]) VALUES (3, 'AlfaBank');
INSERT [dbo].[Banks] ([BankId], [Name]) VALUES (4, 'SberBank');
INSERT [dbo].[Banks] ([BankId], [Name]) VALUES (5, 'GazPromBank');
GO

--Date:16.02.2022 22:16
INSERT [dbo].[Filials] ([FilialId], [BankId], [CityId]) VALUES (1, 1, 1);
INSERT [dbo].[Filials] ([FilialId], [BankId], [CityId]) VALUES (2, 3, 2);
INSERT [dbo].[Filials] ([FilialId], [BankId], [CityId]) VALUES (3, 1, 3);
INSERT [dbo].[Filials] ([FilialId], [BankId], [CityId]) VALUES (4, 3, 4);
INSERT [dbo].[Filials] ([FilialId], [BankId], [CityId]) VALUES (5, 1, 5);
GO

--Date:16.02.2022 22:19
INSERT [dbo].[Cities] ([CityId], [Name]) VALUES (1, 'Minsk');
INSERT [dbo].[Cities] ([CityId], [Name]) VALUES (2, 'Grodno');
INSERT [dbo].[Cities] ([CityId], [Name]) VALUES (3, 'Gomel');
INSERT [dbo].[Cities] ([CityId], [Name]) VALUES (4, 'Brest');
INSERT [dbo].[Cities] ([CityId], [Name]) VALUES (5, 'Vitebsk');
INSERT [dbo].[Cities] ([CityId], [Name]) VALUES (6, 'Mogilev');
GO

--Date:16.02.2022 22:21
INSERT [dbo].[Clients] ([ClientId], [Name], [Surname], [SocialStatusId]) VALUES (1, 'Petr', 'Ivanov', 2);
INSERT [dbo].[Clients] ([ClientId], [Name], [Surname], [SocialStatusId]) VALUES (2, 'Ivan', 'Korablev', 1);
INSERT [dbo].[Clients] ([ClientId], [Name], [Surname], [SocialStatusId]) VALUES (3, 'Alexander', 'Kozlov', 3);
INSERT [dbo].[Clients] ([ClientId], [Name], [Surname], [SocialStatusId]) VALUES (4, 'Anna', 'Klimova', 1);
INSERT [dbo].[Clients] ([ClientId], [Name], [Surname], [SocialStatusId]) VALUES (5, 'Evngeniya', 'Ivanets', 2);
INSERT [dbo].[Clients] ([ClientId], [Name], [Surname], [SocialStatusId]) VALUES (6, 'Vladimir', 'Korbut', 3);
INSERT [dbo].[Clients] ([ClientId], [Name], [Surname], [SocialStatusId]) VALUES (7, 'Pavel', 'Dobrush', 2);
GO