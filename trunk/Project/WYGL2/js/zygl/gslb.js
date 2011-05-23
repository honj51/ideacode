Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.gslbGrid=Ext.extend(Ext.grid.GridPanel ,{
    xtype:"grid",
	title:"公司列表",
    store:new Ext.data.JsonStore({
        root : 'data',
		totalProperty : 'totalProperty',
		url: 'ajax/zygl/gslb.aspx?action=list',
		fields:[
		    'id','编码','名称','描述','联系人','联系电话','助记码','注册号','法人代表','办公地址','联系方法','备注','成立日期'
		]
	}),
	width:792,
	height:560,
	columns:[
	    {
			header:"编号",
			sortable:true,
			resizable:true,
			dataIndex:"id",
			width:100
		},
		{
			header:"编码",
			sortable:true,
			resizable:true,
			dataIndex:"编码",
			width:100
		},
		{
			header:"名称",
			sortable:true,
			resizable:true,
			dataIndex:"名称",
			width:100
		},
		{
			header:"描述",
			sortable:true,
			resizable:true,
			dataIndex:"描述",
			width:100
		},
		{
			header:"联系人",
			sortable:true,
			resizable:true,
			dataIndex:"联系人",
			width:100
		},
		{
			header:"联系电话",
			sortable:true,
			resizable:true,
			dataIndex:"联系电话",
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
                xtype:'hidden',
                name:'id'    				        
	        },
            {
                fieldLabel: '编码',
                name: '编码',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '名称',
                name: '名称',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '描述',
                name: '描述',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '助记码',
                name: '助记码',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '注册号',
                name: '注册号',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '成立日期',
                name: '成立日期',
                width:226,
                xtype: 'datefield',
                format:'Y-m-d'				                           
            },
            {
                fieldLabel: '法人代表',
                name: '法人代表',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '办公地址',
                name: '办公地址',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '联系电话',
                name: '联系电话',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '联系方法',
                name: '联系方法',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '联系人',
                name: '联系人',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '备注',
                name: '备注',
                width:226,
                height:60,
                xtype: 'textfield'				                           
            }
            
              
	    ],
	    buttons:[
	        {
	            text:'保存',// callback
	            iconCls: 'icon-save',
	            handler:function (c) {		                
	                 form.getForm().submit({
	                    url:'ajax/zygl/gslb.aspx',
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
            title:"新增公司",
            items:[
                form
            ]
        });
        w.show();
    },
	
	initComponent: function(){
	    var self = this;
	    var iField = new Ext.form.TextField({ //搜索栏
            emptyText:'请输入姓名',
	        width:150,
        });
	    this.bbar = new Ext.PagingToolbar({
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
		this.tbar=[
			{
				text:"新增",
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
				        Ext.Msg.confirm('删除公司','确定要删除选中的公司吗？',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/zygl/gslb.aspx?action=delete',
									success:function(){
										Ext.Msg.alert('删除公司','公司删除成功！');
										self.store.reload();
									},
									params:{id: r.get('id')}
								});
							}
						});
				    }				    
				}
			},
			'->',
			{
				xtype:"label",
				text:"姓名："
			},
			iField,
			{
				text:"搜索",
				iconCls: 'icon-query',
				handler:function () {
				    self.store.load({
				        params:{
				            iField:iField.getValue()
				        }
				    });
				}
			}
		];
	    self.store.load();
		Ext.Hudongsoft.gslbGrid.superclass.initComponent.call(this);
	}
})