﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行库版本:2.0.50727.3082
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace DBSiteAdmin.Properties {
    
    
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "9.0.0.0")]
    internal sealed partial class Settings : global::System.Configuration.ApplicationSettingsBase {
        
        private static Settings defaultInstance = ((Settings)(global::System.Configuration.ApplicationSettingsBase.Synchronized(new Settings())));
        
        public static Settings Default {
            get {
                return defaultInstance;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("HdHouse-Pub")]
        public string Publication {
            get {
                return ((string)(this["Publication"]));
            }
            set {
                this["Publication"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("localhost")]
        public string Subscriber {
            get {
                return ((string)(this["Subscriber"]));
            }
            set {
                this["Subscriber"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("Rd02")]
        public string Publisher {
            get {
                return ((string)(this["Publisher"]));
            }
            set {
                this["Publisher"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("HdHouse")]
        public string PublicationDatabase {
            get {
                return ((string)(this["PublicationDatabase"]));
            }
            set {
                this["PublicationDatabase"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("HdHouseLocal")]
        public string SubscriptionDatabase {
            get {
                return ((string)(this["SubscriptionDatabase"]));
            }
            set {
                this["SubscriptionDatabase"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("")]
        public string BusinessLogic {
            get {
                return ((string)(this["BusinessLogic"]));
            }
            set {
                this["BusinessLogic"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("30")]
        public int SyncWhenConnectedInterval {
            get {
                return ((int)(this["SyncWhenConnectedInterval"]));
            }
            set {
                this["SyncWhenConnectedInterval"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("Rd03")]
        public string HostName {
            get {
                return ((string)(this["HostName"]));
            }
            set {
                this["HostName"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("https://rd02/hdhouse/websync/replisapi.dll")]
        public string WebSynchronizationUrl {
            get {
                return ((string)(this["WebSynchronizationUrl"]));
            }
            set {
                this["WebSynchronizationUrl"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("HdHouseSync.log")]
        public string OutputFile {
            get {
                return ((string)(this["OutputFile"]));
            }
            set {
                this["OutputFile"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("1")]
        public int OutputVerboseLevel {
            get {
                return ((int)(this["OutputVerboseLevel"]));
            }
            set {
                this["OutputVerboseLevel"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.SpecialSettingAttribute(global::System.Configuration.SpecialSetting.WebServiceUrl)]
        [global::System.Configuration.DefaultSettingValueAttribute("http://localhost:1472/DBCenterAdmin/DBCenterWebService.asmx")]
        public string DBSiteAdmin_dbCenterWebService_DBCenterWebService {
            get {
                return ((string)(this["DBSiteAdmin_dbCenterWebService_DBCenterWebService"]));
            }
            set {
                this["DBSiteAdmin_dbCenterWebService_DBCenterWebService"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("")]
        public string SqlUserName {
            get {
                return ((string)(this["SqlUserName"]));
            }
            set {
                this["SqlUserName"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("")]
        public string SqlUserPassword {
            get {
                return ((string)(this["SqlUserPassword"]));
            }
            set {
                this["SqlUserPassword"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("False")]
        public bool SqlLoginMode {
            get {
                return ((bool)(this["SqlLoginMode"]));
            }
            set {
                this["SqlLoginMode"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("")]
        public string InternetPassword {
            get {
                return ((string)(this["InternetPassword"]));
            }
            set {
                this["InternetPassword"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("")]
        public string InternetLogin {
            get {
                return ((string)(this["InternetLogin"]));
            }
            set {
                this["InternetLogin"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("True")]
        public bool SyncWhenConnected {
            get {
                return ((bool)(this["SyncWhenConnected"]));
            }
            set {
                this["SyncWhenConnected"] = value;
            }
        }
    }
}
