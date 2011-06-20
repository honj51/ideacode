Ext.namespace('Ext.Hudongsoft')

Ext.Hudongsoft.zphtglGrid=Ext.extend(Ext.grid.GridPanel ,{
	title:"��ͬ�б�",
	store:new Ext.data.JsonStore({
		url: 'ajax/zlgl/zphtgl.aspx?action=list',
		root : 'data',
		totalProperty : 'totalProperty',
		fields:[
		    'id','����','�ͻ�����','������ҵ԰','��������','��������','��ͬ��ʼʱ��','��ͬ����ʱ��','������','��ͬ״̬','����ʱ��','��ע','�ͻ�����'
		]	
	}),
	width:792,
	height:560,
	viewConfig : {
		getRowClass : function(record, rowIndex, rowParams, store) {
			var zfq = record.data.������;
			if (!zfq) return;
			var num = new Date(zfq).dateDiff('d',new Date());
			if (num>=0) {
				return 'x-grid-record-red';
			}
		}
	},
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
			header:"�ͻ�����",
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
			header:"��ͬ��ʼʱ��",
			sortable:true,
			resizable:true,
			dataIndex:"��ͬ��ʼʱ��",
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			width:100
		},
		{
			header:"��ͬ����ʱ��",
			dataIndex:"��ͬ����ʱ��",
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			width:100
		},
		{
			header:"������",
			dataIndex:"������",
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			width:100		
		},
		{
			header:"��ͬ״̬",
			sortable:true,
			resizable:true,
			dataIndex:"��ͬ״̬",
			width:100,
			renderer: Ext.Hudongsoft.util.Format.htztRenderer()
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
        var gyy_lx = new Ext.LinkCombox({
            width:226,
            append: false,
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
	        title: add?"������ͬ":"�޸ĺ�ͬ",				        
            width:390,
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
	    
	    var lx_store = new Ext.data.JsonStore({
		    autoLoad:true,
		    url: "ajax/zlgl/zphtgl.aspx?action=find_gyy_fclx",
		    fields: ['lx']
		});
		
		var iFieldName = new Ext.form.TextField({ //����������
            emptyText:'������ͻ�����',
	        width:100
    	   
        });
        
        var iFieldNo = new Ext.form.TextField({ //����������
            emptyText:'��������',
	        width:150
    	   
        });
        
        var gyy_lx = new Ext.GyyLxCombox();
	    var gyy = new Ext.GyyCombox({nextCombox: gyy_lx});        
		this.tbar=[		    
			{
				text:"������ͬ",
				iconCls: 'icon-group-create',
				handler: function () {
                    self.showDetailWindow(true, null);
				}
			},
			{
				text:"�޸ĺ�ͬ",
				iconCls: 'icon-group-update',
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.showDetailWindow(false, r.data);
				    }				    
				}
			},
			{
				text:"ɾ����ͬ",
				iconCls: 'icon-group-delete',
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        Ext.Msg.confirm('ɾ����ͬ','ȷ��Ҫɾ��ѡ�к�ͬ��',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/zlgl/zphtgl.aspx?action=delete',
									success:function(){
										Ext.Msg.alert('ɾ����ͬ','��ͬɾ���ɹ���');
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
				text:"�༭�̶�������Ŀ",
				iconCls: 'icon-xieGenJin',
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (!r) return;			    
		            var fs = ['id','���','������Ŀ','��������','ֵ','����','���','���ɽ�','ǰ�ڶ���','˵��','��������','��Ŀ����','��ͬ���'];
		            var xf_store = new Ext.data.JsonStore({
		                url: 'ajax/zlgl/zphtgl.aspx?action=edit_gdxfx&id='+r.data.id,
	                    root : 'data',
	                    autoLoad: true,
			            fields: fs
		            });         
		            // ����༭��
		            var textEditor = new Ext.form.TextField();
		            var blCombox = new Ext.BLCombox();
		            var vCombox = new Ext.SHCombox();
		            var colModel = new Ext.grid.ColumnModel({
		                columns: [{
		                    header: '���', dataIndex: '���', width: 40
		                },{
		                     header: '������Ŀ', dataIndex: '������Ŀ', width: 120,css:read_only_css
		                },{
		                    header: '��������', dataIndex: '��������', width: 80,css:read_only_css
		                },{
			                header: 'ֵ', dataIndex: 'ֵ', editor: textEditor, width: 70, renderer: valueRenderer
		                },{
			                header: '����', dataIndex: '����', editor: blCombox, width: 70, renderer: valueRenderer
		                },{
			                header: '���', dataIndex: '���', editor: vCombox, width: 70, renderer: percentRenderer
		                },{
			                header: '���ɽ�', dataIndex: '���ɽ�', editor: vCombox, width: 70, renderer: percentRenderer
		                },{
			                header: 'ǰ�ڶ���', dataIndex: 'ǰ�ڶ���', editor: textEditor, width: 80, renderer: valueRenderer
		                },{
			                header: '˵��', dataIndex: '˵��', editor: textEditor, width: 120
		                },{
			                header: '��������', dataIndex: '��������',width: 60,css:read_only_css
		                },{
			                header: '��Ŀ����', dataIndex: '��Ŀ����',width: 60,css:read_only_css
		                }],
		                isCellEditable: function(col, row) {
                            var record = xf_store.getAt(row);
                            if (record.get(fs[col]) == '-') { // replace with your condition
                              return false;
                            }
                            return Ext.grid.ColumnModel.prototype.isCellEditable.call(this, col, row);
                        }
		            });
	            
		            
				    var grid = new Ext.grid.EditorGridPanel({
			            store: xf_store,
			            id: 'xxxxxxxx',
			            colModel: colModel,
			            tbar: ['ע��:��ɫ��Ϊ���ɱ༭�',
			                {
			                    text:'����������',
			                    iconCls: 'icon-group-create',
			                    handler:function(){			                     
	                                var r = self.getSelectionModel().getSelected();
//	                                addxfx(null,xf_store,r);
                                    addxfx(null,xf_store,r,function (values) {
                                        values["���"] = xf_store.getCount()+1;
                                        var r = new Ext.data.Record(values);
                                        xf_store.add(r);
                                    });
                                    
			                    }
			                },
			                {
			                    text:'ɾ��������',
			                    iconCls: 'icon-group-delete',
			                    handler:function () {
			                        var r = grid.getSelectionModel().getSelectedCell();
			                        if(r) {
			                            Ext.Msg.confirm('ɾ��������','ȷ��Ҫɾ��ѡ�е���������',function(btn){
			                                if(btn == 'yes') {
			                                    grid.store.removeAt(r[0]);
			                                }
			                            });
			                        
//			                            var id = grid.store.getAt(r[0]).data.id;
//			                            Ext.Msg.confirm('ɾ��������','ȷ��Ҫɾ��ѡ�е���������',function(btn){
//							                if(btn == 'yes') {
//								                Ext.Ajax.request({
//									                url:'ajax/zlgl/zphtgl.aspx?action=delete_xfx',
//									                success:function(){
//										                Ext.Msg.alert('ɾ��������','������ɾ���ɹ���');
//										                grid.store.reload();
//									                },
//									                params:{id:id}
//								                });
//							                }
//						                });
                                        
			                        }
			                    }
			                },
			                 '->',
			                {
			                    text: '���뵽��ͬ',
			                    handler: function () {
			                        var data = [];
			                        xf_store.each(function(record){
			                            data.push(record.data);
			                        });
			                        Ext.Ajax.request({
			                             url: "ajax/zlgl/zphtgl.aspx?action=import_gdxfx", 
			                             params: {
			                                id: r.data.id,
			                                data: Ext.encode(data)
			                             },
			                             success: function () {
			                                Ext.Msg.alert('�̶��������','���ݵ���ɹ���');
			                                win.close();
			                             }
			                        });			                    
			                    }
			                }  
			            ]
            		});
            		var win = new Ext.Window({
            		    layout: 'fit',
			            height: 500,
			            width: 900,
            		    title: '�̶�������Ŀ',
            		    items: grid
            		});
            		win.show();
				}
			},
			'->',
	        iFieldName,
			{
				xtype:"label",
				text:"��ҵ԰��"
			},
            gyy,
			{
				xtype:"label",
				text:"���ͣ�"
			},
            gyy_lx,
            iFieldNo,
			{
				text:"����",
				iconCls: 'icon-query',
				handler:function () {
				    self.store.baseParams = {
			            iFieldName:iFieldName.getValue(),
			            iFieldNo:iFieldNo.getValue(), 
			            gyy:gyy.getValue(),
			            leix:gyy_lx.getValue()
				    };
				    self.store.load({
				        params: {
				            start:0,
		                    limit:20
				        }
				    });						
				}
			}
		];
		self.store.load({
		    params:{
		        start:0,
		        limit:20
		    }
		});
		Ext.Hudongsoft.zphtglGrid.superclass.initComponent.call(this);
	}
});