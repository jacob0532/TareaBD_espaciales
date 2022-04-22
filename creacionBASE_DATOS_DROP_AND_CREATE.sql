USE [Espaciales]
GO
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_TipoProducto]
GO
ALTER TABLE [dbo].[Inventario] DROP CONSTRAINT [FK_Inventario_Producto]
GO
ALTER TABLE [dbo].[Inventario] DROP CONSTRAINT [FK_Inventario_Bloque]
GO
ALTER TABLE [dbo].[Horario] DROP CONSTRAINT [FK_Horario_Bloque]
GO
ALTER TABLE [dbo].[Horario] DROP CONSTRAINT [FK_Horario.idDiaSemanaFK]
GO
ALTER TABLE [dbo].[Bloque] DROP CONSTRAINT [FK_Bloque_TipoBloque]
GO
ALTER TABLE [dbo].[Bloque] DROP CONSTRAINT [FK_Bloque.idTipoComercioFK]
GO
/****** Object:  Table [dbo].[TipoProducto]    Script Date: 22/4/2022 14:23:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoProducto]') AND type in (N'U'))
DROP TABLE [dbo].[TipoProducto]
GO
/****** Object:  Table [dbo].[TipoComercio]    Script Date: 22/4/2022 14:23:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoComercio]') AND type in (N'U'))
DROP TABLE [dbo].[TipoComercio]
GO
/****** Object:  Table [dbo].[TipoBloque]    Script Date: 22/4/2022 14:23:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoBloque]') AND type in (N'U'))
DROP TABLE [dbo].[TipoBloque]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 22/4/2022 14:23:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND type in (N'U'))
DROP TABLE [dbo].[Producto]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 22/4/2022 14:23:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Inventario]') AND type in (N'U'))
DROP TABLE [dbo].[Inventario]
GO
/****** Object:  Table [dbo].[Horario]    Script Date: 22/4/2022 14:23:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Horario]') AND type in (N'U'))
DROP TABLE [dbo].[Horario]
GO
/****** Object:  Table [dbo].[DiaSemana]    Script Date: 22/4/2022 14:23:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DiaSemana]') AND type in (N'U'))
DROP TABLE [dbo].[DiaSemana]
GO
/****** Object:  Table [dbo].[Bloque]    Script Date: 22/4/2022 14:23:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bloque]') AND type in (N'U'))
DROP TABLE [dbo].[Bloque]
GO
/****** Object:  Table [dbo].[Bloque]    Script Date: 22/4/2022 14:23:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bloque](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[letraBloque] [char](1) NOT NULL,
	[area] [int] NOT NULL,
	[figura] [geometry] NOT NULL,
	[puntoCentro] [geometry] NOT NULL,
	[idTipoComercioFK] [int] NULL,
	[idTipoBloqueFK] [int] NOT NULL,
 CONSTRAINT [PK__Bloque__3213E83F5B7AFEDB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiaSemana]    Script Date: 22/4/2022 14:23:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaSemana](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK__DiaSeman__3213E83FEC33FF42] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horario]    Script Date: 22/4/2022 14:23:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hora1] [time](0) NOT NULL,
	[hora2] [time](0) NOT NULL,
	[idDiaSemanaFK] [int] NOT NULL,
	[idBloqueFK] [int] NOT NULL,
 CONSTRAINT [PK__Horario__3213E83FA6B8D487] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 22/4/2022 14:23:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[precioUnidad] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[idProductoFK] [int] NOT NULL,
	[idBloqueFK] [int] NOT NULL,
 CONSTRAINT [PK__Inventar__3213E83FD8B231E2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 22/4/2022 14:23:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[idTipoProductoFK] [int] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoBloque]    Script Date: 22/4/2022 14:23:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoBloque](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoBloque] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoComercio]    Script Date: 22/4/2022 14:23:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoComercio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK__TipoCome__3213E83F483F4515] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoProducto]    Script Date: 22/4/2022 14:23:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoProducto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK__TipoProd__3213E83F3B1E3958] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bloque]  WITH CHECK ADD  CONSTRAINT [FK_Bloque.idTipoComercioFK] FOREIGN KEY([idTipoComercioFK])
REFERENCES [dbo].[TipoComercio] ([id])
GO
ALTER TABLE [dbo].[Bloque] CHECK CONSTRAINT [FK_Bloque.idTipoComercioFK]
GO
ALTER TABLE [dbo].[Bloque]  WITH CHECK ADD  CONSTRAINT [FK_Bloque_TipoBloque] FOREIGN KEY([idTipoBloqueFK])
REFERENCES [dbo].[TipoBloque] ([id])
GO
ALTER TABLE [dbo].[Bloque] CHECK CONSTRAINT [FK_Bloque_TipoBloque]
GO
ALTER TABLE [dbo].[Horario]  WITH CHECK ADD  CONSTRAINT [FK_Horario.idDiaSemanaFK] FOREIGN KEY([idDiaSemanaFK])
REFERENCES [dbo].[DiaSemana] ([id])
GO
ALTER TABLE [dbo].[Horario] CHECK CONSTRAINT [FK_Horario.idDiaSemanaFK]
GO
ALTER TABLE [dbo].[Horario]  WITH CHECK ADD  CONSTRAINT [FK_Horario_Bloque] FOREIGN KEY([idBloqueFK])
REFERENCES [dbo].[Bloque] ([id])
GO
ALTER TABLE [dbo].[Horario] CHECK CONSTRAINT [FK_Horario_Bloque]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Bloque] FOREIGN KEY([idBloqueFK])
REFERENCES [dbo].[Bloque] ([id])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Bloque]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Producto] FOREIGN KEY([idProductoFK])
REFERENCES [dbo].[Producto] ([id])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Producto]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_TipoProducto] FOREIGN KEY([idTipoProductoFK])
REFERENCES [dbo].[TipoProducto] ([id])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_TipoProducto]
GO
