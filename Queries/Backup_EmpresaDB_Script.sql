USE [master]
GO
/****** Object:  Database [EmpresaDB]    Script Date: 2/10/2025 9:57:56 PM ******/
CREATE DATABASE [EmpresaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmpresaDB', FILENAME = N'C:\PJSMTSQL\EmpresaDB\EmpresaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EmpresaDB_log', FILENAME = N'C:\PJSMTSQL\EmpresaDB\EmpresaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EmpresaDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmpresaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmpresaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmpresaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmpresaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmpresaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmpresaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmpresaDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmpresaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmpresaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmpresaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmpresaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmpresaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmpresaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmpresaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmpresaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmpresaDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EmpresaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmpresaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmpresaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmpresaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmpresaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmpresaDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmpresaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmpresaDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmpresaDB] SET  MULTI_USER 
GO
ALTER DATABASE [EmpresaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmpresaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmpresaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmpresaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EmpresaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EmpresaDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EmpresaDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [EmpresaDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EmpresaDB]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 2/10/2025 9:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[DepartamentoID] [int] IDENTITY(1,1) NOT NULL,
	[NomeDepartamento] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Departamentos] PRIMARY KEY CLUSTERED 
(
	[DepartamentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FuncionarioProjeto]    Script Date: 2/10/2025 9:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FuncionarioProjeto](
	[FuncionarioID] [int] NOT NULL,
	[ProjetoID] [int] NOT NULL,
	[DataAtribuicao] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funcionarios]    Script Date: 2/10/2025 9:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcionarios](
	[FuncionarioID] [int] IDENTITY(1,1) NOT NULL,
	[DepartamentoID] [int] NOT NULL,
	[Nome] [varchar](100) NOT NULL,
	[Cargo] [varchar](50) NULL,
	[Salario] [decimal](10, 2) NULL,
	[DataContratacao] [date] NULL,
 CONSTRAINT [PK_Funcionarios] PRIMARY KEY CLUSTERED 
(
	[FuncionarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projetos]    Script Date: 2/10/2025 9:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projetos](
	[ProjetoID] [int] IDENTITY(1,1) NOT NULL,
	[NomeProjeto] [varchar](100) NOT NULL,
	[DataInicio] [date] NULL,
	[DataFim] [date] NULL,
 CONSTRAINT [PK_Projetos] PRIMARY KEY CLUSTERED 
(
	[ProjetoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departamentos] ON 

INSERT [dbo].[Departamentos] ([DepartamentoID], [NomeDepartamento]) VALUES (1, N'Recursos Humanos')
INSERT [dbo].[Departamentos] ([DepartamentoID], [NomeDepartamento]) VALUES (2, N'TI')
INSERT [dbo].[Departamentos] ([DepartamentoID], [NomeDepartamento]) VALUES (3, N'Financeiro')
SET IDENTITY_INSERT [dbo].[Departamentos] OFF
GO
INSERT [dbo].[FuncionarioProjeto] ([FuncionarioID], [ProjetoID], [DataAtribuicao]) VALUES (1, 1, CAST(N'2024-01-20' AS Date))
INSERT [dbo].[FuncionarioProjeto] ([FuncionarioID], [ProjetoID], [DataAtribuicao]) VALUES (2, 2, CAST(N'2024-02-18' AS Date))
INSERT [dbo].[FuncionarioProjeto] ([FuncionarioID], [ProjetoID], [DataAtribuicao]) VALUES (3, 1, CAST(N'2024-01-25' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Funcionarios] ON 

INSERT [dbo].[Funcionarios] ([FuncionarioID], [DepartamentoID], [Nome], [Cargo], [Salario], [DataContratacao]) VALUES (1, 1, N'Ana Silva', N'Analista', CAST(3500.00 AS Decimal(10, 2)), CAST(N'2023-01-15' AS Date))
INSERT [dbo].[Funcionarios] ([FuncionarioID], [DepartamentoID], [Nome], [Cargo], [Salario], [DataContratacao]) VALUES (2, 2, N'Carlos Santos', N'Desenvolvedor', CAST(5000.00 AS Decimal(10, 2)), CAST(N'2022-07-10' AS Date))
INSERT [dbo].[Funcionarios] ([FuncionarioID], [DepartamentoID], [Nome], [Cargo], [Salario], [DataContratacao]) VALUES (3, 3, N'Fernanda Costa', N'Contadora', CAST(4500.00 AS Decimal(10, 2)), CAST(N'2021-03-05' AS Date))
SET IDENTITY_INSERT [dbo].[Funcionarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Projetos] ON 

INSERT [dbo].[Projetos] ([ProjetoID], [NomeProjeto], [DataInicio], [DataFim]) VALUES (1, N'Sistema Interno', CAST(N'2024-01-01' AS Date), CAST(N'2024-12-31' AS Date))
INSERT [dbo].[Projetos] ([ProjetoID], [NomeProjeto], [DataInicio], [DataFim]) VALUES (2, N'Aplicativo Mobile', CAST(N'2024-02-15' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Projetos] OFF
GO
ALTER TABLE [dbo].[FuncionarioProjeto]  WITH CHECK ADD  CONSTRAINT [FK_FuncionarioProjeto_Funcionarios] FOREIGN KEY([FuncionarioID])
REFERENCES [dbo].[Funcionarios] ([FuncionarioID])
GO
ALTER TABLE [dbo].[FuncionarioProjeto] CHECK CONSTRAINT [FK_FuncionarioProjeto_Funcionarios]
GO
ALTER TABLE [dbo].[FuncionarioProjeto]  WITH CHECK ADD  CONSTRAINT [FK_FuncionarioProjeto_Projetos] FOREIGN KEY([ProjetoID])
REFERENCES [dbo].[Projetos] ([ProjetoID])
GO
ALTER TABLE [dbo].[FuncionarioProjeto] CHECK CONSTRAINT [FK_FuncionarioProjeto_Projetos]
GO
ALTER TABLE [dbo].[Funcionarios]  WITH CHECK ADD  CONSTRAINT [FK_Funcionarios_Departamentos] FOREIGN KEY([DepartamentoID])
REFERENCES [dbo].[Departamentos] ([DepartamentoID])
GO
ALTER TABLE [dbo].[Funcionarios] CHECK CONSTRAINT [FK_Funcionarios_Departamentos]
GO
USE [master]
GO
ALTER DATABASE [EmpresaDB] SET  READ_WRITE 
GO
