/****** Object:  ForeignKey [FK_Administrador_Jornalista]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Administrador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Administrador]'))
ALTER TABLE [dbo].[Administrador] DROP CONSTRAINT [FK_Administrador_Jornalista]
GO
/****** Object:  ForeignKey [FK_Banido_Jornalista]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Banido_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
ALTER TABLE [dbo].[Banido] DROP CONSTRAINT [FK_Banido_Jornalista]
GO
/****** Object:  ForeignKey [FK_Comentario_Jornalista]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario] DROP CONSTRAINT [FK_Comentario_Jornalista]
GO
/****** Object:  ForeignKey [FK_Comentario_Noticia]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario] DROP CONSTRAINT [FK_Comentario_Noticia]
GO
/****** Object:  ForeignKey [FK_Imagem_Noticia]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Imagem_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Imagem]'))
ALTER TABLE [dbo].[Imagem] DROP CONSTRAINT [FK_Imagem_Noticia]
GO
/****** Object:  ForeignKey [FK_Moderador_Jornalista]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Moderador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Moderador]'))
ALTER TABLE [dbo].[Moderador] DROP CONSTRAINT [FK_Moderador_Jornalista]
GO
/****** Object:  ForeignKey [FK_Noticia_Jornalista]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Noticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
ALTER TABLE [dbo].[Noticia] DROP CONSTRAINT [FK_Noticia_Jornalista]
GO
/****** Object:  ForeignKey [FK_Noticia_Mapa]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Noticia_Mapa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
ALTER TABLE [dbo].[Noticia] DROP CONSTRAINT [FK_Noticia_Mapa]
GO
/****** Object:  ForeignKey [FK_NoticiaFlagged_Noticia]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NoticiaFlagged_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]'))
ALTER TABLE [dbo].[NoticiaFlagged] DROP CONSTRAINT [FK_NoticiaFlagged_Noticia]
GO
/****** Object:  ForeignKey [FK_Queixas_Jornalista]    Script Date: 05/18/2010 15:31:06 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Queixas_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Queixa]'))
ALTER TABLE [dbo].[Queixa] DROP CONSTRAINT [FK_Queixas_Jornalista]
GO
/****** Object:  ForeignKey [FK_Sessao_Jornalista]    Script Date: 05/18/2010 15:31:06 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sessao_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sessao]'))
ALTER TABLE [dbo].[Sessao] DROP CONSTRAINT [FK_Sessao_Jornalista]
GO
/****** Object:  ForeignKey [FK_Tour_Mapa]    Script Date: 05/18/2010 15:31:06 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tour_Mapa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tour]'))
ALTER TABLE [dbo].[Tour] DROP CONSTRAINT [FK_Tour_Mapa]
GO
/****** Object:  ForeignKey [FK_Video_Noticia]    Script Date: 05/18/2010 15:31:06 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Video_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Video]'))
ALTER TABLE [dbo].[Video] DROP CONSTRAINT [FK_Video_Noticia]
GO
/****** Object:  ForeignKey [FK_VotoNoticia_Jornalista]    Script Date: 05/18/2010 15:31:06 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia] DROP CONSTRAINT [FK_VotoNoticia_Jornalista]
GO
/****** Object:  ForeignKey [FK_VotoNoticia_Noticia]    Script Date: 05/18/2010 15:31:06 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia] DROP CONSTRAINT [FK_VotoNoticia_Noticia]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comentario]') AND type in (N'U'))
DROP TABLE [dbo].[Comentario]
GO
/****** Object:  Table [dbo].[Imagem]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Imagem]') AND type in (N'U'))
DROP TABLE [dbo].[Imagem]
GO
/****** Object:  Table [dbo].[NoticiaFlagged]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]') AND type in (N'U'))
DROP TABLE [dbo].[NoticiaFlagged]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 05/18/2010 15:31:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Video]') AND type in (N'U'))
DROP TABLE [dbo].[Video]
GO
/****** Object:  Table [dbo].[VotoNoticia]    Script Date: 05/18/2010 15:31:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VotoNoticia]') AND type in (N'U'))
DROP TABLE [dbo].[VotoNoticia]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Administrador]') AND type in (N'U'))
DROP TABLE [dbo].[Administrador]
GO
/****** Object:  Table [dbo].[Banido]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Banido]') AND type in (N'U'))
DROP TABLE [dbo].[Banido]
GO
/****** Object:  Table [dbo].[Queixa]    Script Date: 05/18/2010 15:31:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Queixa]') AND type in (N'U'))
DROP TABLE [dbo].[Queixa]
GO
/****** Object:  Table [dbo].[Sessao]    Script Date: 05/18/2010 15:31:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sessao]') AND type in (N'U'))
DROP TABLE [dbo].[Sessao]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 05/18/2010 15:31:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tour]') AND type in (N'U'))
DROP TABLE [dbo].[Tour]
GO
/****** Object:  Table [dbo].[Moderador]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Moderador]') AND type in (N'U'))
DROP TABLE [dbo].[Moderador]
GO
/****** Object:  Table [dbo].[Noticia]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia]') AND type in (N'U'))
DROP TABLE [dbo].[Noticia]
GO
/****** Object:  Table [dbo].[Jornalista]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Jornalista]') AND type in (N'U'))
DROP TABLE [dbo].[Jornalista]
GO
/****** Object:  Table [dbo].[Mapa]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mapa]') AND type in (N'U'))
DROP TABLE [dbo].[Mapa]
GO
/****** Object:  Default [DF_Administrador_AdministradorId]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Administrador_AdministradorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Administrador]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Administrador_AdministradorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Administrador] DROP CONSTRAINT [DF_Administrador_AdministradorId]
END


End
GO
/****** Object:  Default [DF_Banido_BanidoId]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Banido_BanidoId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Banido_BanidoId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Banido] DROP CONSTRAINT [DF_Banido_BanidoId]
END


End
GO
/****** Object:  Default [DF_Banido_JornalistaId]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Banido_JornalistaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Banido_JornalistaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Banido] DROP CONSTRAINT [DF_Banido_JornalistaId]
END


End
GO
/****** Object:  Default [DF_Comentario_ComentarioId]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Comentario_ComentarioId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Comentario_ComentarioId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Comentario] DROP CONSTRAINT [DF_Comentario_ComentarioId]
END


End
GO
/****** Object:  Default [DF_Imagem_ImagemId]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Imagem_ImagemId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Imagem]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Imagem_ImagemId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Imagem] DROP CONSTRAINT [DF_Imagem_ImagemId]
END


End
GO
/****** Object:  Default [DF_Jornalista_JornalistaId]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Jornalista_JornalistaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Jornalista]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Jornalista_JornalistaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Jornalista] DROP CONSTRAINT [DF_Jornalista_JornalistaId]
END


End
GO
/****** Object:  Default [DF_Mapa_MapaId]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Mapa_MapaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mapa]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Mapa_MapaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Mapa] DROP CONSTRAINT [DF_Mapa_MapaId]
END


End
GO
/****** Object:  Default [DF_Moderador_ModeradorId]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Moderador_ModeradorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Moderador]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Moderador_ModeradorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Moderador] DROP CONSTRAINT [DF_Moderador_ModeradorId]
END


End
GO
/****** Object:  Default [DF_Noticia_NoticiaId]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Noticia_NoticiaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Noticia_NoticiaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Noticia] DROP CONSTRAINT [DF_Noticia_NoticiaId]
END


End
GO
/****** Object:  Default [DF_NoticiaFlagged_NoticiaId]    Script Date: 05/18/2010 15:31:05 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_NoticiaFlagged_NoticiaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_NoticiaFlagged_NoticiaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NoticiaFlagged] DROP CONSTRAINT [DF_NoticiaFlagged_NoticiaId]
END


End
GO
/****** Object:  Default [DF_Queixas_QueixaId]    Script Date: 05/18/2010 15:31:06 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Queixas_QueixaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Queixa]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Queixas_QueixaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Queixa] DROP CONSTRAINT [DF_Queixas_QueixaId]
END


End
GO
/****** Object:  Default [DF_Tour_TourId]    Script Date: 05/18/2010 15:31:06 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Tour_TourId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tour]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Tour_TourId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Tour] DROP CONSTRAINT [DF_Tour_TourId]
END


End
GO
/****** Object:  Default [DF_Video_VideoId]    Script Date: 05/18/2010 15:31:06 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Video_VideoId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Video]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Video_VideoId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Video] DROP CONSTRAINT [DF_Video_VideoId]
END


End
GO
/****** Object:  Table [dbo].[Mapa]    Script Date: 05/18/2010 15:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mapa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mapa](
	[MapaId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[NoticiaId] [uniqueidentifier] NOT NULL,
	[Morada] [varchar](256) COLLATE Latin1_General_CI_AS NULL,
	[Longitude] [float] NOT NULL,
	[Latidude] [float] NOT NULL,
	[isTour] [bit] NOT NULL,
 CONSTRAINT [PK_Mapa] PRIMARY KEY CLUSTERED 
(
	[MapaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Jornalista]    Script Date: 05/18/2010 15:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Jornalista]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Jornalista](
	[Nome] [varchar](64) COLLATE Latin1_General_CI_AS NOT NULL,
	[Email] [varchar](160) COLLATE Latin1_General_CI_AS NOT NULL,
	[Password] [varchar](128) COLLATE Latin1_General_CI_AS NOT NULL,
	[JornalistaId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Jornalista] PRIMARY KEY CLUSTERED 
(
	[JornalistaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[Jornalista] ([Nome], [Email], [Password], [JornalistaId]) VALUES (N'Christophe Gonçalves                                            ', N'jornalista@newzic.com                                                                                                                                           ', N'newzic                                                                                                                          ', N'81379be9-98d4-44bb-8cfa-33a0e6bfdc1f')
/****** Object:  Table [dbo].[Noticia]    Script Date: 05/18/2010 15:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Noticia](
	[NoticiaId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Titulo] [varchar](256) COLLATE Latin1_General_CI_AS NOT NULL,
	[Corpo] [text] COLLATE Latin1_General_CI_AS NOT NULL,
	[Pontuacao] [int] NOT NULL,
	[Data] [datetime] NOT NULL,
	[FlagCount] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Marked] [bit] NOT NULL,
	[JornalistaId] [uniqueidentifier] NOT NULL,
	[Tags] [varchar](512) COLLATE Latin1_General_CI_AS NOT NULL,
	[MapaId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Noticia] PRIMARY KEY CLUSTERED 
(
	[NoticiaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[Noticia] ([NoticiaId], [Titulo], [Corpo], [Pontuacao], [Data], [FlagCount], [Deleted], [Marked], [JornalistaId], [Tags], [MapaId]) VALUES (N'b57d7ed6-269c-471d-8262-4d67c7c37d27', N'Sintonize as suas noticias com o Newzic', N'Falar do Newzic', 0, CAST(0x00009D6C011AE5E0 AS DateTime), 0, 0, 0, N'81379be9-98d4-44bb-8cfa-33a0e6bfdc1f', N'musica newzic noticias', NULL)
/****** Object:  Table [dbo].[Moderador]    Script Date: 05/18/2010 15:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Moderador]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Moderador](
	[ModeradorId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Moderador] PRIMARY KEY CLUSTERED 
(
	[ModeradorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 05/18/2010 15:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tour]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tour](
	[TourId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[MapaId] [uniqueidentifier] NOT NULL,
	[Longitude] [float] NOT NULL,
	[Latitude] [float] NOT NULL,
	[Morada] [varchar](256) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[TourId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Sessao]    Script Date: 05/18/2010 15:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sessao]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sessao](
	[Token] [varchar](128) COLLATE Latin1_General_CI_AS NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[JornalistaId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Sessao_1] PRIMARY KEY CLUSTERED 
(
	[JornalistaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Queixa]    Script Date: 05/18/2010 15:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Queixa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Queixa](
	[QueixaId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[JornalistaId] [uniqueidentifier] NOT NULL,
	[AcusadoId] [uniqueidentifier] NOT NULL,
	[Texto] [varchar](256) COLLATE Latin1_General_CI_AS NOT NULL,
	[Resolved] [bit] NOT NULL,
	[Assunto] [varchar](64) COLLATE Latin1_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Queixas] PRIMARY KEY CLUSTERED 
(
	[QueixaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Banido]    Script Date: 05/18/2010 15:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Banido]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Banido](
	[BanidoId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[JornalistaId] [uniqueidentifier] NOT NULL,
	[DataFim] [datetime] NULL,
	[Permanente] [bit] NOT NULL,
 CONSTRAINT [PK_Banido] PRIMARY KEY CLUSTERED 
(
	[BanidoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 05/18/2010 15:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Administrador]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Administrador](
	[AdministradorId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Administrador] PRIMARY KEY CLUSTERED 
(
	[AdministradorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[VotoNoticia]    Script Date: 05/18/2010 15:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VotoNoticia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VotoNoticia](
	[NoticiaId] [uniqueidentifier] NOT NULL,
	[JornalistaId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_VotoNoticia] PRIMARY KEY CLUSTERED 
(
	[NoticiaId] ASC,
	[JornalistaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Video]    Script Date: 05/18/2010 15:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Video]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Video](
	[VideoId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[NoticiaId] [uniqueidentifier] NOT NULL,
	[Url] [nchar](10) COLLATE Latin1_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Video] PRIMARY KEY CLUSTERED 
(
	[VideoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[NoticiaFlagged]    Script Date: 05/18/2010 15:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NoticiaFlagged](
	[NoticiaId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Data] [datetime] NOT NULL,
 CONSTRAINT [PK_NoticiaFlagged] PRIMARY KEY CLUSTERED 
(
	[NoticiaId] ASC,
	[Data] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Imagem]    Script Date: 05/18/2010 15:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Imagem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Imagem](
	[ImagemId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ImageFile] [image] NOT NULL,
	[NoticiaId] [uniqueidentifier] NOT NULL,
	[Nome] [varchar](64) COLLATE Latin1_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Imagem] PRIMARY KEY CLUSTERED 
(
	[ImagemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 05/18/2010 15:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comentario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Comentario](
	[ComentarioId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Texto] [varchar](256) COLLATE Latin1_General_CI_AS NOT NULL,
	[NoticiaId] [uniqueidentifier] NOT NULL,
	[JornalistaId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Comentario] PRIMARY KEY CLUSTERED 
(
	[ComentarioId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Default [DF_Administrador_AdministradorId]    Script Date: 05/18/2010 15:31:05 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Administrador_AdministradorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Administrador]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Administrador_AdministradorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Administrador] ADD  CONSTRAINT [DF_Administrador_AdministradorId]  DEFAULT (newid()) FOR [AdministradorId]
END


End
GO
/****** Object:  Default [DF_Banido_BanidoId]    Script Date: 05/18/2010 15:31:05 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Banido_BanidoId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Banido_BanidoId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Banido] ADD  CONSTRAINT [DF_Banido_BanidoId]  DEFAULT (newid()) FOR [BanidoId]
END


End
GO
/****** Object:  Default [DF_Banido_JornalistaId]    Script Date: 05/18/2010 15:31:05 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Banido_JornalistaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Banido_JornalistaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Banido] ADD  CONSTRAINT [DF_Banido_JornalistaId]  DEFAULT (newid()) FOR [JornalistaId]
END


End
GO
/****** Object:  Default [DF_Comentario_ComentarioId]    Script Date: 05/18/2010 15:31:05 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Comentario_ComentarioId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Comentario_ComentarioId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Comentario] ADD  CONSTRAINT [DF_Comentario_ComentarioId]  DEFAULT (newid()) FOR [ComentarioId]
END


End
GO
/****** Object:  Default [DF_Imagem_ImagemId]    Script Date: 05/18/2010 15:31:05 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Imagem_ImagemId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Imagem]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Imagem_ImagemId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Imagem] ADD  CONSTRAINT [DF_Imagem_ImagemId]  DEFAULT (newid()) FOR [ImagemId]
END


End
GO
/****** Object:  Default [DF_Jornalista_JornalistaId]    Script Date: 05/18/2010 15:31:05 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Jornalista_JornalistaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Jornalista]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Jornalista_JornalistaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Jornalista] ADD  CONSTRAINT [DF_Jornalista_JornalistaId]  DEFAULT (newid()) FOR [JornalistaId]
END


End
GO
/****** Object:  Default [DF_Mapa_MapaId]    Script Date: 05/18/2010 15:31:05 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Mapa_MapaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mapa]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Mapa_MapaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Mapa] ADD  CONSTRAINT [DF_Mapa_MapaId]  DEFAULT (newid()) FOR [MapaId]
END


End
GO
/****** Object:  Default [DF_Moderador_ModeradorId]    Script Date: 05/18/2010 15:31:05 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Moderador_ModeradorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Moderador]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Moderador_ModeradorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Moderador] ADD  CONSTRAINT [DF_Moderador_ModeradorId]  DEFAULT (newid()) FOR [ModeradorId]
END


End
GO
/****** Object:  Default [DF_Noticia_NoticiaId]    Script Date: 05/18/2010 15:31:05 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Noticia_NoticiaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Noticia_NoticiaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Noticia] ADD  CONSTRAINT [DF_Noticia_NoticiaId]  DEFAULT (newid()) FOR [NoticiaId]
END


End
GO
/****** Object:  Default [DF_NoticiaFlagged_NoticiaId]    Script Date: 05/18/2010 15:31:05 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_NoticiaFlagged_NoticiaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_NoticiaFlagged_NoticiaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NoticiaFlagged] ADD  CONSTRAINT [DF_NoticiaFlagged_NoticiaId]  DEFAULT (newid()) FOR [NoticiaId]
END


End
GO
/****** Object:  Default [DF_Queixas_QueixaId]    Script Date: 05/18/2010 15:31:06 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Queixas_QueixaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Queixa]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Queixas_QueixaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Queixa] ADD  CONSTRAINT [DF_Queixas_QueixaId]  DEFAULT (newid()) FOR [QueixaId]
END


End
GO
/****** Object:  Default [DF_Tour_TourId]    Script Date: 05/18/2010 15:31:06 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Tour_TourId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tour]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Tour_TourId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Tour] ADD  CONSTRAINT [DF_Tour_TourId]  DEFAULT (newid()) FOR [TourId]
END


End
GO
/****** Object:  Default [DF_Video_VideoId]    Script Date: 05/18/2010 15:31:06 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Video_VideoId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Video]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Video_VideoId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Video] ADD  CONSTRAINT [DF_Video_VideoId]  DEFAULT (newid()) FOR [VideoId]
END


End
GO
/****** Object:  ForeignKey [FK_Administrador_Jornalista]    Script Date: 05/18/2010 15:31:05 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Administrador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Administrador]'))
ALTER TABLE [dbo].[Administrador]  WITH CHECK ADD  CONSTRAINT [FK_Administrador_Jornalista] FOREIGN KEY([AdministradorId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Administrador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Administrador]'))
ALTER TABLE [dbo].[Administrador] CHECK CONSTRAINT [FK_Administrador_Jornalista]
GO
/****** Object:  ForeignKey [FK_Banido_Jornalista]    Script Date: 05/18/2010 15:31:05 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Banido_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
ALTER TABLE [dbo].[Banido]  WITH CHECK ADD  CONSTRAINT [FK_Banido_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Banido_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
ALTER TABLE [dbo].[Banido] CHECK CONSTRAINT [FK_Banido_Jornalista]
GO
/****** Object:  ForeignKey [FK_Comentario_Jornalista]    Script Date: 05/18/2010 15:31:05 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Jornalista]
GO
/****** Object:  ForeignKey [FK_Comentario_Noticia]    Script Date: 05/18/2010 15:31:05 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Noticia] FOREIGN KEY([NoticiaId])
REFERENCES [dbo].[Noticia] ([NoticiaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Noticia]
GO
/****** Object:  ForeignKey [FK_Imagem_Noticia]    Script Date: 05/18/2010 15:31:05 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Imagem_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Imagem]'))
ALTER TABLE [dbo].[Imagem]  WITH CHECK ADD  CONSTRAINT [FK_Imagem_Noticia] FOREIGN KEY([NoticiaId])
REFERENCES [dbo].[Noticia] ([NoticiaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Imagem_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Imagem]'))
ALTER TABLE [dbo].[Imagem] CHECK CONSTRAINT [FK_Imagem_Noticia]
GO
/****** Object:  ForeignKey [FK_Moderador_Jornalista]    Script Date: 05/18/2010 15:31:05 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Moderador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Moderador]'))
ALTER TABLE [dbo].[Moderador]  WITH CHECK ADD  CONSTRAINT [FK_Moderador_Jornalista] FOREIGN KEY([ModeradorId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Moderador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Moderador]'))
ALTER TABLE [dbo].[Moderador] CHECK CONSTRAINT [FK_Moderador_Jornalista]
GO
/****** Object:  ForeignKey [FK_Noticia_Jornalista]    Script Date: 05/18/2010 15:31:05 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Noticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
ALTER TABLE [dbo].[Noticia]  WITH CHECK ADD  CONSTRAINT [FK_Noticia_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Noticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
ALTER TABLE [dbo].[Noticia] CHECK CONSTRAINT [FK_Noticia_Jornalista]
GO
/****** Object:  ForeignKey [FK_Noticia_Mapa]    Script Date: 05/18/2010 15:31:05 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Noticia_Mapa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
ALTER TABLE [dbo].[Noticia]  WITH CHECK ADD  CONSTRAINT [FK_Noticia_Mapa] FOREIGN KEY([MapaId])
REFERENCES [dbo].[Mapa] ([MapaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Noticia_Mapa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
ALTER TABLE [dbo].[Noticia] CHECK CONSTRAINT [FK_Noticia_Mapa]
GO
/****** Object:  ForeignKey [FK_NoticiaFlagged_Noticia]    Script Date: 05/18/2010 15:31:05 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NoticiaFlagged_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]'))
ALTER TABLE [dbo].[NoticiaFlagged]  WITH CHECK ADD  CONSTRAINT [FK_NoticiaFlagged_Noticia] FOREIGN KEY([NoticiaId])
REFERENCES [dbo].[Noticia] ([NoticiaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NoticiaFlagged_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]'))
ALTER TABLE [dbo].[NoticiaFlagged] CHECK CONSTRAINT [FK_NoticiaFlagged_Noticia]
GO
/****** Object:  ForeignKey [FK_Queixas_Jornalista]    Script Date: 05/18/2010 15:31:06 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Queixas_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Queixa]'))
ALTER TABLE [dbo].[Queixa]  WITH CHECK ADD  CONSTRAINT [FK_Queixas_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Queixas_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Queixa]'))
ALTER TABLE [dbo].[Queixa] CHECK CONSTRAINT [FK_Queixas_Jornalista]
GO
/****** Object:  ForeignKey [FK_Sessao_Jornalista]    Script Date: 05/18/2010 15:31:06 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sessao_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sessao]'))
ALTER TABLE [dbo].[Sessao]  WITH CHECK ADD  CONSTRAINT [FK_Sessao_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sessao_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sessao]'))
ALTER TABLE [dbo].[Sessao] CHECK CONSTRAINT [FK_Sessao_Jornalista]
GO
/****** Object:  ForeignKey [FK_Tour_Mapa]    Script Date: 05/18/2010 15:31:06 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tour_Mapa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tour]'))
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD  CONSTRAINT [FK_Tour_Mapa] FOREIGN KEY([MapaId])
REFERENCES [dbo].[Mapa] ([MapaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tour_Mapa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tour]'))
ALTER TABLE [dbo].[Tour] CHECK CONSTRAINT [FK_Tour_Mapa]
GO
/****** Object:  ForeignKey [FK_Video_Noticia]    Script Date: 05/18/2010 15:31:06 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Video_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Video]'))
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_Video_Noticia] FOREIGN KEY([NoticiaId])
REFERENCES [dbo].[Noticia] ([NoticiaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Video_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Video]'))
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_Video_Noticia]
GO
/****** Object:  ForeignKey [FK_VotoNoticia_Jornalista]    Script Date: 05/18/2010 15:31:06 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia]  WITH CHECK ADD  CONSTRAINT [FK_VotoNoticia_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia] CHECK CONSTRAINT [FK_VotoNoticia_Jornalista]
GO
/****** Object:  ForeignKey [FK_VotoNoticia_Noticia]    Script Date: 05/18/2010 15:31:06 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia]  WITH CHECK ADD  CONSTRAINT [FK_VotoNoticia_Noticia] FOREIGN KEY([NoticiaId])
REFERENCES [dbo].[Noticia] ([NoticiaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia] CHECK CONSTRAINT [FK_VotoNoticia_Noticia]
GO
