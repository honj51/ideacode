Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.ydglGrid=Ext.extend(Ext.grid.GridPanel ,{
    xtype:"grid",
	title:"预定管理",
	store:new Ext.data.JsonStore({
	    root : 'data',
		totalProperty : 'totalProperty',
		url: 'ajax/zlgl/ydgl.aspx?action=list',
		fields:[
		    'id','编码','客户名称','所属工业园','所属房产','合同开始时间','操作时间','备注'
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
			width:50
		},
		{
			header:"编码",
			sortable:true,
			resizable:true,
			dataIndex:"编码",
			width:160
		},
		{
			header:"预定客户名称",
			sortable:true,
			resizable:true,
			dataIndex:"客户名称",
			width:100
		},
		{
			header:"所属工业园",
			sortable:true,
			resizable:true,
			dataIndex:"所属工业园",
			width:100
		},
		{
			header:"所属房产",
			sortable:true,
			resizable:true,
			dataIndex:"所属房产",
			width:100
		},
		{
			header:"预定时间",
			sortable:true,
			resizable:true,
			dataIndex:"合同开始时间",
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			width:100
		},
		{
			header:"操作时间",
			sortable:true,
			resizable:true,
			dataIndex:"操作时间",
			width:150,
			renderer: Ext.Hudongsoft.util.Format.dateTimeRenderer()
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
	    var gyy_lx = new Ext.GyyLxCombox({
            width:130,
            fieldLabel:'所属房产类型',
            name:'所属房产'
        });
        var gyy = new Ext.GyyCombox({
            lx_store: gyy_lx.store,
            width:226,
            fieldLabel:'所属工业园',
            name:'所属工业园'
        });
	    var form = new Ext.FormPanel({
		    id:'form1',
		    padding:10,
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
                    fieldLabel: '预定客户名称',
                    name: '客户名称',
                    width:226,
                    xtype: 'textfield'				                           
                },
                gyy,
//                {
//                    fieldLabel: '所属工业园',
//                    name: '所属工业园',
//                    width:226,
//                    xtype: 'textfield'				                           
//                },
                {
                    fieldLabel: '所属房产',
                    name: '所属房产',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '预定时间',
                    name: '合同开始时间',
                    width:226,
                    xtype: 'datefield',
                    format:'Y-m-d'				                           
                },
                {
                    fieldLabel: '操作时间',
                    name: '操作时间',
                    width:226,
                    disabled:true,
                    editable:false,
                    xtype: 'datefield',
                    format:'Y-m-d'				                           
                },
                {
                    fieldLabel: '备注',
                    name: '备注',
                    width:226,
                    height:63,
                    xtype: 'textarea'				                           
                }
                
                  
		    ],
		    buttons:[
		        {
		            text:'保存',// callback
		            iconCls: 'icon-save',
		            handler:function (c) {		                
		                 form.getForm().submit({
		                    url:'ajax/zlgl/ydgl.aspx',
		                    params:{
		                        action: add?'add':'update'
		                    },
		                    success:function (form, action) {
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
	        title:"新增预定",
		    width:500,
	        items:[
	            form
	        ]
	    });
	    w.show();
	},  
	
	
	initComponent: function(){
	    var self = this;
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
				        Ext.Msg.confirm('删除房产','确定要删除选中房产吗？',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/zlgl/ydgl.aspx?action=delete',
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
			},
			{
				xtype:"label",
				text:""
			}
		];
		self.store.load({
		    params:{
		        start:0,
		        limit:20
		    }
		});
		Ext.Hudongsoft.ydglGrid.superclass.initComponent.call(this);
	}
})