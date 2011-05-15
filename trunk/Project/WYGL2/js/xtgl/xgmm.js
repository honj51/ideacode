Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.xgmmWin=Ext.extend(Ext.Window ,{
    xtype:"window",
	title:"修改密码",
	layout: 'fit',
	width:320,
	height:150,
	initComponent: function(){
	    var self = this;
		var form = new Ext.FormPanel({
		    padding:10,
		    //width:300,
		    items:[
		        {
		            fieldLabel: '密码',
                    name: 'admin_pwd',
                    inputType: 'password',
                    xtype: 'textfield'	
		        },
		        {
		            fieldLabel: '确认密码',
                    name: 'admin_pwd',
                    inputType: 'password2',
                    xtype: 'textfield'	
		        },
		        
		    ],
		    buttons:[
		        {
		            text:'保存',// callback
	                iconCls: 'icon-save',
	                handler:function () {
	                    form.getForm().submit({
	                        url:'ajax/xtgl/glylb.aspx',
	                        params:{
	                            action:'updata_self'
	                        }
	                    });
	                }
	                
		        },
		        {
		            text:'取消',// callback
	                iconCls: 'icon-cancel',
	                handler: function () {
                        self.close();
                    }
		        }
		    ]
		});
		this.items=[
		    form
		]

		Ext.Hudongsoft.xgmmWin.superclass.initComponent.call(this);
	}
})