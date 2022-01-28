<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HandsOn.aspx.cs" Inherits="Practical_test.HandsOn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 34%;
            height: 370px;
            border-color: #CCFFFF;
        }
        .auto-style2 {
            width: 115px;
        }
        .auto-style3 {
            width: 455px;
        }
        .auto-style4 {
            width: 334px;
        }
    </style>
</head>
<body>
    <center>

        <h1 class="auto-style3">Add Employee </h1>
    </center>
  
    <form id="form1" runat="server">
        <div>
            <table align="center" class="auto-style1">
                 
                <tr>
                    <td class="auto-style2">Emp Code&nbsp; </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtEmp" runat="server" EnableViewState="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="Reqor1" runat="server" ControlToValidate="txtEmp" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Name</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Department</td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="dropDepartment" runat="server" AutoPostBack="True">
                            <asp:ListItem Selected="True">Select</asp:ListItem>
                            <asp:ListItem>Admin</asp:ListItem>
                            <asp:ListItem>Technology</asp:ListItem>
                            <asp:ListItem>Accounts</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="dropDepartment" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Gender</td>
                    <td class="auto-style4">
                        <asp:RadioButton ID="rarMale" runat="server" GroupName="G" Text="Male" />
                        <asp:RadioButton ID="rarFemale" runat="server" GroupName="G" Text="female " />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">BOD</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtBOD" runat="server" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtBOD" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Joining Date</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtJoining" runat="server" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="#FF3300" ControlToValidate="txtJoining"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Prev Experience</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtExperience" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtExperience" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Salary</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtSalary" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSalary" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Address</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtAddress" runat="server" Height="75px" TextMode="MultiLine" Width="175px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtAddress" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                    </td>
                </tr>
              

                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style4">
                        &nbsp;</td>
                </tr>
              

                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:GridView ID="GridView1" CssClass="table" runat="server" Height="144px"
                            DataKeyName="Emp_Code"
                            OnRowEditing="GridView1_RowEditing"
                            OnRowCancelingEdit="GridView1_RowCancelingEdit"
                            OnRowUpdating="GridView1_RowUpdating"
                            AutoGenerateColumns="False" >
                           <Columns>
                              <%-- <asp:BoundField headerText="Emp_Code"  DataField="Emp_Code" />--%>


                                 <asp:TemplateField headerText="Emp_Code">
                                   <ItemTemplate>
                                       <asp:Label runat="server" Text='<%# Eval("Emp_Code") %>'></asp:Label>
                                   </ItemTemplate>
                                   <EditItemTemplate>
                                          <asp:TextBox runat="server" ID="txtId" Text='<%# Bind("Emp_Code") %>'></asp:TextBox>
                                   </EditItemTemplate>
                               </asp:TemplateField>




                               <asp:TemplateField headerText="Name">
                                   <ItemTemplate>
                                       <asp:Label runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                   </ItemTemplate>
                                   <EditItemTemplate>
                                          <asp:TextBox runat="server" ID="txtName" Text='<%# Bind("Name") %>'></asp:TextBox>
                                   </EditItemTemplate>
                               </asp:TemplateField>

                                <asp:TemplateField headerText="Department">
                                   <ItemTemplate>
                                       <asp:Label runat="server" Text='<%# Eval("Department") %>'></asp:Label>
                                   </ItemTemplate>
                                   <EditItemTemplate>
                                          <asp:TextBox runat="server" ID="txtDepartment" Text='<%# Bind("Department") %>'></asp:TextBox>
                                   </EditItemTemplate>
                               </asp:TemplateField>


                            

                               <asp:TemplateField headerText="Gender">
                                   <ItemTemplate>
                                       <asp:Label runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                   </ItemTemplate>
                                   <EditItemTemplate>
                                          <asp:TextBox runat="server" ID="txtGender" Text='<%# Bind("Gender") %>'></asp:TextBox>
                                   </EditItemTemplate>
                               </asp:TemplateField>

                               <asp:TemplateField headerText="BOD">
                                   <ItemTemplate>
                                       <asp:Label runat="server" Text='<%# Eval("DOB") %>'></asp:Label>
                                   </ItemTemplate>
                                   <EditItemTemplate>
                                          <asp:TextBox runat="server" TextMode="Date" ID="txtDate" Text='<%# Bind("DOB") %>'></asp:TextBox>
                                   </EditItemTemplate>
                               </asp:TemplateField>

                               <asp:TemplateField headerText="Joining_Date">
                                   <ItemTemplate>
                                       <asp:Label runat="server" Text='<%# Eval("Joining") %>'></asp:Label>
                                   </ItemTemplate>
                                   <EditItemTemplate>
                                          <asp:TextBox runat="server" TextMode="Date" ID="txtJoining" Text='<%# Bind("Joining") %>'></asp:TextBox>
                                   </EditItemTemplate>
                               </asp:TemplateField>

                               <asp:TemplateField headerText="Previous_Experience">
                                   <ItemTemplate>
                                       <asp:Label runat="server" Text='<%# Eval("Previous_Experience") %>'></asp:Label>
                                   </ItemTemplate>
                                   <EditItemTemplate>
                                          <asp:TextBox runat="server" ID="txtExperience" Text='<%# Bind("Previous_Experience") %>'></asp:TextBox>
                                   </EditItemTemplate>
                               </asp:TemplateField>

                               <asp:TemplateField headerText="Salary">
                                   <ItemTemplate>
                                       <asp:Label runat="server" Text='<%# Eval("Salary") %>'></asp:Label>
                                   </ItemTemplate>
                                   <EditItemTemplate>
                                          <asp:TextBox runat="server" ID="txtSalary" Text='<%# Bind("Salary") %>'></asp:TextBox>
                                   </EditItemTemplate>
                               </asp:TemplateField>


                               <asp:TemplateField headerText="Address">
                                   <ItemTemplate>
                                       <asp:Label runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                   </ItemTemplate>
                                   <EditItemTemplate>
                                          <asp:TextBox runat="server" ID="txtAddress" Text='<%# Bind("Address") %>'></asp:TextBox>
                                   </EditItemTemplate>
                               </asp:TemplateField>
                               
                                                         

                               <asp:CommandField ShowEditButton="true"
                                   ControlStyle-CssClass="btn btn-primary" HeaderText="Edit Record">
<ControlStyle CssClass="btn btn-primary"></ControlStyle>
                               </asp:CommandField>
                           </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
