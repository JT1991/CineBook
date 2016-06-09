<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 
     
    <link href="../Content/owl.carousel.css" rel="stylesheet" />
    <link href="../Content/owl.theme.css" rel="stylesheet" />
    <link href="../Content/owl.transitions.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../StyleSheet.css" rel="stylesheet" />
     <style>

    #owl-demo .item{
      margin: 70px;
    }
    #owl-demo .item img{
      display: block;
      width: 100%;
      height: 300px;
    }

        .auto-style1 {
            width: 221px;
            height: 48px;
        }

    </style>
     <div id="owl-demo">
        
      <div class="item"><img src="Images/carousel1.jpg" alt="Star Wars: Force Awakens"/></div>
      <div class="item"><img src="Images/carousel2.jpg" alt="Spectre"/></div>
      <div class="item"><img src="Images/carousel3.jpg" alt="Bridge Of Spies"/></div>
      <div class="item"><img src="Images/carousel4.jpg" alt="Carol"/></div>
      <div class="item"><img src="Images/carousel5.jpg" alt="Sicario"/></div>
      <div class="item"><img src="Images/carousel6.jpg" alt="Black Mass"/></div>
      <div class="item"><img src="Images/carousel7.jpg" alt="The Martian"/></div>

     
    </div>
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
                    <h1>Greenwich Cinemas</h1>
                    <h2>Experiance Film </h2>
    <script src="~/Scripts/jquery-1.9.1.min.js"></script>
    <script src="~/Scripts/owl.carousel.js"></script>
    <script>


        $(document).ready(function () {

            $("#owl-demo").owlCarousel({

                autoPlay: 3000, //Set AutoPlay to 3 seconds

                items: 4,
                itemsDesktop: [1199, 3],
                itemsDesktopSmall: [979, 3]

            });

        });
        </script>
</asp:Content>
