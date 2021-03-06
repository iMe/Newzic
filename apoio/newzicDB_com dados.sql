/****** Object:  ForeignKey [FK_Administrador_Jornalista]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Administrador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Administrador]'))
ALTER TABLE [dbo].[Administrador] DROP CONSTRAINT [FK_Administrador_Jornalista]
GO
/****** Object:  ForeignKey [FK_Banido_Jornalista]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Banido_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
ALTER TABLE [dbo].[Banido] DROP CONSTRAINT [FK_Banido_Jornalista]
GO
/****** Object:  ForeignKey [FK_Comentario_Jornalista]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario] DROP CONSTRAINT [FK_Comentario_Jornalista]
GO
/****** Object:  ForeignKey [FK_Comentario_Noticia]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario] DROP CONSTRAINT [FK_Comentario_Noticia]
GO
/****** Object:  ForeignKey [FK_Imagem_Noticia]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Imagem_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Imagem]'))
ALTER TABLE [dbo].[Imagem] DROP CONSTRAINT [FK_Imagem_Noticia]
GO
/****** Object:  ForeignKey [FK_Moderador_Jornalista]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Moderador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Moderador]'))
ALTER TABLE [dbo].[Moderador] DROP CONSTRAINT [FK_Moderador_Jornalista]
GO
/****** Object:  ForeignKey [FK_Noticia_Jornalista]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Noticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
ALTER TABLE [dbo].[Noticia] DROP CONSTRAINT [FK_Noticia_Jornalista]
GO
/****** Object:  ForeignKey [FK_Noticia_Mapa]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Noticia_Mapa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
ALTER TABLE [dbo].[Noticia] DROP CONSTRAINT [FK_Noticia_Mapa]
GO
/****** Object:  ForeignKey [FK_NoticiaFlagged_Noticia]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NoticiaFlagged_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]'))
ALTER TABLE [dbo].[NoticiaFlagged] DROP CONSTRAINT [FK_NoticiaFlagged_Noticia]
GO
/****** Object:  ForeignKey [FK_Queixas_Jornalista]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Queixas_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Queixa]'))
ALTER TABLE [dbo].[Queixa] DROP CONSTRAINT [FK_Queixas_Jornalista]
GO
/****** Object:  ForeignKey [FK_Sessao_Jornalista]    Script Date: 05/26/2010 01:13:26 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sessao_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sessao]'))
ALTER TABLE [dbo].[Sessao] DROP CONSTRAINT [FK_Sessao_Jornalista]
GO
/****** Object:  ForeignKey [FK_Video_Noticia]    Script Date: 05/26/2010 01:13:26 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Video_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Video]'))
ALTER TABLE [dbo].[Video] DROP CONSTRAINT [FK_Video_Noticia]
GO
/****** Object:  ForeignKey [FK_VotoNoticia_Jornalista]    Script Date: 05/26/2010 01:13:26 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia] DROP CONSTRAINT [FK_VotoNoticia_Jornalista]
GO
/****** Object:  ForeignKey [FK_VotoNoticia_Noticia]    Script Date: 05/26/2010 01:13:26 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia] DROP CONSTRAINT [FK_VotoNoticia_Noticia]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comentario]') AND type in (N'U'))
DROP TABLE [dbo].[Comentario]
GO
/****** Object:  Table [dbo].[Imagem]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Imagem]') AND type in (N'U'))
DROP TABLE [dbo].[Imagem]
GO
/****** Object:  Table [dbo].[NoticiaFlagged]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]') AND type in (N'U'))
DROP TABLE [dbo].[NoticiaFlagged]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 05/26/2010 01:13:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Video]') AND type in (N'U'))
DROP TABLE [dbo].[Video]
GO
/****** Object:  Table [dbo].[VotoNoticia]    Script Date: 05/26/2010 01:13:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VotoNoticia]') AND type in (N'U'))
DROP TABLE [dbo].[VotoNoticia]
GO
/****** Object:  Table [dbo].[Queixa]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Queixa]') AND type in (N'U'))
DROP TABLE [dbo].[Queixa]
GO
/****** Object:  Table [dbo].[Sessao]    Script Date: 05/26/2010 01:13:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sessao]') AND type in (N'U'))
DROP TABLE [dbo].[Sessao]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 05/26/2010 01:13:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Administrador]') AND type in (N'U'))
DROP TABLE [dbo].[Administrador]
GO
/****** Object:  Table [dbo].[Banido]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Banido]') AND type in (N'U'))
DROP TABLE [dbo].[Banido]
GO
/****** Object:  Table [dbo].[Moderador]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Moderador]') AND type in (N'U'))
DROP TABLE [dbo].[Moderador]
GO
/****** Object:  Table [dbo].[Noticia]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia]') AND type in (N'U'))
DROP TABLE [dbo].[Noticia]
GO
/****** Object:  Table [dbo].[Jornalista]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Jornalista]') AND type in (N'U'))
DROP TABLE [dbo].[Jornalista]
GO
/****** Object:  Table [dbo].[Mapa]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mapa]') AND type in (N'U'))
DROP TABLE [dbo].[Mapa]
GO
/****** Object:  Default [DF_Administrador_AdministradorId]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Administrador_AdministradorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Administrador]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Administrador_AdministradorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Administrador] DROP CONSTRAINT [DF_Administrador_AdministradorId]
END


End
GO
/****** Object:  Default [DF_Banido_BanidoId]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Banido_BanidoId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Banido_BanidoId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Banido] DROP CONSTRAINT [DF_Banido_BanidoId]
END


End
GO
/****** Object:  Default [DF_Banido_JornalistaId]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Banido_JornalistaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Banido_JornalistaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Banido] DROP CONSTRAINT [DF_Banido_JornalistaId]
END


End
GO
/****** Object:  Default [DF_Comentario_ComentarioId]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Comentario_ComentarioId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Comentario_ComentarioId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Comentario] DROP CONSTRAINT [DF_Comentario_ComentarioId]
END


End
GO
/****** Object:  Default [DF_Imagem_ImagemId]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Imagem_ImagemId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Imagem]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Imagem_ImagemId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Imagem] DROP CONSTRAINT [DF_Imagem_ImagemId]
END


End
GO
/****** Object:  Default [DF_Jornalista_JornalistaId]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Jornalista_JornalistaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Jornalista]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Jornalista_JornalistaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Jornalista] DROP CONSTRAINT [DF_Jornalista_JornalistaId]
END


End
GO
/****** Object:  Default [DF_Mapa_MapaId]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Mapa_MapaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mapa]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Mapa_MapaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Mapa] DROP CONSTRAINT [DF_Mapa_MapaId]
END


End
GO
/****** Object:  Default [DF_Moderador_ModeradorId]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Moderador_ModeradorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Moderador]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Moderador_ModeradorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Moderador] DROP CONSTRAINT [DF_Moderador_ModeradorId]
END


End
GO
/****** Object:  Default [DF_Noticia_NoticiaId]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Noticia_NoticiaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Noticia_NoticiaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Noticia] DROP CONSTRAINT [DF_Noticia_NoticiaId]
END


End
GO
/****** Object:  Default [DF_NoticiaFlagged_NoticiaId]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_NoticiaFlagged_NoticiaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_NoticiaFlagged_NoticiaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NoticiaFlagged] DROP CONSTRAINT [DF_NoticiaFlagged_NoticiaId]
END


End
GO
/****** Object:  Default [DF_Queixas_QueixaId]    Script Date: 05/26/2010 01:13:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Queixas_QueixaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Queixa]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Queixas_QueixaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Queixa] DROP CONSTRAINT [DF_Queixas_QueixaId]
END


End
GO
/****** Object:  Default [DF_Video_VideoId]    Script Date: 05/26/2010 01:13:26 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Video_VideoId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Video]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Video_VideoId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Video] DROP CONSTRAINT [DF_Video_VideoId]
END


End
GO
/****** Object:  Table [dbo].[Mapa]    Script Date: 05/26/2010 01:13:25 ******/
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
/****** Object:  Table [dbo].[Jornalista]    Script Date: 05/26/2010 01:13:25 ******/
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
/****** Object:  Table [dbo].[Noticia]    Script Date: 05/26/2010 01:13:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Noticia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Noticia](
	[NoticiaId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Titulo] [varchar](256) COLLATE Latin1_General_CI_AS NOT NULL,
	[Corpo] [varchar](2048) COLLATE Latin1_General_CI_AS NOT NULL,
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
INSERT [dbo].[Noticia] ([NoticiaId], [Titulo], [Corpo], [Pontuacao], [Data], [FlagCount], [Deleted], [Marked], [JornalistaId], [Tags], [MapaId]) VALUES (N'f8cdb59d-ef33-4dbe-b6ec-1ca052463673', N'Lady Gaga proíbe os seus dançarinos de fazerem sexo', N'A cantora nova-iorquina leva as suas medidas proibicionistas ao extremo. Diz que quem com ela partilha o palco não "presta atenção suficiente" aos concertos. Notícias recentes alegam que a diva pop de 24 anos, Lady Gaga, terá proibido qualquer tipo de relações sexuais, a todos os dançarinos que a acompanham na presente digressão.  A razão apresentada pela cantora para esta decisão prende-se com as ''atenções'', que entende não estarem devidamente centradas nos espectáculos. Uma fonte anónima próxima de Lady Gaga terá dito o seguinte ao Daily Telegraph: "ela (Gaga) deixou claro aos dançarinos que não lhes será permitido fazer sexo até terminar o tour . Ela quer que dêem 100% em palco, e que não desperdicem energia na cama".  Aparentemente, Gaga terá recentemente resignado ao uso de drogas durante os concertos, para que a sua performance não fosse prejudicada. Mas, como é habitual da norte-americana, nenhuma declaração surge sem o seu quê de controvérsia e/ou contradição: "Já não toco em cocaína. Não fumo. Quer dizer, talvez um ou outro cigarro - e whisky - enquanto trabalho, porque liberta um pouco a minha mente". Acrescenta ainda: "um pouco de MDMA de vez em quando nunca matou ninguém. Mas não tomo mesmo drogas".  "Preocupo-me com a minha voz. A emoção de sentir a minha voz saudável em palco faz-me muito bem. Tomo conta de mim". Por vezes, o argumentário que apresenta, aparenta uma auto-justificação e não tanto a descrição factual da sua realidade. É conhecida a presente dependência de diversos medicamentos (admitida pela própria), que utiliza para combater as ansiedades e a depressão que a fama lhe provoca. ', 5, CAST(0x00009D8100E297D0 AS DateTime), 0, 0, 1, N'ae9ca1a8-ec9d-4c9a-b208-5977f9a76e99', N'Lady Gaga Lady Gaga proíbe sexo Lady Gaga drogas', N'be83e7e0-415d-40e2-b2ff-feed3cb2addc')
INSERT [dbo].[Noticia] ([NoticiaId], [Titulo], [Corpo], [Pontuacao], [Data], [FlagCount], [Deleted], [Marked], [JornalistaId], [Tags], [MapaId]) VALUES (N'81379be9-98d4-44bb-8cfa-33a0e6bfdc1f', N'Morreu Paul Dedrick Gray, baixista dos Slipknot', N'O músico, de 38 anos, foi encontrado morto num quarto de hotel, ontem, em Des Moines, Iowa, Estados Unidos da América. A polícia está a investigar o caso. Espera-se a todo o momento um comunicando dos Slipknot confirmando (ou não) a digressão que iriam iniciar nos próximos dias. O corpo do baixista dos Slipknot foi encontrado por um empregado num quarto do Town Plaza Hotel, em Northpark Drive, em Des Moines, capital do Estado do Iowa. A polícia de Urbandale está a investigar o sucedido, sendo previsto que a autópsia tenha lugar amanhã. Gray, de 38 anos, foi encontrado sem vida cerca das 10h50, hora local, 16h50 de Lisboa. Em 2003 havia sido acusado, depois de ter despistado o seu Porsche, de posse de marijuana, cocaína e de ter infringido um sinal vermelho. Os médicos provaram, contudo, que não era dependente de drogas. A banda actuou o ano passado no festival Optimus Alive!, ocasião em que decorreu a entrevista aqui citada.', -5, CAST(0x00009D800174B610 AS DateTime), 1, 0, 0, N'40d21727-a7a5-4187-b779-84ef248ad950', N'Slipknot Paul Dedrick Gray baixista Slipknot', NULL)
INSERT [dbo].[Noticia] ([NoticiaId], [Titulo], [Corpo], [Pontuacao], [Data], [FlagCount], [Deleted], [Marked], [JornalistaId], [Tags], [MapaId]) VALUES (N'8bf067eb-6b6d-4f9d-b384-4981f419db30', N'Rolling Stones: fim de linha para Charlie Watts? Eles desmentem tudo', N'Porta-voz da banda inglesa já veio negar a saída do baterista. Os quatro magníficos somam e seguem nos tops internacionais. Diversas vozes revelaram recentemente a suposta saída de Charlie Watts dos Rolling Stones e afirmaram que seria Steve Jordan (co-produtor de Keith Richards, John Mayer ou Eric Clapton) a substituir o baterista na digressão da banda para promover o duplo CD de Exile on Main Street . De acordo com fontes noticiadas pelo jornal inglês The Guardian, Charlie Watts não quereria continuar a digressão dos Stones mas continuaria a trabalhar com Mick Jagger, Keith Richards e Ron Wood em projectos diferentes.  Essas mesmas fontes que o The Guardian anuncia, a primeira foi um promotor da banda que garantiu que os Rolling Stones estariam a preparar uma digressão nos próximos dois anos pela Austrália e a pedir valores exorbitantes, mesmo sem o baterista. Outra das fontes foi um site, Undercover , que escreveu em Setembro passado que Watts tinha deixado o grupo, o que foi posteriormente negado pela banda através do seu porta-voz: "Ao contrário das fabricadas e mal informadas notícias que apareceram ontem num medíocre site de música australiano, nós gostaríamos de deixar claro que o Charlie Watts não deixou os Rolling Stones." Com os Rolling Stones no primeiro lugar dos tops mundiais, a banda nega, de todo, os rumores de que Charlie Watts poderá sair.  Recentemente, Charlie deu entrevistas para promover os últimos projectos da banda - Exile On Main Street e o DVD que sairá brevemente, Stones In Exile. ', 3, CAST(0x00009D8000FE0F10 AS DateTime), 2, 1, 0, N'40d21727-a7a5-4187-b779-84ef248ad950', N'rollings stones charlie watts', NULL)
INSERT [dbo].[Noticia] ([NoticiaId], [Titulo], [Corpo], [Pontuacao], [Data], [FlagCount], [Deleted], [Marked], [JornalistaId], [Tags], [MapaId]) VALUES (N'b57d7ed6-269c-471d-8262-4d67c7c37d27', N'Bono operado de urgência à coluna. Início da digressão dos U2 adiado', N'Vocalista da banda irlandesa lesionou-se a duas semanas do início da nova etapa da digressão 360º. Concerto de arranque foi adiado. Bono deu entrada ontem na unidade de neurocirurgia de um hospital em Munique, onde passará os próximos dias.  De acordo com o site oficial da banda, o primeiro concerto da nova etapa da digressão foi adiado. O arranque deveria acontecer a 3 de Junho, em Salt Lake City, nos Estados Unidos.  Num comunicado publicado no site oficial do grupo, o manager Paul McGuinness refere que a banda se preparava para começar os ensaios na próxima 3ª feira, em Salt Lake City, e que cerca de 400 pessoas da equipa de produção já se encontravam em viagem tendo a cidade americana como destino.  Se os planos se mantiverem, a digressão 360º deverá passar por Portugal a 2 de Outubro. ', 7, CAST(0x00009D7E00D8FAE0 AS DateTime), 3, 0, 0, N'81379be9-98d4-44bb-8cfa-33a0e6bfdc1f', N'u2 concertos u2 digressao u2 360 u2 cancelado bono operação', NULL)
INSERT [dbo].[Noticia] ([NoticiaId], [Titulo], [Corpo], [Pontuacao], [Data], [FlagCount], [Deleted], [Marked], [JornalistaId], [Tags], [MapaId]) VALUES (N'02e41ae4-3ec2-4a71-946b-61069320b877', N'Stone Temple Pilots voltam aos discos 9 anos depois.', N'Stone Temple Pilots é o título do sexto álbum de originais da banda californiana. Scott Weiland: "é rock & roll puro". O novo trabalho dos Stone Temple Pilots já está disponível para audição gratuita online . O site da Billboard colocou à disposição dos fãs da banda a versão completa de Stone Temple Pilots . Um título no mínimo, curioso, para uma banda que conta vinte anos de existência. Este é o primeiro trabalho de Scott Weiland e companhia em nove anos (o último foi Shangri-LA DEE DA , em 2001), e era já aguardado por muitos - que vislumbravam cada vez mais difícil um regresso ao activo dos Stone Temple Pilots. A descrição que o cantor faz do mesmo revela que se sente igualmente entusiasmado: "É um álbum de rock & roll puro, direito ao assunto. Tem muitos blues imiscuídos, e muito r&b pelo meio". O disco novo estará à venda a partir de 25 de Maio. ', 8, CAST(0x00009D7D0142B930 AS DateTime), 4, 1, 0, N'fe30fc06-cbf1-46de-b7bd-71ef2fc5b6a0', N'Stone Temple Pilots', NULL)
INSERT [dbo].[Noticia] ([NoticiaId], [Titulo], [Corpo], [Pontuacao], [Data], [FlagCount], [Deleted], [Marked], [JornalistaId], [Tags], [MapaId]) VALUES (N'ea82d589-0c97-4070-8189-91f1dcee731c', N'Danças com vampiros, mortos e satânicos em novo teledisco de Goldfrapp', N'"Alive" é o novo single de Head First , quinto disco de originais da dupla britânica. A sensualidade e o macabro à modo 80''s são os destaques do teledisco. A diva de Felt Mountain e Black Cherry está de volta: ela é Allison Golfrapp, e tem um disco novo para mostrar ao mundo: Head First .  As referências sonoras e estéticas deste disco (cujo título significa algo como ''de cabeça'') são facilmente identificáveis: os míticos 80''s da pop electrónica estão por toda a parte. Mesmo no vídeo de "Alive", os trejeitos, indumentária e coreografias revelam que a mente de Goldfrapp está noutra época. A sua temática, essa, é bem actual: vampiros, mortos-vivos e símbolos satânicos. ', -2, CAST(0x00009D7D012BED40 AS DateTime), 5, 0, 0, N'fe30fc06-cbf1-46de-b7bd-71ef2fc5b6a0', N'Goldfrapp Alive Head First', NULL)
/****** Object:  Table [dbo].[Moderador]    Script Date: 05/26/2010 01:13:25 ******/
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
/****** Object:  Table [dbo].[Banido]    Script Date: 05/26/2010 01:13:25 ******/
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
/****** Object:  Table [dbo].[Administrador]    Script Date: 05/26/2010 01:13:24 ******/
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
/****** Object:  Table [dbo].[Sessao]    Script Date: 05/26/2010 01:13:26 ******/
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
/****** Object:  Table [dbo].[Queixa]    Script Date: 05/26/2010 01:13:25 ******/
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
INSERT [dbo].[Queixa] ([QueixaId], [JornalistaId], [AcusadoId], [Texto], [Resolved], [Assunto]) VALUES (N'67d626be-f546-4c97-a1e6-f6693d126612', N'9ecf1673-a461-4875-a162-139687f109f6', N'81379be9-98d4-44bb-8cfa-33a0e6bfdc1f', N'Falta de respeito para com a comunidade', 1, N'Falta de respeito para com a comunidade jornalistica')
/****** Object:  Table [dbo].[VotoNoticia]    Script Date: 05/26/2010 01:13:26 ******/
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
INSERT [dbo].[VotoNoticia] ([NoticiaId], [JornalistaId]) VALUES (N'f8cdb59d-ef33-4dbe-b6ec-1ca052463673', N'9ecf1673-a461-4875-a162-139687f109f6')
INSERT [dbo].[VotoNoticia] ([NoticiaId], [JornalistaId]) VALUES (N'f8cdb59d-ef33-4dbe-b6ec-1ca052463673', N'81379be9-98d4-44bb-8cfa-33a0e6bfdc1f')
INSERT [dbo].[VotoNoticia] ([NoticiaId], [JornalistaId]) VALUES (N'81379be9-98d4-44bb-8cfa-33a0e6bfdc1f', N'70c444d7-49c6-40b0-a878-2acbf6465523')
INSERT [dbo].[VotoNoticia] ([NoticiaId], [JornalistaId]) VALUES (N'b57d7ed6-269c-471d-8262-4d67c7c37d27', N'81379be9-98d4-44bb-8cfa-33a0e6bfdc1f')
INSERT [dbo].[VotoNoticia] ([NoticiaId], [JornalistaId]) VALUES (N'b57d7ed6-269c-471d-8262-4d67c7c37d27', N'eb6c4f11-cf43-40bb-85ec-33d6619a72c6')
INSERT [dbo].[VotoNoticia] ([NoticiaId], [JornalistaId]) VALUES (N'02e41ae4-3ec2-4a71-946b-61069320b877', N'ae9ca1a8-ec9d-4c9a-b208-5977f9a76e99')
/****** Object:  Table [dbo].[Video]    Script Date: 05/26/2010 01:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Video]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Video](
	[VideoId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[NoticiaId] [uniqueidentifier] NOT NULL,
	[Url] [nchar](100) COLLATE Latin1_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Video] PRIMARY KEY CLUSTERED 
(
	[VideoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[Video] ([VideoId], [NoticiaId], [Url]) VALUES (N'ef28c875-6280-41de-a77d-b9060c890fb1', N'b57d7ed6-269c-471d-8262-4d67c7c37d27', N'                                                                                                    ')
INSERT [dbo].[Video] ([VideoId], [NoticiaId], [Url]) VALUES (N'900fe23d-bd12-483b-a759-fdbe07e4adbc', N'ea82d589-0c97-4070-8189-91f1dcee731c', N'                                                                                                    ')
/****** Object:  Table [dbo].[NoticiaFlagged]    Script Date: 05/26/2010 01:13:25 ******/
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
INSERT [dbo].[NoticiaFlagged] ([NoticiaId], [Data]) VALUES (N'81379be9-98d4-44bb-8cfa-33a0e6bfdc1f', CAST(0x00009DA1011AE5E0 AS DateTime))
INSERT [dbo].[NoticiaFlagged] ([NoticiaId], [Data]) VALUES (N'8bf067eb-6b6d-4f9d-b384-4981f419db30', CAST(0x00009DC100000000 AS DateTime))
INSERT [dbo].[NoticiaFlagged] ([NoticiaId], [Data]) VALUES (N'b57d7ed6-269c-471d-8262-4d67c7c37d27', CAST(0x00009DC3012E1FC0 AS DateTime))
/****** Object:  Table [dbo].[Imagem]    Script Date: 05/26/2010 01:13:25 ******/
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
/****** Object:  Table [dbo].[Comentario]    Script Date: 05/26/2010 01:13:25 ******/
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
INSERT [dbo].[Comentario] ([ComentarioId], [Texto], [NoticiaId], [JornalistaId]) VALUES (N'064e20ca-0415-49e5-b4f3-7cca76c866d8', N'Que descanse em paz. RIP! ', N'81379be9-98d4-44bb-8cfa-33a0e6bfdc1f', N'81379be9-98d4-44bb-8cfa-33a0e6bfdc1f')
INSERT [dbo].[Comentario] ([ComentarioId], [Texto], [NoticiaId], [JornalistaId]) VALUES (N'd78defaa-7463-49f3-9561-8850f9eaf40f', N'Olha o Bono a arranjar uma desculpa para já não ir para a estrada!Ainda por cima sabe que vem a Portugal e assustou-se!! Operado às costas? Que treta!!', N'b57d7ed6-269c-471d-8262-4d67c7c37d27', N'40d21727-a7a5-4187-b779-84ef248ad950')
INSERT [dbo].[Comentario] ([ComentarioId], [Texto], [NoticiaId], [JornalistaId]) VALUES (N'35a3240e-39a9-4426-8667-c50ca12a6f67', N'Ela fez isto porque uma vez queria fazer sexo com um dos dançarinos e ele n aceitou!A revolta da Lady Gaga.Ela é que ficou Gaga quando ele a rejeito!!!', N'f8cdb59d-ef33-4dbe-b6ec-1ca052463673', N'70c444d7-49c6-40b0-a878-2acbf6465523')
INSERT [dbo].[Comentario] ([ComentarioId], [Texto], [NoticiaId], [JornalistaId]) VALUES (N'6f9000f6-6998-4436-8014-d9aa96da3ae5', N'Olha, estes gajos ainda estão vivos!Rock and Roll!!!', N'02e41ae4-3ec2-4a71-946b-61069320b877', N'fe30fc06-cbf1-46de-b7bd-71ef2fc5b6a0')
INSERT [dbo].[Comentario] ([ComentarioId], [Texto], [NoticiaId], [JornalistaId]) VALUES (N'667b4e1f-c417-46a6-a421-dbc5b08a2fd2', N'Também só falta por a notícia de que BRITNEY SPEARS quer ser CONGELADA quando MORRER, para poder ressuscitar no futuro.', N'f8cdb59d-ef33-4dbe-b6ec-1ca052463673', N'ae9ca1a8-ec9d-4c9a-b208-5977f9a76e99')
INSERT [dbo].[Comentario] ([ComentarioId], [Texto], [NoticiaId], [JornalistaId]) VALUES (N'09c2ce23-85e4-4ae3-a7ba-f6c003326930', N'Cá para mim o Bono ainda vai ter a coluna toda lixada e os U2 já não vêm tocar a Portugal!!!Ainda bem! :P', N'b57d7ed6-269c-471d-8262-4d67c7c37d27', N'9ecf1673-a461-4875-a162-139687f109f6')
/****** Object:  Default [DF_Administrador_AdministradorId]    Script Date: 05/26/2010 01:13:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Administrador_AdministradorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Administrador]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Administrador_AdministradorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Administrador] ADD  CONSTRAINT [DF_Administrador_AdministradorId]  DEFAULT (newid()) FOR [AdministradorId]
END


End
GO
/****** Object:  Default [DF_Banido_BanidoId]    Script Date: 05/26/2010 01:13:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Banido_BanidoId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Banido_BanidoId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Banido] ADD  CONSTRAINT [DF_Banido_BanidoId]  DEFAULT (newid()) FOR [BanidoId]
END


End
GO
/****** Object:  Default [DF_Banido_JornalistaId]    Script Date: 05/26/2010 01:13:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Banido_JornalistaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Banido_JornalistaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Banido] ADD  CONSTRAINT [DF_Banido_JornalistaId]  DEFAULT (newid()) FOR [JornalistaId]
END


End
GO
/****** Object:  Default [DF_Comentario_ComentarioId]    Script Date: 05/26/2010 01:13:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Comentario_ComentarioId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Comentario_ComentarioId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Comentario] ADD  CONSTRAINT [DF_Comentario_ComentarioId]  DEFAULT (newid()) FOR [ComentarioId]
END


End
GO
/****** Object:  Default [DF_Imagem_ImagemId]    Script Date: 05/26/2010 01:13:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Imagem_ImagemId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Imagem]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Imagem_ImagemId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Imagem] ADD  CONSTRAINT [DF_Imagem_ImagemId]  DEFAULT (newid()) FOR [ImagemId]
END


End
GO
/****** Object:  Default [DF_Jornalista_JornalistaId]    Script Date: 05/26/2010 01:13:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Jornalista_JornalistaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Jornalista]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Jornalista_JornalistaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Jornalista] ADD  CONSTRAINT [DF_Jornalista_JornalistaId]  DEFAULT (newid()) FOR [JornalistaId]
END


End
GO
/****** Object:  Default [DF_Mapa_MapaId]    Script Date: 05/26/2010 01:13:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Mapa_MapaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mapa]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Mapa_MapaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Mapa] ADD  CONSTRAINT [DF_Mapa_MapaId]  DEFAULT (newid()) FOR [MapaId]
END


End
GO
/****** Object:  Default [DF_Moderador_ModeradorId]    Script Date: 05/26/2010 01:13:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Moderador_ModeradorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Moderador]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Moderador_ModeradorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Moderador] ADD  CONSTRAINT [DF_Moderador_ModeradorId]  DEFAULT (newid()) FOR [ModeradorId]
END


End
GO
/****** Object:  Default [DF_Noticia_NoticiaId]    Script Date: 05/26/2010 01:13:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Noticia_NoticiaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Noticia_NoticiaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Noticia] ADD  CONSTRAINT [DF_Noticia_NoticiaId]  DEFAULT (newid()) FOR [NoticiaId]
END


End
GO
/****** Object:  Default [DF_NoticiaFlagged_NoticiaId]    Script Date: 05/26/2010 01:13:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_NoticiaFlagged_NoticiaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_NoticiaFlagged_NoticiaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NoticiaFlagged] ADD  CONSTRAINT [DF_NoticiaFlagged_NoticiaId]  DEFAULT (newid()) FOR [NoticiaId]
END


End
GO
/****** Object:  Default [DF_Queixas_QueixaId]    Script Date: 05/26/2010 01:13:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Queixas_QueixaId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Queixa]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Queixas_QueixaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Queixa] ADD  CONSTRAINT [DF_Queixas_QueixaId]  DEFAULT (newid()) FOR [QueixaId]
END


End
GO
/****** Object:  Default [DF_Video_VideoId]    Script Date: 05/26/2010 01:13:26 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Video_VideoId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Video]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Video_VideoId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Video] ADD  CONSTRAINT [DF_Video_VideoId]  DEFAULT (newid()) FOR [VideoId]
END


End
GO
/****** Object:  ForeignKey [FK_Administrador_Jornalista]    Script Date: 05/26/2010 01:13:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Administrador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Administrador]'))
ALTER TABLE [dbo].[Administrador]  WITH CHECK ADD  CONSTRAINT [FK_Administrador_Jornalista] FOREIGN KEY([AdministradorId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Administrador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Administrador]'))
ALTER TABLE [dbo].[Administrador] CHECK CONSTRAINT [FK_Administrador_Jornalista]
GO
/****** Object:  ForeignKey [FK_Banido_Jornalista]    Script Date: 05/26/2010 01:13:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Banido_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
ALTER TABLE [dbo].[Banido]  WITH CHECK ADD  CONSTRAINT [FK_Banido_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Banido_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banido]'))
ALTER TABLE [dbo].[Banido] CHECK CONSTRAINT [FK_Banido_Jornalista]
GO
/****** Object:  ForeignKey [FK_Comentario_Jornalista]    Script Date: 05/26/2010 01:13:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Jornalista]
GO
/****** Object:  ForeignKey [FK_Comentario_Noticia]    Script Date: 05/26/2010 01:13:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Noticia] FOREIGN KEY([NoticiaId])
REFERENCES [dbo].[Noticia] ([NoticiaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Noticia]
GO
/****** Object:  ForeignKey [FK_Imagem_Noticia]    Script Date: 05/26/2010 01:13:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Imagem_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Imagem]'))
ALTER TABLE [dbo].[Imagem]  WITH CHECK ADD  CONSTRAINT [FK_Imagem_Noticia] FOREIGN KEY([NoticiaId])
REFERENCES [dbo].[Noticia] ([NoticiaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Imagem_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Imagem]'))
ALTER TABLE [dbo].[Imagem] CHECK CONSTRAINT [FK_Imagem_Noticia]
GO
/****** Object:  ForeignKey [FK_Moderador_Jornalista]    Script Date: 05/26/2010 01:13:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Moderador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Moderador]'))
ALTER TABLE [dbo].[Moderador]  WITH CHECK ADD  CONSTRAINT [FK_Moderador_Jornalista] FOREIGN KEY([ModeradorId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Moderador_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Moderador]'))
ALTER TABLE [dbo].[Moderador] CHECK CONSTRAINT [FK_Moderador_Jornalista]
GO
/****** Object:  ForeignKey [FK_Noticia_Jornalista]    Script Date: 05/26/2010 01:13:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Noticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
ALTER TABLE [dbo].[Noticia]  WITH CHECK ADD  CONSTRAINT [FK_Noticia_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Noticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
ALTER TABLE [dbo].[Noticia] CHECK CONSTRAINT [FK_Noticia_Jornalista]
GO
/****** Object:  ForeignKey [FK_Noticia_Mapa]    Script Date: 05/26/2010 01:13:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Noticia_Mapa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
ALTER TABLE [dbo].[Noticia]  WITH CHECK ADD  CONSTRAINT [FK_Noticia_Mapa] FOREIGN KEY([MapaId])
REFERENCES [dbo].[Mapa] ([MapaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Noticia_Mapa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Noticia]'))
ALTER TABLE [dbo].[Noticia] CHECK CONSTRAINT [FK_Noticia_Mapa]
GO
/****** Object:  ForeignKey [FK_NoticiaFlagged_Noticia]    Script Date: 05/26/2010 01:13:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NoticiaFlagged_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]'))
ALTER TABLE [dbo].[NoticiaFlagged]  WITH CHECK ADD  CONSTRAINT [FK_NoticiaFlagged_Noticia] FOREIGN KEY([NoticiaId])
REFERENCES [dbo].[Noticia] ([NoticiaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NoticiaFlagged_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[NoticiaFlagged]'))
ALTER TABLE [dbo].[NoticiaFlagged] CHECK CONSTRAINT [FK_NoticiaFlagged_Noticia]
GO
/****** Object:  ForeignKey [FK_Queixas_Jornalista]    Script Date: 05/26/2010 01:13:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Queixas_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Queixa]'))
ALTER TABLE [dbo].[Queixa]  WITH CHECK ADD  CONSTRAINT [FK_Queixas_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Queixas_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Queixa]'))
ALTER TABLE [dbo].[Queixa] CHECK CONSTRAINT [FK_Queixas_Jornalista]
GO
/****** Object:  ForeignKey [FK_Sessao_Jornalista]    Script Date: 05/26/2010 01:13:26 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sessao_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sessao]'))
ALTER TABLE [dbo].[Sessao]  WITH CHECK ADD  CONSTRAINT [FK_Sessao_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sessao_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sessao]'))
ALTER TABLE [dbo].[Sessao] CHECK CONSTRAINT [FK_Sessao_Jornalista]
GO
/****** Object:  ForeignKey [FK_Video_Noticia]    Script Date: 05/26/2010 01:13:26 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Video_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Video]'))
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_Video_Noticia] FOREIGN KEY([NoticiaId])
REFERENCES [dbo].[Noticia] ([NoticiaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Video_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Video]'))
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_Video_Noticia]
GO
/****** Object:  ForeignKey [FK_VotoNoticia_Jornalista]    Script Date: 05/26/2010 01:13:26 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia]  WITH CHECK ADD  CONSTRAINT [FK_VotoNoticia_Jornalista] FOREIGN KEY([JornalistaId])
REFERENCES [dbo].[Jornalista] ([JornalistaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Jornalista]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia] CHECK CONSTRAINT [FK_VotoNoticia_Jornalista]
GO
/****** Object:  ForeignKey [FK_VotoNoticia_Noticia]    Script Date: 05/26/2010 01:13:26 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia]  WITH CHECK ADD  CONSTRAINT [FK_VotoNoticia_Noticia] FOREIGN KEY([NoticiaId])
REFERENCES [dbo].[Noticia] ([NoticiaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VotoNoticia_Noticia]') AND parent_object_id = OBJECT_ID(N'[dbo].[VotoNoticia]'))
ALTER TABLE [dbo].[VotoNoticia] CHECK CONSTRAINT [FK_VotoNoticia_Noticia]
GO
