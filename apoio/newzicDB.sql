/****** Object:  ForeignKey [FK_Administrador_Jornalista]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Administrador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Administrador]'))
ALTER TABLE [dbo].[Administrador] DROP CONSTRAINT [FK_Administrador_Jornalista]
GO
/****** Object:  ForeignKey [FK_Banido_Jornalista]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Banido_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
ALTER TABLE [dbo].[Banido] DROP CONSTRAINT [FK_Banido_Jornalista]
GO
/****** Object:  ForeignKey [FK_Comentario_Jornalista]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario] DROP CONSTRAINT [FK_Comentario_Jornalista]
GO
/****** Object:  ForeignKey [FK_Comentario_Noticia]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario] DROP CONSTRAINT [FK_Comentario_Noticia]
GO
/****** Object:  ForeignKey [FK_Imagem_Noticia]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Imagem_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Imagem]'))
ALTER TABLE [dbo].[Imagem] DROP CONSTRAINT [FK_Imagem_Noticia]
GO
/****** Object:  ForeignKey [FK_Mapa_Noticia]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Mapa_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mapa]'))
ALTER TABLE [dbo].[Mapa] DROP CONSTRAINT [FK_Mapa_Noticia]
GO
/****** Object:  ForeignKey [FK_Moderador_Jornalista]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Moderador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Moderador]'))
ALTER TABLE [dbo].[Moderador] DROP CONSTRAINT [FK_Moderador_Jornalista]
GO
/****** Object:  ForeignKey [FK_Noticia_Jornalista]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Noticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
ALTER TABLE [dbo].[Noticia] DROP CONSTRAINT [FK_Noticia_Jornalista]
GO
/****** Object:  ForeignKey [FK_Queixas_Jornalista]    Script Date: 05/04/2010 18:25:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Queixas_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Queixas]'))
ALTER TABLE [dbo].[Queixas] DROP CONSTRAINT [FK_Queixas_Jornalista]
GO
/****** Object:  ForeignKey [FK_Sessao_Jornalista]    Script Date: 05/04/2010 18:25:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sessao_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sessao]'))
ALTER TABLE [dbo].[Sessao] DROP CONSTRAINT [FK_Sessao_Jornalista]
GO
/****** Object:  ForeignKey [FK_Video_Noticia]    Script Date: 05/04/2010 18:25:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Video_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Video]'))
ALTER TABLE [dbo].[Video] DROP CONSTRAINT [FK_Video_Noticia]
GO
/****** Object:  ForeignKey [FK_VotoNoticia_Jornalista]    Script Date: 05/04/2010 18:25:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia] DROP CONSTRAINT [FK_VotoNoticia_Jornalista]
GO
/****** Object:  ForeignKey [FK_VotoNoticia_Noticia]    Script Date: 05/04/2010 18:25:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia] DROP CONSTRAINT [FK_VotoNoticia_Noticia]
GO
/****** Object:  View [dbo].[MapaView]    Script Date: 05/04/2010 18:25:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[MapaView]'))
DROP VIEW [dbo].[MapaView]
GO
/****** Object:  Table [dbo].[Mapa]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mapa]') AND type in (N'U'))
DROP TABLE [dbo].[Mapa]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 05/04/2010 18:25:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Video]') AND type in (N'U'))
DROP TABLE [dbo].[Video]
GO
/****** Object:  Table [dbo].[VotoNoticia]    Script Date: 05/04/2010 18:25:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VotoNoticia]') AND type in (N'U'))
DROP TABLE [dbo].[VotoNoticia]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comentario]') AND type in (N'U'))
DROP TABLE [dbo].[Comentario]
GO
/****** Object:  Table [dbo].[Imagem]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Imagem]') AND type in (N'U'))
DROP TABLE [dbo].[Imagem]
GO
/****** Object:  Table [dbo].[Moderador]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Moderador]') AND type in (N'U'))
DROP TABLE [dbo].[Moderador]
GO
/****** Object:  Table [dbo].[Noticia]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia]') AND type in (N'U'))
DROP TABLE [dbo].[Noticia]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Administrador]') AND type in (N'U'))
DROP TABLE [dbo].[Administrador]
GO
/****** Object:  Table [dbo].[Banido]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Banido]') AND type in (N'U'))
DROP TABLE [dbo].[Banido]
GO
/****** Object:  Table [dbo].[Queixas]    Script Date: 05/04/2010 18:25:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Queixas]') AND type in (N'U'))
DROP TABLE [dbo].[Queixas]
GO
/****** Object:  Table [dbo].[Sessao]    Script Date: 05/04/2010 18:25:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sessao]') AND type in (N'U'))
DROP TABLE [dbo].[Sessao]
GO
/****** Object:  Table [dbo].[NoticiaFlagged]    Script Date: 05/04/2010 18:25:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]') AND type in (N'U'))
DROP TABLE [dbo].[NoticiaFlagged]
GO
/****** Object:  Table [dbo].[Jornalista]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Jornalista]') AND type in (N'U'))
DROP TABLE [dbo].[Jornalista]
GO
/****** Object:  Default [DF_Administrador_AdministradorId]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Administrador_AdministradorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Administrador]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Administrador_AdministradorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Administrador] DROP CONSTRAINT [DF_Administrador_AdministradorId]
END


End
GO
/****** Object:  Default [DF_Banido_BanidoId]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Banido_BanidoId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Banido_BanidoId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Banido] DROP CONSTRAINT [DF_Banido_BanidoId]
END


End
GO
/****** Object:  Default [DF_Banido_JornalistaId]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Banido_JornalistaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Banido_JornalistaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Banido] DROP CONSTRAINT [DF_Banido_JornalistaId]
END


End
GO
/****** Object:  Default [DF_Comentario_ComentarioId]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Comentario_ComentarioId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Comentario_ComentarioId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Comentario] DROP CONSTRAINT [DF_Comentario_ComentarioId]
END


End
GO
/****** Object:  Default [DF_Imagem_ImagemId]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Imagem_ImagemId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Imagem]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Imagem_ImagemId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Imagem] DROP CONSTRAINT [DF_Imagem_ImagemId]
END


End
GO
/****** Object:  Default [DF_Jornalista_JornalistaId]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Jornalista_JornalistaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Jornalista]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Jornalista_JornalistaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Jornalista] DROP CONSTRAINT [DF_Jornalista_JornalistaId]
END


End
GO
/****** Object:  Default [DF_Mapa_MapaId]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Mapa_MapaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mapa]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Mapa_MapaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Mapa] DROP CONSTRAINT [DF_Mapa_MapaId]
END


End
GO
/****** Object:  Default [DF_Moderador_ModeradorId]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Moderador_ModeradorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Moderador]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Moderador_ModeradorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Moderador] DROP CONSTRAINT [DF_Moderador_ModeradorId]
END


End
GO
/****** Object:  Default [DF_Noticia_NoticiaId]    Script Date: 05/04/2010 18:25:02 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Noticia_NoticiaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Noticia_NoticiaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Noticia] DROP CONSTRAINT [DF_Noticia_NoticiaId]
END


End
GO
/****** Object:  Default [DF_NoticiaFlagged_NoticiaId]    Script Date: 05/04/2010 18:25:03 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_NoticiaFlagged_NoticiaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_NoticiaFlagged_NoticiaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NoticiaFlagged] DROP CONSTRAINT [DF_NoticiaFlagged_NoticiaId]
END


End
GO
/****** Object:  Default [DF_Queixas_QueixaId]    Script Date: 05/04/2010 18:25:03 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Queixas_QueixaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Queixas]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Queixas_QueixaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Queixas] DROP CONSTRAINT [DF_Queixas_QueixaId]
END


End
GO
/****** Object:  Default [DF_Sessao_SessaoId]    Script Date: 05/04/2010 18:25:03 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sessao_SessaoId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sessao]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Sessao_SessaoId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sessao] DROP CONSTRAINT [DF_Sessao_SessaoId]
END


End
GO
/****** Object:  Default [DF_Video_VideoId]    Script Date: 05/04/2010 18:25:03 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Video_VideoId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Video]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Video_VideoId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Video] DROP CONSTRAINT [DF_Video_VideoId]
END


End
GO
/****** Object:  Table [dbo].[Jornalista]    Script Date: 05/04/2010 18:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Jornalista]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Jornalista](
	[Nome] [nchar](64) COLLATE Latin1_General_CI_AS NOT NULL,
	[Email] [nchar](160) COLLATE Latin1_General_CI_AS NOT NULL,
	[Password] [nchar](128) COLLATE Latin1_General_CI_AS NOT NULL,
	[JornalistaId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Jornalista] PRIMARY KEY CLUSTERED 
(
	[JornalistaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[Jornalista] ([Nome], [Email], [Password], [JornalistaId]) VALUES (N'Christophe Gonçalves                                            ', N'jornalista@newzic.com                                                                                                                                           ', N'newzic                                                                                                                          ', N'81379be9-98d4-44bb-8cfa-33a0e6bfdc1f')
/****** Object:  Table [dbo].[NoticiaFlagged]    Script Date: 05/04/2010 18:25:03 ******/
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
/****** Object:  Table [dbo].[Sessao]    Script Date: 05/04/2010 18:25:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sessao]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sessao](
	[Token] [varchar](128) COLLATE Latin1_General_CI_AS NOT NULL,
	[Timestamp] [timestamp] NOT NULL,
	[SessaoId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[JornalistaId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Sessao] PRIMARY KEY CLUSTERED 
(
	[SessaoId] ASC,
	[JornalistaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Queixas]    Script Date: 05/04/2010 18:25:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Queixas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Queixas](
	[QueixaId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[JornalistaId] [uniqueidentifier] NOT NULL,
	[AcusadoId] [uniqueidentifier] NOT NULL,
	[Texto] [varchar](256) COLLATE Latin1_General_CI_AS NOT NULL,
	[Resolved] [bit] NOT NULL,
 CONSTRAINT [PK_Queixas] PRIMARY KEY CLUSTERED 
(
	[QueixaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Banido]    Script Date: 05/04/2010 18:25:02 ******/
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
/****** Object:  Table [dbo].[Administrador]    Script Date: 05/04/2010 18:25:02 ******/
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
/****** Object:  Table [dbo].[Noticia]    Script Date: 05/04/2010 18:25:02 ******/
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
 CONSTRAINT [PK_Noticia] PRIMARY KEY CLUSTERED 
(
	[NoticiaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[Noticia] ([NoticiaId], [Titulo], [Corpo], [Pontuacao], [Data], [FlagCount], [Deleted], [Marked], [JornalistaId]) VALUES (N'b57d7ed6-269c-471d-8262-4d67c7c37d27', N'Sintonize as suas noticias com o Newzic', N'Falar do Newzic', 0, CAST(0x00009D6C011AE5E0 AS DateTime), 0, 0, 0, N'81379be9-98d4-44bb-8cfa-33a0e6bfdc1f')
/****** Object:  Table [dbo].[Moderador]    Script Date: 05/04/2010 18:25:02 ******/
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
/****** Object:  Table [dbo].[Imagem]    Script Date: 05/04/2010 18:25:02 ******/
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
 CONSTRAINT [PK_Imagem] PRIMARY KEY CLUSTERED 
(
	[ImagemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 05/04/2010 18:25:02 ******/
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
/****** Object:  Table [dbo].[VotoNoticia]    Script Date: 05/04/2010 18:25:03 ******/
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
/****** Object:  Table [dbo].[Video]    Script Date: 05/04/2010 18:25:03 ******/
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
/****** Object:  Table [dbo].[Mapa]    Script Date: 05/04/2010 18:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mapa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mapa](
	[MapaId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Mapa] [geography] NOT NULL,
	[NoticiaId] [uniqueidentifier] NOT NULL,
	[Morada] [varchar](256) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_Mapa] PRIMARY KEY CLUSTERED 
(
	[MapaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  View [dbo].[MapaView]    Script Date: 05/04/2010 18:25:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[MapaView]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[MapaView]
AS
SELECT        MapaId, NoticiaId, Morada, CAST(Mapa AS VARBINARY(MAX)) AS Mapa
FROM            dbo.Mapa
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'MapaView', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[39] 4[31] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Mapa"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MapaView'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'MapaView', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MapaView'
GO
/****** Object:  Default [DF_Administrador_AdministradorId]    Script Date: 05/04/2010 18:25:02 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Administrador_AdministradorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Administrador]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Administrador_AdministradorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Administrador] ADD  CONSTRAINT [DF_Administrador_AdministradorId]  DEFAULT (newid()) FOR [AdministradorId]
END


End
GO
/****** Object:  Default [DF_Banido_BanidoId]    Script Date: 05/04/2010 18:25:02 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Banido_BanidoId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Banido_BanidoId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Banido] ADD  CONSTRAINT [DF_Banido_BanidoId]  DEFAULT (newid()) FOR [BanidoId]
END


End
GO
/****** Object:  Default [DF_Banido_JornalistaId]    Script Date: 05/04/2010 18:25:02 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Banido_JornalistaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Banido_JornalistaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Banido] ADD  CONSTRAINT [DF_Banido_JornalistaId]  DEFAULT (newid()) FOR [JornalistaId]
END


End
GO
/****** Object:  Default [DF_Comentario_ComentarioId]    Script Date: 05/04/2010 18:25:02 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Comentario_ComentarioId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Comentario_ComentarioId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Comentario] ADD  CONSTRAINT [DF_Comentario_ComentarioId]  DEFAULT (newid()) FOR [ComentarioId]
END


End
GO
/****** Object:  Default [DF_Imagem_ImagemId]    Script Date: 05/04/2010 18:25:02 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Imagem_ImagemId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Imagem]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Imagem_ImagemId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Imagem] ADD  CONSTRAINT [DF_Imagem_ImagemId]  DEFAULT (newid()) FOR [ImagemId]
END


End
GO
/****** Object:  Default [DF_Jornalista_JornalistaId]    Script Date: 05/04/2010 18:25:02 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Jornalista_JornalistaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Jornalista]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Jornalista_JornalistaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Jornalista] ADD  CONSTRAINT [DF_Jornalista_JornalistaId]  DEFAULT (newid()) FOR [JornalistaId]
END


End
GO
/****** Object:  Default [DF_Mapa_MapaId]    Script Date: 05/04/2010 18:25:02 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Mapa_MapaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mapa]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Mapa_MapaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Mapa] ADD  CONSTRAINT [DF_Mapa_MapaId]  DEFAULT (newid()) FOR [MapaId]
END


End
GO
/****** Object:  Default [DF_Moderador_ModeradorId]    Script Date: 05/04/2010 18:25:02 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Moderador_ModeradorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Moderador]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Moderador_ModeradorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Moderador] ADD  CONSTRAINT [DF_Moderador_ModeradorId]  DEFAULT (newid()) FOR [ModeradorId]
END


End
GO
/****** Object:  Default [DF_Noticia_NoticiaId]    Script Date: 05/04/2010 18:25:02 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Noticia_NoticiaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Noticia_NoticiaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Noticia] ADD  CONSTRAINT [DF_Noticia_NoticiaId]  DEFAULT (newid()) FOR [NoticiaId]
END


End
GO
/****** Object:  Default [DF_NoticiaFlagged_NoticiaId]    Script Date: 05/04/2010 18:25:03 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_NoticiaFlagged_NoticiaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_NoticiaFlagged_NoticiaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NoticiaFlagged] ADD  CONSTRAINT [DF_NoticiaFlagged_NoticiaId]  DEFAULT (newid()) FOR [NoticiaId]
END


End
GO
/****** Object:  Default [DF_Queixas_QueixaId]    Script Date: 05/04/2010 18:25:03 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Queixas_QueixaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Queixas]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Queixas_QueixaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Queixas] ADD  CONSTRAINT [DF_Queixas_QueixaId]  DEFAULT (newid()) FOR [QueixaId]
END


End
GO
/****** Object:  Default [DF_Sessao_SessaoId]    Script Date: 05/04/2010 18:25:03 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sessao_SessaoId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sessao]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Sessao_SessaoId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sessao] ADD  CONSTRAINT [DF_Sessao_SessaoId]  DEFAULT (newid()) FOR [SessaoId]
END


End
GO
/****** Object:  Default [DF_Video_VideoId]    Script Date: 05/04/2010 18:25:03 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Video_VideoId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Video]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Video_VideoId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Video] ADD  CONSTRAINT [DF_Video_VideoId]  DEFAULT (newid()) FOR [VideoId]
END


End
GO
/****** Object:  ForeignKey [FK_Administrador_Jornalista]    Script Date: 05/04/2010 18:25:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Administrador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Administrador]'))
ALTER TABLE [dbo].[Administrador]  WITH CHECK ADD  CONSTRAINT [FK_Administrador_Jornalista] FOREIGN KEY([AdministradorId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Administrador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Administrador]'))
ALTER TABLE [dbo].[Administrador] CHECK CONSTRAINT [FK_Administrador_Jornalista]
GO
/****** Object:  ForeignKey [FK_Banido_Jornalista]    Script Date: 05/04/2010 18:25:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Banido_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
ALTER TABLE [dbo].[Banido]  WITH CHECK ADD  CONSTRAINT [FK_Banido_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Banido_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
ALTER TABLE [dbo].[Banido] CHECK CONSTRAINT [FK_Banido_Jornalista]
GO
/****** Object:  ForeignKey [FK_Comentario_Jornalista]    Script Date: 05/04/2010 18:25:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Jornalista]
GO
/****** Object:  ForeignKey [FK_Comentario_Noticia]    Script Date: 05/04/2010 18:25:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Noticia] FOREIGN KEY([NoticiaId])
REFERENCES [dbo].[Noticia] ([NoticiaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Noticia]
GO
/****** Object:  ForeignKey [FK_Imagem_Noticia]    Script Date: 05/04/2010 18:25:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Imagem_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Imagem]'))
ALTER TABLE [dbo].[Imagem]  WITH CHECK ADD  CONSTRAINT [FK_Imagem_Noticia] FOREIGN KEY([NoticiaId])
REFERENCES [dbo].[Noticia] ([NoticiaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Imagem_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Imagem]'))
ALTER TABLE [dbo].[Imagem] CHECK CONSTRAINT [FK_Imagem_Noticia]
GO
/****** Object:  ForeignKey [FK_Mapa_Noticia]    Script Date: 05/04/2010 18:25:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Mapa_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mapa]'))
ALTER TABLE [dbo].[Mapa]  WITH CHECK ADD  CONSTRAINT [FK_Mapa_Noticia] FOREIGN KEY([NoticiaId])
REFERENCES [dbo].[Noticia] ([NoticiaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Mapa_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mapa]'))
ALTER TABLE [dbo].[Mapa] CHECK CONSTRAINT [FK_Mapa_Noticia]
GO
/****** Object:  ForeignKey [FK_Moderador_Jornalista]    Script Date: 05/04/2010 18:25:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Moderador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Moderador]'))
ALTER TABLE [dbo].[Moderador]  WITH CHECK ADD  CONSTRAINT [FK_Moderador_Jornalista] FOREIGN KEY([ModeradorId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Moderador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Moderador]'))
ALTER TABLE [dbo].[Moderador] CHECK CONSTRAINT [FK_Moderador_Jornalista]
GO
/****** Object:  ForeignKey [FK_Noticia_Jornalista]    Script Date: 05/04/2010 18:25:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Noticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
ALTER TABLE [dbo].[Noticia]  WITH CHECK ADD  CONSTRAINT [FK_Noticia_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Noticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
ALTER TABLE [dbo].[Noticia] CHECK CONSTRAINT [FK_Noticia_Jornalista]
GO
/****** Object:  ForeignKey [FK_Queixas_Jornalista]    Script Date: 05/04/2010 18:25:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Queixas_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Queixas]'))
ALTER TABLE [dbo].[Queixas]  WITH CHECK ADD  CONSTRAINT [FK_Queixas_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Queixas_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Queixas]'))
ALTER TABLE [dbo].[Queixas] CHECK CONSTRAINT [FK_Queixas_Jornalista]
GO
/****** Object:  ForeignKey [FK_Sessao_Jornalista]    Script Date: 05/04/2010 18:25:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sessao_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sessao]'))
ALTER TABLE [dbo].[Sessao]  WITH CHECK ADD  CONSTRAINT [FK_Sessao_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sessao_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sessao]'))
ALTER TABLE [dbo].[Sessao] CHECK CONSTRAINT [FK_Sessao_Jornalista]
GO
/****** Object:  ForeignKey [FK_Video_Noticia]    Script Date: 05/04/2010 18:25:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Video_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Video]'))
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_Video_Noticia] FOREIGN KEY([NoticiaId])
REFERENCES [dbo].[Noticia] ([NoticiaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Video_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Video]'))
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_Video_Noticia]
GO
/****** Object:  ForeignKey [FK_VotoNoticia_Jornalista]    Script Date: 05/04/2010 18:25:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia]  WITH CHECK ADD  CONSTRAINT [FK_VotoNoticia_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia] CHECK CONSTRAINT [FK_VotoNoticia_Jornalista]
GO
/****** Object:  ForeignKey [FK_VotoNoticia_Noticia]    Script Date: 05/04/2010 18:25:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia]  WITH CHECK ADD  CONSTRAINT [FK_VotoNoticia_Noticia] FOREIGN KEY([NoticiaId])
REFERENCES [dbo].[Noticia] ([NoticiaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia] CHECK CONSTRAINT [FK_VotoNoticia_Noticia]
GO
