Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.jsqxGrid=Ext.extend(Ext.grid.GridPanel ,{
xtype:"grid",
	title:"角色权限",
     store:new Ext.data.JsonStore({
		url: 'ajax/xtgl/jsqx.aspx?action=list',
		fields:[
		    'id','role_id','role_name'
		]
	}),
	width:814,
	height:450,
	columns:[
	
		{
			header:"编号",
			sortable:true,
			resizable:true,
			dataIndex:"role_id",
			width:100
		},
		{
			header:"角色名称",
			sortable:true,
			resizable:true,
			dataIndex:"role_name",
			width:300
		}
	],
	
	listeners : {  // 添加监听事件
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
                    fieldLabel: '角色排列序号',
                    name: 'role_id',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '角色名称',
                    name: 'role_name',
                    width:226,
                    xtype: 'textfield'				                           
                }
                
                  
	        ],
	        buttons:[
	            {
	                text:'保存',// callback
	                iconCls: 'icon-save',
	                handler:function (c) {		                
	                     form.getForm().submit({
	                        url:'ajax/xtgl/jsqx.aspx',
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
                    iconCls: 'icon-cancel',
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
                title:"添加角色",
                items:[
                    form
                ]
            });
            w.show();
    },
    
    setPermissions:function (data) { 
        var form = new Ext.form.FormPanel({
            width:400,
            height:300,
            items:[
                {
                    xtype: 'hidden',
                    name: 'id'
                },
                {
                    xtype: 'hidden',
                    name: 'role_name'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'数据录入',
                    name:'数据录入'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'缴费管理',
                    name:'缴费管理'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'工业园管理',
                    name:'工业园管理'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'房产管理',
                    name:'房产管理'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'客户管理',
                    name:'客户管理'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'预定管理',
                    name:'预定管理'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'租赁合同管理',
                    name:'租凭合同管理'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'合同到期提示',
                    name:'合同到期提示'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'收款分类统计',
                    name:'收款分类统计'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'收款详细统计',
                    name:'收款详细统计'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'角色权限',
                    name:'角色权限'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'管理员管理',
                    name:'管理员管理'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'修改本身密码',
                    name:'修改本身密码'
                }     
            ],
            buttons:[
                {
                    text:'保存',// callback
                    iconCls: 'icon-save',
                    handler:function () {
                        form.getForm().submit({
                            url: 'ajax/xtgl/jsqx.aspx',
                            params: {
                                action:'updatePermissions'
                            },
                            success: function (form, action) {                                                               
                                wins.close();
                            }
                        })
                    }
                },
                {
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function () {
                        wins.close()
                    }
                }
            ]
        });        
        var wins = new Ext.Window({
            title:'修改权限',
            layout:'fit',
            width:500,
            height:400,
            store:self.PermissionsStore,
            items: form
        });
        form.getForm().load({
            url: 'ajax/xtgl/jsqx.aspx?action=set&role_name='+data.role_name,            
            failure: function(form, action) {
                Ext.Msg.alert("Load failed", action.result.errorMessage);
            }
        });
        wins.show();    
    },
	
	initComponent: function(){
	    var self = this;
		this.tbar=[
			{
				text:"添加",
				iconCls: 'icon-group-create',
				handler:function () {
                    self.showDetailWindow(true, null);
				}
			},
			{
				text:"修改",
				iconCls: 'icon-group-update',
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.showDetailWindow(false, r.data);
				    }				    
				}
			},
			{
				text:"删除",
				iconCls: 'icon-group-delete',
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        Ext.Msg.confirm('删除角色','确定要删除选中的角色吗？',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/xtgl/jsqx.aspx?action=delete',
									success:function(){
										Ext.Msg.alert('删除角色','角色删除成功！');
										self.store.reload();
									},
									params:{id: r.get('id')}
								});
							}
						});
				    }				    
				}
			},
			{
				text:"设置权限",
				iconCls: 'icon-sheZhi',
				handler:function () {
				    var per = self.getSelectionModel().getSelected();
				    if (per) {
				        if (per.json.role_name=='总管理员') {
				            Ext.Msg.alert("提示","总管理员拥有最高权限，不能修改！");
				            return;
				        }
//				         var PermissionsStore = new Ext.data.JsonStore({
//				            url: 'ajax/xtgl/jsqx.aspx?action=set&role_name='+per.json.role_name,
//		                    fields:[
//		                        'id','role_name','数据录入','缴费管理','工业园管理','房产管理','客户管理','预定管理','租凭合同管理','合同到期提示',
//		                        '收款分类统计','收款详细统计','角色权限','管理员管理','修改本身密码'
//		                    ],
//				         });
				         self.setPermissions(per.data);
				         //PermissionsStore.load();
				         //console.log(per.json.role_name)
				    }			   
				}
			}
		];
		self.store.load();
		Ext.Hudongsoft.jsqxGrid.superclass.initComponent.call(this);
	}
})