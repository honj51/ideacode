Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.xgmmWin=Ext.extend(Ext.Window ,{
    xtype:"window",
	title:"�޸�����",
	layout: 'fit',
	width:320,
	height:150,
	initComponent: function(){
	    var self = this;
	    var password1 = new Ext.form.TextField({ 
            fieldLabel: '����',
            name: 'admin_pwd',
            inputType: 'password',
            allowBlank:false 	   
        });
        
        var password2 = new Ext.form.TextField({ 
            fieldLabel: 'ȷ������',
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
		            text:'����',// callback
	                iconCls: 'icon-save',
	                handler:function () {
	                    if (password1.getValue() != password2.getValue()) {
	                         Ext.Msg.alert("��ʾ","�����������벻һ��,���������룡");
	                         return;
	                    };
	                    form.getForm().submit({
	                        url:'ajax/xtgl/glylb.aspx',
	                        params:{
	                            action:'updata_self'
	                        },
	                        success:function () {
	                            self.close();
	                            Ext.Msg.alert("�޸�����","�����޸ĳɹ�");
	                        }
	                    });
	                }
	                
		        },
		        {
		            text:'ȡ��',// callback
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
});