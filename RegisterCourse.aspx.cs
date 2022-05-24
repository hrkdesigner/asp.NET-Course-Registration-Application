using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab8
{
    public partial class RegisterCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                List<Student> listOfStudent = (List<Student>)Session["students"];
                int index = 0;

                if (listOfStudent != null)
                {
                    foreach (Student student in listOfStudent)
                    {
                        selectedCoursesMsg.Visible = true;
                        sample.Items.Add(student.ToString());
                        index++;

                        // update checbox
                        sample.Items[index].Value = student.Id.ToString();
                    }
                }

                

                index = 0;

                // loop through available courses
                foreach (Course course in Helper.GetAvailableCourses())
                {
                    checklist.Items.Add(new ListItem($"{course.Code} {course.Title} - {course.WeeklyHours} hours/week"));
                    checklist.Items[index].Value = course.Code;
                    index++;
                }
            }
        }
        protected void Final_Click(object sender, EventArgs e)
        {
            List<Student> result = (List<Student>)Session["students"];
            int totalHours = 0;
            selectedCoursesMsg.Visible = true;

            int i = 0;
            List<Course> selectedCourses = new List<Course>();

            foreach (ListItem listItem in checklist.Items)
            {
                if (listItem.Selected == true)
                {
                    Course c = Helper.GetCourseByCode(listItem.Value);

                    selectedCourses.Add(c);

                    totalHours += selectedCourses[i].WeeklyHours;
                    i++;
                }
            }

            // loop through
            foreach (Student student in result)
            {
                if (student.Id == int.Parse(sample.SelectedItem.Value))
                {
                    try
                    {
                        student.RegisterCourses(selectedCourses);
                        coursesErrorMsg.Visible = false;
                        Session["students"] = result;
                        selectedCoursesMsg.Text = ($"Selected student has registred {student.RegisteredCourses.Count} courses, {totalHours} hours weekly");
                    }
                    catch (Exception msg)
                    {
                        selectedCoursesMsg.Visible = false;
                        coursesErrorMsg.Visible = true;
                        // handle exception
                        coursesErrorMsg.Text = msg.Message;
                    }
                }
            }
        }

        protected void change(object sender, EventArgs e)
        {
            coursesErrorMsg.Visible = false;

            if (sample.SelectedItem.Value != "unselected")
            {
                List<Student> listOfStudent = (List<Student>)Session["students"];
                int totalHours = 0;
                selectedCoursesMsg.Visible = true;

                int index = 0;
               
                foreach (Student s in listOfStudent)
                {
                    if (s.Id == int.Parse(sample.SelectedItem.Value))
                    {
                        break;
                    }
                    index++;
                }

                // loop through courses checkboxeslist
                foreach (ListItem listItem in checklist.Items)
                {
                    listItem.Selected = false;

                    foreach (Course c in listOfStudent[index].RegisteredCourses)
                    {
                        if (listItem.Value == c.Code.ToString())
                        {
                            totalHours += c.WeeklyHours;
                            listItem.Selected = true;
                            break;
                        }
                    }
                }

                // update message
                selectedCoursesMsg.Text = ($"Selected student has registred {listOfStudent[index].RegisteredCourses.Count} courses, {totalHours} hours weekly");
            }
            else
            {
                selectedCoursesMsg.Visible = false;
                foreach (ListItem lstItem in checklist.Items)
                {
                    lstItem.Selected = false;
                }
            }
        }

    }
}