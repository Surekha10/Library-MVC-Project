using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


/// <summary>
/// Summary description for LibraryDAL
/// </summary>
public class LibraryDAL
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

    public bool Login(LoginModel model)
    {
        SqlCommand com_login = new SqlCommand("proc_login", con);
        com_login.Parameters.AddWithValue("@id", model.LoginId);
        com_login.Parameters.AddWithValue("@password", model.Password);
        com_login.CommandType = CommandType.StoredProcedure;
        SqlParameter para_ret = new SqlParameter();
        para_ret.Direction = ParameterDirection.ReturnValue;
        com_login.Parameters.Add(para_ret);
        con.Open();
        com_login.ExecuteNonQuery();
        con.Close();
        int count = Convert.ToInt32(para_ret.Value);
        if (count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public int AddStudent(NewStudentModel model)
    {
        SqlCommand com_addstudent = new SqlCommand("proc_addstudent",con);
        com_addstudent.Parameters.AddWithValue("@name", model.StudentName);
        com_addstudent.Parameters.AddWithValue("@emailid", model.StudentEmailId);
        com_addstudent.Parameters.AddWithValue("@password", model.StudentPassword);
        com_addstudent.Parameters.AddWithValue("@city", model.StudentCity);
        com_addstudent.Parameters.AddWithValue("@address", model.StudentAddress);
        com_addstudent.Parameters.AddWithValue("@dob", model.StudentDOB);
        com_addstudent.Parameters.AddWithValue("@mobileno", model.StudentMobileNo);
        com_addstudent.Parameters.AddWithValue("@image", model.StudentImage);
        com_addstudent.CommandType = CommandType.StoredProcedure;
        SqlParameter para_ret = new SqlParameter();
        para_ret.Direction = ParameterDirection.ReturnValue;
        com_addstudent.Parameters.Add(para_ret);
        con.Open();
        com_addstudent.ExecuteNonQuery();
        con.Close();
        int id = Convert.ToInt32(para_ret.Value);
        return id;
    }
    public List<NewStudentModel> search(string key)
    {
        SqlCommand com_search = new SqlCommand("proc_searchstudent",con);
        com_search.Parameters.AddWithValue("@key", key);
        com_search.CommandType = CommandType.StoredProcedure;
        con.Open();
        SqlDataReader dr = com_search.ExecuteReader();
        List<NewStudentModel> list = new List<NewStudentModel>();
        while (dr.Read())
        {
            NewStudentModel model = new NewStudentModel();
            model.StudentID = dr.GetInt32(0);
            model.StudentName = dr.GetString(1);
            model.StudentEmailId = dr.GetString(2);
            model.StudentPassword = dr.GetString(3);
            model.StudentCity = dr.GetString(4);
            model.StudentAddress = dr.GetString(5);
            model.StudentDOB = dr.GetDateTime(6);
            model.StudentMobileNo = dr.GetString(7);
            model.StudentImage = dr.GetString(8);
            list.Add(model);
        }
        con.Close();
        return list;
    }

    public int AddBooks(BookModel model)
    {
        SqlCommand com_addAdmin = new SqlCommand("proc_addBook1", con);
        com_addAdmin.Parameters.AddWithValue("@name", model.BookName);
        com_addAdmin.Parameters.AddWithValue("@author", model.BookAuthor);
        com_addAdmin.Parameters.AddWithValue("@title", model.BookTitle);
        com_addAdmin.Parameters.AddWithValue("@price", model.BookPrice);
        com_addAdmin.Parameters.AddWithValue("@date", model.BookAddDate);
        com_addAdmin.Parameters.AddWithValue("@pages", model.NoOfPages);
        com_addAdmin.Parameters.AddWithValue("@image", model.BookImage);
        com_addAdmin.CommandType = CommandType.StoredProcedure;
        SqlParameter para_ret = new SqlParameter();
        para_ret.Direction = ParameterDirection.ReturnValue;
        com_addAdmin.Parameters.Add(para_ret);
        con.Open();
        com_addAdmin.ExecuteNonQuery();
        con.Close();
        int id = Convert.ToInt32(para_ret.Value);
        return id;
    }

    public List<BookModel> Search(string key)
    {
        SqlCommand com_search = new SqlCommand("proc_searchBook", con);
        com_search.Parameters.AddWithValue("@key", key);
        com_search.CommandType = CommandType.StoredProcedure;
        con.Open();
        SqlDataReader dr = com_search.ExecuteReader();

        List<BookModel> list = new List<BookModel>();
        while (dr.Read())
        {
            BookModel model = new BookModel();
            model.BookID= dr.GetInt32(0);
            model.BookName = dr.GetString(1);
            model.BookAuthor = dr.GetString(2);
            model.BookTitle = dr.GetString(3);
            model.BookPrice = dr.GetInt32(4);
            model.BookAddDate = dr.GetDateTime(5);
            model.NoOfPages = dr.GetInt32(6);
            model.BookImage = dr.GetString(7);
            list.Add(model);
        }
        con.Close();
        return list;
    }

    public BookModel FindBook(string id)
    {
        SqlCommand com_find = new SqlCommand("proc_FindBook", con);
        com_find.Parameters.AddWithValue("@id",id);
        com_find.CommandType = CommandType.StoredProcedure;
        con.Open();
        SqlDataReader dr = com_find.ExecuteReader();
        if (dr.Read())
        {
            BookModel model = new BookModel();
            model.BookID= dr.GetInt32(0);
            model.BookName = dr.GetString(1);
            model.BookAuthor = dr.GetString(2);
            model.BookTitle = dr.GetString(3);
            model.BookPrice = dr.GetInt32(4);
            model.BookAddDate =dr.GetDateTime(5);
            model.NoOfPages = dr.GetInt32(6);
            model.BookImage = dr.GetString(7);
            con.Close();
            return model;

        }
        con.Close();
        return null;


    }

   public int IssueBook(int bid,int sid)
    {
        SqlCommand com_IssueBook = new SqlCommand("proc_IssueBook", con);
        com_IssueBook.Parameters.AddWithValue("@bid",bid);
        com_IssueBook.Parameters.AddWithValue("@sid", sid);
        com_IssueBook.CommandType = CommandType.StoredProcedure;
        SqlParameter para_ret = new SqlParameter();
        para_ret.Direction = ParameterDirection.ReturnValue;
        com_IssueBook.Parameters.Add(para_ret);
        con.Open();
        com_IssueBook.ExecuteNonQuery();
        con.Close();
        int id = Convert.ToInt32(para_ret.Value);
        return id;
    }

   public List<BookModel> Show(int sid)
    {
        SqlCommand com_Show = new SqlCommand("proc_ShowBook", con);
        com_Show.Parameters.AddWithValue("@sid",sid);
        com_Show.CommandType = CommandType.StoredProcedure;
        con.Open();
        SqlDataReader dr = com_Show.ExecuteReader();

        List<BookModel> list = new List<BookModel>();
        while (dr.Read())
        {
            BookModel model = new BookModel();
            model.BookID = dr.GetInt32(0);
            model.BookName = dr.GetString(1);
            model.BookAuthor = dr.GetString(2);
            model.BookTitle = dr.GetString(3);
            model.BookPrice = dr.GetInt32(4);
            model.BookAddDate = dr.GetDateTime(5);
            model.NoOfPages = dr.GetInt32(6);
            model.BookImage = dr.GetString(7);
            list.Add(model);
        }
        con.Close();
        return list;

    }


}

