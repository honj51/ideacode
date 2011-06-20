Ext.namespace('Ext.Hudongsoft');


Ext.Hudongsoft.fcglGrid=Ext.extend(Ext.grid.GridPanel ,{
    xtype:"grid",
	title:"��������",
	store:new Ext.data.JsonStore({
		root : 'data',
		totalProperty : 'totalProperty',
		url: 'ajax/zygl/fcgl.aspx?action=list',
		fields:[
		    'id','��ҵ԰����','��������','����','����','����','����','���ݽṹ'
		]
	}),
	width:785,
	height:576,
	columns:[
		{
			header:"���",
			sortable:true,
			resizable:true,
			dataIndex:"id",
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
			header:"��������",
			sortable:true,
			resizable:true,
			dataIndex:"��������",
			width:100
		},
		{
			header:"����",
			sortable:true,
			resizable:true,
			dataIndex:"����",
			width:100
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
	    //ʵ����combox���

        var gyy_lx = new Ext.GyyLxCombox({
            width:130,
	        emptyText:'��ѡ��',
	        fieldLabel:'����',
	        name:'��������'
        });
	    var gyy = new Ext.GyyCombox({
	        nextCombox: gyy_lx,
	        width:130,
	        emptyText:'��ѡ��',
	        fieldLabel:'��ҵ԰',
	        name:'��ҵ԰����'
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
                    fieldLabel: '����',
                    name: '����',
                    xtype: 'textfield'				                           
                },
                gyy,
                gyy_lx,
                {
                    fieldLabel: '����',
                    name: '����',
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '����',
                    name: '����',
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '����',
                    name: '����',
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '���ݽṹ',
                    name: '���ݽṹ',
                    xtype: 'textfield'				                           
                }
                
                  
		    ],
		    buttons:[
		        {
		            text:'����',// callback
		            iconCls: 'icon-save',
		            handler:function (c) {		                
		                 form.getForm().submit({
		                    url:'ajax/zygl/fcgl.aspx',
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
	        title:add?"��������":"�޸ķ���",
		    width:300,
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
				text:"��������",
				iconCls: 'icon-group-create',
				handler:function () {
                    self.showDetailWindow(true, null);
				}
				
			},
			{
				text:"�޸ķ���",
				iconCls: 'icon-group-update',
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.showDetailWindow(false, r.data);
				    }				    
				}
			},
			{
				text:"ɾ������",
				iconCls: 'icon-group-delete',
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        Ext.Msg.confirm('ɾ������','ȷ��Ҫɾ��ѡ�з�����',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/zygl/fcgl.aspx?action=delete',
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
			}
		];
		self.store.load({
		    params:{
		        start:0,
		        limit:20
		    }
		});
		Ext.Hudongsoft.fcglGrid.superclass.initComponent.call(this);
	}
});


