﻿Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.xgmmWin=Ext.extend(Ext.Window ,{
    xtype:"window",
	title:"修改密码",
	width:400,
	height:259,
	initComponent: function(){
		this.items=[
			{
				xtype:"form",
				 id:'form1',
	            padding:10,
	            width:300,
				height:200,
				items:[
					{
						xtype:"textfield",
						fieldLabel:"密码",
						name:''

					},
					{
						xtype:"textfield",
						fieldLabel:"确认密码",
                        name:''
					},
					{
						xtype:"button",
						text:"保存"
					},
					{
						xtype:"button",
						text:"取消"
					}
				]
			}
		]
		Ext.Hudongsoft.xgmmWin.superclass.initComponent.call(this);
	}
})