Ext.namespace('Ext.Hudongsoft');


Ext.Hudongsoft.fcglGrid=Ext.extend(Ext.grid.GridPanel ,{
xtype:"grid",
	title:"房产管理",
	store:new Ext.data.JsonStore({
		autoLoad:true,
		url: 'fcgl.aspx?action=list',
		fields:[
		    'id','工业园名称','房产类型','房号','描述','房型','朝向','房屋结构'
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
			header:"编号",
			sortable:true,
			resizable:true,
			dataIndex:"房号",
			width:100
		}
	],
	
	listeners : {
	    celldblclick: function(grid, rowIndex, columnIndex, e) {
	        var r = grid.store.getAt(rowIndex);	
	        grid.showDetailWindow(false, r.data);
	    }
	},
	showDetailWindow: function (add, data) {    // 显示详细窗体: add: 是否是新增数据, data: 数据参数
	    var self = this;
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
                    fieldLabel: '房号',
                    name: '房号',
                    xtype: 'textfield'				                           
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
		            text:'保存',// callback
		            handler:function (c) {		                
		                 form.getForm().submit({
		                    url:'fcgl.aspx',
		                    params:{
		                        action: add?'add':'update'
		                    },
		                    success:function (form, action) {
		                        console.log(action.response.responseText);                                      
                                w.close();                                
                                self.store.reload();
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
        
        if (!add && data) {
            form.getForm().setValues(data);
        }
        
	    var w = new Ext.Window({
	        title:"新增厂房",
	        items:[
	            form
	        ]
	    });
	    w.show();
	},
	
	initComponent: function(){
	    var self = this;
		this.tbar=[
			{
				text:"新增房产",
				handler:function () {
                    self.showDetailWindow(true, null);
				}
				
			},
			{
				text:"修改房产",
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.showDetailWindow(false, r.data);
				    }				    
				}
			},
			{
				text:"删除房产",
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        Ext.Msg.confirm('删除房产','确定要删除选中房产吗？',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'fcgl.aspx?action=delete',
									success:function(){
										Ext.Msg.alert('删除房产','房产删除成功！');
										self.store.reload();
									},
									params:{id: r.get('id')}
								});
							}
						});
				    }				    
				}
			}
		]
		Ext.Hudongsoft.fcglGrid.superclass.initComponent.call(this);
	}
})


