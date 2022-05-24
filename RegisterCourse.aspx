<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterCourse.aspx.cs" Inherits="Lab8.RegisterCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="APP_Themes/SiteStyles.css" />
    <title>Course Registration</title>
</head>
<body>
    <main>
        <div>
            <h1>Registrations</h1>
            <form id="form2" runat="server" class="formRegister">
                <div>
                    <div>
                        <label for="studentReg" >Student:</label>
                    </div>

                    <div class="col-9">
                        <asp:DropDownList ID="sample" CssClass="dropdown"
                            AutoPostBack="True"
                            OnSelectedIndexChanged="change" runat="server">
                            <asp:ListItem Value="unselected" Text="-Select-"></asp:ListItem>
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator runat="server" CssClass="errorMsg errorSpan"
                            ErrorMessage="Must select one!"
                            ForeColor="Red" ControlToValidate="sample"
                            InitialValue="unselected" Display="Static"></asp:RequiredFieldValidator>
                    </div>
                </div>
            
                <div >
                    <div >
                        <div>
                            <asp:Label runat="server" ID="coursesErrorMsg" Display="Static" Visible="false" class="badge bg-danger" />
                        </div>
                        
                    </div>
                    <br />
                    <div class="col-12">
                        <div class="coursesMsg">
                            <asp:Label runat="server" ID="selectedCoursesMsg" Display="Static" Visible="false"  class="badge bg-primary notification"></asp:Label>
                        </div>
                    </div>

                    <div >
                       
                        <h5>Following courses are currently available for registration:</h5>
                    </div>

                    <div class="check">
                        <asp:CheckBoxList ID="checklist" runat="server" SelectionMode="Multiple" />
                    </div>

                </div>

                    <asp:Button ID="saveStudent" Text="Save" runat="server" OnClick="Final_Click"  class="btn btn-primary" />
                    <br />
                <br />
                <asp:HyperLink ID="addStudentLink" NavigateUrl="AddStudent.aspx" runat="server">Add Student</asp:HyperLink>

            </form>
        </div>
    </main>
</body>
</html>
