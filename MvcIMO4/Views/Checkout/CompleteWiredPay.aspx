<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcIMO4.Models.OrderDetail>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	CompleteWiredPay
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:ViewRes.CheckoutStrings.CompleteWiredPay %></h2>


    <fieldset>
        <legend><%:ViewRes.CheckoutStrings.PaymentInfo %></legend>
        
        <div class="display-label"><%:ViewRes.CheckoutStrings.OrderDetailId %></div>
        <div class="display-field"><%: Model.OrderDetailId %></div>
        
        <div class="display-label"><%:ViewRes.CheckoutStrings.ordemid %></div>
        <div class="display-field"><%: Model.OrderId %></div>
        
        <div class="display-label"><%:ViewRes.CheckoutStrings.SubscricaoId%></div>
        <div class="display-field"><%: Model.SubscricaoId %></div>
        
        <div class="display-label"><%:ViewRes.CheckoutStrings.Price%></div>
        <div class="display-field"><%: String.Format("{0:F}", Model.Price) %></div>

        <div class="display-label"><%:ViewRes.CheckoutStrings.BankTransferInfo%></div>
        <div class="display-field"> 
                <%:ViewRes.CheckoutStrings.explaintranfer%> <%: Model.SubscricaoId %> <br />                    
                NIB 0035 0204 00059582530 09 <br />
                IBAN PT50 0035 0204 00059582530 09 <br />
                BIC SWIFT CGDIPTPL <br />
        </div>
        <div class="display-label"><%:ViewRes.CheckoutStrings.aftermoney%></div>
        <div class="display-field">       
            <%:ViewRes.CheckoutStrings.activeated%> <br />
            <%:ViewRes.CheckoutStrings.receiveinvoice%>      
           
        </div>
        
    </fieldset>
    <p>
      <p>
        <a href="javascript:history.go(-1)"><%:ViewRes.CheckoutStrings.Back%></a>
    </p>
  

    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>

