Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.xgmmWin=Ext.extend(Ext.Window ,{
    xtype:"window",
	title:"修改密码",
	layout: 'fit',
	width:320,
	height:150,
	initComponent: function(){
	    var self = this;
	    var password1 = new Ext.form.TextField({ 
            fieldLabel: '密码',
            name: 'admin_pwd',
            inputType: 'password',
            allowBlank:false 	   
        });
        
        var password2 = new Ext.form.TextField({ 
            fieldLabel: '确认密码',
            name: 'admin_pwd2',
            allowBlank:false,
            inputType: 'password'	   
        });
        
		var form = new Ext.FormPanel({
		    padding:10,
		    //width:300,
		    items:[
		      password1,password2
		        
		    ],
		    buttons:[
		        {
		            text:'保存',// callback
	                iconCls: 'icon-save',
	                handler:function () {
	                    if (password1.getValue() != password2.getValue()) {
	                         Ext.Msg.alert("提示","两次密码输入不一致,请重新输入！");
	                         return;
	                    };
	                    form.getForm().submit({
	                        url:'ajax/xtgl/glylb.aspx',
	                        params:{
	                            action:'updata_self'
	                        },
	                        success:function () {
	                            self.close();
	                            Ext.Msg.alert("修改密码","密码修改成功");
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