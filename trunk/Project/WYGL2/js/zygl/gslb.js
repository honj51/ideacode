Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.gslbGrid=Ext.extend(Ext.grid.GridPanel ,{
    xtype:"grid",
	title:"��˾�б�",
    store:new Ext.data.JsonStore({
        root : 'data',
		totalProperty : 'totalProperty',
		url: 'ajax/zygl/gslb.aspx?action=list',
		fields:[
		    'id','����','����','����','��ϵ��','��ϵ�绰','������','ע���','���˴���','�칫��ַ','��ϵ����','��ע','��������_��','��������_��','��������_��'
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
			header:"����",
			sortable:true,
			resizable:true,
			dataIndex:"����",
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
			header:"��ϵ��",
			sortable:true,
			resizable:true,
			dataIndex:"��ϵ��",
			width:100
		},
		{
			header:"��ϵ�绰",
			sortable:true,
			resizable:true,
			dataIndex:"��ϵ�绰",
			width:100
		}
	],
	
	listeners : { // ��Ӽ����¼�
	    celldblclick: function(grid, rowIndex, columnIndex, e) {
	        var r = grid.store.getAt(rowIndex);	
	        grid.showDetailWindow(false, r.data);
	    }
	},
	
	showDetailWindow: function (add, data) {    // ��ʾ��ϸ����: add: �Ƿ�����������, data: ���ݲ���
    var self = this;
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
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '����',
                name: '����',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '����',
                name: '����',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '������',
                name: '������',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: 'ע���',
                name: 'ע���',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '��������',
                name: '��������',
                width:226,
                xtype: 'datefield',
                format:'Y-m-d'				                           
            },
            {
                fieldLabel: '���˴���',
                name: '���˴���',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '�칫��ַ',
                name: '�칫��ַ',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '��ϵ�绰',
                name: '��ϵ�绰',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '��ϵ����',
                name: '��ϵ����',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '��ϵ��',
                name: '��ϵ��',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '��ע',
                name: '��ע',
                width:226,
                height:60,
                xtype: 'textarea'				                           
            }
            
              
	    ],
	    buttons:[
	        {
	            text:'����',// callback
	            iconCls: 'icon-save',
	            handler:function (c) {		                
	                 form.getForm().submit({
	                    url:'ajax/zygl/gslb.aspx',
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
            data.�������� = new Date(data.��������_��,data.��������_��-1,data.��������_��);
            form.getForm().setValues(data);
        }
        
        var w = new Ext.Window({
            title:add?"������˾":"�޸Ĺ�˾",
             width:400,
            items:[
                form
            ]
        });
        w.show();
    },
	
	initComponent: function(){
	    var self = this;
	    var iField = new Ext.form.TextField({ //������
            emptyText:'����������',
	        width:150
        });
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
				        Ext.Msg.confirm('ɾ����˾','ȷ��Ҫɾ��ѡ�еĹ�˾��',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/zygl/gslb.aspx?action=delete',
									success:function(){
										Ext.Msg.alert('ɾ����˾','��˾ɾ���ɹ���');
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
				text:"������"
			},
			iField,
			{
				text:"����",
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
});