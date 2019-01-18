<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewAdmin.aspx.cs" Inherits="NewAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="JS/jquery-1.10.2.js"></script>
    <script src="JS/jquery-ui.js"></script>
    <script src="JS/bootstrap.js"></script>
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <link href="CSS/jquery-ui.css" rel="stylesheet" />
     <script>
        $(document).ready(function () {
            $(".text-danger").hide();
            $("#btn_newAdmin").click(function () {
                if ($("#txt_Adminname").val().length == 0)
                {
                    $("#txt_Adminname_error").show();
                    $("#txt_Adminname").focus();
                    return false;
                }
                else
                {
                    $("#txt_Adminname_error").hide();
                }
                if ($("#txt_Adminemailid").val().length == 0)
                {
                    $("#txt_Adminemailid_error").show();
                    $("txt_Adminemailid").focus();
                    return false;
                }
                else
                {
                    $("#txt_Adminemailid_error").hide();
                }
                if ($("#txt_Adminpassword").val().length == 0) {
                    $("#txt_Adminpassword_error").show();
                    $("#txt_Adminpassword").focus();
                    return false;
                }
                else
                {
                    $("#txt_Adminpassword_error").hide();
                }
                if ($("#txt_AdminMobileNo").val().length == 0) {
                    $("#txt_AdminMobileNo_error").show();
                    $("#txt_AdminMobileNo").focus();
                    return false;
                }
                else
                {
                    $("#txt_AdminMobileNo_error").hide();
                }
                 });
     });
    </script>

</head>
<body>
    
   <div align="center">
    <form id="form2" runat="server" class="Container" style="text-align:left;width:25%">
    <div class="form-group">
        <label for="txt_Adminname" class="form-control-plaintext">Admin Name :</label>
        <asp:TextBox ID="txt_Adminname" runat="server" CssClass="form-control" />
        <label for="txt_Adminname" id="txt_Adminname_error" class="text-danger">*</label>
    </div>
    <div class="form-group">
        <label for="txt_Adminemailid" class="form-control-plaintext">Admin Email ID :</label>
        <asp:TextBox ID="txt_Adminemailid" runat="server" CssClass="form-control" />
        <label for="txt_Adminemailid" id="txt_Adminemailid_error" class="text-danger">*</label>
    </div>
    <div class="form-group">
        <label for="txt_Adminpassword" class="form-control-plaintext">Admin Password :</label>
        <asp:TextBox ID="txt_Adminpassword" runat="server" CssClass="form-control" />
        <label for="txt_Adminpassword" id="txt_Adminpassword_error" class="text-danger">*</label>
    </div>
        <div class="form-group">
        <label for="txt_AdminMobileNo" class="form-control-plaintext">Admin Mobile No :</label>
        <asp:TextBox ID="txt_AdminMobileNo" runat="server" CssClass="form-control" />
        <label for="txt_AdminMobileNo" id="txt_AdminMobileNo_error" class="text-danger">*</label>
    </div>
        <div class="form-group">
        <asp:Button ID="btn_newAdmin" runat="server" Text="NewAdmin" CssClass="btn-danger" OnClick="btn_newAdmin_Click" />
        <asp:Label ID="lbl_msg" runat="server" CssClass="text-danger" />
        <br />
        <a href="Login.aspx" class="btn-link" style="width:200px">Login</a>
    </div>
    </form>

       </div>

</body>
</html>
