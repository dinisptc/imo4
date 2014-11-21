<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<int>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Complete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <h2>
        Checkout Complete
    </h2>

    <p>
        Thanks for your order! Your order number is:
        <%: Model %>
    </p>

    <p>
        How about shopping for some more music in our 
        <%: Html.ActionLink("store", "Index", "Home") %>?
    </p>


        <form id="Paypal" name="Paypal" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">

            <%=Html.Hidden("cmd", "_cart")%>
            <%=Html.Hidden("upload", "1")%>
            <%=Html.Hidden("business", this.SiteData().PayPalBusinessEmail)%>
            <%=Html.Hidden("custom", this..CurrentCart().UserName.ToString())%>
            <%=Html.Hidden("tax_cart", this.CurrentCart().TaxAmount.ToLocalCurrency())%>
            <%=Html.Hidden("currency_code", this.SiteData().CurrencyCode)%>
            
            <%=Html.Hidden("return", Url.Action("pdt","paypal"))%>
            <%=Html.Hidden("cancel_return", Url.Action("Show","Order"))%>
      
        <%if(this.CurrentCart().ShippingAddress!=null){ %>

            <%=Html.Hidden("first_name", this.CurrentCart().ShippingAddress.FirstName)%>
            <%=Html.Hidden("last_name", this.CurrentCart().ShippingAddress.LastName)%>
            <%=Html.Hidden("address1", this.CurrentCart().ShippingAddress.Street1)%>
            <%=Html.Hidden("address2", this.CurrentCart().ShippingAddress.Street2)%>
            <%=Html.Hidden("city", this.CurrentCart().ShippingAddress.City)%>
            <%=Html.Hidden("state", this.CurrentCart().ShippingAddress.StateOrProvince)%>
            <%=Html.Hidden("country", this.CurrentCart().ShippingAddress.Country)%>
            <%=Html.Hidden("zip", this.CurrentCart().ShippingAddress.Zip)%>

        <%} 
        int itemIndex = 1;
        foreach(var item in this.CurrentCart().Items){ %>

            <%=Html.Hidden("item_name_"+itemIndex, item.Product.Name)%>
            <%=Html.Hidden("amount_" + itemIndex, item.Product.Price.ToLocalCurrency())%>
            <%=Html.Hidden("item_number_" + itemIndex, item.Product.SKU)%>
            <%=Html.Hidden("quantity_" + itemIndex, item.Quantity.ToString())%>
            <%=Html.Hidden("shipping_" + itemIndex, (this.CurrentCart().ShippingAmount / this.CurrentCart().Items.Count()).ToLocalCurrency())%>
           
            <%itemIndex++;
        } %>
        <div class="checkout-button">
        <input type="image" src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" align="left" style="margin-right:7px;" />
        </div>
        </form>
           


        <form id="Form1" name="Paypal" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">

            <%=Html.Hidden("cmd", "_cart")%>
            <%=Html.Hidden("upload", "1")%>
            <%=Html.Hidden("business", "dinisnet@hotmail.com")%>
            <%=Html.Hidden("custom", Model.Username)%>
           
            <%=Html.Hidden("currency_code", "EUR")%>
            
            <%=Html.Hidden("return", Url.Action("PDT", "PayPal"))%>
            <%=Html.Hidden("cancel_return", Url.Action("Index","Store"))%>
      
        <%if(Model.Address!=null){ %>

            <%=Html.Hidden("first_name", Model.FirstName)%>
            <%=Html.Hidden("last_name", Model.LastName)%>
            <%=Html.Hidden("address", Model.Address)%>
    
            <%=Html.Hidden("city", Model.City)%>
            <%=Html.Hidden("state", Model.State)%>
            <%=Html.Hidden("country", Model.Country)%>
            <%=Html.Hidden("zip", Model.PostalCode)%>

        <%} 
        int itemIndex = 1;
        foreach (var item in Model.OrderDetails)
        { %>

           
            <%=Html.Hidden("amount_" + itemIndex, Model.Total)%>
      
            <%=Html.Hidden("quantity_" + itemIndex, item.Quantity.ToString())%>

           
            <%itemIndex++;
        } %>
        <div class="checkout-button">
        <input type="image" src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" align="left" style="margin-right:7px;" />
        </div>
        </form>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header1" runat="server">
</asp:Content>
