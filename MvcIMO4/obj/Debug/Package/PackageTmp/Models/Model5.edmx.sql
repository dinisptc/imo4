
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 05/17/2011 18:11:41
-- Generated from EDMX file: D:\www.imo4.com\MvcIMO4\MvcIMO4\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [imo4];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__aspnet_Me__Appli__662B2B3B]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_Membership] DROP CONSTRAINT [FK__aspnet_Me__Appli__662B2B3B];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Me__UserI__671F4F74]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_Membership] DROP CONSTRAINT [FK__aspnet_Me__UserI__671F4F74];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Pa__Appli__1F63A897]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_Paths] DROP CONSTRAINT [FK__aspnet_Pa__Appli__1F63A897];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Pe__PathI__2704CA5F]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers] DROP CONSTRAINT [FK__aspnet_Pe__PathI__2704CA5F];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Pe__PathI__2CBDA3B5]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] DROP CONSTRAINT [FK__aspnet_Pe__PathI__2CBDA3B5];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Pe__UserI__2DB1C7EE]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] DROP CONSTRAINT [FK__aspnet_Pe__UserI__2DB1C7EE];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Pr__UserI__7D0E9093]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_Profile] DROP CONSTRAINT [FK__aspnet_Pr__UserI__7D0E9093];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Ro__Appli__0880433F]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_Roles] DROP CONSTRAINT [FK__aspnet_Ro__Appli__0880433F];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Us__Appli__5224328E]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_Users] DROP CONSTRAINT [FK__aspnet_Us__Appli__5224328E];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Us__RoleI__0F2D40CE]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK__aspnet_Us__RoleI__0F2D40CE];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Us__UserI__0E391C95]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK__aspnet_Us__UserI__0E391C95];
GO
IF OBJECT_ID(N'[dbo].[FK_Cart_subscricoes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Carts] DROP CONSTRAINT [FK_Cart_subscricoes];
GO
IF OBJECT_ID(N'[dbo].[FK_Categorias_Idiomas]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Categorias] DROP CONSTRAINT [FK_Categorias_Idiomas];
GO
IF OBJECT_ID(N'[dbo].[FK_estado_Idiomas]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[estadoes] DROP CONSTRAINT [FK_estado_Idiomas];
GO
IF OBJECT_ID(N'[dbo].[FK_Fotos_imovel]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Fotos] DROP CONSTRAINT [FK_Fotos_imovel];
GO
IF OBJECT_ID(N'[dbo].[FK_imovel_descricao_Idiomas]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[imovel_descricao] DROP CONSTRAINT [FK_imovel_descricao_Idiomas];
GO
IF OBJECT_ID(N'[dbo].[FK_imovel_descricao_imovel]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[imovel_descricao] DROP CONSTRAINT [FK_imovel_descricao_imovel];
GO
IF OBJECT_ID(N'[dbo].[FK_imovel_objectivo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[imovels] DROP CONSTRAINT [FK_imovel_objectivo];
GO
IF OBJECT_ID(N'[dbo].[FK_imovel_subscricoes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[imovels] DROP CONSTRAINT [FK_imovel_subscricoes];
GO
IF OBJECT_ID(N'[dbo].[FK_imovel_tipologia]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[imovels] DROP CONSTRAINT [FK_imovel_tipologia];
GO
IF OBJECT_ID(N'[dbo].[FK_imovels_Categorias]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[imovels] DROP CONSTRAINT [FK_imovels_Categorias];
GO
IF OBJECT_ID(N'[dbo].[FK_imovels_estadoes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[imovels] DROP CONSTRAINT [FK_imovels_estadoes];
GO
IF OBJECT_ID(N'[dbo].[FK_objectivo_Idiomas]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[objectivoes] DROP CONSTRAINT [FK_objectivo_Idiomas];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderDetail_OrdemdeCompra]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK_OrderDetail_OrdemdeCompra];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderDetail_subscricoes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK_OrderDetail_subscricoes];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[aspnet_Applications]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_Applications];
GO
IF OBJECT_ID(N'[dbo].[aspnet_Membership]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_Membership];
GO
IF OBJECT_ID(N'[dbo].[aspnet_Paths]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_Paths];
GO
IF OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_PersonalizationAllUsers];
GO
IF OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_PersonalizationPerUser];
GO
IF OBJECT_ID(N'[dbo].[aspnet_Profile]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_Profile];
GO
IF OBJECT_ID(N'[dbo].[aspnet_Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_Roles];
GO
IF OBJECT_ID(N'[dbo].[aspnet_SchemaVersions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_SchemaVersions];
GO
IF OBJECT_ID(N'[dbo].[aspnet_Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_Users];
GO
IF OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_UsersInRoles];
GO
IF OBJECT_ID(N'[dbo].[aspnet_WebEvent_Events]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_WebEvent_Events];
GO
IF OBJECT_ID(N'[dbo].[Carts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Carts];
GO
IF OBJECT_ID(N'[dbo].[Categorias]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categorias];
GO
IF OBJECT_ID(N'[dbo].[contadors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[contadors];
GO
IF OBJECT_ID(N'[dbo].[estadoes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[estadoes];
GO
IF OBJECT_ID(N'[dbo].[Fotos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Fotos];
GO
IF OBJECT_ID(N'[dbo].[Idiomas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Idiomas];
GO
IF OBJECT_ID(N'[dbo].[imovel_descricao]', 'U') IS NOT NULL
    DROP TABLE [dbo].[imovel_descricao];
GO
IF OBJECT_ID(N'[dbo].[imovels]', 'U') IS NOT NULL
    DROP TABLE [dbo].[imovels];
GO
IF OBJECT_ID(N'[dbo].[objectivoes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[objectivoes];
GO
IF OBJECT_ID(N'[dbo].[OrdemdeCompras]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrdemdeCompras];
GO
IF OBJECT_ID(N'[dbo].[OrderDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderDetails];
GO
IF OBJECT_ID(N'[dbo].[subscricoes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[subscricoes];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[tabelaprecos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tabelaprecos];
GO
IF OBJECT_ID(N'[dbo].[tipologias]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tipologias];
GO
IF OBJECT_ID(N'[imo4ModelStoreContainer].[vw_aspnet_Applications]', 'U') IS NOT NULL
    DROP TABLE [imo4ModelStoreContainer].[vw_aspnet_Applications];
GO
IF OBJECT_ID(N'[imo4ModelStoreContainer].[vw_aspnet_MembershipUsers]', 'U') IS NOT NULL
    DROP TABLE [imo4ModelStoreContainer].[vw_aspnet_MembershipUsers];
GO
IF OBJECT_ID(N'[imo4ModelStoreContainer].[vw_aspnet_Profiles]', 'U') IS NOT NULL
    DROP TABLE [imo4ModelStoreContainer].[vw_aspnet_Profiles];
GO
IF OBJECT_ID(N'[imo4ModelStoreContainer].[vw_aspnet_Roles]', 'U') IS NOT NULL
    DROP TABLE [imo4ModelStoreContainer].[vw_aspnet_Roles];
GO
IF OBJECT_ID(N'[imo4ModelStoreContainer].[vw_aspnet_Users]', 'U') IS NOT NULL
    DROP TABLE [imo4ModelStoreContainer].[vw_aspnet_Users];
GO
IF OBJECT_ID(N'[imo4ModelStoreContainer].[vw_aspnet_UsersInRoles]', 'U') IS NOT NULL
    DROP TABLE [imo4ModelStoreContainer].[vw_aspnet_UsersInRoles];
GO
IF OBJECT_ID(N'[imo4ModelStoreContainer].[vw_aspnet_WebPartState_Paths]', 'U') IS NOT NULL
    DROP TABLE [imo4ModelStoreContainer].[vw_aspnet_WebPartState_Paths];
GO
IF OBJECT_ID(N'[imo4ModelStoreContainer].[vw_aspnet_WebPartState_Shared]', 'U') IS NOT NULL
    DROP TABLE [imo4ModelStoreContainer].[vw_aspnet_WebPartState_Shared];
GO
IF OBJECT_ID(N'[imo4ModelStoreContainer].[vw_aspnet_WebPartState_User]', 'U') IS NOT NULL
    DROP TABLE [imo4ModelStoreContainer].[vw_aspnet_WebPartState_User];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'aspnet_Applications'
CREATE TABLE [dbo].[aspnet_Applications] (
    [ApplicationName] nvarchar(256)  NOT NULL,
    [LoweredApplicationName] nvarchar(256)  NOT NULL,
    [ApplicationId] uniqueidentifier  NOT NULL,
    [Description] nvarchar(256)  NULL
);
GO

-- Creating table 'aspnet_Membership'
CREATE TABLE [dbo].[aspnet_Membership] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [UserId] uniqueidentifier  NOT NULL,
    [Password] nvarchar(128)  NOT NULL,
    [PasswordFormat] int  NOT NULL,
    [PasswordSalt] nvarchar(128)  NOT NULL,
    [MobilePIN] nvarchar(16)  NULL,
    [Email] nvarchar(256)  NULL,
    [LoweredEmail] nvarchar(256)  NULL,
    [PasswordQuestion] nvarchar(256)  NULL,
    [PasswordAnswer] nvarchar(128)  NULL,
    [IsApproved] bit  NOT NULL,
    [IsLockedOut] bit  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [LastLoginDate] datetime  NOT NULL,
    [LastPasswordChangedDate] datetime  NOT NULL,
    [LastLockoutDate] datetime  NOT NULL,
    [FailedPasswordAttemptCount] int  NOT NULL,
    [FailedPasswordAttemptWindowStart] datetime  NOT NULL,
    [FailedPasswordAnswerAttemptCount] int  NOT NULL,
    [FailedPasswordAnswerAttemptWindowStart] datetime  NOT NULL,
    [Comment] nvarchar(max)  NULL
);
GO

-- Creating table 'aspnet_Paths'
CREATE TABLE [dbo].[aspnet_Paths] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [PathId] uniqueidentifier  NOT NULL,
    [Path] nvarchar(256)  NOT NULL,
    [LoweredPath] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'aspnet_PersonalizationAllUsers'
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers] (
    [PathId] uniqueidentifier  NOT NULL,
    [PageSettings] varbinary(max)  NOT NULL,
    [LastUpdatedDate] datetime  NOT NULL
);
GO

-- Creating table 'aspnet_PersonalizationPerUser'
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser] (
    [Id] uniqueidentifier  NOT NULL,
    [PathId] uniqueidentifier  NULL,
    [UserId] uniqueidentifier  NULL,
    [PageSettings] varbinary(max)  NOT NULL,
    [LastUpdatedDate] datetime  NOT NULL
);
GO

-- Creating table 'aspnet_Profile'
CREATE TABLE [dbo].[aspnet_Profile] (
    [UserId] uniqueidentifier  NOT NULL,
    [PropertyNames] nvarchar(max)  NOT NULL,
    [PropertyValuesString] nvarchar(max)  NOT NULL,
    [PropertyValuesBinary] varbinary(max)  NOT NULL,
    [LastUpdatedDate] datetime  NOT NULL
);
GO

-- Creating table 'aspnet_Roles'
CREATE TABLE [dbo].[aspnet_Roles] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [RoleId] uniqueidentifier  NOT NULL,
    [RoleName] nvarchar(256)  NOT NULL,
    [LoweredRoleName] nvarchar(256)  NOT NULL,
    [Description] nvarchar(256)  NULL
);
GO

-- Creating table 'aspnet_SchemaVersions'
CREATE TABLE [dbo].[aspnet_SchemaVersions] (
    [Feature] nvarchar(128)  NOT NULL,
    [CompatibleSchemaVersion] nvarchar(128)  NOT NULL,
    [IsCurrentVersion] bit  NOT NULL
);
GO

-- Creating table 'aspnet_Users'
CREATE TABLE [dbo].[aspnet_Users] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [UserId] uniqueidentifier  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL,
    [LoweredUserName] nvarchar(256)  NOT NULL,
    [MobileAlias] nvarchar(16)  NULL,
    [IsAnonymous] bit  NOT NULL,
    [LastActivityDate] datetime  NOT NULL
);
GO

-- Creating table 'aspnet_WebEvent_Events'
CREATE TABLE [dbo].[aspnet_WebEvent_Events] (
    [EventId] char(32)  NOT NULL,
    [EventTimeUtc] datetime  NOT NULL,
    [EventTime] datetime  NOT NULL,
    [EventType] nvarchar(256)  NOT NULL,
    [EventSequence] decimal(19,0)  NOT NULL,
    [EventOccurrence] decimal(19,0)  NOT NULL,
    [EventCode] int  NOT NULL,
    [EventDetailCode] int  NOT NULL,
    [Message] nvarchar(1024)  NULL,
    [ApplicationPath] nvarchar(256)  NULL,
    [ApplicationVirtualPath] nvarchar(256)  NULL,
    [MachineName] nvarchar(256)  NOT NULL,
    [RequestUrl] nvarchar(1024)  NULL,
    [ExceptionType] nvarchar(256)  NULL,
    [Details] nvarchar(max)  NULL
);
GO

-- Creating table 'Carts'
CREATE TABLE [dbo].[Carts] (
    [RecordId] int IDENTITY(1,1) NOT NULL,
    [CartId] varchar(50)  NOT NULL,
    [SubscricaoId] int  NOT NULL,
    [Count] int  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [identidade] nvarchar(200)  NULL
);
GO

-- Creating table 'Categorias'
CREATE TABLE [dbo].[Categorias] (
    [id] int IDENTITY(1,1) NOT NULL,
    [lcode_id] int  NOT NULL,
    [nome] nvarchar(200)  NOT NULL,
    [foto] nvarchar(500)  NOT NULL,
    [classe] int  NOT NULL
);
GO

-- Creating table 'contadors'
CREATE TABLE [dbo].[contadors] (
    [visitas] int  NOT NULL
);
GO

-- Creating table 'estadoes'
CREATE TABLE [dbo].[estadoes] (
    [id] int IDENTITY(1,1) NOT NULL,
    [estado1] nvarchar(100)  NOT NULL,
    [lcode_id] int  NULL,
    [classe] int  NULL
);
GO

-- Creating table 'Fotos'
CREATE TABLE [dbo].[Fotos] (
    [id] int IDENTITY(1,1) NOT NULL,
    [image_file_name] nvarchar(500)  NOT NULL,
    [imovel_id] int  NOT NULL
);
GO

-- Creating table 'Idiomas'
CREATE TABLE [dbo].[Idiomas] (
    [id] int IDENTITY(1,1) NOT NULL,
    [lcode] nvarchar(2)  NOT NULL
);
GO

-- Creating table 'imovel_descricao'
CREATE TABLE [dbo].[imovel_descricao] (
    [id] int IDENTITY(1,1) NOT NULL,
    [lcode_id] int  NOT NULL,
    [descrição] nvarchar(max)  NOT NULL,
    [imovel_id] int  NOT NULL
);
GO

-- Creating table 'imovels'
CREATE TABLE [dbo].[imovels] (
    [id] int IDENTITY(1,1) NOT NULL,
    [categoria_id] int  NULL,
    [classe_id] int  NULL,
    [estado_id] int  NULL,
    [estado_classe_id] int  NULL,
    [tipologia_id] int  NULL,
    [subscricao_id] int  NULL,
    [objectivo_classe_id] int  NULL,
    [objectivo_id] int  NULL,
    [area_util] nvarchar(200)  NULL,
    [distrito] nvarchar(200)  NULL,
    [concelho] nvarchar(200)  NULL,
    [freguesia] nvarchar(200)  NULL,
    [rua] nvarchar(max)  NULL,
    [preco] int  NULL,
    [area_bruta] nvarchar(200)  NULL,
    [area_terreno] nvarchar(200)  NULL,
    [identidade] nvarchar(200)  NULL,
    [status] int  NULL,
    [data_criacao] datetime  NULL,
    [data_aprovacao] datetime  NULL,
    [data_expira] datetime  NULL,
    [jaesteveactivo] bit  NULL,
    [pais] nvarchar(200)  NULL,
    [Latitude] float  NULL,
    [Longitude] float  NULL
);
GO

-- Creating table 'objectivoes'
CREATE TABLE [dbo].[objectivoes] (
    [id] int IDENTITY(1,1) NOT NULL,
    [tipo_negocio] nvarchar(200)  NOT NULL,
    [lcode_id] int  NULL,
    [classe] int  NULL
);
GO

-- Creating table 'OrdemdeCompras'
CREATE TABLE [dbo].[OrdemdeCompras] (
    [OrderId] int IDENTITY(1,1) NOT NULL,
    [OrderDate] datetime  NULL,
    [Username] nvarchar(256)  NULL,
    [FirstName] nvarchar(160)  NULL,
    [LastName] nvarchar(160)  NULL,
    [InvoiceInfo] nvarchar(max)  NULL,
    [Phone] nvarchar(24)  NULL,
    [Email] nvarchar(160)  NULL,
    [Total] decimal(10,2)  NOT NULL
);
GO

-- Creating table 'OrderDetails'
CREATE TABLE [dbo].[OrderDetails] (
    [OrderDetailId] int IDENTITY(1,1) NOT NULL,
    [OrderId] int  NOT NULL,
    [SubscricaoId] int  NOT NULL,
    [Price] decimal(10,2)  NOT NULL
);
GO

-- Creating table 'subscricoes'
CREATE TABLE [dbo].[subscricoes] (
    [id] int IDENTITY(1,1) NOT NULL,
    [numeromeses] int  NOT NULL,
    [numeroanuncios] int  NOT NULL,
    [identidade] nvarchar(200)  NOT NULL,
    [data_criacao_subscricao] datetime  NOT NULL,
    [price] decimal(10,2)  NOT NULL,
    [pago] bit  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'tabelaprecos'
CREATE TABLE [dbo].[tabelaprecos] (
    [id] int  NOT NULL,
    [precomeses] decimal(2,0)  NOT NULL,
    [precoanuncios] decimal(2,0)  NOT NULL
);
GO

-- Creating table 'tipologias'
CREATE TABLE [dbo].[tipologias] (
    [id] int IDENTITY(1,1) NOT NULL,
    [nome] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'vw_aspnet_Applications'
CREATE TABLE [dbo].[vw_aspnet_Applications] (
    [ApplicationName] nvarchar(256)  NOT NULL,
    [LoweredApplicationName] nvarchar(256)  NOT NULL,
    [ApplicationId] uniqueidentifier  NOT NULL,
    [Description] nvarchar(256)  NULL
);
GO

-- Creating table 'vw_aspnet_MembershipUsers'
CREATE TABLE [dbo].[vw_aspnet_MembershipUsers] (
    [UserId] uniqueidentifier  NOT NULL,
    [PasswordFormat] int  NOT NULL,
    [MobilePIN] nvarchar(16)  NULL,
    [Email] nvarchar(256)  NULL,
    [LoweredEmail] nvarchar(256)  NULL,
    [PasswordQuestion] nvarchar(256)  NULL,
    [PasswordAnswer] nvarchar(128)  NULL,
    [IsApproved] bit  NOT NULL,
    [IsLockedOut] bit  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [LastLoginDate] datetime  NOT NULL,
    [LastPasswordChangedDate] datetime  NOT NULL,
    [LastLockoutDate] datetime  NOT NULL,
    [FailedPasswordAttemptCount] int  NOT NULL,
    [FailedPasswordAttemptWindowStart] datetime  NOT NULL,
    [FailedPasswordAnswerAttemptCount] int  NOT NULL,
    [FailedPasswordAnswerAttemptWindowStart] datetime  NOT NULL,
    [Comment] nvarchar(max)  NULL,
    [ApplicationId] uniqueidentifier  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL,
    [MobileAlias] nvarchar(16)  NULL,
    [IsAnonymous] bit  NOT NULL,
    [LastActivityDate] datetime  NOT NULL
);
GO

-- Creating table 'vw_aspnet_Profiles'
CREATE TABLE [dbo].[vw_aspnet_Profiles] (
    [UserId] uniqueidentifier  NOT NULL,
    [LastUpdatedDate] datetime  NOT NULL,
    [DataSize] int  NULL
);
GO

-- Creating table 'vw_aspnet_Roles'
CREATE TABLE [dbo].[vw_aspnet_Roles] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [RoleId] uniqueidentifier  NOT NULL,
    [RoleName] nvarchar(256)  NOT NULL,
    [LoweredRoleName] nvarchar(256)  NOT NULL,
    [Description] nvarchar(256)  NULL
);
GO

-- Creating table 'vw_aspnet_Users'
CREATE TABLE [dbo].[vw_aspnet_Users] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [UserId] uniqueidentifier  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL,
    [LoweredUserName] nvarchar(256)  NOT NULL,
    [MobileAlias] nvarchar(16)  NULL,
    [IsAnonymous] bit  NOT NULL,
    [LastActivityDate] datetime  NOT NULL
);
GO

-- Creating table 'vw_aspnet_UsersInRoles'
CREATE TABLE [dbo].[vw_aspnet_UsersInRoles] (
    [UserId] uniqueidentifier  NOT NULL,
    [RoleId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'vw_aspnet_WebPartState_Paths'
CREATE TABLE [dbo].[vw_aspnet_WebPartState_Paths] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [PathId] uniqueidentifier  NOT NULL,
    [Path] nvarchar(256)  NOT NULL,
    [LoweredPath] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'vw_aspnet_WebPartState_Shared'
CREATE TABLE [dbo].[vw_aspnet_WebPartState_Shared] (
    [PathId] uniqueidentifier  NOT NULL,
    [DataSize] int  NULL,
    [LastUpdatedDate] datetime  NOT NULL
);
GO

-- Creating table 'vw_aspnet_WebPartState_User'
CREATE TABLE [dbo].[vw_aspnet_WebPartState_User] (
    [PathId] uniqueidentifier  NULL,
    [UserId] uniqueidentifier  NULL,
    [DataSize] int  NULL,
    [LastUpdatedDate] datetime  NOT NULL
);
GO

-- Creating table 'aspnet_UsersInRoles'
CREATE TABLE [dbo].[aspnet_UsersInRoles] (
    [aspnet_Roles_RoleId] uniqueidentifier  NOT NULL,
    [aspnet_Users_UserId] uniqueidentifier  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ApplicationId] in table 'aspnet_Applications'
ALTER TABLE [dbo].[aspnet_Applications]
ADD CONSTRAINT [PK_aspnet_Applications]
    PRIMARY KEY CLUSTERED ([ApplicationId] ASC);
GO

-- Creating primary key on [UserId] in table 'aspnet_Membership'
ALTER TABLE [dbo].[aspnet_Membership]
ADD CONSTRAINT [PK_aspnet_Membership]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [PathId] in table 'aspnet_Paths'
ALTER TABLE [dbo].[aspnet_Paths]
ADD CONSTRAINT [PK_aspnet_Paths]
    PRIMARY KEY CLUSTERED ([PathId] ASC);
GO

-- Creating primary key on [PathId] in table 'aspnet_PersonalizationAllUsers'
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]
ADD CONSTRAINT [PK_aspnet_PersonalizationAllUsers]
    PRIMARY KEY CLUSTERED ([PathId] ASC);
GO

-- Creating primary key on [Id] in table 'aspnet_PersonalizationPerUser'
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
ADD CONSTRAINT [PK_aspnet_PersonalizationPerUser]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [UserId] in table 'aspnet_Profile'
ALTER TABLE [dbo].[aspnet_Profile]
ADD CONSTRAINT [PK_aspnet_Profile]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [RoleId] in table 'aspnet_Roles'
ALTER TABLE [dbo].[aspnet_Roles]
ADD CONSTRAINT [PK_aspnet_Roles]
    PRIMARY KEY CLUSTERED ([RoleId] ASC);
GO

-- Creating primary key on [Feature], [CompatibleSchemaVersion] in table 'aspnet_SchemaVersions'
ALTER TABLE [dbo].[aspnet_SchemaVersions]
ADD CONSTRAINT [PK_aspnet_SchemaVersions]
    PRIMARY KEY CLUSTERED ([Feature], [CompatibleSchemaVersion] ASC);
GO

-- Creating primary key on [UserId] in table 'aspnet_Users'
ALTER TABLE [dbo].[aspnet_Users]
ADD CONSTRAINT [PK_aspnet_Users]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [EventId] in table 'aspnet_WebEvent_Events'
ALTER TABLE [dbo].[aspnet_WebEvent_Events]
ADD CONSTRAINT [PK_aspnet_WebEvent_Events]
    PRIMARY KEY CLUSTERED ([EventId] ASC);
GO

-- Creating primary key on [RecordId] in table 'Carts'
ALTER TABLE [dbo].[Carts]
ADD CONSTRAINT [PK_Carts]
    PRIMARY KEY CLUSTERED ([RecordId] ASC);
GO

-- Creating primary key on [id] in table 'Categorias'
ALTER TABLE [dbo].[Categorias]
ADD CONSTRAINT [PK_Categorias]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [visitas] in table 'contadors'
ALTER TABLE [dbo].[contadors]
ADD CONSTRAINT [PK_contadors]
    PRIMARY KEY CLUSTERED ([visitas] ASC);
GO

-- Creating primary key on [id] in table 'estadoes'
ALTER TABLE [dbo].[estadoes]
ADD CONSTRAINT [PK_estadoes]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Fotos'
ALTER TABLE [dbo].[Fotos]
ADD CONSTRAINT [PK_Fotos]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Idiomas'
ALTER TABLE [dbo].[Idiomas]
ADD CONSTRAINT [PK_Idiomas]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'imovel_descricao'
ALTER TABLE [dbo].[imovel_descricao]
ADD CONSTRAINT [PK_imovel_descricao]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'imovels'
ALTER TABLE [dbo].[imovels]
ADD CONSTRAINT [PK_imovels]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'objectivoes'
ALTER TABLE [dbo].[objectivoes]
ADD CONSTRAINT [PK_objectivoes]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [OrderId] in table 'OrdemdeCompras'
ALTER TABLE [dbo].[OrdemdeCompras]
ADD CONSTRAINT [PK_OrdemdeCompras]
    PRIMARY KEY CLUSTERED ([OrderId] ASC);
GO

-- Creating primary key on [OrderDetailId] in table 'OrderDetails'
ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT [PK_OrderDetails]
    PRIMARY KEY CLUSTERED ([OrderDetailId] ASC);
GO

-- Creating primary key on [id] in table 'subscricoes'
ALTER TABLE [dbo].[subscricoes]
ADD CONSTRAINT [PK_subscricoes]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [id] in table 'tabelaprecos'
ALTER TABLE [dbo].[tabelaprecos]
ADD CONSTRAINT [PK_tabelaprecos]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'tipologias'
ALTER TABLE [dbo].[tipologias]
ADD CONSTRAINT [PK_tipologias]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [ApplicationName], [LoweredApplicationName], [ApplicationId] in table 'vw_aspnet_Applications'
ALTER TABLE [dbo].[vw_aspnet_Applications]
ADD CONSTRAINT [PK_vw_aspnet_Applications]
    PRIMARY KEY CLUSTERED ([ApplicationName], [LoweredApplicationName], [ApplicationId] ASC);
GO

-- Creating primary key on [UserId], [PasswordFormat], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate] in table 'vw_aspnet_MembershipUsers'
ALTER TABLE [dbo].[vw_aspnet_MembershipUsers]
ADD CONSTRAINT [PK_vw_aspnet_MembershipUsers]
    PRIMARY KEY CLUSTERED ([UserId], [PasswordFormat], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate] ASC);
GO

-- Creating primary key on [UserId], [LastUpdatedDate] in table 'vw_aspnet_Profiles'
ALTER TABLE [dbo].[vw_aspnet_Profiles]
ADD CONSTRAINT [PK_vw_aspnet_Profiles]
    PRIMARY KEY CLUSTERED ([UserId], [LastUpdatedDate] ASC);
GO

-- Creating primary key on [ApplicationId], [RoleId], [RoleName], [LoweredRoleName] in table 'vw_aspnet_Roles'
ALTER TABLE [dbo].[vw_aspnet_Roles]
ADD CONSTRAINT [PK_vw_aspnet_Roles]
    PRIMARY KEY CLUSTERED ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName] ASC);
GO

-- Creating primary key on [ApplicationId], [UserId], [UserName], [LoweredUserName], [IsAnonymous], [LastActivityDate] in table 'vw_aspnet_Users'
ALTER TABLE [dbo].[vw_aspnet_Users]
ADD CONSTRAINT [PK_vw_aspnet_Users]
    PRIMARY KEY CLUSTERED ([ApplicationId], [UserId], [UserName], [LoweredUserName], [IsAnonymous], [LastActivityDate] ASC);
GO

-- Creating primary key on [UserId], [RoleId] in table 'vw_aspnet_UsersInRoles'
ALTER TABLE [dbo].[vw_aspnet_UsersInRoles]
ADD CONSTRAINT [PK_vw_aspnet_UsersInRoles]
    PRIMARY KEY CLUSTERED ([UserId], [RoleId] ASC);
GO

-- Creating primary key on [ApplicationId], [PathId], [Path], [LoweredPath] in table 'vw_aspnet_WebPartState_Paths'
ALTER TABLE [dbo].[vw_aspnet_WebPartState_Paths]
ADD CONSTRAINT [PK_vw_aspnet_WebPartState_Paths]
    PRIMARY KEY CLUSTERED ([ApplicationId], [PathId], [Path], [LoweredPath] ASC);
GO

-- Creating primary key on [PathId], [LastUpdatedDate] in table 'vw_aspnet_WebPartState_Shared'
ALTER TABLE [dbo].[vw_aspnet_WebPartState_Shared]
ADD CONSTRAINT [PK_vw_aspnet_WebPartState_Shared]
    PRIMARY KEY CLUSTERED ([PathId], [LastUpdatedDate] ASC);
GO

-- Creating primary key on [LastUpdatedDate] in table 'vw_aspnet_WebPartState_User'
ALTER TABLE [dbo].[vw_aspnet_WebPartState_User]
ADD CONSTRAINT [PK_vw_aspnet_WebPartState_User]
    PRIMARY KEY CLUSTERED ([LastUpdatedDate] ASC);
GO

-- Creating primary key on [aspnet_Roles_RoleId], [aspnet_Users_UserId] in table 'aspnet_UsersInRoles'
ALTER TABLE [dbo].[aspnet_UsersInRoles]
ADD CONSTRAINT [PK_aspnet_UsersInRoles]
    PRIMARY KEY NONCLUSTERED ([aspnet_Roles_RoleId], [aspnet_Users_UserId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ApplicationId] in table 'aspnet_Membership'
ALTER TABLE [dbo].[aspnet_Membership]
ADD CONSTRAINT [FK__aspnet_Me__Appli__662B2B3B]
    FOREIGN KEY ([ApplicationId])
    REFERENCES [dbo].[aspnet_Applications]
        ([ApplicationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Me__Appli__662B2B3B'
CREATE INDEX [IX_FK__aspnet_Me__Appli__662B2B3B]
ON [dbo].[aspnet_Membership]
    ([ApplicationId]);
GO

-- Creating foreign key on [ApplicationId] in table 'aspnet_Paths'
ALTER TABLE [dbo].[aspnet_Paths]
ADD CONSTRAINT [FK__aspnet_Pa__Appli__1F63A897]
    FOREIGN KEY ([ApplicationId])
    REFERENCES [dbo].[aspnet_Applications]
        ([ApplicationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Pa__Appli__1F63A897'
CREATE INDEX [IX_FK__aspnet_Pa__Appli__1F63A897]
ON [dbo].[aspnet_Paths]
    ([ApplicationId]);
GO

-- Creating foreign key on [ApplicationId] in table 'aspnet_Roles'
ALTER TABLE [dbo].[aspnet_Roles]
ADD CONSTRAINT [FK__aspnet_Ro__Appli__0880433F]
    FOREIGN KEY ([ApplicationId])
    REFERENCES [dbo].[aspnet_Applications]
        ([ApplicationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Ro__Appli__0880433F'
CREATE INDEX [IX_FK__aspnet_Ro__Appli__0880433F]
ON [dbo].[aspnet_Roles]
    ([ApplicationId]);
GO

-- Creating foreign key on [ApplicationId] in table 'aspnet_Users'
ALTER TABLE [dbo].[aspnet_Users]
ADD CONSTRAINT [FK__aspnet_Us__Appli__5224328E]
    FOREIGN KEY ([ApplicationId])
    REFERENCES [dbo].[aspnet_Applications]
        ([ApplicationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Us__Appli__5224328E'
CREATE INDEX [IX_FK__aspnet_Us__Appli__5224328E]
ON [dbo].[aspnet_Users]
    ([ApplicationId]);
GO

-- Creating foreign key on [UserId] in table 'aspnet_Membership'
ALTER TABLE [dbo].[aspnet_Membership]
ADD CONSTRAINT [FK__aspnet_Me__UserI__671F4F74]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[aspnet_Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PathId] in table 'aspnet_PersonalizationAllUsers'
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]
ADD CONSTRAINT [FK__aspnet_Pe__PathI__2704CA5F]
    FOREIGN KEY ([PathId])
    REFERENCES [dbo].[aspnet_Paths]
        ([PathId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PathId] in table 'aspnet_PersonalizationPerUser'
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
ADD CONSTRAINT [FK__aspnet_Pe__PathI__2CBDA3B5]
    FOREIGN KEY ([PathId])
    REFERENCES [dbo].[aspnet_Paths]
        ([PathId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Pe__PathI__2CBDA3B5'
CREATE INDEX [IX_FK__aspnet_Pe__PathI__2CBDA3B5]
ON [dbo].[aspnet_PersonalizationPerUser]
    ([PathId]);
GO

-- Creating foreign key on [UserId] in table 'aspnet_PersonalizationPerUser'
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
ADD CONSTRAINT [FK__aspnet_Pe__UserI__2DB1C7EE]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[aspnet_Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Pe__UserI__2DB1C7EE'
CREATE INDEX [IX_FK__aspnet_Pe__UserI__2DB1C7EE]
ON [dbo].[aspnet_PersonalizationPerUser]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'aspnet_Profile'
ALTER TABLE [dbo].[aspnet_Profile]
ADD CONSTRAINT [FK__aspnet_Pr__UserI__7D0E9093]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[aspnet_Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SubscricaoId] in table 'Carts'
ALTER TABLE [dbo].[Carts]
ADD CONSTRAINT [FK_Cart_subscricoes]
    FOREIGN KEY ([SubscricaoId])
    REFERENCES [dbo].[subscricoes]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Cart_subscricoes'
CREATE INDEX [IX_FK_Cart_subscricoes]
ON [dbo].[Carts]
    ([SubscricaoId]);
GO

-- Creating foreign key on [lcode_id] in table 'Categorias'
ALTER TABLE [dbo].[Categorias]
ADD CONSTRAINT [FK_Categorias_Idiomas]
    FOREIGN KEY ([lcode_id])
    REFERENCES [dbo].[Idiomas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Categorias_Idiomas'
CREATE INDEX [IX_FK_Categorias_Idiomas]
ON [dbo].[Categorias]
    ([lcode_id]);
GO

-- Creating foreign key on [categoria_id] in table 'imovels'
ALTER TABLE [dbo].[imovels]
ADD CONSTRAINT [FK_imovels_Categorias]
    FOREIGN KEY ([categoria_id])
    REFERENCES [dbo].[Categorias]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_imovels_Categorias'
CREATE INDEX [IX_FK_imovels_Categorias]
ON [dbo].[imovels]
    ([categoria_id]);
GO

-- Creating foreign key on [lcode_id] in table 'estadoes'
ALTER TABLE [dbo].[estadoes]
ADD CONSTRAINT [FK_estado_Idiomas]
    FOREIGN KEY ([lcode_id])
    REFERENCES [dbo].[Idiomas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_estado_Idiomas'
CREATE INDEX [IX_FK_estado_Idiomas]
ON [dbo].[estadoes]
    ([lcode_id]);
GO

-- Creating foreign key on [estado_id] in table 'imovels'
ALTER TABLE [dbo].[imovels]
ADD CONSTRAINT [FK_imovels_estadoes]
    FOREIGN KEY ([estado_id])
    REFERENCES [dbo].[estadoes]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_imovels_estadoes'
CREATE INDEX [IX_FK_imovels_estadoes]
ON [dbo].[imovels]
    ([estado_id]);
GO

-- Creating foreign key on [imovel_id] in table 'Fotos'
ALTER TABLE [dbo].[Fotos]
ADD CONSTRAINT [FK_Fotos_imovel]
    FOREIGN KEY ([imovel_id])
    REFERENCES [dbo].[imovels]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Fotos_imovel'
CREATE INDEX [IX_FK_Fotos_imovel]
ON [dbo].[Fotos]
    ([imovel_id]);
GO

-- Creating foreign key on [lcode_id] in table 'imovel_descricao'
ALTER TABLE [dbo].[imovel_descricao]
ADD CONSTRAINT [FK_imovel_descricao_Idiomas]
    FOREIGN KEY ([lcode_id])
    REFERENCES [dbo].[Idiomas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_imovel_descricao_Idiomas'
CREATE INDEX [IX_FK_imovel_descricao_Idiomas]
ON [dbo].[imovel_descricao]
    ([lcode_id]);
GO

-- Creating foreign key on [lcode_id] in table 'objectivoes'
ALTER TABLE [dbo].[objectivoes]
ADD CONSTRAINT [FK_objectivo_Idiomas]
    FOREIGN KEY ([lcode_id])
    REFERENCES [dbo].[Idiomas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_objectivo_Idiomas'
CREATE INDEX [IX_FK_objectivo_Idiomas]
ON [dbo].[objectivoes]
    ([lcode_id]);
GO

-- Creating foreign key on [imovel_id] in table 'imovel_descricao'
ALTER TABLE [dbo].[imovel_descricao]
ADD CONSTRAINT [FK_imovel_descricao_imovel]
    FOREIGN KEY ([imovel_id])
    REFERENCES [dbo].[imovels]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_imovel_descricao_imovel'
CREATE INDEX [IX_FK_imovel_descricao_imovel]
ON [dbo].[imovel_descricao]
    ([imovel_id]);
GO

-- Creating foreign key on [objectivo_id] in table 'imovels'
ALTER TABLE [dbo].[imovels]
ADD CONSTRAINT [FK_imovel_objectivo]
    FOREIGN KEY ([objectivo_id])
    REFERENCES [dbo].[objectivoes]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_imovel_objectivo'
CREATE INDEX [IX_FK_imovel_objectivo]
ON [dbo].[imovels]
    ([objectivo_id]);
GO

-- Creating foreign key on [subscricao_id] in table 'imovels'
ALTER TABLE [dbo].[imovels]
ADD CONSTRAINT [FK_imovel_subscricoes]
    FOREIGN KEY ([subscricao_id])
    REFERENCES [dbo].[subscricoes]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_imovel_subscricoes'
CREATE INDEX [IX_FK_imovel_subscricoes]
ON [dbo].[imovels]
    ([subscricao_id]);
GO

-- Creating foreign key on [tipologia_id] in table 'imovels'
ALTER TABLE [dbo].[imovels]
ADD CONSTRAINT [FK_imovel_tipologia]
    FOREIGN KEY ([tipologia_id])
    REFERENCES [dbo].[tipologias]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_imovel_tipologia'
CREATE INDEX [IX_FK_imovel_tipologia]
ON [dbo].[imovels]
    ([tipologia_id]);
GO

-- Creating foreign key on [OrderId] in table 'OrderDetails'
ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT [FK_OrderDetail_OrdemdeCompra]
    FOREIGN KEY ([OrderId])
    REFERENCES [dbo].[OrdemdeCompras]
        ([OrderId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderDetail_OrdemdeCompra'
CREATE INDEX [IX_FK_OrderDetail_OrdemdeCompra]
ON [dbo].[OrderDetails]
    ([OrderId]);
GO

-- Creating foreign key on [SubscricaoId] in table 'OrderDetails'
ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT [FK_OrderDetail_subscricoes]
    FOREIGN KEY ([SubscricaoId])
    REFERENCES [dbo].[subscricoes]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderDetail_subscricoes'
CREATE INDEX [IX_FK_OrderDetail_subscricoes]
ON [dbo].[OrderDetails]
    ([SubscricaoId]);
GO

-- Creating foreign key on [aspnet_Roles_RoleId] in table 'aspnet_UsersInRoles'
ALTER TABLE [dbo].[aspnet_UsersInRoles]
ADD CONSTRAINT [FK_aspnet_UsersInRoles_aspnet_Roles]
    FOREIGN KEY ([aspnet_Roles_RoleId])
    REFERENCES [dbo].[aspnet_Roles]
        ([RoleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [aspnet_Users_UserId] in table 'aspnet_UsersInRoles'
ALTER TABLE [dbo].[aspnet_UsersInRoles]
ADD CONSTRAINT [FK_aspnet_UsersInRoles_aspnet_Users]
    FOREIGN KEY ([aspnet_Users_UserId])
    REFERENCES [dbo].[aspnet_Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_aspnet_UsersInRoles_aspnet_Users'
CREATE INDEX [IX_FK_aspnet_UsersInRoles_aspnet_Users]
ON [dbo].[aspnet_UsersInRoles]
    ([aspnet_Users_UserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------