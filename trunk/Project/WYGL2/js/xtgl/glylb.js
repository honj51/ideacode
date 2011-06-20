Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.glylbGrid=Ext.extend(Ext.grid.GridPanel ,{
	title:"����Ա�б�",
	store:new Ext.data.JsonStore({
		url: 'ajax/xtgl/glylb.aspx?action=list',
		fields:[
		    'id','admin_id','admin_pwd','admin_name','admin_limit','tel','qq','email'
		]
	}),
	width:814,
	height:450,
	columns:[
		{
			header:"���",
			dataIndex:"id",
			width:100
		},
		{
			header:"����Ա�ʺ�",
			dataIndex:"admin_id",
			width:100
		},
		{
			header:"����",
			dataIndex:"admin_name",
			width:100
		},
		{
			header:"��ɫ",
			dataIndex:"admin_limit",
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
        var password1 = new Ext.form.TextField({ 
            fieldLabel: '����',
            name: 'admin_pwd',
            width:226,
            inputType: 'password',
            allowBlank:false 	   
        });
        
        var password2 = new Ext.form.TextField({ 
            fieldLabel: 'ȷ������',
            name: 'admin_pwd2',
            width:226,
            allowBlank:false,
            inputType: 'password'	   
        });
        
        var js = new Ext.form.ComboBox({
            fieldLabel:'��ɫ',
            width:226,
            name:'admin_limit',
            triggerAction:'all',
            editable:false,
            store: new Ext.data.JsonStore({
                autoLoad:true,
	            url: "ajax/xtgl/glylb.aspx?action=glygl_js",
	            fields: ['js']
            }),            
            valueField:'js',
            displayField:'js'  
        });
        
        var form = new Ext.FormPanel({
	        padding:10,
	        items:[
	            {
	                xtype: 'textfield',
                    name: 'id',
                    hidden: true,
                    hideLabel:true
	            },
                {
                    fieldLabel: '�ʺ�',
                    name: 'admin_id',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '����',
                    name: 'admin_name',
                    width:226,
                    xtype: 'textfield'				                           
                },
                password1,
                password2,
                js,
                {
                    fieldLabel: '�绰',
                    name: 'tel',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: 'qq',
                    name: 'qq',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '����',
                    name: 'email',
                    width:226,
                    vtype:'email',  
                    xtype: 'textfield'				                           
                }              
	        ],
	        buttons:[
	            {
	                text:'����',// callback
	                iconCls: 'icon-save',
	                handler:function (c) {	
	                    if (password1.getValue() != password2.getValue()) {
	                         Ext.Msg.alert("��ʾ","�����������벻һ��,���������룡");
	                         return;
	                    };	                
	                     form.getForm().submit({
	                        url:'ajax/xtgl/glylb.aspx',
	                        params:{
	                            action: add?'add':'update'
	                        },
	                        success:function (form, action) {
	                            w.close();
                                self.store.load();                                
                                Ext.Msg.alert("����Ա����","���ݱ���ɹ�!");
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
            data.admin_pwd2 = data.admin_pwd;
            form.getForm().setValues(data);
        }
        
        var w = new Ext.Window({
            title:add?"��ӹ���Ա":'�޸Ĺ���Ա',
	        width:400,
            items:[
                form
            ]
        });
        w.show();
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
				        Ext.Msg.confirm('ɾ������Ա','ȷ��Ҫɾ��ѡ�еĹ���Ա��',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/xtgl/glylb.aspx?action=delete',
									success:function(){
										Ext.Msg.alert('ɾ������Ա','����Աɾ���ɹ���');
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
		self.store.load();		
		Ext.Hudongsoft.glylbGrid.superclass.initComponent.call(this);
	}
});
