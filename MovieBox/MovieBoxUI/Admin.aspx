<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="MovieBoxUI.Admin1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        body {
            font-family: "Open Sans", sans-serif;
            line-height: 1.25;
        }

        table {
            table-layout: fixed;
            width: stretch;
        }

            table th {
                background: #999;
                color: #fff;
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


        .table-title .add-new i {
            margin-right: 4px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <div class="table-filmler">
        <div class="header">
            FİLMLER
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Insert</button>

        </div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="FilmId">
                    <ItemTemplate>
                        <asp:Label ID="lblFilmId" runat="server" Text='<%#Eval("FilmId")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FilmAdi">
                    <ItemTemplate>
                        <asp:Label ID="lblFilmAdi" runat="server" Text='<%#Eval("FilmAdi")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFilmAdi" MaxLength="15" runat="server" Text='<%#Eval("FilmAdi")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VizyonTarihi">
                    <ItemTemplate>
                        <asp:Label ID="lblVizyonTarihi" runat="server" Text='<%#Eval("VizyonTarihi")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtVizyonTarihi" MaxLength="15" runat="server" Text='<%#Eval("VizyonTarihi")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FilmSuresi">
                    <ItemTemplate>
                        <asp:Label ID="lblFilmSuresi" runat="server" Text='<%#Eval("FilmSuresi")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFilmSuresi" MaxLength="15" runat="server" Text='<%#Eval("FilmSuresi")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Konusu">
                    <ItemTemplate>
                        <asp:Label ID="lblKonusu" runat="server" Text='<%#Eval("Konusu")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtKonusu" MaxLength="15" runat="server" Text='<%#Eval("Konusu")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="FilmOdul">
                    <ItemTemplate>
                        <asp:Label ID="lblFilmOdul" runat="server" Text='<%#Eval("FilmOdul")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFilmOdul" MaxLength="15" runat="server" Text='<%#Eval("FilmOdul")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="YasSiniri">
                    <ItemTemplate>
                        <asp:Label ID="lblYasSiniri" runat="server" Text='<%#Eval("YasSiniri")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtYasSiniri" MaxLength="15" runat="server" Text='<%#Eval("YasSiniri")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Ulkesi">
                    <ItemTemplate>
                        <asp:Label ID="lblUlkesi" runat="server" Text='<%#Eval("Ulkesi")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtUlkesi" MaxLength="15" runat="server" Text='<%#Eval("Ulkesi")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="FilmResim">
                    <ItemTemplate>
                        <asp:Label ID="lblFilmResim" runat="server" Text='<%#Eval("FilmResim")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFilmResim" MaxLength="15" runat="server" Text='<%#Eval("FilmResim")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Video">
                    <ItemTemplate>
                        <asp:Label ID="lblVideo" runat="server" Text='<%#Eval("Video")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtVideo" MaxLength="15" runat="server" Text='<%#Eval("Video")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="FragmanSuresi">
                    <ItemTemplate>
                        <asp:Label ID="lblFragmanSuresi" runat="server" Text='<%#Eval("FragmanSuresi")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFragmanSuresi" MaxLength="15" runat="server" Text='<%#Eval("FragmanSuresi")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FragmanVideo">
                    <ItemTemplate>
                        <asp:Label ID="lblFragmanVideo" runat="server" Text='<%#Eval("FragmanVideo")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFragmanVideo" MaxLength="15" runat="server" Text='<%#Eval("FragmanVideo")%>'></asp:TextBox>
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

                <asp:TemplateField HeaderText="YonetmenId">
                    <ItemTemplate>
                        <asp:Label ID="lblYonetmenId" runat="server" Text='<%#Eval("YonetmenId")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtYonetmenId" MaxLength="15" runat="server" Text='<%#Eval("YonetmenId")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="KategoriId">
                    <ItemTemplate>
                        <asp:Label ID="lblKategoriId" runat="server" Text='<%#Eval("KategoriId")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtKategoriId" MaxLength="15" runat="server" Text='<%#Eval("KategoriId")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="BtnDelete" runat="server" Text="Sil" CommandName="Delete" CommandArgument='<%#Eval("FilmId")%>' />
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
                    <h5 class="modal-title">Film Ekleme Formu</h5>
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
                                        <b>Film Adı : </b>
                                        <br />
                                        <asp:TextBox ID="txtFilmAdi" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <b>Vizyon Tarihi : </b>
                                        <br />
                                        <asp:TextBox ID="txtVizyonTarihi" type="date" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <b>Film Süresi : </b>
                                        <br />
                                        <asp:TextBox ID="txtFilmSüresi" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <b>Konusu :</b>
                                        <br />
                                        <asp:TextBox ID="txtFilmKonusu" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <b>Film Ödül : </b>
                                        <br />
                                        <asp:TextBox ID="txtodul" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <b>Yaş Sınırı : </b>
                                        <br />
                                        <asp:TextBox ID="txtYasSiniri" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <b>Ülkesi : </b>
                                        <br />
                                        <asp:TextBox ID="txtulke" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <b>Resim : </b>
                                        <br />
                                        <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />


                                        <div class="form-group">
                                            <b>Video : </b>
                                            <br />
                                            <asp:TextBox ID="txtVideo" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <b>Fragman Süresi : </b>
                                            <br />
                                            <asp:TextBox ID="txtFragmanSuresi" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <b>Fragman Video : </b>
                                            <br />
                                            <asp:TextBox ID="txtFragmanVideo" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <b>Yonetmen : </b>
                                            <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <b>Kategori : </b>
                                            <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
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


</asp:Content>
