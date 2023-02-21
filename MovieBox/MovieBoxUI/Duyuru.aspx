<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Duyuru.aspx.cs" Inherits="MovieBoxUI.Duyuru" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
      <style type="text/css">

        table {
            table-layout: fixed;
            width: stretch;
        }

            table th {
                font-size: .85em;
                text-transform: capitalize;
                text-align: center;
               
            }

            table td {
                white-space: unset;
                overflow: hidden;
                text-overflow: clip;
                text-align: center;
              
            }

        .header {
            text-align: center;
            position: unset;
        }
    </style>
<%--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">--%>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <div class="table-filmler">
        <div class="header">
            DUYURULAR
        </div>

        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Insert</button>
        <div class="body"></div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" CellPadding="0">
            <Columns>
                 <asp:TemplateField HeaderText="Duyuru ID">
                    <ItemTemplate>
                        <asp:Label ID="lblDuyuruId" runat="server" Text='<%#Eval("FilmId")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Duyuru ID">
                    <ItemTemplate>
                        <asp:Label ID="lblDuyuruId" runat="server" Text='<%#Eval("FilmId")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="KullaniciId">
                    <ItemTemplate>
                        <asp:Label ID="lblKullaniciId" runat="server" Text='<%#Eval("KullaniciId")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 
                <asp:TemplateField HeaderText="Duyuru İçerik">
                    <ItemTemplate>
                        <asp:Label ID="lblicerik" runat="server" Text='<%#Eval("duyuruIcerik")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txticerik" MaxLength="15" runat="server" Text='<%#Eval("duyuruIcerik")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tarih">
                    <ItemTemplate>
                        <asp:Label ID="lblTarih" runat="server" Text='<%#Eval("Tarih")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTarih" MaxLength="15" runat="server" Text='<%#Eval("Tarih")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
               

                <asp:TemplateField HeaderText="isDeleted">
                    <ItemTemplate>
                        <asp:Label ID="lblisDeleted" runat="server" Text='<%#Eval("isDeleted")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtisDeleted" MaxLength="15" runat="server" Text='<%#Eval("isDeleted")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="BtnDelete" runat="server" Text="Sil" CommandName="Delete" CommandArgument='<%#Eval("DuyuruId")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="BtnEdit" runat="server" Text="Düzenle" CommandName="Edit" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button ID="BtnUpdate" runat="server" Text="Güncelle" CommandName="Update" />
                        <asp:Button ID="BtnCancel" runat="server" Text="Vazgeç" CommandName="Cancel" />
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>
        
    </div>
    <div id="exampleModal" class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Duyuru Ekleme Formu</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <section class="section">
                    <div class="section-header">
                    </div>
                    <div class="section-body">
                        <div>
                            <div class="card">
                                <div class="card-body">
                                    
                                    <div class="form-group">
                                        <b>Duyuru İçerik : </b>
                                        <br />
                                        <asp:TextBox ID="txtduyuruIcerik" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <b>Tarihi : </b>
                                        <br />
                                        <asp:TextBox ID="txtTarih" type="date" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                   
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <div class="modal-footer">

                    <asp:Button ID="btnKaydet" runat="server" Text="Kaydet" OnClick="btnKaydet_Click" />
                    <asp:Button ID="btnKapat" runat="server" Text="Vazgeç" data-dismiss="modal" /><br />
                    <br />


                </div>
            </div>
        </div>
    </div>
        </form>
</asp:Content>
