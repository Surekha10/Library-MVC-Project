<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="SearchAdmin.aspx.cs" Inherits="SearchAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <script>
          $(document).ready(function () {

              $("#main_btn_newBook").click(function () {
                  if ($("#main_txt_search").val().length == 0) {
                      $("#main_txt_search_error").show();
                      $("#main_txt_search").focus();
                      return false;
                  }
                  else {
                      $("#main_txt_search_error").hide();
                  }
              });
          });
          </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
    <div align="center">
      <div class="form-group" style="text-align:left;width:35%">
                <label class="form-control-static">Search Key :</label>
                <asp:TextBox ID="txt_search" runat="server" CssClass="form-control" />
            <label for="txt_search" id="txt_search_error" class="text-danger">*</label>
            </div>
            <div class="form-group">
                <asp:Button ID="btn_search" runat="server" Text="Search" CssClass="btn-danger" OnClick="btn_search_Click" />
            </div>
        <div class="form-group">
            <asp:GridView ID="gv_books" runat="server" CssClass="table" AutoGenerateColumns="false" OnSelectedIndexChanged="gv_books_SelectedIndexChanged">
                <Columns>

                    <asp:TemplateField HeaderText="Book ID" >
                        <ItemTemplate>
                            <asp:Label ID="lbl_bid" runat="server" Text='<% # Eval("BookID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                      <asp:TemplateField HeaderText="Book Name" >
                        <ItemTemplate>
                            <asp:Label ID="lbl_bname" runat="server" Text='<% # Eval("BookName") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Book Author" >
                        <ItemTemplate>
                            <asp:Label ID="lbl_bAuthor" runat="server" Text='<% # Eval("BookAuthor") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Book Title" >
                        <ItemTemplate>
                            <asp:Label ID="lbl_bTitle" runat="server" Text='<% # Eval("BookTitle") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Book Price" >
                        <ItemTemplate>
                            <asp:Label ID="lbl_bPrice" runat="server" Text='<% # Eval("BookPrice") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Book AddDate" >
                        <ItemTemplate>
                            <asp:Label ID="lbl_bAddDate" runat="server" Text='<% # Eval("BookAddDate") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="NoOf Pages" >
                        <ItemTemplate>
                            <asp:Label ID="lbl_bNoofPages" runat="server" Text='<% # Eval("NoOfPages") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>



                      <asp:TemplateField HeaderText="Book Image" >
                        <ItemTemplate>
                            <asp:Image ID="lbl_img" runat="server" ImageUrl='<% # Eval("BookImage") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                  

                </Columns>
            </asp:GridView>
        </div>
        </div>
</asp:Content>

