using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Helper
/// </summary>
namespace Lab8
{
    public class Helper
    {
        public static List<Course> GetAvailableCourses()
        {
            List<Course> courses = new List<Course>();

            Course course = new Course("GFW8383", "Introduction to DevOps");
            course.WeeklyHours = 4;
            courses.Add(course);

            course = new Course("GFW8253", "Advanced JavaScript");
            course.WeeklyHours = 2;
            courses.Add(course);

            course = new Course("GFW8256", "Web Programming Language");
            course.WeeklyHours = 5;
            courses.Add(course);

            course = new Course("GFW6255", "Python Language");
            course.WeeklyHours = 2;
            courses.Add(course);

            course = new Course("GFW6254", "Front-end Bootcamp");
            course.WeeklyHours = 1;
            courses.Add(course);

            course = new Course("GFW2300", "Backend NodeJs");
            course.WeeklyHours = 3;
            courses.Add(course);

            course = new Course("GFW2350", "No SQL Advance Database topics");
            course.WeeklyHours = 1;
            courses.Add(course);

            return courses;
        }

        public static Course GetCourseByCode(string code)
        {
            foreach (Course c in GetAvailableCourses())
            {
                if (c.Code == code)
                {
                    return c;
                }
            }
            return null;
        }
    }
}