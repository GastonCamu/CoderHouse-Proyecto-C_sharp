USE [SistemaGestion]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 2/10/2023 11:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Descripciones] [varchar](max) NOT NULL,
	[Costo] [money] NULL,
	[PrecioVenta] [money] NOT NULL,
	[Stock] [int] NOT NULL,
	[IdUsuario] [bigint] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductoVendido]    Script Date: 2/10/2023 11:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductoVendido](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Stock] [int] NOT NULL,
	[IdProducto] [bigint] NOT NULL,
	[IdVenta] [bigint] NOT NULL,
 CONSTRAINT [PK_ProductoVendido] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 2/10/2023 11:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Apellido] [varchar](max) NOT NULL,
	[NombreUsuario] [varchar](max) NOT NULL,
	[Contraseña] [varchar](max) NOT NULL,
	[Mail] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 2/10/2023 11:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Comentarios] [varchar](max) NULL,
	[IdUsuario] [bigint] NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Usuario]
GO
ALTER TABLE [dbo].[ProductoVendido]  WITH CHECK ADD  CONSTRAINT [FK_ProductoVendido_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductoVendido] CHECK CONSTRAINT [FK_ProductoVendido_Producto]
GO
ALTER TABLE [dbo].[ProductoVendido]  WITH CHECK ADD  CONSTRAINT [FK_ProductoVendido_Venta] FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Venta] ([Id])
GO
ALTER TABLE [dbo].[ProductoVendido] CHECK CONSTRAINT [FK_ProductoVendido_Venta]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Usuario]
GO
