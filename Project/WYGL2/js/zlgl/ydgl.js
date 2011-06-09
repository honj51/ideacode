Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.ydglGrid=Ext.extend(Ext.grid.GridPanel ,{
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
	    var gyy_lx = new Ext.LinkCombox({
            width:226,
            store: new Ext.data.JsonStore({
                url: "ajax/zlgl/zphtgl.aspx?action=gyy_fc_lb",
	            fields: ['fc']
            }),
	        displayField: 'fc',
	        valueField: 'fc',
	        keyField: ['gyy'],
	        initComponent: function(){	    
	            Ext.LinkCombox.superclass.initComponent.call(this);	    
	        },
            fieldLabel:'所属房产类型',
            name:'所属房产'
        });
	    var gyy = new Ext.GyyCombox({nextCombox: gyy_lx,width:226,fieldLabel:'所属工业园',name:'所属工业园'});	    
	    var kehu = new Ext.KehuCombox({
	        width:226,            
            name:'客户名称',
            fieldLabel:'预定客户名称'
	    });	    	    
        
	    var form = new Ext.FormPanel({
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
                    readOnly: true, 
                    value: '自动产生',  
                    xtype: 'textfield'				                           
                },
                kehu,
                gyy,
                gyy_lx,
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
                    readOnly: true,
                    format: 'Y-m-d H:i:s',
                    xtype: 'datefield',
                    value: new Date()		                           
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
	        title:add?"新增预定":"修改预定",
		    width:400,
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
			},'->',
			{				
				text:"转为正式合同",
				iconCls: 'icon-jobSum',
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        Ext.Msg.confirm('转为正式合同','确定要转为正式合同吗？',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/zlgl/ydgl.aspx?action=change',
									success:function(){
										Ext.Msg.alert('转为正式合同','转为正式合同成功！');
										self.store.reload();
									},
									params:{id: r.get('id')}
								});
							}
						});
				    }
				}
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