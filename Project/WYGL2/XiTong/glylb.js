Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.glylbGrid=Ext.extend(Ext.grid.GridPanel ,{
xtype:"grid",
	title:"管理员列表",
	store:new Ext.data.JsonStore({
		autoLoad:true,
		url: 'glylb.aspx?action=list',
		fields:[
		    'id','admin_id','admin_pwd','admin_name','admin_limit','tel','qq','email'
		]
	}),
	width:814,
	height:450,
	columns:[
		{
			header:"编号",
			sortable:true,
			resizable:true,
			dataIndex:"id",
			width:100
		},
		{
			header:"管理员帐号",
			sortable:true,
			resizable:true,
			dataIndex:"admin_id",
			width:100
		},
		{
			header:"名称",
			sortable:true,
			resizable:true,
			dataIndex:"admin_name",
			width:100
		},
		{
			header:"角色",
			sortable:true,
			resizable:true,
			dataIndex:"admin_limit",
			width:100
		}
	],
	
	listeners : { // 添加监听事件
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
	                xtype: 'textfield',
                    name: 'id',
                    hidden: true,
                    hideLabel:true
	            },
                {
                    fieldLabel: '帐号',
                    name: 'admin_id',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '名称',
                    name: 'admin_name',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '密码',
                    name: 'admin_pwd',
                    width:226,
                    inputType: 'password',
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '再次输入密码',
                    name: 'admin_pwd',
                    width:226,
                    inputType: 'password',
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '角色',
                    name: 'admin_limit',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '电话',
                    name: 'tel',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: 'qq',
                    name: 'qq',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '邮箱',
                    name: 'email',
                    width:226,
                    vtype:'email',  
                    xtype: 'textfield'				                           
                }              
	        ],
	        buttons:[
	            {
	                text:'保存',// callback
	                handler:function (c) {		                
	                     form.getForm().submit({
	                        url:'glylb.aspx',
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
            title:"添加管理员",
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
				text:"添加",
				handler:function () {
                    self.showDetailWindow(true, null);
				}
			},
			{
				text:"修改",
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.showDetailWindow(false, r.data);
				    }				    
				}
			},
			{
				text:"删除",
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        Ext.Msg.confirm('删除管理员','确定要删除选中的管理员吗？',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'glylb.aspx?action=delete',
									success:function(){
										Ext.Msg.alert('删除管理员','管理员删除成功！');
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
		Ext.Hudongsoft.glylbGrid.superclass.initComponent.call(this);
	}
})