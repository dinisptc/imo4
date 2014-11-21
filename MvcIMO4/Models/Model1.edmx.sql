
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 10/22/2010 13:31:23
-- Generated from EDMX file: D:\IMO4\IMO4_nova_versao_euro\MvcIMO4\MvcIMO4\Models\Model1.edmx
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
IF OBJECT_ID(N'[dbo].[FK_imovel_Categorias]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[imovels] DROP CONSTRAINT [FK_imovel_Categorias];
GO
IF OBJECT_ID(N'[dbo].[FK_imovel_descricao_Idiomas]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[imovel_descricao] DROP CONSTRAINT [FK_imovel_descricao_Idiomas];
GO
IF OBJECT_ID(N'[dbo].[FK_imovel_descricao_imovel]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[imovel_descricao] DROP CONSTRAINT [FK_imovel_descricao_imovel];
GO
IF OBJECT_ID(N'[dbo].[FK_imovel_estado_estado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[imovel_estado] DROP CONSTRAINT [FK_imovel_estado_estado];
GO
IF OBJECT_ID(N'[dbo].[FK_imovel_estado_imovel]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[imovel_estado] DROP CONSTRAINT [FK_imovel_estado_imovel];
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
IF OBJECT_ID(N'[dbo].[imovel_estado]', 'U') IS NOT NULL
    DROP TABLE [dbo].[imovel_estado];
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

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Carts'
CREATE TABLE [dbo].[Carts] (
    [RecordId] int IDENTITY(1,1) NOT NULL,
    [CartId] varchar(50)  NOT NULL,
    [SubscricaoId] int  NOT NULL,
    [Count] int  NOT NULL,
    [DateCreated] datetime  NOT NULL
);
GO

-- Creating table 'Categorias'
CREATE TABLE [dbo].[Categorias] (
    [id] int IDENTITY(1,1) NOT NULL,
    [lcode_id] int  NOT NULL,
    [nome] nvarchar(256)  NOT NULL,
    [foto] varchar(max)  NULL
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
    [lcode_id] int  NULL
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

-- Creating table 'imovel_estado'
CREATE TABLE [dbo].[imovel_estado] (
    [id] int  NOT NULL,
    [imovelid] int  NOT NULL,
    [estadoid] int  NOT NULL
);
GO

-- Creating table 'imovels'
CREATE TABLE [dbo].[imovels] (
    [id] int IDENTITY(1,1) NOT NULL,
    [categoria_id] int  NOT NULL,
    [tipologia_id] int  NULL,
    [subscricao_id] int  NULL,
    [objectivo_id] int  NULL,
    [area_util] nvarchar(200)  NULL,
    [distrito] nvarchar(200)  NOT NULL,
    [concelho] nvarchar(200)  NOT NULL,
    [freguesia] nvarchar(200)  NOT NULL,
    [rua] nvarchar(max)  NULL,
    [preco] int  NULL,
    [area_bruta] nvarchar(200)  NULL,
    [area_terreno] nvarchar(200)  NULL,
    [identidade] nvarchar(200)  NOT NULL,
    [status] int  NULL,
    [data_criacao] datetime  NULL,
    [data_aprovacao] datetime  NULL,
    [data_expira] datetime  NULL,
    [jaesteveactivo] bit  NULL,
    [pais] nvarchar(200)  NOT NULL
);
GO

-- Creating table 'objectivoes'
CREATE TABLE [dbo].[objectivoes] (
    [id] int IDENTITY(1,1) NOT NULL,
    [tipo_negocio] nvarchar(200)  NOT NULL,
    [lcode_id] int  NULL
);
GO

-- Creating table 'OrdemdeCompras'
CREATE TABLE [dbo].[OrdemdeCompras] (
    [OrderId] int IDENTITY(1,1) NOT NULL,
    [OrderDate] datetime  NULL,
    [Username] nvarchar(256)  NULL,
    [FirstName] nvarchar(160)  NULL,
    [LastName] nvarchar(160)  NULL,
    [Address] nvarchar(200)  NULL,
    [City] nvarchar(70)  NULL,
    [State] nvarchar(70)  NULL,
    [PostalCode] nvarchar(10)  NULL,
    [Country] nvarchar(40)  NULL,
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
    [precomeses] decimal(10,2)  NOT NULL,
    [precoanuncios] decimal(10,2)  NOT NULL
);
GO

-- Creating table 'tipologias'
CREATE TABLE [dbo].[tipologias] (
    [id] int IDENTITY(1,1) NOT NULL,
    [nome] nvarchar(50)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

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

-- Creating primary key on [id] in table 'imovel_estado'
ALTER TABLE [dbo].[imovel_estado]
ADD CONSTRAINT [PK_imovel_estado]
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

-- Creating primary key on [precomeses], [precoanuncios] in table 'tabelaprecos'
ALTER TABLE [dbo].[tabelaprecos]
ADD CONSTRAINT [PK_tabelaprecos]
    PRIMARY KEY CLUSTERED ([precomeses], [precoanuncios] ASC);
GO

-- Creating primary key on [id] in table 'tipologias'
ALTER TABLE [dbo].[tipologias]
ADD CONSTRAINT [PK_tipologias]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

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
ADD CONSTRAINT [FK_imovel_Categorias]
    FOREIGN KEY ([categoria_id])
    REFERENCES [dbo].[Categorias]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_imovel_Categorias'
CREATE INDEX [IX_FK_imovel_Categorias]
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

-- Creating foreign key on [estadoid] in table 'imovel_estado'
ALTER TABLE [dbo].[imovel_estado]
ADD CONSTRAINT [FK_imovel_estado_estado]
    FOREIGN KEY ([estadoid])
    REFERENCES [dbo].[estadoes]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_imovel_estado_estado'
CREATE INDEX [IX_FK_imovel_estado_estado]
ON [dbo].[imovel_estado]
    ([estadoid]);
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

-- Creating foreign key on [imovelid] in table 'imovel_estado'
ALTER TABLE [dbo].[imovel_estado]
ADD CONSTRAINT [FK_imovel_estado_imovel]
    FOREIGN KEY ([imovelid])
    REFERENCES [dbo].[imovels]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_imovel_estado_imovel'
CREATE INDEX [IX_FK_imovel_estado_imovel]
ON [dbo].[imovel_estado]
    ([imovelid]);
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

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------