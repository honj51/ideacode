Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.gyyglGrid=Ext.extend(Ext.grid.GridPanel ,{
    xtype:"grid",
	title:"工业园管理列表",
	store:new Ext.data.JsonStore({
		//xtype:"jsonstore",
		autoLoad:true,
		url: 'gyygl.aspx?action=list',
		fields:[
		    'id','序号','工业园名称','工业园面积'
		]
	}),
	width:778,
	height:544,
	columns:[
		{
			header:"编号",
			sortable:true,
			resizable:true,
			dataIndex:"序号",
			width:100
		},
		{
			header:"工业园名称",
			sortable:true,
			resizable:true,
			dataIndex:"工业园名称",
			width:100
		},
		{
			header:"工业面积（平方米）",
			sortable:true,
			resizable:true,
			dataIndex:"工业园面积",
			width:120
		}
	],
	initComponent: function(){
		this.tbar=[
			{
				text:"添加工业园",
				handler: function () {
                    var form = new Ext.FormPanel({	
                        id : 'abcdef',			                
		                padding: 10,
		                width: 250,
		                items: [{
		                    xtype: 'hidden',
		                    name: 'id'
		                },{
		                    fieldLabel: '序号',
		                    name: '序号',
		                    xtype: 'textfield'				                           
		                },{
		                    fieldLabel: '工业园名称',
		                    name: '工业园名称',
		                    xtype: 'textfield'				                           
		                },{
		                    fieldLabel: '工园业面积',
		                    name: '工业园面积',
		                    xtype: 'textfield'				                           
		                }],
		                buttons: [{
                            text: '保存',
                            handler: function (c) {                                
                                form.getForm().submit({
                                    url: 'gyygl.aspx',
                                    params: {
                                        action: 'add'
                                    },
                                    success: function (form, action) {  
                                        console.log(action.response.responseText);                                      
                                        w.close();
                                    }
                                });
                            }
                        },{
                            text: '取消',
                            handler: function (c) {
                                w.close();
                            }
                        }]
		            });

				    var w = new Ext.Window({
				        title: '添加工业园',				        
				        items:[
				            form
				        ]
				    });
				    w.show();
				}
			},
			{
				text:"修改工业园"
			},
			{
				text:"删除工业园"
			},
			{
				text:"编辑房产类型"
			}
		]
		Ext.Hudongsoft.gyyglGrid.superclass.initComponent.call(this);
	}
})