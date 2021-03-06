USE [master]
GO
/****** Object:  Database [Proyecto DB]    Script Date: 24/02/2018 11:51:59 a.m. ******/
CREATE DATABASE [Proyecto DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Proyecto DB', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Proyecto DB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Proyecto DB_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Proyecto DB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Proyecto DB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Proyecto DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Proyecto DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Proyecto DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Proyecto DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Proyecto DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Proyecto DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Proyecto DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Proyecto DB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Proyecto DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Proyecto DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Proyecto DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Proyecto DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Proyecto DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Proyecto DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Proyecto DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Proyecto DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Proyecto DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Proyecto DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Proyecto DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Proyecto DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Proyecto DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Proyecto DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Proyecto DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Proyecto DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Proyecto DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Proyecto DB] SET  MULTI_USER 
GO
ALTER DATABASE [Proyecto DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Proyecto DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Proyecto DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Proyecto DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Proyecto DB]
GO
/****** Object:  Table [dbo].[AreaEmpleado]    Script Date: 24/02/2018 11:52:00 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AreaEmpleado](
	[IdEmpleado] [uniqueidentifier] NOT NULL,
	[Area] [nvarchar](50) NOT NULL,
	[CodigoArea] [nchar](10) NULL,
	[Puesto] [nvarchar](50) NULL,
 CONSTRAINT [PK_AreaEmpleado] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DatosEmpleado]    Script Date: 24/02/2018 11:52:00 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatosEmpleado](
	[IdEmpleado] [uniqueidentifier] NOT NULL,
	[Nombre] [nchar](50) NOT NULL,
	[Apellidos] [nchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Edad]  AS (datediff(year,[FechaNacimiento],getdate())),
	[Direccion] [geography] NOT NULL,
	[Telefono] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_DatosEmpleado] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empleado-Empresa]    Script Date: 24/02/2018 11:52:00 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado-Empresa](
	[IdEmpleado] [uniqueidentifier] NOT NULL,
	[Sede] [geography] NOT NULL,
	[Area] [nchar](10) NOT NULL,
	[Salario] [money] NOT NULL,
	[DiaSalario] [time](7) NOT NULL,
	[IdSede] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Empleado-Empresa] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 24/02/2018 11:52:00 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[IdSede] [uniqueidentifier] NOT NULL,
	[Locacion] [geography] NOT NULL,
	[Gerente] [nchar](50) NOT NULL,
	[Subgerente] [nchar](50) NOT NULL,
	[TotalEmpleados] [int] NOT NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[IdSede] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 24/02/2018 11:52:00 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[IdAlmacen] [uniqueidentifier] NOT NULL,
	[Gerente] [nchar](50) NOT NULL,
	[TotalProductos] [int] NOT NULL,
	[ProductosNecesarios] [int] NOT NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[IdAlmacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tabla 1]    Script Date: 24/02/2018 11:52:00 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tabla 1](
	[Id] [uniqueidentifier] NOT NULL,
	[Precio] [money] NOT NULL,
	[IVA]  AS ([Precio]*(0.16)),
	[Edad]  AS (datediff(year,[FechaNacimiento],getdate())),
	[FechaNacimiento] [date] NOT NULL,
 CONSTRAINT [PK_Tabla 1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_1]    Script Date: 24/02/2018 11:52:00 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_1](
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_AreaEmpleado]    Script Date: 24/02/2018 11:52:00 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_AreaEmpleado] ON [dbo].[AreaEmpleado]
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Empleado-Empresa]    Script Date: 24/02/2018 11:52:00 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_Empleado-Empresa] ON [dbo].[Empleado-Empresa]
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Empresa]    Script Date: 24/02/2018 11:52:00 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_Empresa] ON [dbo].[Empresa]
(
	[IdSede] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Inventario]    Script Date: 24/02/2018 11:52:00 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_Inventario] ON [dbo].[Inventario]
(
	[IdAlmacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Proyecto DB] SET  READ_WRITE 
GO
