Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.gyyglGrid=Ext.extend(Ext.grid.GridPanel ,{
    xtype:"grid",
	title:"��ҵ԰�����б�",
	store:new Ext.data.JsonStore({
		url: 'ajax/zygl/gyygl.aspx?action=list',
		fields:[
		    'id','���','��ҵ԰����','��ҵ԰���'
		]
	}),
	width:778,
	height:544,
	columns:[
		{
			header:"���",
			sortable:true,
			resizable:true,
			dataIndex:"���",
			width:100
		},
		{
			header:"��ҵ԰����",
			sortable:true,
			resizable:true,
			dataIndex:"��ҵ԰����",
			width:100
		},
		{
			header:"��ҵ�����ƽ���ף�",
			sortable:true,
			resizable:true,
			dataIndex:"��ҵ԰���",
			width:120
		}
	],
	listeners : {
	    celldblclick: function(grid, rowIndex, columnIndex, e) {
	        var r = grid.store.getAt(rowIndex);	
	        grid.showDetailWindow(false, r.data);
	    }
	},
	showDetailWindow: function (add, data) { // ��ʾ��ϸ����: add: �Ƿ�����������, data: ���ݲ���
	    var self = this;
        var form = new Ext.FormPanel({	
            padding: 10,            
            items: [{
                xtype: 'hidden',
                name: 'id'
            },{
                fieldLabel: '���',
                name: '���',
                allowBlank:false,
                xtype: 'textfield'				                           
            },{
                fieldLabel: '��ҵ԰����',
                name: '��ҵ԰����',
                allowBlank:false,
                xtype: 'textfield'				                           
            },{
                fieldLabel: '��԰ҵ���',
                name: '��ҵ԰���',
                allowBlank:false,
                xtype: 'textfield'				                           
            }],
            buttons: [{
                text: '����',
                iconCls: 'icon-save',
                handler: function (c) {                                
                    form.getForm().submit({
                        url: 'ajax/zygl/gyygl.aspx',
                        params: {
                            action: add?'add':'update'
                        },
                        success: function (form, action) {  
                            w.close();
                            self.store.reload();
                        }
                    });
                }
            },{
                text: 'ȡ��',
                iconCls: 'icon-cancel',
                handler: function (c) {
                    w.close();
                }
            }]
        });
        
        if (!add && data) {
            form.getForm().setValues(data);
        }
        
	    var w = new Ext.Window({
	        title: add?'������ҵ԰':'�޸Ĺ�ҵ԰',	
	        width: 300,			        
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
				text:"��ӹ�ҵ԰",
				iconCls: 'icon-group-create',
				handler: function () {
                    self.showDetailWindow(true, null);
				}
			},
			{
				text:"�޸Ĺ�ҵ԰",
				iconCls: 'icon-group-update',
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.showDetailWindow(false, r.data);
				    }				    
				}
			},
			{
				text:"ɾ����ҵ԰",
				iconCls: 'icon-group-delete',
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        Ext.Msg.confirm('ɾ����ҵ԰','ȷ��Ҫɾ��ѡ�й�ҵ԰��',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/zygl/gyygl.aspx?action=delete',
									success:function(){
										Ext.Msg.alert('ɾ����ҵ԰','��ҵ԰ɾ���ɹ���');
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
				text:"�༭��������",
				iconCls: 'icon-xieGenJin',
				handler:function () {
				    var r = self.getSelectionModel().getSelected();
				    if (!r) return;
				    var lxstore = new Ext.data.JsonStore({
                        url: 'ajax/zygl/gyygl.aspx?action=lx_list&find_id='+escape(r.data.��ҵ԰����),
                        fields:[
                            'id','���','��ҵ԰����','��������'
                        ]
	                }); 
	                
	                var lxgird = new Ext.grid.GridPanel({
	                    store:lxstore,
	                    layout:'fit',
	                    columns:[
	                                {
			                            header:"���",
			                            sortable:true,
			                            resizable:true,
			                            dataIndex:"���",
			                            width:200
			                           
		                            },
		                            {
			                            header:"��������",
			                            sortable:true,
			                            resizable:true,
			                            dataIndex:"��������",
			                            width:300
			                            
		                            }
	                            ]
	                            ,
	                            listeners : {
	                                celldblclick: function(grid, rowIndex, columnIndex, e) {
	                                    var d = grid.store.getAt(rowIndex);	
	                                    showLx(false, d.data);
	                                }
	                            }
	                });
	                
	                function showLx(add,data) {
	                    var lxform = new Ext.FormPanel({
	                        padding:10,
	                        items:[
	                            {
	                                xtype: 'hidden',
                                    name: 'id',
                                    value: r.json.id 
	                            },
                                {
                                    xtype: 'hidden',
                                    name: '��ҵ԰����',
                                    value: r.json.��ҵ԰����    
                                },
                                {
                                    fieldLabel:'���',
                                    name:'���',
                                    allowBlank:false,
                                    xtype: 'textfield' 
                                },
                                {
                                    fieldLabel:'��������',
                                    name:'��������',
                                    allowBlank:false,
                                    xtype: 'textfield' 
                                }
                                
                            ],
                            buttons:[
                                {
                                    text: '����',
                                    iconCls: 'icon-save',
                                    handler:function () {
                                        lxform.getForm().submit({
                                            url: 'ajax/zygl/gyygl.aspx',
                                            params: {
                                                action:add? 'addlx':'updatelx'
                                            },
                                            success: function (form, action) {  
                                                //console.log(action.response.responseText);                                      
                                                lxWin.close();
                                                lxstore.reload();
                                            }
                                        });
                                    } 
                                },
                                {
                                    text: 'ȡ��',
                                    iconCls: 'icon-cancel',
                                    handler: function () {
                                        lxWin.close();
                                    }
                                }
                            ]
	                    });
	                    
                        var lxWin = new Ext.Window({
                            title:add?'��������':'�޸�����',
                            width:300,
                            height:150,
                            layout:'fit',
                            items:[                                     
                                   lxform 
                            ]
                        });
                        
                    if (!add && data) {
                        lxform.getForm().setValues(data);
                    }
                    
                    lxWin.show();
	                }        
	                       
				    var win = new Ext.Window({
				        title:"���������б�",
				        width:600,
				        height:400,
				        layout:'fit',
				        tbar:[
				            {
				                text:"��������",
				                iconCls: 'icon-group-create',
				                handler:function(){
				                    showLx(true,null);
                                }
				            },
				            {
				                text:"�޸�����",
				                iconCls: 'icon-group-update',
				                handler:function () {
				                    var d = lxgird.getSelectionModel().getSelected();
                                    showLx(false,d.data); 
				                    
				                }
				            },
				            {
				                text:"ɾ������",
				                iconCls: 'icon-group-delete',
				                handler: function () {
				                    var d = lxgird.getSelectionModel().getSelected();
				                    if (d) {
				                        Ext.Msg.confirm('ɾ����������','ȷ��Ҫɾ��ѡ�еķ���������',function(btn){
							                if(btn == 'yes') {
								                Ext.Ajax.request({
									                url:'ajax/zygl/gyygl.aspx?action=deletelx',
									                success:function(){
										                Ext.Msg.alert('ɾ����������','��������ɾ���ɹ���');
										                lxstore.reload();
									                },
									                params:{id: d.get('id')}
								                });
							                }
						                });
				                    }				    
				                }
				            },
				            {
				                text:"�༭���������б�",
				                iconCls: 'icon-xieGenJin',
				                handler:function () {
				                    var d = lxgird.getSelectionModel().getSelected();
				                    var fcxfStore = new Ext.data.JsonStore({
				                        url: 'ajax/zygl/gyygl.aspx?action=fcxf_list',
		                                fields:[
		                                    'id','���','��ҵ԰����','��������','������Ŀ','��������','ֵ','����','���','���ɽ�','˵��'
		                                ],
		                                baseParams:{
		                                    gyyName:d.data.��ҵ԰����,
		                                    fclx:d.data.��������
		                                }
				                    });
				                    //console.log(d);
				                    
				                    
				                    var fcxfGird = new Ext.grid.GridPanel({
	                                    store:fcxfStore,
	                                    columns:[
                                            {
	                                            header:"���",
	                                            sortable:true,
	                                            resizable:true,
	                                            dataIndex:"���",
	                                            width:50
        			                           
                                            },
                                            {
	                                            header:"������Ŀ",
	                                            sortable:true,
	                                            resizable:true,
	                                            dataIndex:"������Ŀ",
	                                            width:100
        			                            
                                            },
                                            {
                                                header:"��������",
	                                            sortable:true,
	                                            resizable:true,
	                                            dataIndex:"��������",
	                                            width:100
                                            },
                                            {
                                                header:"ֵ",
	                                            sortable:true,
	                                            resizable:true,
	                                            dataIndex:"ֵ",
	                                            width:100
                                            },
                                            {
                                                header:"����",
	                                            sortable:true,
	                                            resizable:true,
	                                            dataIndex:"����",
	                                            width:100
                                            },
                                            {
                                                header:"���",
	                                            sortable:true,
	                                            resizable:true,
	                                            dataIndex:"���",
	                                            width:100
                                            },
                                            {
                                                header:"���ɽ�",
	                                            sortable:true,
	                                            resizable:true,
	                                            dataIndex:"���ɽ�",
	                                            width:100
                                            },
                                            {
                                                header:"˵��",
	                                            dataIndex:"˵��",
	                                            width:100
                                            }
                                        ]
	                                });
	                                
	                                var fcxfWin = new Ext.Window({
	                                    layout:'fit',
	                                    width:800,
	                                    height:400,
	                                    tbar:[
	                                        {
	                                            text:"������������",
	                                            iconCls: 'icon-group-create',
	                                            handler:function(){
                                                     addxfx(d,fcxfStore,null);
    
                                                }
	                                        },
	                                        {
	                                            text:"ɾ����������",
	                                            iconCls: 'icon-group-update',
	                                            handler:function () {
	                                                var d = fcxfGird.getSelectionModel().getSelected();
                                                    if (d) {
				                                        Ext.Msg.confirm('ɾ����������','ȷ��Ҫɾ��ѡ�еķ���������',function(btn){
							                                if(btn == 'yes') {
								                                Ext.Ajax.request({
									                                url:'ajax/zygl/gyygl.aspx?action=delete_fcxf',
									                                success:function(){
										                                Ext.Msg.alert('ɾ����������','��������ɾ���ɹ���');
										                                fcxfStore.reload();
									                                },
									                                params:{id: d.get('id')}
								                                });
							                                }
						                                });
				                                    } 
	                                            }
	                                        }
	                                    ],
				                        items:[
				                            fcxfGird
				                        ]
				                    });
				                    fcxfWin.show();
				                    fcxfStore.load();
				                }
				            }
				        ],
				        items:[
				            lxgird
				        ]
				        
				    });
				    win.show();
				    lxstore.load();
				    
				
				}
			}
		];
		self.store.load();
		Ext.Hudongsoft.gyyglGrid.superclass.initComponent.call(this);
	}
});