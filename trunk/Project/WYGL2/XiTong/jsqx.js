Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.jsqxGrid=Ext.extend(Ext.grid.GridPanel ,{
xtype:"grid",
	title:"角色权限",
     store:new Ext.data.JsonStore({
		autoLoad:true,
		url: 'jsqx.aspx?action=list',
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
	                handler:function (c) {		                
	                     form.getForm().submit({
	                        url:'jsqx.aspx',
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
                title:"添加角色",
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
				        Ext.Msg.confirm('删除角色','确定要删除选中的角色吗？',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'jsqx.aspx?action=delete',
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
				text:"设置权限"
			}
		]
		Ext.Hudongsoft.jsqxGrid.superclass.initComponent.call(this);
	}
})