USE [Banking]
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
	--[SocialStatusId] [int] NOT NULL,
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
INSERT [dbo].[Clients] ([ClientId], [Name], [Surname]) VALUES (1, 'Petr', 'Ivanov');
INSERT [dbo].[Clients] ([ClientId], [Name], [Surname]) VALUES (2, 'Ivan', 'Korablev');
INSERT [dbo].[Clients] ([ClientId], [Name], [Surname]) VALUES (3, 'Alexander', 'Kozlov');
INSERT [dbo].[Clients] ([ClientId], [Name], [Surname]) VALUES (4, 'Anna', 'Klimova');
INSERT [dbo].[Clients] ([ClientId], [Name], [Surname]) VALUES (5, 'Evngeniya', 'Ivanets');
INSERT [dbo].[Clients] ([ClientId], [Name], [Surname]) VALUES (6, 'Vladimir', 'Korbut');
INSERT [dbo].[Clients] ([ClientId], [Name], [Surname]) VALUES (7, 'Pavel', 'Dobrush');
GO

--Date:17.02.2022 10:31
INSERT [dbo].[Accounts] ([AccountId], [ClientId], [Balance]) VALUES (1, 1, 47.32);
INSERT [dbo].[Accounts] ([AccountId], [ClientId], [Balance]) VALUES (2, 2, 23.32);
INSERT [dbo].[Accounts] ([AccountId], [ClientId], [Balance]) VALUES (3, 3, 83.96);
INSERT [dbo].[Accounts] ([AccountId], [ClientId], [Balance]) VALUES (4, 4, 213.01);
INSERT [dbo].[Accounts] ([AccountId], [ClientId], [Balance]) VALUES (5, 5, 123.42);
INSERT [dbo].[Accounts] ([AccountId], [ClientId], [Balance]) VALUES (6, 6, 101.01);
GO

--Date:17.02.2022 10:35
INSERT [dbo].[SocialStatuses] ([SocialStatusId], [Name]) VALUES (1, 'employee');
INSERT [dbo].[SocialStatuses] ([SocialStatusId], [Name]) VALUES (2, 'pensioner');
INSERT [dbo].[SocialStatuses] ([SocialStatusId], [Name]) VALUES (3, 'disabled');
INSERT [dbo].[SocialStatuses] ([SocialStatusId], [Name]) VALUES (4, 'student');
GO


--Date:17.02.2022 10:40
INSERT [dbo].[Clients_Statuses] ([ClientId], [SocialStatusId]) VALUES (1, 1);
INSERT [dbo].[Clients_Statuses] ([ClientId], [SocialStatusId]) VALUES (1, 2);
INSERT [dbo].[Clients_Statuses] ([ClientId], [SocialStatusId]) VALUES (2, 3);
INSERT [dbo].[Clients_Statuses] ([ClientId], [SocialStatusId]) VALUES (3, 1);
INSERT [dbo].[Clients_Statuses] ([ClientId], [SocialStatusId]) VALUES (3, 4);
INSERT [dbo].[Clients_Statuses] ([ClientId], [SocialStatusId]) VALUES (4, 2);
INSERT [dbo].[Clients_Statuses] ([ClientId], [SocialStatusId]) VALUES (5, 2);
INSERT [dbo].[Clients_Statuses] ([ClientId], [SocialStatusId]) VALUES (5, 3);
INSERT [dbo].[Clients_Statuses] ([ClientId], [SocialStatusId]) VALUES (6, 1);
INSERT [dbo].[Clients_Statuses] ([ClientId], [SocialStatusId]) VALUES (6, 2);
INSERT [dbo].[Clients_Statuses] ([ClientId], [SocialStatusId]) VALUES (7, 1);
INSERT [dbo].[Clients_Statuses] ([ClientId], [SocialStatusId]) VALUES (7, 4);
GO

--Date:17.02.2022 10:44
INSERT [dbo].[Cards] ([CardId], [AccountId], [BankId], [OwnerName], [Balance], [SocialStatusId]) 
VALUES (1, 1, 1, 'Jack', 43.43, 1);
INSERT [dbo].[Cards] ([CardId], [AccountId], [BankId], [OwnerName], [Balance], [SocialStatusId]) 
VALUES (2, NULL, 1, 'John', 13.23, 4);
INSERT [dbo].[Cards] ([CardId], [AccountId], [BankId], [OwnerName], [Balance], [SocialStatusId]) 
VALUES (3, 2, 2, 'Vladislav', 75.34, 2);
INSERT [dbo].[Cards] ([CardId], [AccountId], [BankId], [OwnerName], [Balance], [SocialStatusId]) 
VALUES (4, 3, 3, 'Ekaterina', 132.02, 2);
INSERT [dbo].[Cards] ([CardId], [AccountId], [BankId], [OwnerName], [Balance], [SocialStatusId]) 
VALUES (5, 4, 4, 'Nikolai', 65.23, 1);
INSERT [dbo].[Cards] ([CardId], [AccountId], [BankId], [OwnerName], [Balance], [SocialStatusId]) 
VALUES (6, 5, 3, 'Boris', 54.95, 3);
GO

--Date:17.02.2022 10:00
ALTER TABLE [dbo].[Filials] ADD CONSTRAINT [FK_Filials_BankId] FOREIGN KEY([BankId]) 
REFERENCES [dbo].[Banks] ([BankId]);
GO

ALTER TABLE [dbo].[Filials] ADD CONSTRAINT [FK_Filials_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([CityId]);
GO

--Date:17.02.2022 10:04
ALTER TABLE [dbo].[Cards] ADD CONSTRAINT [FK_Cards_AccountId] FOREIGN KEY ([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId]);
GO

ALTER TABLE [dbo].[Cards] ADD CONSTRAINT [FK_Cards_BankId] FOREIGN KEY ([BankId])
REFERENCES [dbo].[Banks] ([BankId]);
GO

ALTER TABLE [dbo].[Cards] ADD CONSTRAINT [FK_Cards_SocialStatusId] FOREIGN KEY ([SocialStatusId])
REFERENCES [dbo].[SocialStatuses] ([SocialStatusId]);
GO

--Date:17.02.2022 10:07
ALTER TABLE [dbo].[Accounts] ADD CONSTRAINT [FK_Accounts_ClientId] FOREIGN KEY ([ClientId])
REFERENCES [dbo].[Clients] ([ClientId]);
GO

--Date:17.02.2022 10:10
ALTER TABLE [dbo].[Clients_Statuses] ADD CONSTRAINT [FK_Clients_Statuses_SocialStatusId] FOREIGN KEY ([SocialStatusId])
REFERENCES [dbo].[SocialStatuses] ([SocialStatusId]);
GO

ALTER TABLE [dbo].[Clients_Statuses] ADD CONSTRAINT [FK_Clients_Statuses_ClientId] FOREIGN KEY ([ClientId])
REFERENCES [dbo].[Clients] ([ClientId]);
GO