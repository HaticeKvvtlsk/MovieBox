﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Oyuncular.aspx.cs" Inherits="MovieBoxUI.Oyuncular" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
     <style>
        #ekle {
            text-align: start;
        }

        #baslik {
            text-align: center;
            position: unset;
        }

        .btnEkle {
            height: 30px;
            font-weight: bold;
            font-size: 12px;
            text-shadow: none;
            min-width: 100px;
            border-radius: 50px;
            line-height: 15px;
            background-color: blue;
            color: aliceblue;
        }
        
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

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
   
    <div id="baslik">
        KULLANICILAR
    </div>
    <div>

        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Insert</button>


    </div>
    <div>
    </div>

    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="Oyuncu ID">
                    <ItemTemplate>
                        <asp:Label ID="lblOyuncuId" runat="server" Text='<%#Eval("OyuncuId")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Oyuncu Adı">
                    <ItemTemplate>
                        <asp:Label ID="lblOyuncuAdi" runat="server" Text='<%#Eval("OyuncuAdi")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtOyuncuAdi" MaxLength="15" runat="server" Text='<%#Eval("OyuncuAdi")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Oyuncu Soyadı">
                    <ItemTemplate>
                        <asp:Label ID="lblOyuncuSoyadi" runat="server" Text='<%#Eval("OyuncuSoyadi")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtOyuncuSoyadi" MaxLength="15" runat="server" Text='<%#Eval("OyuncuSoyadi")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
               
                <asp:TemplateField HeaderText="DogumTarihi">
                    <ItemTemplate>
                        <asp:Label ID="lblDogumTarihi" runat="server" Text='<%#Eval("DogumTarihi")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDogumTarihi" MaxLength="15" runat="server" Text='<%#Eval("DogumTarihi")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Cinsiyet">
                    <ItemTemplate>
                        <asp:Label ID="lblCinsiyet" runat="server" Text='<%#Eval("Cinsiyet")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCinsiyet" MaxLength="15" runat="server" Text='<%#Eval("Cinsiyet")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Ülkesi">
                    <ItemTemplate>
                        <asp:Label ID="lblUlkesi" runat="server" Text='<%#Eval("Ulkesi")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtUlkesi" MaxLength="15" runat="server" Text='<%#Eval("Ulkesi")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Oyuncu Ödülleri">
                    <ItemTemplate>
                        <asp:Label ID="lblOyuncuOdulleri" runat="server" Text='<%#Eval("OyuncuOdulleri")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtOyuncuOdulleri" runat="server" Text='<%#Eval("OyuncuOdulleri")%>'></asp:TextBox>
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
                        <asp:Button ID="BtnDelete" runat="server" Text="Sil" CommandName="Delete" CommandArgument='<%#Eval("OyuncuId")%>' />
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
                    <h5 class="modal-title">Kullanıcı Ekleme Formu</h5>
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
                                        <b>Oyuncu Adı : </b>
                                        <br />
                                        <asp:TextBox ID="txtOyuncuAdi" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <b>Oyuncu Soyadı : </b>
                                        <br />
                                        <asp:TextBox ID="txtOyuncuSoyadi" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <b>Doğum Tarihi : </b>
                                        <br />
                                        <asp:TextBox ID="txtdate" type="date" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <b>Cinsiyet : </b>
                                        <br />
                                        <br />
                                        <asp:RadioButton ID="cinsK" GroupName="Cins" runat="server" Text="Kadın" />
                                        <br />
                                        <asp:RadioButton ID="cinsE" GroupName="Cins" runat="server" Text="Erkek" />

                                    </div>
                                    <div class="form-group">
                                        <b>Ülkesi : </b>
                                        <br />
                                        <asp:TextBox ID="txtUlkesi" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <b>Oyuncu Ödülleri : </b>
                                        <br />
                                        <asp:TextBox ID="txtOyuncuOdullleri" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    

                                </div>

                            </div>
                        </div>
                    </div>
                </section>

                <div class="modal-footer">

                    <asp:Button ID="btnKaydet" runat="server" Text="Kaydet" OnClick="btnKaydet_Click"/>
                    <asp:Button ID="btnKapat" runat="server" Text="Vazgeç" data-dismiss="modal" /><br />
                    <br />


                </div>
            </div>
        </div>
    </div>
    </form>
</asp:Content>