CREATE DATABASE DronTaxi
GO
USE [DronTaxi]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 31.07.2020 8:39:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[SystemName] [nvarchar](56) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[SystemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolesSystemFunctions]    Script Date: 31.07.2020 8:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesSystemFunctions](
	[RoleSystemName] [nvarchar](56) NOT NULL,
	[SystemFunctionSystemName] [nvarchar](56) NOT NULL,
 CONSTRAINT [PK_RolesSystemFunctions] PRIMARY KEY CLUSTERED 
(
	[RoleSystemName] ASC,
	[SystemFunctionSystemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemFunctions]    Script Date: 31.07.2020 8:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemFunctions](
	[SystemName] [nvarchar](56) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_SystemFunctions] PRIMARY KEY CLUSTERED 
(
	[SystemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 31.07.2020 8:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Login] [nvarchar](128) NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[Salt] [nvarchar](128) NOT NULL,
	[Logo] [nvarchar](128) NULL,
	[SecondName] [nvarchar](64) NULL,
	[FirstName] [nvarchar](64) NULL,
	[PatronymicName] [nvarchar](64) NULL,
	[Email] [nvarchar](128) NULL,
	[Birthday] [date] NULL,
	[Sex] [nvarchar](1) NULL,
	[Phone] [nvarchar](20) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersRoles]    Script Date: 31.07.2020 8:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersRoles](
	[UserLogin] [nvarchar](128) NOT NULL,
	[RoleSystemName] [nvarchar](56) NOT NULL,
	[BeginingDate] [date] NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_UsersRoles] PRIMARY KEY CLUSTERED 
(
	[UserLogin] ASC,
	[RoleSystemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Roles] ([SystemName], [Name]) VALUES (N'admin', N'Администратор')
INSERT [dbo].[Roles] ([SystemName], [Name]) VALUES (N'user', N'Пользователь')
GO
INSERT [dbo].[RolesSystemFunctions] ([RoleSystemName], [SystemFunctionSystemName]) VALUES (N'admin', N'profile')
INSERT [dbo].[RolesSystemFunctions] ([RoleSystemName], [SystemFunctionSystemName]) VALUES (N'admin', N'rolemanage')
INSERT [dbo].[RolesSystemFunctions] ([RoleSystemName], [SystemFunctionSystemName]) VALUES (N'admin', N'usermanage')
INSERT [dbo].[RolesSystemFunctions] ([RoleSystemName], [SystemFunctionSystemName]) VALUES (N'user', N'profile')
GO
INSERT [dbo].[SystemFunctions] ([SystemName], [Name]) VALUES (N'profile', N'Профиль')
INSERT [dbo].[SystemFunctions] ([SystemName], [Name]) VALUES (N'rolemanage', N'Управление ролями')
INSERT [dbo].[SystemFunctions] ([SystemName], [Name]) VALUES (N'usermanage', N'Управление пользователями')
GO
INSERT [dbo].[Users] ([Login], [Password], [Salt], [Logo], [SecondName], [FirstName], [PatronymicName], [Email], [Birthday], [Sex], [Phone]) VALUES (N'admin@yandex.ru', N'A1AE64B52EC1F98F8A80988D585D30EF8A4911DF20180B2D554E9F3128416A10', N'ADB7B2F89F7B9171E11D07FF21D815BDA93C53708CC28C7B94F9A199F66E0888', N'admin.jpg', N'Петров', N'Сергей', N'Борисович', N'petrov@yandex.ru', CAST(N'1992-04-01' AS Date), N'м', N'9 034-514-9991')
INSERT [dbo].[Users] ([Login], [Password], [Salt], [Logo], [SecondName], [FirstName], [PatronymicName], [Email], [Birthday], [Sex], [Phone]) VALUES (N'drontaxi@yandex.ru', N'2D7871D246B79D4559DF7786ED7A20EEC03B4A499A74A1F27C4DB708DE5B5ED0', N'2AEDDB74D8FAA0748733053542BA20893772629CBD2EFD4350003606A1DDABF7', N'Logo_Dron_Taxi.png', N'Петров', N'Петр', N'Петрович', NULL, CAST(N'2012-12-12' AS Date), N'ж', NULL)
INSERT [dbo].[Users] ([Login], [Password], [Salt], [Logo], [SecondName], [FirstName], [PatronymicName], [Email], [Birthday], [Sex], [Phone]) VALUES (N'todor@mail.ru', N'B33E013F3CCDEE88F8BC6EFBF2ECBD16906E4D8EC8974FA4079919CBBF0DC410', N'AEB3846CDDCC8D199732B90D8C2A06A6897666047A666AF6E6E0C93B58018B8A', N'todor.jpg', N'Тодоренко', N'Регина', N'Петровна', NULL, CAST(N'1990-06-14' AS Date), N'ж', NULL)
INSERT [dbo].[Users] ([Login], [Password], [Salt], [Logo], [SecondName], [FirstName], [PatronymicName], [Email], [Birthday], [Sex], [Phone]) VALUES (N'user@yandex.ru', N'BED30FAE14AE2A914F79DCC4251EF298122E8B3B917E783950EBA458EB8C4913', N'6645DA434CE45269C65FDB50051C729015E7538BE82CDAF97A2EFACB913DF436', N'clear-prof.png', N'Игнатьев', N'Юзер', N'Сергеевич', N'', CAST(N'1990-01-27' AS Date), N'м', NULL)
GO
INSERT [dbo].[UsersRoles] ([UserLogin], [RoleSystemName], [BeginingDate], [EndDate]) VALUES (N'admin@yandex.ru', N'admin', CAST(N'2020-07-29' AS Date), NULL)
INSERT [dbo].[UsersRoles] ([UserLogin], [RoleSystemName], [BeginingDate], [EndDate]) VALUES (N'admin@yandex.ru', N'user', CAST(N'2020-07-29' AS Date), NULL)
INSERT [dbo].[UsersRoles] ([UserLogin], [RoleSystemName], [BeginingDate], [EndDate]) VALUES (N'drontaxi@yandex.ru', N'user', CAST(N'2020-07-30' AS Date), NULL)
INSERT [dbo].[UsersRoles] ([UserLogin], [RoleSystemName], [BeginingDate], [EndDate]) VALUES (N'todor@mail.ru', N'user', CAST(N'2020-07-29' AS Date), NULL)
INSERT [dbo].[UsersRoles] ([UserLogin], [RoleSystemName], [BeginingDate], [EndDate]) VALUES (N'user@yandex.ru', N'user', CAST(N'2020-07-29' AS Date), NULL)
GO
ALTER TABLE [dbo].[RolesSystemFunctions]  WITH CHECK ADD  CONSTRAINT [FK_RolesSystemFunctions_Roles] FOREIGN KEY([RoleSystemName])
REFERENCES [dbo].[Roles] ([SystemName])
GO
ALTER TABLE [dbo].[RolesSystemFunctions] CHECK CONSTRAINT [FK_RolesSystemFunctions_Roles]
GO
ALTER TABLE [dbo].[RolesSystemFunctions]  WITH CHECK ADD  CONSTRAINT [FK_RolesSystemFunctions_SystemFunctions] FOREIGN KEY([SystemFunctionSystemName])
REFERENCES [dbo].[SystemFunctions] ([SystemName])
GO
ALTER TABLE [dbo].[RolesSystemFunctions] CHECK CONSTRAINT [FK_RolesSystemFunctions_SystemFunctions]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersRoles_Roles] FOREIGN KEY([RoleSystemName])
REFERENCES [dbo].[Roles] ([SystemName])
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_UsersRoles_Roles]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersRoles_Users] FOREIGN KEY([UserLogin])
REFERENCES [dbo].[Users] ([Login])
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_UsersRoles_Users]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Системное имя' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Roles', @level2type=N'COLUMN',@level2name=N'SystemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Наименование' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Roles', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Роли' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Roles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Системное имя роли' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RolesSystemFunctions', @level2type=N'COLUMN',@level2name=N'RoleSystemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Системное имя функции системы' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RolesSystemFunctions', @level2type=N'COLUMN',@level2name=N'SystemFunctionSystemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Роли и системные функции' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RolesSystemFunctions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Системное имя' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemFunctions', @level2type=N'COLUMN',@level2name=N'SystemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Наименование' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemFunctions', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Функции системы' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemFunctions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Логин' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Login'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Пароль' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Соль' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Salt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Фото профиля' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Logo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Фамилия' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'SecondName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Имя' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Отчество' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'PatronymicName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'День рождения' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Birthday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Пол' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Таблица пользователей' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Логин пользователя' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UsersRoles', @level2type=N'COLUMN',@level2name=N'UserLogin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Системное имя роли' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UsersRoles', @level2type=N'COLUMN',@level2name=N'RoleSystemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Пользователи и их роли' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UsersRoles'
GO
