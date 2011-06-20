Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.ydglGrid=Ext.extend(Ext.grid.GridPanel ,{
	title:"Ԥ������",
	store:new Ext.data.JsonStore({
	    root : 'data',
		totalProperty : 'totalProperty',
		url: 'ajax/zlgl/ydgl.aspx?action=list',
		fields:[
		    'id','����','�ͻ�����','������ҵ԰','��������','��ͬ��ʼʱ��','����ʱ��','��ע'
		]
	
	}),	
	width:792,
	height:560,
	columns:[
		{
			header:"���",
			sortable:true,
			resizable:true,
			dataIndex:"id",
			width:50
		},
		{
			header:"����",
			sortable:true,
			resizable:true,
			dataIndex:"����",
			width:160
		},
		{
			header:"Ԥ���ͻ�����",
			sortable:true,
			resizable:true,
			dataIndex:"�ͻ�����",
			width:100
		},
		{
			header:"������ҵ԰",
			sortable:true,
			resizable:true,
			dataIndex:"������ҵ԰",
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
			header:"Ԥ��ʱ��",
			sortable:true,
			resizable:true,
			dataIndex:"��ͬ��ʼʱ��",
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			width:100
		},
		{
			header:"����ʱ��",
			sortable:true,
			resizable:true,
			dataIndex:"����ʱ��",
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
	
	showDetailWindow: function (add, data) {    // ��ʾ��ϸ����: add: �Ƿ�����������, data: ���ݲ���
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
            fieldLabel:'������������',
            name:'��������'
        });
	    var gyy = new Ext.GyyCombox({nextCombox: gyy_lx,width:226,fieldLabel:'������ҵ԰',name:'������ҵ԰'});	    
	    var kehu = new Ext.KehuCombox({
	        width:226,            
            name:'�ͻ�����',
            fieldLabel:'Ԥ���ͻ�����'
	    });	    	    
        
	    var form = new Ext.FormPanel({
		    padding:10,
		    items:[
		        {
                    xtype:'hidden',
                    name:'id'    				        
		        },
		        {
                    fieldLabel: '����',
                    name: '����',
                    width:226,
                    readOnly: true, 
                    value: '�Զ�����',  
                    xtype: 'textfield'				                           
                },
                kehu,
                gyy,
                gyy_lx,
                {
                    fieldLabel: 'Ԥ��ʱ��',
                    name: '��ͬ��ʼʱ��',
                    width:226,
                    xtype: 'datefield',
                    format:'Y-m-d'				                           
                },
                {
                    fieldLabel: '����ʱ��',
                    name: '����ʱ��',
                    width:226,
                    readOnly: true,
                    format: 'Y-m-d H:i:s',
                    xtype: 'datefield',
                    value: new Date()		                           
                },
                {
                    fieldLabel: '��ע',
                    name: '��ע',
                    width:226,
                    height:63,
                    xtype: 'textarea'				                           
                }
                
                  
		    ],
		    buttons:[
		        {
		            text:'����',// callback
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
                    text: 'ȡ��',
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
	        title:add?"����Ԥ��":"�޸�Ԥ��",
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
				text:"����",
				iconCls: 'icon-group-create',
				handler:function () {
                    self.showDetailWindow(true, null);
				}
			},
			{
				text:"�޸�",
				iconCls: 'icon-group-update',
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.showDetailWindow(false, r.data);
				    }				    
				}
			},
			{
				text:"ɾ��",
				iconCls: 'icon-group-delete',
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        Ext.Msg.confirm('ɾ������','ȷ��Ҫɾ��ѡ�з�����',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/zlgl/ydgl.aspx?action=delete',
									success:function(){
										Ext.Msg.alert('ɾ������','����ɾ���ɹ���');
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
				text:"תΪ��ʽ��ͬ",
				iconCls: 'icon-jobSum',
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        Ext.Msg.confirm('תΪ��ʽ��ͬ','ȷ��ҪתΪ��ʽ��ͬ��',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/zlgl/ydgl.aspx?action=change',
									success:function(){
										Ext.Msg.alert('תΪ��ʽ��ͬ','תΪ��ʽ��ͬ�ɹ���');
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
});