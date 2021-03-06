USE [BDGimnasio]
GO
/****** Object:  StoredProcedure [dbo].[GuardarRutina]    Script Date: 15/11/2021 7:16:43 p. m. ******/
DROP PROCEDURE [dbo].[GuardarRutina]
GO
/****** Object:  StoredProcedure [dbo].[EliminarRutina]    Script Date: 15/11/2021 7:16:43 p. m. ******/
DROP PROCEDURE [dbo].[EliminarRutina]
GO
/****** Object:  StoredProcedure [dbo].[ConsultarRutina]    Script Date: 15/11/2021 7:16:43 p. m. ******/
DROP PROCEDURE [dbo].[ConsultarRutina]
GO
/****** Object:  Table [dbo].[RutinaC]    Script Date: 15/11/2021 7:16:43 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RutinaC]') AND type in (N'U'))
DROP TABLE [dbo].[RutinaC]
GO
USE [master]
GO
/****** Object:  Database [BDGimnasio]    Script Date: 15/11/2021 7:16:43 p. m. ******/
DROP DATABASE [BDGimnasio]
GO
/****** Object:  Database [BDGimnasio]    Script Date: 15/11/2021 7:16:43 p. m. ******/
CREATE DATABASE [BDGimnasio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDGimnasio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BDGimnasio.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDGimnasio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BDGimnasio_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BDGimnasio] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDGimnasio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDGimnasio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDGimnasio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDGimnasio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDGimnasio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDGimnasio] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDGimnasio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDGimnasio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDGimnasio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDGimnasio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDGimnasio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDGimnasio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDGimnasio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDGimnasio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDGimnasio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDGimnasio] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDGimnasio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDGimnasio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDGimnasio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDGimnasio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDGimnasio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDGimnasio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDGimnasio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDGimnasio] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BDGimnasio] SET  MULTI_USER 
GO
ALTER DATABASE [BDGimnasio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDGimnasio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDGimnasio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDGimnasio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDGimnasio] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BDGimnasio] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BDGimnasio] SET QUERY_STORE = OFF
GO
USE [BDGimnasio]
GO
/****** Object:  Table [dbo].[RutinaC]    Script Date: 15/11/2021 7:16:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RutinaC](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Musculos] [nvarchar](50) NOT NULL,
	[EjerciciosR] [nvarchar](50) NOT NULL,
	[Repeticiones] [int] NOT NULL,
	[Series] [int] NOT NULL,
 CONSTRAINT [PK_RutinaC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RutinaC] ON 

INSERT [dbo].[RutinaC] ([id], [Musculos], [EjerciciosR], [Repeticiones], [Series]) VALUES (5, N'triceps', N'Fondos,flexiones,muscle', 22, 12)
INSERT [dbo].[RutinaC] ([id], [Musculos], [EjerciciosR], [Repeticiones], [Series]) VALUES (6, N'biceps', N'dominadas,curl', 20, 4)
INSERT [dbo].[RutinaC] ([id], [Musculos], [EjerciciosR], [Repeticiones], [Series]) VALUES (7, N'piernas', N'sentadillas', 100, 4)
SET IDENTITY_INSERT [dbo].[RutinaC] OFF
GO
/****** Object:  StoredProcedure [dbo].[ConsultarRutina]    Script Date: 15/11/2021 7:16:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarRutina]
@id int
as
select * from RutinaC where id = @id
GO
/****** Object:  StoredProcedure [dbo].[EliminarRutina]    Script Date: 15/11/2021 7:16:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarRutina]
@id int
as
delete from RutinaC where id=@id
GO
/****** Object:  StoredProcedure [dbo].[GuardarRutina]    Script Date: 15/11/2021 7:16:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GuardarRutina]

@Musculos nvarchar(50),
@EjerciciosR nvarchar(50),
@Repeticiones int,
@Series int
as
INSERT INTO RutinaC(Musculos,EjerciciosR,Repeticiones,Series) values(@Musculos,@EjerciciosR,@Repeticiones,@Series)
GO
USE [master]
GO
ALTER DATABASE [BDGimnasio] SET  READ_WRITE 
GO
