USE SchoolDB

GO
CREATE VIEW vmTeachersAndLessons
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