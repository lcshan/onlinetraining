ALTER TABLE [dbo].[OnlineTraining_Question] DROP CONSTRAINT [FK_OnlineTraining_Question_OnlineTraining_Question]
GO
ALTER TABLE [dbo].[OnlineTraining_Question] DROP CONSTRAINT [FK_OnlineTraining_Question_OnlineTraining_Module]
GO
ALTER TABLE [dbo].[OnlineTraining_Module] DROP CONSTRAINT [FK_OnlineTrainingModule_OnlineTrainingModuleSetting]
GO
ALTER TABLE [dbo].[OnlineTraining_Answer] DROP CONSTRAINT [FK_OnlineTraining_Answer_OnlineTraining_Question]
GO
ALTER TABLE [dbo].[OnlineTraining_ModuleSetting] DROP CONSTRAINT [DF_OnlineTrainingModuleSetting_AttemptTimes]
GO
ALTER TABLE [dbo].[OnlineTraining_ModuleSetting] DROP CONSTRAINT [DF_OnlineTrainingModuleSetting_PassRequired]
GO
ALTER TABLE [dbo].[OnlineTraining_ModuleSetting] DROP CONSTRAINT [DF_OnlineTrainingModuleSetting_HasScore]
GO
ALTER TABLE [dbo].[OnlineTraining_ModuleSetting] DROP CONSTRAINT [DF_OnlineTrainingModuleSetting_CheckAnswer]
GO
ALTER TABLE [dbo].[OnlineTraining_ModuleSetting] DROP CONSTRAINT [DF_OnlineTrainingModuleSetting_LoadAnswer]
GO
ALTER TABLE [dbo].[OnlineTraining_ModuleSetting] DROP CONSTRAINT [DF_OnlineTrainingModuleSetting_ShowAnswerSheet]
GO
ALTER TABLE [dbo].[OnlineTraining_ModuleSetting] DROP CONSTRAINT [DF_OnlineTrainingModuleSetting_PopupIntroduction]
GO
ALTER TABLE [dbo].[OnlineTraining_Answer] DROP CONSTRAINT [DF_OnlineTraining_Answer_IsCorrectAnswer]
GO
/****** Object:  Table [dbo].[OnlineTraining_Question]    Script Date: 10/16/2015 5:01:20 PM ******/
DROP TABLE [dbo].[OnlineTraining_Question]
GO
/****** Object:  Table [dbo].[OnlineTraining_ModuleSetting]    Script Date: 10/16/2015 5:01:20 PM ******/
DROP TABLE [dbo].[OnlineTraining_ModuleSetting]
GO
/****** Object:  Table [dbo].[OnlineTraining_Module]    Script Date: 10/16/2015 5:01:20 PM ******/
DROP TABLE [dbo].[OnlineTraining_Module]
GO
/****** Object:  Table [dbo].[OnlineTraining_Answer]    Script Date: 10/16/2015 5:01:20 PM ******/
DROP TABLE [dbo].[OnlineTraining_Answer]
GO
/****** Object:  Table [dbo].[OnlineTraining_Answer]    Script Date: 10/16/2015 5:01:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlineTraining_Answer](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[IsCorrectAnswer] [bit] NOT NULL,
	[NameAndValue] [text] NULL,
	[QuestionId] [int] NOT NULL,
 CONSTRAINT [PK_OnlineTraining_Answer] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OnlineTraining_Module]    Script Date: 10/16/2015 5:01:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlineTraining_Module](
	[ModuleId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[ModuleSettingId] [int] NOT NULL,
	[Description] [text] NULL,
	[Content] [text] NULL,
 CONSTRAINT [PK_OnlineTrainingModule] PRIMARY KEY CLUSTERED 
(
	[ModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OnlineTraining_ModuleSetting]    Script Date: 10/16/2015 5:01:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlineTraining_ModuleSetting](
	[ModuleSettingId] [int] IDENTITY(1,1) NOT NULL,
	[SettingName] [nvarchar](250) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[PopupIntroduction] [bit] NOT NULL,
	[ShowAnswerSheet] [bit] NOT NULL,
	[LoadAnswer] [bit] NOT NULL,
	[CheckAnswer] [bit] NOT NULL,
	[HasScore] [bit] NOT NULL,
	[PassRequired] [bit] NOT NULL,
	[AttemptTimes] [int] NOT NULL,
	[PassPercentage] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[RewardsPoint] [int] NULL,
 CONSTRAINT [PK_OnlineTrainingModuleSetting] PRIMARY KEY CLUSTERED 
(
	[ModuleSettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OnlineTraining_Question]    Script Date: 10/16/2015 5:01:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlineTraining_Question](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[Description] [text] NULL,
	[QuestionType] [int] NOT NULL,
	[Score] [int] NULL,
	[AnswerMaxLength] [int] NULL,
	[RepeatDirection] [int] NOT NULL,
	[ModuleId] [int] NOT NULL,
	[CopyFromQuestionId] [int] NULL,
 CONSTRAINT [PK_OnlineTraining_Question] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[OnlineTraining_Answer] ADD  CONSTRAINT [DF_OnlineTraining_Answer_IsCorrectAnswer]  DEFAULT ((0)) FOR [IsCorrectAnswer]
GO
ALTER TABLE [dbo].[OnlineTraining_ModuleSetting] ADD  CONSTRAINT [DF_OnlineTrainingModuleSetting_PopupIntroduction]  DEFAULT ((0)) FOR [PopupIntroduction]
GO
ALTER TABLE [dbo].[OnlineTraining_ModuleSetting] ADD  CONSTRAINT [DF_OnlineTrainingModuleSetting_ShowAnswerSheet]  DEFAULT ((0)) FOR [ShowAnswerSheet]
GO
ALTER TABLE [dbo].[OnlineTraining_ModuleSetting] ADD  CONSTRAINT [DF_OnlineTrainingModuleSetting_LoadAnswer]  DEFAULT ((0)) FOR [LoadAnswer]
GO
ALTER TABLE [dbo].[OnlineTraining_ModuleSetting] ADD  CONSTRAINT [DF_OnlineTrainingModuleSetting_CheckAnswer]  DEFAULT ((0)) FOR [CheckAnswer]
GO
ALTER TABLE [dbo].[OnlineTraining_ModuleSetting] ADD  CONSTRAINT [DF_OnlineTrainingModuleSetting_HasScore]  DEFAULT ((0)) FOR [HasScore]
GO
ALTER TABLE [dbo].[OnlineTraining_ModuleSetting] ADD  CONSTRAINT [DF_OnlineTrainingModuleSetting_PassRequired]  DEFAULT ((0)) FOR [PassRequired]
GO
ALTER TABLE [dbo].[OnlineTraining_ModuleSetting] ADD  CONSTRAINT [DF_OnlineTrainingModuleSetting_AttemptTimes]  DEFAULT ((0)) FOR [AttemptTimes]
GO
ALTER TABLE [dbo].[OnlineTraining_Answer]  WITH CHECK ADD  CONSTRAINT [FK_OnlineTraining_Answer_OnlineTraining_Question] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[OnlineTraining_Question] ([QuestionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OnlineTraining_Answer] CHECK CONSTRAINT [FK_OnlineTraining_Answer_OnlineTraining_Question]
GO
ALTER TABLE [dbo].[OnlineTraining_Module]  WITH CHECK ADD  CONSTRAINT [FK_OnlineTrainingModule_OnlineTrainingModuleSetting] FOREIGN KEY([ModuleSettingId])
REFERENCES [dbo].[OnlineTraining_ModuleSetting] ([ModuleSettingId])
GO
ALTER TABLE [dbo].[OnlineTraining_Module] CHECK CONSTRAINT [FK_OnlineTrainingModule_OnlineTrainingModuleSetting]
GO
ALTER TABLE [dbo].[OnlineTraining_Question]  WITH CHECK ADD  CONSTRAINT [FK_OnlineTraining_Question_OnlineTraining_Module] FOREIGN KEY([ModuleId])
REFERENCES [dbo].[OnlineTraining_Module] ([ModuleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OnlineTraining_Question] CHECK CONSTRAINT [FK_OnlineTraining_Question_OnlineTraining_Module]
GO
ALTER TABLE [dbo].[OnlineTraining_Question]  WITH CHECK ADD  CONSTRAINT [FK_OnlineTraining_Question_OnlineTraining_Question] FOREIGN KEY([CopyFromQuestionId])
REFERENCES [dbo].[OnlineTraining_Question] ([QuestionId])
GO
ALTER TABLE [dbo].[OnlineTraining_Question] CHECK CONSTRAINT [FK_OnlineTraining_Question_OnlineTraining_Question]
GO
