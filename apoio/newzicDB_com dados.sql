/****** Object:  ForeignKey [FK_Administrador_Jornalista]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Administrador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Administrador]'))
ALTER TABLE [dbo].[Administrador] DROP CONSTRAINT [FK_Administrador_Jornalista]
GO
/****** Object:  ForeignKey [FK_Banido_Jornalista]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Banido_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
ALTER TABLE [dbo].[Banido] DROP CONSTRAINT [FK_Banido_Jornalista]
GO
/****** Object:  ForeignKey [FK_Comentario_Jornalista]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario] DROP CONSTRAINT [FK_Comentario_Jornalista]
GO
/****** Object:  ForeignKey [FK_Comentario_Noticia]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario] DROP CONSTRAINT [FK_Comentario_Noticia]
GO
/****** Object:  ForeignKey [FK_Imagem_Noticia]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Imagem_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Imagem]'))
ALTER TABLE [dbo].[Imagem] DROP CONSTRAINT [FK_Imagem_Noticia]
GO
/****** Object:  ForeignKey [FK_Moderador_Jornalista]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Moderador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Moderador]'))
ALTER TABLE [dbo].[Moderador] DROP CONSTRAINT [FK_Moderador_Jornalista]
GO
/****** Object:  ForeignKey [FK_Noticia_Jornalista]    Script Date: 05/25/2010 19:38:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Noticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
ALTER TABLE [dbo].[Noticia] DROP CONSTRAINT [FK_Noticia_Jornalista]
GO
/****** Object:  ForeignKey [FK_Noticia_Mapa]    Script Date: 05/25/2010 19:38:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Noticia_Mapa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
ALTER TABLE [dbo].[Noticia] DROP CONSTRAINT [FK_Noticia_Mapa]
GO
/****** Object:  ForeignKey [FK_NoticiaFlagged_Noticia]    Script Date: 05/25/2010 19:38:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NoticiaFlagged_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]'))
ALTER TABLE [dbo].[NoticiaFlagged] DROP CONSTRAINT [FK_NoticiaFlagged_Noticia]
GO
/****** Object:  ForeignKey [FK_Queixas_Jornalista]    Script Date: 05/25/2010 19:38:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Queixas_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Queixa]'))
ALTER TABLE [dbo].[Queixa] DROP CONSTRAINT [FK_Queixas_Jornalista]
GO
/****** Object:  ForeignKey [FK_Sessao_Jornalista]    Script Date: 05/25/2010 19:38:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sessao_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sessao]'))
ALTER TABLE [dbo].[Sessao] DROP CONSTRAINT [FK_Sessao_Jornalista]
GO
/****** Object:  ForeignKey [FK_Video_Noticia]    Script Date: 05/25/2010 19:38:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Video_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Video]'))
ALTER TABLE [dbo].[Video] DROP CONSTRAINT [FK_Video_Noticia]
GO
/****** Object:  ForeignKey [FK_VotoNoticia_Jornalista]    Script Date: 05/25/2010 19:38:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia] DROP CONSTRAINT [FK_VotoNoticia_Jornalista]
GO
/****** Object:  ForeignKey [FK_VotoNoticia_Noticia]    Script Date: 05/25/2010 19:38:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia] DROP CONSTRAINT [FK_VotoNoticia_Noticia]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comentario]') AND type in (N'U'))
DROP TABLE [dbo].[Comentario]
GO
/****** Object:  Table [dbo].[Imagem]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Imagem]') AND type in (N'U'))
DROP TABLE [dbo].[Imagem]
GO
/****** Object:  Table [dbo].[NoticiaFlagged]    Script Date: 05/25/2010 19:38:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]') AND type in (N'U'))
DROP TABLE [dbo].[NoticiaFlagged]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 05/25/2010 19:38:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Video]') AND type in (N'U'))
DROP TABLE [dbo].[Video]
GO
/****** Object:  Table [dbo].[VotoNoticia]    Script Date: 05/25/2010 19:38:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VotoNoticia]') AND type in (N'U'))
DROP TABLE [dbo].[VotoNoticia]
GO
/****** Object:  Table [dbo].[Queixa]    Script Date: 05/25/2010 19:38:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Queixa]') AND type in (N'U'))
DROP TABLE [dbo].[Queixa]
GO
/****** Object:  Table [dbo].[Sessao]    Script Date: 05/25/2010 19:38:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sessao]') AND type in (N'U'))
DROP TABLE [dbo].[Sessao]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Administrador]') AND type in (N'U'))
DROP TABLE [dbo].[Administrador]
GO
/****** Object:  Table [dbo].[Banido]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Banido]') AND type in (N'U'))
DROP TABLE [dbo].[Banido]
GO
/****** Object:  Table [dbo].[Moderador]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Moderador]') AND type in (N'U'))
DROP TABLE [dbo].[Moderador]
GO
/****** Object:  Table [dbo].[Noticia]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia]') AND type in (N'U'))
DROP TABLE [dbo].[Noticia]
GO
/****** Object:  Table [dbo].[Jornalista]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Jornalista]') AND type in (N'U'))
DROP TABLE [dbo].[Jornalista]
GO
/****** Object:  Table [dbo].[Mapa]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mapa]') AND type in (N'U'))
DROP TABLE [dbo].[Mapa]
GO
/****** Object:  Default [DF_Administrador_AdministradorId]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Administrador_AdministradorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Administrador]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Administrador_AdministradorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Administrador] DROP CONSTRAINT [DF_Administrador_AdministradorId]
END


End
GO
/****** Object:  Default [DF_Banido_BanidoId]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Banido_BanidoId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Banido_BanidoId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Banido] DROP CONSTRAINT [DF_Banido_BanidoId]
END


End
GO
/****** Object:  Default [DF_Banido_JornalistaId]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Banido_JornalistaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Banido_JornalistaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Banido] DROP CONSTRAINT [DF_Banido_JornalistaId]
END


End
GO
/****** Object:  Default [DF_Comentario_ComentarioId]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Comentario_ComentarioId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Comentario_ComentarioId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Comentario] DROP CONSTRAINT [DF_Comentario_ComentarioId]
END


End
GO
/****** Object:  Default [DF_Imagem_ImagemId]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Imagem_ImagemId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Imagem]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Imagem_ImagemId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Imagem] DROP CONSTRAINT [DF_Imagem_ImagemId]
END


End
GO
/****** Object:  Default [DF_Jornalista_JornalistaId]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Jornalista_JornalistaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Jornalista]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Jornalista_JornalistaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Jornalista] DROP CONSTRAINT [DF_Jornalista_JornalistaId]
END


End
GO
/****** Object:  Default [DF_Mapa_MapaId]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Mapa_MapaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mapa]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Mapa_MapaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Mapa] DROP CONSTRAINT [DF_Mapa_MapaId]
END


End
GO
/****** Object:  Default [DF_Moderador_ModeradorId]    Script Date: 05/25/2010 19:38:34 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Moderador_ModeradorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Moderador]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Moderador_ModeradorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Moderador] DROP CONSTRAINT [DF_Moderador_ModeradorId]
END


End
GO
/****** Object:  Default [DF_Noticia_NoticiaId]    Script Date: 05/25/2010 19:38:35 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Noticia_NoticiaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Noticia_NoticiaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Noticia] DROP CONSTRAINT [DF_Noticia_NoticiaId]
END


End
GO
/****** Object:  Default [DF_NoticiaFlagged_NoticiaId]    Script Date: 05/25/2010 19:38:35 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_NoticiaFlagged_NoticiaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_NoticiaFlagged_NoticiaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NoticiaFlagged] DROP CONSTRAINT [DF_NoticiaFlagged_NoticiaId]
END


End
GO
/****** Object:  Default [DF_Queixas_QueixaId]    Script Date: 05/25/2010 19:38:35 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Queixas_QueixaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Queixa]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Queixas_QueixaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Queixa] DROP CONSTRAINT [DF_Queixas_QueixaId]
END


End
GO
/****** Object:  Default [DF_Video_VideoId]    Script Date: 05/25/2010 19:38:35 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Video_VideoId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Video]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Video_VideoId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Video] DROP CONSTRAINT [DF_Video_VideoId]
END


End
GO
/****** Object:  Table [dbo].[Mapa]    Script Date: 05/25/2010 19:38:34 ******/
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
	[Latitude] [float] NOT NULL,
 CONSTRAINT [PK_Mapa] PRIMARY KEY CLUSTERED 
(
	[MapaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[Mapa] ([MapaId], [NoticiaId], [Morada], [Longitude], [Latitude]) VALUES (N'be83e7e0-415d-40e2-b2ff-feed3cb2addc', N'b57d7ed6-269c-471d-8262-4d67c7c37d27', N'rua nº1, 1º dir', 10, 20)
/****** Object:  Table [dbo].[Jornalista]    Script Date: 05/25/2010 19:38:34 ******/
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
INSERT [dbo].[Jornalista] ([Nome], [Email], [Password], [JornalistaId]) VALUES (N'Tiago Veloso', N'tiago.veloso@newzic.pt', N'tv', N'9ecf1673-a461-4875-a162-139687f109f6')
INSERT [dbo].[Jornalista] ([Nome], [Email], [Password], [JornalistaId]) VALUES (N'Martinho Fernandes', N'martinho.fernandes@newzic.pt', N'mf', N'70c444d7-49c6-40b0-a878-2acbf6465523')
INSERT [dbo].[Jornalista] ([Nome], [Email], [Password], [JornalistaId]) VALUES (N'Christophe Gonçalves                                            ', N'christophe.goncalves@newzic.pt', N'cg', N'81379be9-98d4-44bb-8cfa-33a0e6bfdc1f')
INSERT [dbo].[Jornalista] ([Nome], [Email], [Password], [JornalistaId]) VALUES (N'Luis Couto', N'luis.couto@newzic.pt', N'lc', N'eb6c4f11-cf43-40bb-85ec-33d6619a72c6')
INSERT [dbo].[Jornalista] ([Nome], [Email], [Password], [JornalistaId]) VALUES (N'Bruno Amorim', N'bruno.amorim@newzic.pt', N'ba', N'ae9ca1a8-ec9d-4c9a-b208-5977f9a76e99')
INSERT [dbo].[Jornalista] ([Nome], [Email], [Password], [JornalistaId]) VALUES (N'Ricardo Alves', N'ricardo.alves@newzic.pt', N'ra', N'fe30fc06-cbf1-46de-b7bd-71ef2fc5b6a0')
INSERT [dbo].[Jornalista] ([Nome], [Email], [Password], [JornalistaId]) VALUES (N'Vitor Gonçalves', N'vitor.goncalves@newzic.pt', N'vg', N'24fb044d-5365-43c0-b6d4-7f565f2f86b9')
INSERT [dbo].[Jornalista] ([Nome], [Email], [Password], [JornalistaId]) VALUES (N'Andre Carvalho', N'andre.carvalho@newzic.pt', N'ac', N'40d21727-a7a5-4187-b779-84ef248ad950')
INSERT [dbo].[Jornalista] ([Nome], [Email], [Password], [JornalistaId]) VALUES (N'Joana Gomes', N'joana.gomes@newzic.pt', N'jg', N'59788306-d854-4434-b9cd-8aa3a7de9052')
INSERT [dbo].[Jornalista] ([Nome], [Email], [Password], [JornalistaId]) VALUES (N'Armando Brito ', N'armando.brito@newzic.pt', N'ab', N'0e24cd99-274c-44ca-a4c1-b6735ad01d09')
/****** Object:  Table [dbo].[Noticia]    Script Date: 05/25/2010 19:38:34 ******/
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
INSERT [dbo].[Noticia] ([NoticiaId], [Titulo], [Corpo], [Pontuacao], [Data], [FlagCount], [Deleted], [Marked], [JornalistaId], [Tags], [MapaId]) VALUES (N'f8cdb59d-ef33-4dbe-b6ec-1ca052463673', N'Lady Gaga proíbe os seus dançarinos de fazerem sexo', N'A cantora nova-iorquina leva as suas medidas proibicionistas ao extremo. Diz que quem com ela partilha o palco não "presta atenção suficiente" aos concertos.', 5, CAST(0x00009D7F00DE7920 AS DateTime), 1, 1, 1, N'ae9ca1a8-ec9d-4c9a-b208-5977f9a76e99', N'titulo1 musica newzic', N'be83e7e0-415d-40e2-b2ff-feed3cb2addc')
INSERT [dbo].[Noticia] ([NoticiaId], [Titulo], [Corpo], [Pontuacao], [Data], [FlagCount], [Deleted], [Marked], [JornalistaId], [Tags], [MapaId]) VALUES (N'81379be9-98d4-44bb-8cfa-33a0e6bfdc1f', N'Titulo 4', N'Corpo da notícia', -5, CAST(0x00009E1501297470 AS DateTime), 1, 1, 0, N'40d21727-a7a5-4187-b779-84ef248ad950', N'titulo4 musica newzic', NULL)
INSERT [dbo].[Noticia] ([NoticiaId], [Titulo], [Corpo], [Pontuacao], [Data], [FlagCount], [Deleted], [Marked], [JornalistaId], [Tags], [MapaId]) VALUES (N'8bf067eb-6b6d-4f9d-b384-4981f419db30', N'Titulo 5', N'Corpo da notícia 5', 3, CAST(0x00009F1C00000000 AS DateTime), 0, 1, 0, N'40d21727-a7a5-4187-b779-84ef248ad950', N'titulo5 assunto5 musica', NULL)
INSERT [dbo].[Noticia] ([NoticiaId], [Titulo], [Corpo], [Pontuacao], [Data], [FlagCount], [Deleted], [Marked], [JornalistaId], [Tags], [MapaId]) VALUES (N'b57d7ed6-269c-471d-8262-4d67c7c37d27', N'Sintonize as suas noticias com o Newzic', N'Falar do Newzic', 0, CAST(0x00009D6C011AE5E0 AS DateTime), 0, 0, 0, N'81379be9-98d4-44bb-8cfa-33a0e6bfdc1f', N'musica newzic noticias', NULL)
INSERT [dbo].[Noticia] ([NoticiaId], [Titulo], [Corpo], [Pontuacao], [Data], [FlagCount], [Deleted], [Marked], [JornalistaId], [Tags], [MapaId]) VALUES (N'02e41ae4-3ec2-4a71-946b-61069320b877', N'Titulo 2 ', N'Corpo da notícia 2', 8, CAST(0x00009AC000E6B680 AS DateTime), 0, 0, 0, N'fe30fc06-cbf1-46de-b7bd-71ef2fc5b6a0', N'titulo2 musica', NULL)
INSERT [dbo].[Noticia] ([NoticiaId], [Titulo], [Corpo], [Pontuacao], [Data], [FlagCount], [Deleted], [Marked], [JornalistaId], [Tags], [MapaId]) VALUES (N'ea82d589-0c97-4070-8189-91f1dcee731c', N'Titulo 3 ', N'Corpo da notícia 3', -2, CAST(0x00009B8C00000000 AS DateTime), 0, 0, 1, N'fe30fc06-cbf1-46de-b7bd-71ef2fc5b6a0', N'assunto2 musica', NULL)
/****** Object:  Table [dbo].[Moderador]    Script Date: 05/25/2010 19:38:34 ******/
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
INSERT [dbo].[Moderador] ([ModeradorId]) VALUES (N'81379be9-98d4-44bb-8cfa-33a0e6bfdc1f')
INSERT [dbo].[Moderador] ([ModeradorId]) VALUES (N'ae9ca1a8-ec9d-4c9a-b208-5977f9a76e99')
/****** Object:  Table [dbo].[Banido]    Script Date: 05/25/2010 19:38:34 ******/
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
INSERT [dbo].[Banido] ([BanidoId], [JornalistaId], [DataFim], [Permanente]) VALUES (N'e4bed197-2110-4033-be18-8ae081d256b8', N'ae9ca1a8-ec9d-4c9a-b208-5977f9a76e99', CAST(0x00009E51015FE334 AS DateTime), 0)
/****** Object:  Table [dbo].[Administrador]    Script Date: 05/25/2010 19:38:34 ******/
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
INSERT [dbo].[Administrador] ([AdministradorId]) VALUES (N'81379be9-98d4-44bb-8cfa-33a0e6bfdc1f')
INSERT [dbo].[Administrador] ([AdministradorId]) VALUES (N'24fb044d-5365-43c0-b6d4-7f565f2f86b9')
/****** Object:  Table [dbo].[Sessao]    Script Date: 05/25/2010 19:38:35 ******/
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
INSERT [dbo].[Sessao] ([Token], [Timestamp], [JornalistaId]) VALUES (N'1', CAST(0x00009D2200CF3BF4 AS DateTime), N'81379be9-98d4-44bb-8cfa-33a0e6bfdc1f')
/****** Object:  Table [dbo].[Queixa]    Script Date: 05/25/2010 19:38:35 ******/
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
INSERT [dbo].[Queixa] ([QueixaId], [JornalistaId], [AcusadoId], [Texto], [Resolved], [Assunto]) VALUES (N'67d626be-f546-4c97-a1e6-f6693d126612', N'81379be9-98d4-44bb-8cfa-33a0e6bfdc1f', N'7222e060-0f81-4299-9d5d-4d00140af351', N'texto da queixa', 1, N'queixa queixa queixa')
/****** Object:  Table [dbo].[VotoNoticia]    Script Date: 05/25/2010 19:38:35 ******/
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
INSERT [dbo].[VotoNoticia] ([NoticiaId], [JornalistaId]) VALUES (N'b57d7ed6-269c-471d-8262-4d67c7c37d27', N'81379be9-98d4-44bb-8cfa-33a0e6bfdc1f')
/****** Object:  Table [dbo].[Video]    Script Date: 05/25/2010 19:38:35 ******/
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
INSERT [dbo].[Video] ([VideoId], [NoticiaId], [Url]) VALUES (N'ef28c875-6280-41de-a77d-b9060c890fb1', N'b57d7ed6-269c-471d-8262-4d67c7c37d27', N'video1    ')
/****** Object:  Table [dbo].[NoticiaFlagged]    Script Date: 05/25/2010 19:38:35 ******/
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
INSERT [dbo].[NoticiaFlagged] ([NoticiaId], [Data]) VALUES (N'b57d7ed6-269c-471d-8262-4d67c7c37d27', CAST(0x00009D8B011AE5E0 AS DateTime))
/****** Object:  Table [dbo].[Imagem]    Script Date: 05/25/2010 19:38:34 ******/
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
	[Tipo] [varchar](20) COLLATE Latin1_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Imagem] PRIMARY KEY CLUSTERED 
(
	[ImagemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 05/25/2010 19:38:34 ******/
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
INSERT [dbo].[Comentario] ([ComentarioId], [Texto], [NoticiaId], [JornalistaId]) VALUES (N'09c2ce23-85e4-4ae3-a7ba-f6c003326930', N'comentario 1', N'b57d7ed6-269c-471d-8262-4d67c7c37d27', N'24fb044d-5365-43c0-b6d4-7f565f2f86b9')
/****** Object:  Default [DF_Administrador_AdministradorId]    Script Date: 05/25/2010 19:38:34 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Administrador_AdministradorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Administrador]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Administrador_AdministradorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Administrador] ADD  CONSTRAINT [DF_Administrador_AdministradorId]  DEFAULT (newid()) FOR [AdministradorId]
END


End
GO
/****** Object:  Default [DF_Banido_BanidoId]    Script Date: 05/25/2010 19:38:34 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Banido_BanidoId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Banido_BanidoId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Banido] ADD  CONSTRAINT [DF_Banido_BanidoId]  DEFAULT (newid()) FOR [BanidoId]
END


End
GO
/****** Object:  Default [DF_Banido_JornalistaId]    Script Date: 05/25/2010 19:38:34 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Banido_JornalistaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Banido_JornalistaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Banido] ADD  CONSTRAINT [DF_Banido_JornalistaId]  DEFAULT (newid()) FOR [JornalistaId]
END


End
GO
/****** Object:  Default [DF_Comentario_ComentarioId]    Script Date: 05/25/2010 19:38:34 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Comentario_ComentarioId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Comentario_ComentarioId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Comentario] ADD  CONSTRAINT [DF_Comentario_ComentarioId]  DEFAULT (newid()) FOR [ComentarioId]
END


End
GO
/****** Object:  Default [DF_Imagem_ImagemId]    Script Date: 05/25/2010 19:38:34 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Imagem_ImagemId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Imagem]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Imagem_ImagemId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Imagem] ADD  CONSTRAINT [DF_Imagem_ImagemId]  DEFAULT (newid()) FOR [ImagemId]
END


End
GO
/****** Object:  Default [DF_Jornalista_JornalistaId]    Script Date: 05/25/2010 19:38:34 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Jornalista_JornalistaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Jornalista]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Jornalista_JornalistaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Jornalista] ADD  CONSTRAINT [DF_Jornalista_JornalistaId]  DEFAULT (newid()) FOR [JornalistaId]
END


End
GO
/****** Object:  Default [DF_Mapa_MapaId]    Script Date: 05/25/2010 19:38:34 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Mapa_MapaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mapa]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Mapa_MapaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Mapa] ADD  CONSTRAINT [DF_Mapa_MapaId]  DEFAULT (newid()) FOR [MapaId]
END


End
GO
/****** Object:  Default [DF_Moderador_ModeradorId]    Script Date: 05/25/2010 19:38:34 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Moderador_ModeradorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Moderador]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Moderador_ModeradorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Moderador] ADD  CONSTRAINT [DF_Moderador_ModeradorId]  DEFAULT (newid()) FOR [ModeradorId]
END


End
GO
/****** Object:  Default [DF_Noticia_NoticiaId]    Script Date: 05/25/2010 19:38:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Noticia_NoticiaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Noticia_NoticiaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Noticia] ADD  CONSTRAINT [DF_Noticia_NoticiaId]  DEFAULT (newid()) FOR [NoticiaId]
END


End
GO
/****** Object:  Default [DF_NoticiaFlagged_NoticiaId]    Script Date: 05/25/2010 19:38:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_NoticiaFlagged_NoticiaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_NoticiaFlagged_NoticiaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NoticiaFlagged] ADD  CONSTRAINT [DF_NoticiaFlagged_NoticiaId]  DEFAULT (newid()) FOR [NoticiaId]
END


End
GO
/****** Object:  Default [DF_Queixas_QueixaId]    Script Date: 05/25/2010 19:38:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Queixas_QueixaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Queixa]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Queixas_QueixaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Queixa] ADD  CONSTRAINT [DF_Queixas_QueixaId]  DEFAULT (newid()) FOR [QueixaId]
END


End
GO
/****** Object:  Default [DF_Video_VideoId]    Script Date: 05/25/2010 19:38:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Video_VideoId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Video]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Video_VideoId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Video] ADD  CONSTRAINT [DF_Video_VideoId]  DEFAULT (newid()) FOR [VideoId]
END


End
GO
/****** Object:  ForeignKey [FK_Administrador_Jornalista]    Script Date: 05/25/2010 19:38:34 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Administrador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Administrador]'))
ALTER TABLE [dbo].[Administrador]  WITH CHECK ADD  CONSTRAINT [FK_Administrador_Jornalista] FOREIGN KEY([AdministradorId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Administrador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Administrador]'))
ALTER TABLE [dbo].[Administrador] CHECK CONSTRAINT [FK_Administrador_Jornalista]
GO
/****** Object:  ForeignKey [FK_Banido_Jornalista]    Script Date: 05/25/2010 19:38:34 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Banido_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
ALTER TABLE [dbo].[Banido]  WITH CHECK ADD  CONSTRAINT [FK_Banido_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Banido_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
ALTER TABLE [dbo].[Banido] CHECK CONSTRAINT [FK_Banido_Jornalista]
GO
/****** Object:  ForeignKey [FK_Comentario_Jornalista]    Script Date: 05/25/2010 19:38:34 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Jornalista]
GO
/****** Object:  ForeignKey [FK_Comentario_Noticia]    Script Date: 05/25/2010 19:38:34 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Noticia] FOREIGN KEY([NoticiaId])
REFERENCES [dbo].[Noticia] ([NoticiaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Noticia]
GO
/****** Object:  ForeignKey [FK_Imagem_Noticia]    Script Date: 05/25/2010 19:38:34 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Imagem_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Imagem]'))
ALTER TABLE [dbo].[Imagem]  WITH CHECK ADD  CONSTRAINT [FK_Imagem_Noticia] FOREIGN KEY([NoticiaId])
REFERENCES [dbo].[Noticia] ([NoticiaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Imagem_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Imagem]'))
ALTER TABLE [dbo].[Imagem] CHECK CONSTRAINT [FK_Imagem_Noticia]
GO
/****** Object:  ForeignKey [FK_Moderador_Jornalista]    Script Date: 05/25/2010 19:38:34 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Moderador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Moderador]'))
ALTER TABLE [dbo].[Moderador]  WITH CHECK ADD  CONSTRAINT [FK_Moderador_Jornalista] FOREIGN KEY([ModeradorId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Moderador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Moderador]'))
ALTER TABLE [dbo].[Moderador] CHECK CONSTRAINT [FK_Moderador_Jornalista]
GO
/****** Object:  ForeignKey [FK_Noticia_Jornalista]    Script Date: 05/25/2010 19:38:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Noticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
ALTER TABLE [dbo].[Noticia]  WITH CHECK ADD  CONSTRAINT [FK_Noticia_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Noticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
ALTER TABLE [dbo].[Noticia] CHECK CONSTRAINT [FK_Noticia_Jornalista]
GO
/****** Object:  ForeignKey [FK_Noticia_Mapa]    Script Date: 05/25/2010 19:38:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Noticia_Mapa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
ALTER TABLE [dbo].[Noticia]  WITH CHECK ADD  CONSTRAINT [FK_Noticia_Mapa] FOREIGN KEY([MapaId])
REFERENCES [dbo].[Mapa] ([MapaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Noticia_Mapa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
ALTER TABLE [dbo].[Noticia] CHECK CONSTRAINT [FK_Noticia_Mapa]
GO
/****** Object:  ForeignKey [FK_NoticiaFlagged_Noticia]    Script Date: 05/25/2010 19:38:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NoticiaFlagged_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]'))
ALTER TABLE [dbo].[NoticiaFlagged]  WITH CHECK ADD  CONSTRAINT [FK_NoticiaFlagged_Noticia] FOREIGN KEY([NoticiaId])
REFERENCES [dbo].[Noticia] ([NoticiaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NoticiaFlagged_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]'))
ALTER TABLE [dbo].[NoticiaFlagged] CHECK CONSTRAINT [FK_NoticiaFlagged_Noticia]
GO
/****** Object:  ForeignKey [FK_Queixas_Jornalista]    Script Date: 05/25/2010 19:38:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Queixas_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Queixa]'))
ALTER TABLE [dbo].[Queixa]  WITH CHECK ADD  CONSTRAINT [FK_Queixas_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Queixas_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Queixa]'))
ALTER TABLE [dbo].[Queixa] CHECK CONSTRAINT [FK_Queixas_Jornalista]
GO
/****** Object:  ForeignKey [FK_Sessao_Jornalista]    Script Date: 05/25/2010 19:38:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sessao_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sessao]'))
ALTER TABLE [dbo].[Sessao]  WITH CHECK ADD  CONSTRAINT [FK_Sessao_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sessao_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sessao]'))
ALTER TABLE [dbo].[Sessao] CHECK CONSTRAINT [FK_Sessao_Jornalista]
GO
/****** Object:  ForeignKey [FK_Video_Noticia]    Script Date: 05/25/2010 19:38:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Video_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Video]'))
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_Video_Noticia] FOREIGN KEY([NoticiaId])
REFERENCES [dbo].[Noticia] ([NoticiaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Video_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Video]'))
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_Video_Noticia]
GO
/****** Object:  ForeignKey [FK_VotoNoticia_Jornalista]    Script Date: 05/25/2010 19:38:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia]  WITH CHECK ADD  CONSTRAINT [FK_VotoNoticia_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia] CHECK CONSTRAINT [FK_VotoNoticia_Jornalista]
GO
/****** Object:  ForeignKey [FK_VotoNoticia_Noticia]    Script Date: 05/25/2010 19:38:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia]  WITH CHECK ADD  CONSTRAINT [FK_VotoNoticia_Noticia] FOREIGN KEY([NoticiaId])
REFERENCES [dbo].[Noticia] ([NoticiaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia] CHECK CONSTRAINT [FK_VotoNoticia_Noticia]
GO
