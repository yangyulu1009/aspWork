<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditMovie.aspx.cs" Inherits="EditMovie" MaintainScrollPositionOnPostBack="true"%>

<asp:Content ID="Header1" ContentPlaceHolderID="ContentPlaceHolderHeader" runat="server">
     <style>.addbtn { float:right; width:100px; height:28px; position:relative; top:9px; right:2px; } .gridheader {text-align:center; height:40px;font-family:'Microsoft YaHei';font-weight:normal;} .griditem {text-align:center;height: 40px;font-family:'Microsoft YaHei';font-weight:normal;} .gridEdit {text-align:center;width:5%;}</style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">

   <form id="form1" runat="server">
       <h1 style="float:left;padding:5px;">相关新闻</h1>
        <asp:Button Runat="server" ID="addNews" onClick="btnAdd_Click" text="添加新闻" CssClass="addbtn"/>

       
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceNews" Width="100%" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" >
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="content" HeaderText="新闻内容" SortExpression="content" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="url" HeaderText="新闻链接" SortExpression="url" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="release_date" HeaderText="发布日期" SortExpression="release_date" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                </asp:BoundField>
                <asp:CommandField CancelText="取消" DeleteText="删除" EditText="编辑" ShowDeleteButton="True" ShowEditButton="True" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                </asp:CommandField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" ForeColor="#663399" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceNews" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>" 
            SelectCommand="SELECT [id], [content], [url], [release_date] FROM [news] WHERE ([movie_id] = @id) ORDER by [id] ASC"
            DeleteCommand="DELETE FROM news WHERE (id = @id)"
            UpdateCommand="Update news set content=@content, url=@url, release_date=@release_date WHERE (id=@id)">
            
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" DefaultValue="1" />
            </SelectParameters>
        </asp:SqlDataSource>


        <h1 style="padding:10px;margin-top:50px">相关图片</h1>
       <table runat="server" style="width:100%;" >
           <tr>
               <td style="width:300px;text-align:center"><img runat="server" id="ImageIcon" style="background-color:#eeeeee" src="<%# mMovie.icon %>"/></td>
               <td><asp:TextBox ID="TextBox1" runat="server" style="width:100%;" AutoPostBack="true"/></td>
              
               <td><asp:Button runat="server" ID="updateIcon" Text="更新" OnClick="updateIconClick"/></td>
           </tr>


       </table>


    </form>

        


</asp:Content>