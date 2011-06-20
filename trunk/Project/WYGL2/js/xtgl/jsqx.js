Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.jsqxGrid=Ext.extend(Ext.grid.GridPanel ,{
	title:"��ɫȨ��",
     store:new Ext.data.JsonStore({
		url: 'ajax/xtgl/jsqx.aspx?action=list',
		fields:[
		    'id','role_id','role_name'
		]
	}),
	width:814,
	height:450,
	columns:[{
			header:"���",
			dataIndex:"role_id",
			width:100
		},
		{
			header:"��ɫ����",
			dataIndex:"role_name",
			width:300
		}
	],
	listeners : {  // ��Ӽ����¼�
        celldblclick: function(grid, rowIndex, columnIndex, e) {
            var r = grid.store.getAt(rowIndex);	
            grid.showDetailWindow(false, r.data);
        }
	},
	showDetailWindow: function (add, data) {    // ��ʾ��ϸ����: add: �Ƿ�����������, data: ���ݲ���
	    if (!add && data.role_name=="�ܹ���Ա") {
	        Ext.Msg.alert("��ʾ","�ܹ���Ա�����޸ģ�");
		    return;
	    }
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
                    fieldLabel: '��ɫ�������',
                    name: 'role_id',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '��ɫ����',
                    name: 'role_name',
                    width:226,
                    xtype: 'textfield'				                           
                }
                
                  
	        ],
	        buttons:[
	            {
	                text:'����',// callback
	                iconCls: 'icon-save',
	                handler:function (c) {		
	                    if (add && form.getForm().getValues().role_name == '�ܹ���Ա') {
	                        Ext.Msg.alert("��ʾ","�ܹ���Ա����������");
	                        return;
	                    }                
	                     form.getForm().submit({
	                        url:'ajax/xtgl/jsqx.aspx',
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
                title: add?"��ӽ�ɫ":'�޸Ľ�ɫ',
    	        width:400,
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
                    boxLabel:'����¼��',
                    name:'����¼��'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'�ɷѹ���',
                    name:'�ɷѹ���'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'��ҵ԰����',
                    name:'��ҵ԰����'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'��������',
                    name:'��������'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'�ͻ�����',
                    name:'�ͻ�����'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'Ԥ������',
                    name:'Ԥ������'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'���޺�ͬ����',
                    name:'��ƾ��ͬ����'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'��ͬ������ʾ',
                    name:'��ͬ������ʾ'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'�տ����ͳ��',
                    name:'�տ����ͳ��'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'�տ���ϸͳ��',
                    name:'�տ���ϸͳ��'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'��ɫȨ��',
                    name:'��ɫȨ��'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'����Ա����',
                    name:'����Ա����'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'�޸ı�������',
                    name:'�޸ı�������'
                }     
            ],
            buttons:[
                {
                    text:'����',// callback
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
                    text:'ȡ��',
                    iconCls:'icon-cancel',
                    handler:function () {
                        wins.close()
                    }
                }
            ]
        });        
        var wins = new Ext.Window({
            title:'�޸�Ȩ��',
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
				text:"���",
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
				        if (r.data.role_name == "�ܹ���Ա") {
				            Ext.Msg.alert("��ʾ","�ܹ���Ա����ɾ����");
		                    return;
				        }
				        Ext.Msg.confirm('ɾ����ɫ','ȷ��Ҫɾ��ѡ�еĽ�ɫ��',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/xtgl/jsqx.aspx?action=delete',
									success:function(){
										Ext.Msg.alert('ɾ����ɫ','��ɫɾ���ɹ���');
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
				text:"����Ȩ��",
				iconCls: 'icon-sheZhi',
				handler:function () {
				    var per = self.getSelectionModel().getSelected();
				    if (per) {
				        if (per.json.role_name=='�ܹ���Ա') {
				            Ext.Msg.alert("��ʾ","�ܹ���Աӵ�����Ȩ�ޣ������޸ģ�");
				            return;
				        }
				         self.setPermissions(per.data);
				    }			   
				}
			}
		];
		self.store.load();
		Ext.Hudongsoft.jsqxGrid.superclass.initComponent.call(this);
	}
});