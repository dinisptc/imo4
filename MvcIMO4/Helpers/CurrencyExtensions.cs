using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MvcIMO4
{
    public static class CurrencyExtensions {
        public static string ToLocalCurrency(this Decimal input) {
            return Math.Round(input, System.Globalization.CultureInfo.CurrentCulture.NumberFormat.CurrencyDecimalDigits).ToString();
        }
    }
}
