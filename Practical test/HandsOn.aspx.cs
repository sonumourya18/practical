using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practical_test
{
    public partial class HandsOn : System.Web.UI.Page
    {
        
        SqlConnection conn  = new SqlConnection(ConfigurationManager.ConnectionStrings["Constr"].ToString());
        SqlCommand cmd;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //ShowData();
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string Gender = null;
            conn.Open();
            cmd = new SqlCommand("usp_Insert", conn);
            if (rarMale.Checked)
                Gender = rarMale.Text;
            else if (rarFemale.Checked)
                Gender = rarFemale.Text;
          
            cmd.Parameters.AddWithValue("@Emp_Code", txtEmp.Text);
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@Department", dropDepartment.SelectedValue);
            cmd.Parameters.AddWithValue("@Gender", Gender);
            cmd.Parameters.AddWithValue("@DOB",txtBOD.Text);
            cmd.Parameters.AddWithValue("@Joining",txtJoining.Text);
            cmd.Parameters.AddWithValue("@Previous_Experience",txtExperience.Text);
            cmd.Parameters.AddWithValue("@Salary",txtSalary.Text);
            cmd.Parameters.AddWithValue("@Address",txtAddress.Text);          
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
          
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
                
                Response.Write("Data Inserted");
            conn.Close();
            ShowData();


        }

        public void ShowData()
        {
            cmd = new SqlCommand("usp_display", conn);
            conn.Open();
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                GridView1.DataSource = dr;
                GridView1.DataBind();
            }
            conn.Close();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            ShowData();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            ShowData();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
          
            string Code = (GridView1.Rows[e.RowIndex].FindControl("txtId") as TextBox).Text;
            string Name = (GridView1.Rows[e.RowIndex].FindControl("txtName") as TextBox).Text;
            string Department = (GridView1.Rows[e.RowIndex].FindControl("txtDepartment") as TextBox).Text;
            string Gender = (GridView1.Rows[e.RowIndex].FindControl("txtGender") as TextBox).Text;
            string BOD = (GridView1.Rows[e.RowIndex].FindControl("txtDate") as TextBox).Text;
            string Joining = (GridView1.Rows[e.RowIndex].FindControl("txtJoining") as TextBox).Text;
            int Experience = Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("txtExperience") as TextBox).Text);
            int Salary = Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("txtSalary") as TextBox).Text);
            string Address = (GridView1.Rows[e.RowIndex].FindControl("txtAddress") as TextBox).Text;
            

            conn.Open();
            cmd = new SqlCommand("usp_employee_Updata", conn);

            cmd.Parameters.AddWithValue("@Emp_Code", Code);
            cmd.Parameters.AddWithValue("@Name", Name);
            cmd.Parameters.AddWithValue("@Department", Department);
            cmd.Parameters.AddWithValue("@Gender", Gender);
            cmd.Parameters.AddWithValue("@DOB", BOD);
            cmd.Parameters.AddWithValue("@Joining", Joining);
            cmd.Parameters.AddWithValue("@Previous_Experience", Experience);
            cmd.Parameters.AddWithValue("@Salary", Salary);
            cmd.Parameters.AddWithValue("@Address", Address);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            int a = cmd.ExecuteNonQuery();
            if (a > 0)

                Response.Write("Data Updated");
            conn.Close();
            GridView1.EditIndex = -1;
            ShowData();
           
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

            string Gender = null;
            if (rarMale.Checked)
                Gender = rarMale.Text;
            else if (rarFemale.Checked)
                Gender = rarFemale.Text;

            txtEmp.Text = "";       
            txtName.Text="";
            dropDepartment.SelectedValue="";
            Gender = "";
            txtBOD.Text="";
            txtJoining.Text="";
            txtExperience.Text="";
            txtSalary.Text="";
            txtAddress.Text="";
        }
    }
}