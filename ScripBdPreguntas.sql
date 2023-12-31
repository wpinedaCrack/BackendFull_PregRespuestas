USE [PreguntasApp]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/12/2023 6:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuestionario]    Script Date: 8/12/2023 6:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuestionario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [varchar](150) NOT NULL,
	[FechaCreacion] [datetime2](7) NOT NULL,
	[Activo] [int] NOT NULL,
	[UsuarioId] [int] NOT NULL,
 CONSTRAINT [PK_Cuestionario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pregunta]    Script Date: 8/12/2023 6:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pregunta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[CuestionarioId] [int] NOT NULL,
 CONSTRAINT [PK_Pregunta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuesta]    Script Date: 8/12/2023 6:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuesta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[EsCorrecta] [bit] NOT NULL,
	[PreguntaId] [int] NOT NULL,
 CONSTRAINT [PK_Respuesta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RespuestaCuestionario]    Script Date: 8/12/2023 6:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RespuestaCuestionario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreParticipante] [varchar](100) NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[Activo] [int] NOT NULL,
	[CuestionarioId] [int] NOT NULL,
 CONSTRAINT [PK_RespuestaCuestionario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RespuestaCuestionarioDetalle]    Script Date: 8/12/2023 6:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RespuestaCuestionarioDetalle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RespuestaCuestionarioId] [int] NOT NULL,
	[RespuestaId] [int] NOT NULL,
 CONSTRAINT [PK_RespuestaCuestionarioDetalle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 8/12/2023 6:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](20) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231017011910_Inicial', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231029033509_v1.1', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231111222533_version2', N'5.0.17')
GO
SET IDENTITY_INSERT [dbo].[Cuestionario] ON 

INSERT [dbo].[Cuestionario] ([Id], [Nombre], [Descripcion], [FechaCreacion], [Activo], [UsuarioId]) VALUES (1, N'Capitales del Mundo', N'Vamos a evaluar', CAST(N'2023-10-28T23:32:17.3638193' AS DateTime2), 1, 6)
INSERT [dbo].[Cuestionario] ([Id], [Nombre], [Descripcion], [FechaCreacion], [Activo], [UsuarioId]) VALUES (2, N'Cuestionario Postman', N'Test Postman', CAST(N'2023-10-28T23:40:38.3073998' AS DateTime2), 1, 6)
INSERT [dbo].[Cuestionario] ([Id], [Nombre], [Descripcion], [FechaCreacion], [Activo], [UsuarioId]) VALUES (3, N'Campeonatos de copas del mundo', N'Evaluaremos que sabes de futbol', CAST(N'2023-10-30T16:04:21.5173818' AS DateTime2), 1, 6)
INSERT [dbo].[Cuestionario] ([Id], [Nombre], [Descripcion], [FechaCreacion], [Activo], [UsuarioId]) VALUES (4, N'Dragon ball z', N'evaluamos cuanto sabes de dragon ball', CAST(N'2023-10-30T16:08:19.6180937' AS DateTime2), 1, 1)
INSERT [dbo].[Cuestionario] ([Id], [Nombre], [Descripcion], [FechaCreacion], [Activo], [UsuarioId]) VALUES (5, N'Capitales de Colombia', N'evaluaremos capitales de colombia', CAST(N'2023-10-30T16:11:10.9913176' AS DateTime2), 1, 1)
INSERT [dbo].[Cuestionario] ([Id], [Nombre], [Descripcion], [FechaCreacion], [Activo], [UsuarioId]) VALUES (6, N'Presidentes de Colombia', N'evaluaremos presidentes de Colombia.', CAST(N'2023-10-30T16:15:36.6475536' AS DateTime2), 1, 2)
INSERT [dbo].[Cuestionario] ([Id], [Nombre], [Descripcion], [FechaCreacion], [Activo], [UsuarioId]) VALUES (7, N'Desarrollador full stack', N'vamos a evaluar estas habilidades', CAST(N'2023-11-03T18:40:18.3417319' AS DateTime2), 1, 6)
SET IDENTITY_INSERT [dbo].[Cuestionario] OFF
GO
SET IDENTITY_INSERT [dbo].[Pregunta] ON 

INSERT [dbo].[Pregunta] ([Id], [Descripcion], [CuestionarioId]) VALUES (1, N'Cual es la capital de Francia ?', 1)
INSERT [dbo].[Pregunta] ([Id], [Descripcion], [CuestionarioId]) VALUES (2, N'Cual es la capital de Italia?', 1)
INSERT [dbo].[Pregunta] ([Id], [Descripcion], [CuestionarioId]) VALUES (3, N'Cual es el campeón del Mundial Qatar 2022', 3)
INSERT [dbo].[Pregunta] ([Id], [Descripcion], [CuestionarioId]) VALUES (4, N'Cual es Ganador del Mundial Rusia 2018', 3)
INSERT [dbo].[Pregunta] ([Id], [Descripcion], [CuestionarioId]) VALUES (5, N'Cual es el  mejor jugador del Mundo ', 3)
INSERT [dbo].[Pregunta] ([Id], [Descripcion], [CuestionarioId]) VALUES (6, N'Como se llama el hijo de Goku', 4)
INSERT [dbo].[Pregunta] ([Id], [Descripcion], [CuestionarioId]) VALUES (7, N'Como se llama el capitan gyniu', 4)
INSERT [dbo].[Pregunta] ([Id], [Descripcion], [CuestionarioId]) VALUES (8, N'Como se llama el hijo menor de goku', 4)
INSERT [dbo].[Pregunta] ([Id], [Descripcion], [CuestionarioId]) VALUES (9, N'Capital de Boyaca', 5)
INSERT [dbo].[Pregunta] ([Id], [Descripcion], [CuestionarioId]) VALUES (10, N'Capital de Cundinamarca', 5)
INSERT [dbo].[Pregunta] ([Id], [Descripcion], [CuestionarioId]) VALUES (11, N'Presidente de colombia', 5)
INSERT [dbo].[Pregunta] ([Id], [Descripcion], [CuestionarioId]) VALUES (12, N'Como se llama el presidente de Colombia', 6)
INSERT [dbo].[Pregunta] ([Id], [Descripcion], [CuestionarioId]) VALUES (13, N'Apodo del presidente de colombia', 6)
INSERT [dbo].[Pregunta] ([Id], [Descripcion], [CuestionarioId]) VALUES (14, N'Quien gano la alcaldía de bogota', 6)
INSERT [dbo].[Pregunta] ([Id], [Descripcion], [CuestionarioId]) VALUES (15, N'cual de los siguientes es un lenguaje de programacion', 7)
INSERT [dbo].[Pregunta] ([Id], [Descripcion], [CuestionarioId]) VALUES (16, N'cual de las siguientes sentencias se usa para crear tablas en sql', 7)
INSERT [dbo].[Pregunta] ([Id], [Descripcion], [CuestionarioId]) VALUES (17, N'que es ddl', 7)
INSERT [dbo].[Pregunta] ([Id], [Descripcion], [CuestionarioId]) VALUES (18, N'que es dml', 7)
INSERT [dbo].[Pregunta] ([Id], [Descripcion], [CuestionarioId]) VALUES (19, N'cual de las siguientes sentencias se usa para consolidar dtos', 7)
SET IDENTITY_INSERT [dbo].[Pregunta] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuesta] ON 

INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (1, N'Londres', 0, 1)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (2, N'Madrid', 0, 1)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (3, N'Roma', 0, 1)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (4, N'Paris', 1, 1)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (5, N'PaRIS', 0, 2)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (6, N'Berlin', 0, 2)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (7, N'Roma', 1, 2)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (8, N'Barcelona', 0, 2)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (9, N'Perú', 0, 3)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (10, N'Colombia', 0, 3)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (11, N'Argentina', 1, 3)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (12, N'Venezuela', 0, 3)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (13, N'Brazil', 0, 4)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (14, N'Panama', 0, 4)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (15, N'Francia', 1, 4)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (16, N'Costa de Marfil', 0, 4)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (17, N'Tino asprilla', 0, 5)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (18, N'messi', 1, 5)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (19, N'rodallega', 0, 5)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (20, N'james', 0, 5)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (21, N'petronilo', 0, 6)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (22, N'panfilo', 0, 6)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (23, N'gojan', 1, 6)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (24, N'gyniu', 1, 7)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (25, N'epifanio', 0, 7)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (26, N'sabon', 0, 7)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (27, N'carlos', 1, 8)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (28, N'goten', 0, 8)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (29, N'Tunja', 1, 9)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (30, N'Quito', 0, 9)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (31, N'la paz', 0, 9)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (32, N'Cali', 1, 10)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (33, N'Bogota', 0, 10)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (34, N'Maracucho', 0, 10)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (35, N'gaviria', 0, 11)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (36, N'cacas', 1, 11)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (37, N'bolivar', 0, 11)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (38, N'Petronilo', 0, 12)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (39, N'El cacas', 1, 12)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (40, N'Humberto', 0, 12)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (41, N'Tornillo', 0, 13)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (42, N'El pacho', 0, 13)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (43, N'alias el cacas', 1, 13)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (44, N'Bolivar el ñero', 0, 14)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (45, N'scaff', 0, 14)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (46, N'gaviria', 1, 14)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (47, N'java', 1, 15)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (48, N'delete', 0, 19)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (49, N'update', 0, 19)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (50, N'ninguna', 0, 18)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (51, N'lenguaje de definicion de datos', 0, 18)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (52, N'lenguaje de manipulacion de datos', 1, 18)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (53, N'confirmación de transacciones', 0, 17)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (54, N'lenguaje de manipulacion de datos', 1, 17)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (55, N'lenguaje de creacion de datos', 0, 17)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (56, N'alter', 0, 16)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (57, N'create', 1, 16)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (58, N'merge', 0, 16)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (59, N'join', 0, 16)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (60, N'su mama', 0, 15)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (61, N'jaguar', 0, 15)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (62, N'micheline', 0, 15)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (63, N'merge', 1, 19)
INSERT [dbo].[Respuesta] ([Id], [Descripcion], [EsCorrecta], [PreguntaId]) VALUES (64, N'insert', 0, 19)
SET IDENTITY_INSERT [dbo].[Respuesta] OFF
GO
SET IDENTITY_INSERT [dbo].[RespuestaCuestionario] ON 

INSERT [dbo].[RespuestaCuestionario] ([Id], [NombreParticipante], [Fecha], [Activo], [CuestionarioId]) VALUES (1002, N'Camilo', CAST(N'2023-11-07T00:10:10.4600000' AS DateTime2), 1, 7)
INSERT [dbo].[RespuestaCuestionario] ([Id], [NombreParticipante], [Fecha], [Activo], [CuestionarioId]) VALUES (1003, N'luis', CAST(N'2023-11-12T22:28:48.0391862' AS DateTime2), 1, 1)
INSERT [dbo].[RespuestaCuestionario] ([Id], [NombreParticipante], [Fecha], [Activo], [CuestionarioId]) VALUES (1004, N'angye', CAST(N'2023-11-12T22:29:22.7070510' AS DateTime2), 1, 3)
SET IDENTITY_INSERT [dbo].[RespuestaCuestionario] OFF
GO
SET IDENTITY_INSERT [dbo].[RespuestaCuestionarioDetalle] ON 

INSERT [dbo].[RespuestaCuestionarioDetalle] ([Id], [RespuestaCuestionarioId], [RespuestaId]) VALUES (1002, 1002, 47)
INSERT [dbo].[RespuestaCuestionarioDetalle] ([Id], [RespuestaCuestionarioId], [RespuestaId]) VALUES (1003, 1002, 57)
INSERT [dbo].[RespuestaCuestionarioDetalle] ([Id], [RespuestaCuestionarioId], [RespuestaId]) VALUES (1004, 1002, 54)
INSERT [dbo].[RespuestaCuestionarioDetalle] ([Id], [RespuestaCuestionarioId], [RespuestaId]) VALUES (1005, 1002, 51)
INSERT [dbo].[RespuestaCuestionarioDetalle] ([Id], [RespuestaCuestionarioId], [RespuestaId]) VALUES (1006, 1002, 63)
INSERT [dbo].[RespuestaCuestionarioDetalle] ([Id], [RespuestaCuestionarioId], [RespuestaId]) VALUES (1007, 1003, 2)
INSERT [dbo].[RespuestaCuestionarioDetalle] ([Id], [RespuestaCuestionarioId], [RespuestaId]) VALUES (1008, 1003, 6)
INSERT [dbo].[RespuestaCuestionarioDetalle] ([Id], [RespuestaCuestionarioId], [RespuestaId]) VALUES (1009, 1004, 11)
INSERT [dbo].[RespuestaCuestionarioDetalle] ([Id], [RespuestaCuestionarioId], [RespuestaId]) VALUES (1010, 1004, 15)
INSERT [dbo].[RespuestaCuestionarioDetalle] ([Id], [RespuestaCuestionarioId], [RespuestaId]) VALUES (1011, 1004, 18)
SET IDENTITY_INSERT [dbo].[RespuestaCuestionarioDetalle] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id], [NombreUsuario], [Password]) VALUES (1, N'wilbert', N'0192023a7bbd73250516f069df18b500')
INSERT [dbo].[Usuario] ([Id], [NombreUsuario], [Password]) VALUES (2, N'samuel', N'0192023a7bbd73250516f069df18b500')
INSERT [dbo].[Usuario] ([Id], [NombreUsuario], [Password]) VALUES (3, N'luis', N'0192023a7bbd73250516f069df18b500')
INSERT [dbo].[Usuario] ([Id], [NombreUsuario], [Password]) VALUES (4, N'kike', N'0192023a7bbd73250516f069df18b500')
INSERT [dbo].[Usuario] ([Id], [NombreUsuario], [Password]) VALUES (5, N'Yei', N'0192023a7bbd73250516f069df18b500')
INSERT [dbo].[Usuario] ([Id], [NombreUsuario], [Password]) VALUES (6, N'nini', N'0192023a7bbd73250516f069df18b500')
INSERT [dbo].[Usuario] ([Id], [NombreUsuario], [Password]) VALUES (7, N'papi', N'c93ccd78b2076528346216b3b2f701e6')
INSERT [dbo].[Usuario] ([Id], [NombreUsuario], [Password]) VALUES (8, N'marina', N'c93ccd78b2076528346216b3b2f701e6')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Cuestionario]  WITH CHECK ADD  CONSTRAINT [FK_Cuestionario_Usuario_UsuarioId] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cuestionario] CHECK CONSTRAINT [FK_Cuestionario_Usuario_UsuarioId]
GO
ALTER TABLE [dbo].[Pregunta]  WITH CHECK ADD  CONSTRAINT [FK_Pregunta_Cuestionario_CuestionarioId] FOREIGN KEY([CuestionarioId])
REFERENCES [dbo].[Cuestionario] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pregunta] CHECK CONSTRAINT [FK_Pregunta_Cuestionario_CuestionarioId]
GO
ALTER TABLE [dbo].[Respuesta]  WITH CHECK ADD  CONSTRAINT [FK_Respuesta_Pregunta_PreguntaId] FOREIGN KEY([PreguntaId])
REFERENCES [dbo].[Pregunta] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Respuesta] CHECK CONSTRAINT [FK_Respuesta_Pregunta_PreguntaId]
GO
ALTER TABLE [dbo].[RespuestaCuestionario]  WITH CHECK ADD  CONSTRAINT [FK_RespuestaCuestionario_Cuestionario_CuestionarioId] FOREIGN KEY([CuestionarioId])
REFERENCES [dbo].[Cuestionario] ([Id])
GO
ALTER TABLE [dbo].[RespuestaCuestionario] CHECK CONSTRAINT [FK_RespuestaCuestionario_Cuestionario_CuestionarioId]
GO
ALTER TABLE [dbo].[RespuestaCuestionarioDetalle]  WITH CHECK ADD  CONSTRAINT [FK_RespuestaCuestionarioDetalle_Respuesta_RespuestaId] FOREIGN KEY([RespuestaId])
REFERENCES [dbo].[Respuesta] ([Id])
GO
ALTER TABLE [dbo].[RespuestaCuestionarioDetalle] CHECK CONSTRAINT [FK_RespuestaCuestionarioDetalle_Respuesta_RespuestaId]
GO
ALTER TABLE [dbo].[RespuestaCuestionarioDetalle]  WITH CHECK ADD  CONSTRAINT [FK_RespuestaCuestionarioDetalle_RespuestaCuestionario_RespuestaCuestionarioId] FOREIGN KEY([RespuestaCuestionarioId])
REFERENCES [dbo].[RespuestaCuestionario] ([Id])
GO
ALTER TABLE [dbo].[RespuestaCuestionarioDetalle] CHECK CONSTRAINT [FK_RespuestaCuestionarioDetalle_RespuestaCuestionario_RespuestaCuestionarioId]
GO
