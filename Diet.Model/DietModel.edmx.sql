
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/02/2015 15:25:39
-- Generated from EDMX file: c:\users\jakub.kozlowski\documents\visual studio 2013\Projects\Diet\Diet.Model\DietModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [diet];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UnitSet'
CREATE TABLE [dbo].[UnitSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nazwa] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'MealSet'
CREATE TABLE [dbo].[MealSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'DietTypeSet'
CREATE TABLE [dbo].[DietTypeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Type] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'DailyAssignmentSet'
CREATE TABLE [dbo].[DailyAssignmentSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Date] datetime  NOT NULL,
    [Quantity] int  NOT NULL,
    [Unit_Id] int  NOT NULL,
    [Meal_Id] int  NOT NULL,
    [DietType_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'UnitSet'
ALTER TABLE [dbo].[UnitSet]
ADD CONSTRAINT [PK_UnitSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MealSet'
ALTER TABLE [dbo].[MealSet]
ADD CONSTRAINT [PK_MealSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DietTypeSet'
ALTER TABLE [dbo].[DietTypeSet]
ADD CONSTRAINT [PK_DietTypeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DailyAssignmentSet'
ALTER TABLE [dbo].[DailyAssignmentSet]
ADD CONSTRAINT [PK_DailyAssignmentSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Unit_Id] in table 'DailyAssignmentSet'
ALTER TABLE [dbo].[DailyAssignmentSet]
ADD CONSTRAINT [FK_UnitDailyAssignment]
    FOREIGN KEY ([Unit_Id])
    REFERENCES [dbo].[UnitSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UnitDailyAssignment'
CREATE INDEX [IX_FK_UnitDailyAssignment]
ON [dbo].[DailyAssignmentSet]
    ([Unit_Id]);
GO

-- Creating foreign key on [Meal_Id] in table 'DailyAssignmentSet'
ALTER TABLE [dbo].[DailyAssignmentSet]
ADD CONSTRAINT [FK_MealDailyAssignment]
    FOREIGN KEY ([Meal_Id])
    REFERENCES [dbo].[MealSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MealDailyAssignment'
CREATE INDEX [IX_FK_MealDailyAssignment]
ON [dbo].[DailyAssignmentSet]
    ([Meal_Id]);
GO

-- Creating foreign key on [DietType_Id] in table 'DailyAssignmentSet'
ALTER TABLE [dbo].[DailyAssignmentSet]
ADD CONSTRAINT [FK_DietTypeDailyAssignment]
    FOREIGN KEY ([DietType_Id])
    REFERENCES [dbo].[DietTypeSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DietTypeDailyAssignment'
CREATE INDEX [IX_FK_DietTypeDailyAssignment]
ON [dbo].[DailyAssignmentSet]
    ([DietType_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------