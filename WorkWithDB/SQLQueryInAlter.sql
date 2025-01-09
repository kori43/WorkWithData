USE [SchoolDB]
GO

/****** Object:  View [dbo].[vmTeachersAndLessons]    Script Date: 05.01.2025 18:50:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[vmTeachersAndLessons]
AS

SELECT
	Teachers.[Name]
	,Teachers.Surname
	,Teachers.Gender
	,TeachersAndLessons.LessonName
	,Lessons.Details
FROM Teachers
JOIN TeachersAndLessons ON Teachers.Id = TeachersAndLessons.TeachId
JOIN Lessons ON Lessons.[Name] = TeachersAndLessons.LessonName

--WHERE LessonName = 'алгебра'

-- ORDER BY Teachers.[Name]
	--,Teachers.Surname
GO


