Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.zrrlbGrid=Ext.extend(Ext.grid.GridPanel ,{
	title:"��Ȼ���б�",
		store:new Ext.data.JsonStore({
		root : 'data',
		totalProperty : 'totalProperty',
		url: 'ajax/zygl/zrrlb.aspx?action=list',
		fields:[
		    'id','����','����','����','��ϵ��','��ϵ�绰','������','�Ա�','֤������','֤������','����','��ϵ��ַ','��ע','��������_��','��������_��','��������_��','canDelete'
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
			dataIndex:"����",
			width:160
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
        
        var sex = new Ext.form.ComboBox({
            fieldLabel:'�Ա�',
            width:226,
            mode:'local',
            name:'�Ա�',
            triggerAction:'all',
            editable:false,
            store:new Ext.data.SimpleStore({
                fields : ['myId','displayText'],
                data :[['��','��'],['Ů','Ů']]
            }),
            value:'��',
            valueField:'myId',
            displayField:'displayText'
         });
         
        var jiGuan = new Ext.form.ComboBox({
            fieldLabel:'����',
            name:'����',
            width:226,
            mode:'local',
            name:'����',
            triggerAction:'all',
            editable:false,
            store:new Ext.data.SimpleStore({
                fields : ['id','Text'],
                data :[['�ӱ�ʡ','�ӱ�ʡ'],['ɽ��ʡ','ɽ��ʡ'],['����ʡ','����ʡ'],['����ʡ','����ʡ'],['������ʡ','������ʡ'],['����ʡ','����ʡ'],['�㽭ʡ','�㽭ʡ'],['����ʡ','����ʡ'],['����ʡ','����ʡ'],
                        ['����ʡ','����ʡ'],['ɽ��ʡ','ɽ��ʡ'],['����ʡ','����ʡ'],['����ʡ','����ʡ'],['����ʡ','����ʡ'],['�㶫ʡ','�㶫ʡ'],['����ʡ','����ʡ'],['�Ĵ�ʡ','�Ĵ�ʡ'],['����ʡ','����ʡ'],
                        ['����ʡ','����ʡ'],['����ʡ','����ʡ'],['����ʡ','����ʡ'],['�ຣʡ','�ຣʡ'],['̨��ʡ','̨��ʡ'],['������','������'],['�����','�����'],['������','������'],['�Ϻ���','�Ϻ���'],
                        ['���','���'],['����','����'],['���ɹ�','���ɹ�'],['����','����'],['����','����'],['�½�','�½�'],['����','����']]  
            }),
            emptyText:'��ѡ��',
            valueField:'id',
            displayField:'Text'
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
                    width:226,
                    readOnly: true, 
                    value: '�Զ�����',
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
                sex,
                {
                    fieldLabel: '��������',
                    name: '��������',
                    width:226,
                    xtype: 'datefield',
                    format:'Y-m-d'				                           
                },
                {
                    fieldLabel: '֤������',
                    name: '֤������',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '֤������',
                    name: '֤������',
                    width:226,
                    xtype: 'textfield'				                           
                },
                jiGuan,
                {
                    fieldLabel: '��ϵ�绰',
                    name: '��ϵ�绰',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '��ϵ��ַ',
                    name: '��ϵ��ַ',
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
	                        url:'ajax/zygl/zrrlb.aspx',
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
                title:add?"������Ȼ��":"�޸���Ȼ��",
                width:400,
                items:[
                    form
                ]
            });
            w.show();
    },
    
    //������ͬ
    addhtWindow: function (data) { // ��ʾ��ϸ����: add: �Ƿ�����������, data: ���ݲ���
	    var self = this;
        var gyy_lx = new Ext.LinkCombox({
            width:226,
            append: false,
            store: new Ext.data.JsonStore({
                url: "ajax/zlgl/zphtgl.aspx?action=gyy_fc_lb",//�����Ѿ��еķ�����
	            fields: ['fc']
            }),
	        displayField: 'fc',
	        valueField: 'fc',
	        keyField: ['gyy'],
	        initComponent: function(){	    
	            Ext.LinkCombox.superclass.initComponent.call(this);	    
	        },
            fieldLabel:'��������',
            name:'��������'
        });
	    var gyy = new Ext.GyyCombox({
	        append: false,
	        nextCombox: gyy_lx,
	        width:226,
	        fieldLabel:'������ҵ԰',
	        name:'������ҵ԰'
	    });	    
	    var kehu = new Ext.KehuCombox({
	        width:226,        
            name:'�ͻ�����',
            fieldLabel:'�ͻ�����'
	    });
        
	    var form = new Ext.FormPanel({	
            padding: 10,
            items: [{
                xtype: 'hidden',
                name: 'id'
            },
            {
                fieldLabel: '����',
                name: '����',
                width:226,
                readOnly: true, 
                value: '�Զ�����',                
                xtype: 'textfield'				                           
            },kehu,
            gyy,gyy_lx,
            {
                fieldLabel: '��ͬ��ʼʱ��',
                name: '��ͬ��ʼʱ��',
                width:226,
                allowBlank:false,
                format: 'Y-m-d',
                xtype: 'datefield',
                value: new Date()				                           
            },
            {
                fieldLabel: '��ͬ����ʱ��',
                name: '��ͬ����ʱ��',
                width:226,
                allowBlank:false,
                format: 'Y-m-d',
                xtype: 'datefield',
                value: new Date()					                           
            },
            {
                fieldLabel: '������',
                name: '������',
                width:226,
                format: 'Y-m-d',
                xtype: 'datefield',
                value: new Date()
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
            buttons: [{
                text: '����',
                iconCls: 'icon-save',
                handler: function (c) {                                
                    form.getForm().submit({
                        url: 'ajax/zlgl/zphtgl.aspx',
                        params: {
                            action:'add'
                        },
                        success: function (form, action) {  
                            win.close();
                        }
                    });
                }
            },{
                text: 'ȡ��',
                iconCls: 'icon-cancel',
                handler: function (c) {
                    win.close();
                }
            }]
        });
        
	    var win = new Ext.Window({
	        title:"������ͬ",				        
            width:390,
	        items:[
	            form
	        ]
	    });
	    win.show();
	    kehu.setValue(data.����);

	},
	
	initComponent: function(){
	    var self = this;    
	    var iField = new Ext.form.TextField({ //������
            emptyText:'����������',
	        width:150
    	   
        });
        this.bbar = new Ext.PagingToolbar({ //��ҳ�ؼ�
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
	    var btnDelete = new Ext.Button({
			text:"ɾ��",
			iconCls: 'icon-group-delete',
			handler: function () {
			    var r = self.getSelectionModel().getSelected();
			    if (r) {
			        Ext.Msg.confirm('ɾ����Ȼ��','ȷ��Ҫɾ��ѡ�е���Ȼ����',function(btn){
						if(btn == 'yes') {
							Ext.Ajax.request({
								url:'ajax/zygl/zrrlb.aspx?action=delete',
								success:function(){
									Ext.Msg.alert('ɾ����Ȼ��','��Ȼ��ɾ���ɹ���');
									self.store.reload();
								},
								params:{id: r.get('id')}
							});
						}
					});
			    }				    
			}
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
			btnDelete,
			{
			    text:"��Ӻ�ͬ",
			    iconCls: 'icon-group-create',
			    handler:function () {
			        var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.addhtWindow(r.data); 
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
				    //iField:iField.getValue()
				    
				    self.store.load({
				        params:{
				            iField:iField.getValue()
				        }
				    });
				}
			}
		];
		self.getSelectionModel().on('rowselect', function(sm, rowIdx, r) {
		    btnDelete.setDisabled(!r.data.canDelete);
		});
		self.store.load({
		    params:{
		        start:0,
		        limit:20
		    }
		});		
		Ext.Hudongsoft.zrrlbGrid.superclass.initComponent.call(this);
	}
});