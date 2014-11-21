<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcIMO4.Models.OrdemdeCompra>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	CompletePay
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">

         <%
            string orda = Model.OrderId.ToString();            
         %>

        <input type="hidden" name="cmd" value="_cart">
        <input type="hidden" name="upload" value="1">
        <input type="hidden" name="business" value="seller_1279819470_biz@hotmail.com">  
        <input type="hidden" name="tx" value="TransactionID">    
        <%=Html.Hidden("custom",orda)%>
        <input type="hidden" name="currency_code" value="EUR">

        <%=Html.Hidden("return","http://www.imo4.com"+Url.Action("PDT","PayPal"))%>
        <%=Html.Hidden("cancel_return", "http://www.imo4.com") %>
        
        <% var ordensitem=(from ord in Model.OrderDetails
                           where ord.OrderId==Model.OrderId
                           select ord);
           int itemIndex = 1;
           foreach (var item in ordensitem)
           { %>                       
                 <% decimal dec = Convert.ToDecimal(item.Price);  %>
                 <% string ammount = dec.ToLocalCurrency().ToString();%> 
                 <%                
                     System.Globalization.CultureInfo culture = new System.Globalization.CultureInfo("en-US");
                     string valor = String.Format(culture, "{0:0.00}", dec);                
                 %>
                 <%=Html.Hidden("item_name_"+itemIndex,item.subscrico.id)%>          
                 <%=Html.Hidden("amount_" + itemIndex, valor)%>
                 <%=Html.Hidden("item_number_" +itemIndex,item.SubscricaoId)%>
                 <%=Html.Hidden("quantity_" +itemIndex,"1")%>       
        <%itemIndex++;
           } %> 
                 
        <div class="checkout-button">
                <input type="image" src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" align="left" style="margin-right:7px;" />
        </div>

      </form>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>
