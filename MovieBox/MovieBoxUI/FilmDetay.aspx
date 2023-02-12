<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FilmDetay.aspx.cs" Inherits="MovieBoxUI.FilmDetay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="/lib/bootstrap.min.css">
       <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
     <script src="/lib/jquery-1.12.2.min.js"></script>
    <script src="/lib/bootstrap.min.js"></script>
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
</head>
<body>
    <form id="form1" runat="server">
     <div id="myModal" class="modal" tabindex="-1" role="dialog">
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
                          
                            <b>Film Id :</b>
                            <br />
                            <asp:TextBox ID="txtFilmID" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
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
                            <asp:TextBox ID="txtFilmKonusu" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
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
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <b>Kategori : </b>
                                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <b>Oyuncu : </b>
                                <asp:DropDownList runat="server" ID="Oyuncuddl" CssClass="form-control" ItemType="Checkbox">
                                </asp:DropDownList>
                             </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnGuncelle" CssClass="btn btn-success" runat="server" Text="Guncelle" OnClick="btnGuncelle_Click" />
                       <asp:Button ID="btnKapat" CssClass="btn btn-warning" runat="server" Text="Vazgeç" OnClick="btnKapat_Click" />
                         </div>
                </section>


            </div>
        </div>
    </div>

        </form>
</body>
       <script>
           $(function () {
               $("#myModal").modal("show");
           });
       </script>
</html>
