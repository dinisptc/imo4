﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.1
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ViewRes {
    using System;
    
    
    /// <summary>
    ///   A strongly-typed resource class, for looking up localized strings, etc.
    /// </summary>
    // This class was auto-generated by the StronglyTypedResourceBuilder
    // class via a tool like ResGen or Visual Studio.
    // To add or remove a member, edit your .ResX file then rerun ResGen
    // with the /str option, or rebuild your VS project.
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("System.Resources.Tools.StronglyTypedResourceBuilder", "4.0.0.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    public class ValidationStrings {
        
        private static global::System.Resources.ResourceManager resourceMan;
        
        private static global::System.Globalization.CultureInfo resourceCulture;
        
        [global::System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal ValidationStrings() {
        }
        
        /// <summary>
        ///   Returns the cached ResourceManager instance used by this class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        public static global::System.Resources.ResourceManager ResourceManager {
            get {
                if (object.ReferenceEquals(resourceMan, null)) {
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("MvcIMO4.Resources.Models.Account.ValidationStrings", typeof(ValidationStrings).Assembly);
                    resourceMan = temp;
                }
                return resourceMan;
            }
        }
        
        /// <summary>
        ///   Overrides the current thread's CurrentUICulture property for all
        ///   resource lookups using this strongly typed resource class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        public static global::System.Globalization.CultureInfo Culture {
            get {
                return resourceCulture;
            }
            set {
                resourceCulture = value;
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to A username for that e-mail address already exists. Please enter a different e-mail address..
        /// </summary>
        public static string emailduplic {
            get {
                return ResourceManager.GetString("emailduplic", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The e-mail address provided is invalid. Please check the value and try again..
        /// </summary>
        public static string emailinvalid {
            get {
                return ResourceManager.GetString("emailinvalid", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator..
        /// </summary>
        public static string errodesconhecido {
            get {
                return ResourceManager.GetString("errodesconhecido", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The password provided is invalid. Please enter a valid password value..
        /// </summary>
        public static string invalidpassword {
            get {
                return ResourceManager.GetString("invalidpassword", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The user name provided is invalid. Please check the value and try again..
        /// </summary>
        public static string invaliduser {
            get {
                return ResourceManager.GetString("invaliduser", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The password and confirmation password do not match..
        /// </summary>
        public static string PasswordsMustMatch {
            get {
                return ResourceManager.GetString("PasswordsMustMatch", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to {0} field is required.
        /// </summary>
        public static string Required {
            get {
                return ResourceManager.GetString("Required", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Username already exists. Please enter a different user name..
        /// </summary>
        public static string userallreadyexists {
            get {
                return ResourceManager.GetString("userallreadyexists", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator..
        /// </summary>
        public static string userejected {
            get {
                return ResourceManager.GetString("userejected", resourceCulture);
            }
        }
    }
}
