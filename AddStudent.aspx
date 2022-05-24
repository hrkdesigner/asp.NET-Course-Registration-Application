<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="Lab8.AddStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="APP_Themes/SiteStyles.css" />
    <title>Add Student</title>
</head>
<body>
            <h1 runat="server" id="user">Student</h1>
            <form id="form1" runat="server">
                <div id="total" runat="server">
                    <div>
                        <label for="studentName" class="maintext">Student Name:</label>
                    </div>
                    <div>
                        <asp:TextBox runat="server" ID="studentName" CssClass="input"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="requiredFieldStudentName"
                            runat="server"
                            CssClass="errorMsg errorSpan"
                            ForeColor="Red"
                            Display="Static"
                            ControlToValidate="studentName"
                            EnableClientScript="true">
                            Required field!
                        </asp:RequiredFieldValidator>
                    </div>

                     <div>
                        <label for="studentType" class="maintext">Student Type:</label>
                    </div>

                    <div>
                        <asp:DropDownList ID="studentTypeList" class="dropdown" CssClass="dropdown" runat="server">
                            <asp:ListItem Value="unselected" Text="Select ..."></asp:ListItem>
                            <asp:ListItem Value="full">Full Time</asp:ListItem>
                            <asp:ListItem Value="part">Part Time</asp:ListItem>
                            <asp:ListItem Value="coop">Co-op</asp:ListItem>
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ID="requiredFieldStudentType" runat="server" CssClass="errorMsg errorSpan"
                            ErrorMessage="Must select one!"
                            ForeColor="Red" ControlToValidate="studentTypeList"
                            InitialValue="unselected" Display="Static"></asp:RequiredFieldValidator>
                    </div>
                    <div >
                </div>
                </div>
               
                <asp:Button ID="cmdAdd" Text="Add" runat="server" OnClick="cmdAdd_Click" type="button" class="btn btn-primary" />

                <div class="teb">
                    <div>
                        <asp:Table ID="studentsTable" runat="server" CssClass="table table-striped">
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell>ID</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Name</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Type</asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                            <asp:TableRow>
                                <asp:TableCell ID="CellOne" runat="server"></asp:TableCell>
                                <asp:TableCell ID="CellTwo" runat="server"></asp:TableCell>
                                <asp:TableCell ID="CellThree" runat="server"></asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <br />

                    <asp:HyperLink ID="registerCourseLink" NavigateUrl="RegisterCourse.aspx" runat="server">Register Courses</asp:HyperLink>
                </div>
            </form>
</body>
</html>
