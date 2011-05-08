Ext.namespace('Ext.Hudongsoft');


Ext.Hudongsoft.fcglGrid=Ext.extend(Ext.grid.GridPanel ,{
xtype:"grid",
	title:"房产管理",
	store:new Ext.data.JsonStore({
		autoLoad:true,
		url: 'fcgl.aspx?action=list',
		fields:[
		    'id','工业园名称','房产类型','房号'
		]
	}),
	width:785,
	height:576,
	columns:[
		{
			header:"序号",
			sortable:true,
			resizable:true,
			dataIndex:"id",
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
			header:"房产类型",
			sortable:true,
			resizable:true,
			dataIndex:"房产类型",
			width:100
		},
		{
			header:"房号",
			sortable:true,
			resizable:true,
			dataIndex:"房号",
			width:100
		}
	],
	initComponent: function(){
		this.tbar=[
			{
				text:"新增房产",
				handler:function () {
				    var form = new Ext.FormPanel({
    				    id:'form1',
    				    padding:10,
    				    width:500,
    				    items:[
    				        {
                                xtype:'hidden',
                                name:'id'    				        
    				        },
		                    {
		                        fieldLabel: '工业园名称',
		                        name: '工业园名称',
		                        xtype: 'textfield'				                           
		                    },
		                    {
		                        fieldLabel: '房产类型',
		                        name: '房产类型',
		                        xtype: 'textfield'				                           
		                    },
		                    {
		                        fieldLabel: '描述',
		                        name: '描述',
		                        xtype: 'textfield'				                           
		                    },
		                    {
		                        fieldLabel: '房型',
		                        name: '房型',
		                        xtype: 'textfield'				                           
		                    },
		                    {
		                        fieldLabel: '朝向',
		                        name: '朝向',
		                        xtype: 'textfield'				                           
		                    },
		                    {
		                        fieldLabel: '房屋结构',
		                        name: '房屋结构',
		                        xtype: 'textfield'				                           
		                    }
		                    
		                      
    				    ],
    				    buttons:[
    				        {
    				            text:'保存',
    				            handler:function (c) {
    				                 form.getForm().submit({
    				                    url:'fcgl.aspx',
    				                    params:{
    				                        action:'add'
    				                    },
    				                    success:function (form, action) {
    				                        console.log(action.response.responseText);                                      
                                            w.close();
    				                    }
    				                });
    				            }
    				        },
    				        {
                                text: '取消',
                                handler: function (c) {
                                    w.close();
                                }
                            }
    				    ]
				    });
				    
				    var w = new Ext.Window({
				        title:"新增厂房",
				        items:[
				            form
				        ]
				    });
				    w.show();
				}
				
			},
			{
				text:"修改"
			},
			{
				text:"删除"
			}
		]
		Ext.Hudongsoft.fcglGrid.superclass.initComponent.call(this);
	}
})


