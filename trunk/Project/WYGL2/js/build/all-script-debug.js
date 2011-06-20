/*!
 * HdAgency JS. Hudongsoft.cn
 */
Ext.namespace('Ext.Hudongsoft');

/************************************************************************/
/* ¼���б�                                                             */
/************************************************************************/
Ext.Hudongsoft.sjlrGrid=Ext.extend(Ext.grid.GridPanel ,{	
	jfgl: false,
	dispalyDetails: function() {
	    var self = this;
	    var r = self.getSelectionModel().getSelected();
	    if (r) {
            function printDate(f) {
                var data = r.data;
                return data[f+'_��'] + '/' + data[f+'_��'] + '/' + data[f+'_��'];
            }
            
            var html = '<table class="tab1">'+
                        '<tr style="height:20px;">'+
                            '<td>'+'<strong>'+'��ͬ��ţ�'+'</strong>'+r.data.����+'<td>'+
                            '<td>'+'<strong>'+'�ͻ���ţ�'+'</strong>'+r.data.�ͻ�����+'<td>'+
                            '<td>'+'<strong>'+'�ͻ�����:'+'</strong>'+r.data.�ͻ�����+'<td>'
                        +'</tr>'
                        +'<tr style="height:20px;">'+
                            '<td>'+'<strong>'+'��ϵ�绰��'+'</strong>'+r.data.��ϵ�绰+'<td>'+
                            '<td>'+'<strong>'+'��ϵ��ַ��'+'</strong>'+r.data.��ϵ��ַ+'<td>'
                        +'</tr>'+
                        '<tr style="height:20px;">'+
                            '<td>'+'<strong>'+'������ҵ԰��'+'</strong>'+r.data.������ҵ԰+'<td>'+
                            '<td>'+'<strong>'+'�������ͣ�'+'</strong>'+r.data.��������+'<td>'+
                            '<td>'+'<strong>'+'����������'+'</strong>'+r.data.��������+'<td>'+
                            '<td>'+'<strong>'+'��ͬ��ʼʱ�䣺'+'</strong>'+printDate('��ͬ��ʼʱ��')+'<td>'+
                            '<td>'+'<strong>'+'��ͬ����ʱ�䣺'+'</strong>'+printDate('��ͬ����ʱ��')+'<td>'+
                         '</tr>'
                        +'</table>';
            var panel = new Ext.Panel({
                title: self.jfgl?'�ɷ��ܱ�':'¼���ܱ�',                
                layout: 'border',                
                items: [{
                    xtype: 'panel',
                    region:'north',
                    cls: 'side_col',
                    html: html
                },
                new Ext.Hudongsoft.lrzbGrid({region:'center',jfgl: self.jfgl,zbdata:r.data})]
            });
            main_tab.add(panel).show();
	    }
	},
	listeners : { // ��Ӽ����¼�
	    celldblclick: function(grid, rowIndex, columnIndex, e) {
	        var r = grid.store.getAt(rowIndex);	
	        grid.dispalyDetails();
	    }
	},
	initComponent: function(){
	    var self = this;
	    self.title = self.jfgl? "�ɷѹ���":"¼�����";
	    self.store = new Ext.data.JsonStore({
	        storeId:self.jfgl?'jiaofei':'luru',
		    url: 'ajax/sfgl/sjlr.aspx?action=list',
            root : 'data',
	        totalProperty : 'totalProperty',
		    fields:[ // idΪ��ͬid
		        'id','����','�ͻ�����','�ͻ�����','��ϵ�绰','��ϵ��ַ','������ҵ԰','��������','��������','��ͬ��ʼʱ��_��','��ͬ��ʼʱ��_��','��ͬ��ʼʱ��_��','��ͬ����ʱ��_��','��ͬ����ʱ��_��',
		        '��ͬ����ʱ��_��','��ͬ��ʼʱ��','��ͬ����ʱ��','¼��״̬','�ɷ�״̬','¼���·�'
		    ]
	    });
	    
	    var lx_store = new Ext.data.JsonStore({
		    autoLoad:true,
		    url: "ajax/zlgl/zphtgl.aspx?action=find_gyy_fclx",
		    fields: ['lx']
		});
	    self.columns = [
		    {
			    header:"���",
			    sortable:true,
			    resizable:true,
			    dataIndex:"id",
			    width:60
		    },
		    {
			    header:"����",
			    sortable:true,
			    resizable:true,
			    dataIndex:"����",
			    width:150
		    },
		    {
			    header:"�ͻ�����",
			    sortable:true,
			    resizable:true,
			    dataIndex:"�ͻ�����",
			    width:70
		    },
		    {
			    header:"������ҵ԰",
			    sortable:true,
			    resizable:true,
			    dataIndex:"������ҵ԰",
			    width:80
		    },
		    {
			    header:"��������",
			    sortable:true,
			    resizable:true,
			    dataIndex:"��������",
			    width:80
		    },
		    {
			    header:"��ͬ��ʼʱ��",
			    sortable:true,
			    resizable:true,
			    dataIndex:"��ͬ��ʼʱ��",
			    renderer: Ext.Hudongsoft.util.Format.yearMonthDayRenderer_1,
			    width:100
		    },
		    {
			    header:"��ͬ����ʱ��",
			    sortable:true,
			    resizable:true,
			    dataIndex:"��ͬ����ʱ��",
			    renderer: Ext.Hudongsoft.util.Format.yearMonthDayRenderer_2,
			    width:100
		    },
		    {
			    header:self.jfgl?"�ɷ�״̬":"¼��״̬",
			    sortable:true,
			    resizable:true,
			    dataIndex:self.jfgl?"�ɷ�״̬":"¼��״̬",
			    renderer:self.jfgl?Ext.Hudongsoft.util.Format.jfztRenderer():Ext.Hudongsoft.util.Format.lrztRenderer(),
			    width:100
		    },
		    {
			    header:"¼���·�",
			    sortable:true,
			    resizable:true,
			    dataIndex:"¼���·�",
			    width:70
		    }
	    ];
	    this.bbar = new Ext.PagingToolbar({
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
	    
	    // ��������
	    var mc = new Ext.form.TextField({width:80});
	    var gyy_lx = new Ext.GyyLxCombox();
	    var gyy = new Ext.GyyCombox({nextCombox: gyy_lx});
	    var hm = new Ext.form.TextField({width:80});
	    var nian = new Ext.YearCombox();
	    var yue = new Ext.MonthCombox();
	    this.tbar=new Ext.Toolbar({		
	        enableOverflow: true,    
		    items: ['���ƣ�',
			mc,'  ',
			'��ҵ԰��',
            gyy,'  ',
            '���ͣ�',
            gyy_lx,'  ',
			'���룺',
			hm,'  ',
			'�꣺',nian,'  ',
			'�£�',yue,'  ',
            {
				text:"����",
				iconCls: 'icon-query',
				handler: function () {
	                self.store.baseParams = {
			            mc: mc.getValue(),
                        gyy: gyy.getValue(),
                        gyy_lx: gyy_lx.getValue(),
                        hm: hm.getValue(),
                        nian: nian.getValue(),
                        yue: yue.getValue()         				            
                    };
				    self.store.load({
				        params: {
				            start: 0,limit:20
				        }
				    });
				}
			},'->',
			{
			    text:"�鿴����",
			    iconCls: 'icon-list',
			    handler: function () {
			        self.dispalyDetails();
			    }
			}
			
		]});
		
		self.store.baseParams = {
	        nian:now_year,yue:now_month
	    };
		self.store.load({
		    params: {
		        start: 0,limit:20
		    }
		});
		Ext.Hudongsoft.sjlrGrid.superclass.initComponent.call(this);
	}
})

/*
 *	¼���ܱ� (�շ��ܱ�)
 */
Ext.Hudongsoft.lrzbGrid=Ext.extend(Ext.grid.GridPanel ,{
	zbdata: null,
	jfgl: false,
	store:new Ext.data.JsonStore({
		url: 'ajax/sfgl/sjlr.aspx?action=list_zb',
		fields:[
		    'id','���','����·�','���ݱ��','�ͻ����','�ͻ�����','������','������','�ܷ���','�ɷѽ��','���','¼��״̬','�ɷ�״̬'
		]
	}),
	width:700,
	height:500,
	columns:[
		{
			header:"���",
			dataIndex:"���",
			width:60		
		},
		{
			header:"����·�",
			dataIndex:"����·�",
			width:100
		},
		{
			header:"�ܷ���",
			dataIndex:"�ܷ���",
			width:80
		},
		{
			header:"�ɷѽ��",
			dataIndex:"�ɷѽ��",
			width:80
		},
		{
			header:"���",
			dataIndex:"���",
			width:80
		},
		{
			header:"¼��״̬",
			dataIndex:"¼��״̬",
			renderer: Ext.Hudongsoft.util.Format.lrztRenderer(),
			width:100
		},
		{
			header:"�ɷ�״̬",
			dataIndex:"�ɷ�״̬",
			renderer: Ext.Hudongsoft.util.Format.jfztRenderer(),
			width:100
		}
	],
	initComponent: function(){
	    var self = this;
	    var btnXQ = new Ext.Button({
	        text: '�鿴����',
	        iconCls: 'icon-list',
	        disabled: true,
		    handler: function () {
		        var r = self.getSelectionModel().getSelected();
		        if (r) {
		            var html = '';
		            var w = new Ext.Window({
                        title:"�տ���ϸ�б�",
            	        width:815,
                        autoScroll: true,
                        items:[{
                            xtype: 'panel',
                            html:'<iframe src="Print.aspx?djbh='+r.data.���ݱ��+ '&ny='+r.data.����·�+'" width=800 height=500 frameborder="0" scrolling="auto"></iframe>'
                         }]
                    });
                    w.show();
		        }
		    }
	    });
	    var btnLR = new Ext.Button({
	        text: self.jfgl?'�ɷ�':'¼��',
	        iconCls: 'icon-jiSuan',
	        width:90,
	        disabled: true,
		    handler: function () {	
//		        var r = self.getSelectionModel().getSelected();
//		        if (btnLR.text == "�޸�¼��" && r.data.�ɷ�״̬=='�ѽɷ�') {
//	                Ext.Msg.alert("��ʾ","����¼���ѽɷѣ��������ݻ�����ɷ���Ϣ����Ҫ���½ɷ�"); 
//	            }
    
		        // ¼��
		        function lr() {
		            if (btnLR.text == "�޸�¼��") {
		                if (permission_xglr == false) {
		                    Ext.Msg.alert("��ʾ","û��Ȩ���޸���¼�������");
		                    return;
		                }
		            }
		        	var r = self.getSelectionModel().getSelected();
				    if (!r) return;
		            var fs = ['���','������Ŀ','��������','ֵ','����','���','���ɽ�','���¶���','����','˵��','��������'];
		            var xf_store = new Ext.data.JsonStore({
		                url: 'ajax/sfgl/sjlr.aspx?action=list_lr&id='+self.zbdata.id +'&xh='+r.data.���, // idΪ��ͬid,	                    
	                    autoLoad: true,
			            fields: fs
		            });         
		            // ����༭��
		            var textEditor = new Ext.form.NumberField();
		            var blCombox = new Ext.BLCombox();
		            var vCombox = new Ext.SHCombox();
		            var colModel = new Ext.grid.ColumnModel({
		                columns: [{
		                    header: '���', dataIndex: '���', width: 40
		                },{
		                     header: '������Ŀ', dataIndex: '������Ŀ', width: 110,css:read_only_css
		                },{
		                    header: '��������', dataIndex: '��������', width: 70,css:read_only_css
		                },{
			                header: 'ֵ', dataIndex: 'ֵ', width: 70, css:read_only_css
		                },{
			                header: '����', dataIndex: '����', width: 70, css:read_only_css
		                },{
			                header: '���', dataIndex: '���',  width: 70, css:read_only_css
		                },{
			                header: '���ɽ�', dataIndex: '���ɽ�',  width: 60, css:read_only_css
		                },{
			                header: '���¶���', dataIndex: '���¶���', width: 80,  css:read_only_css
		                },{
			                header: '����', dataIndex: '����', editor: textEditor, width: 80
		                },{
			                header: '˵��', dataIndex: '˵��', width: 110,  css:read_only_css
		                },{
			                header: '��������', dataIndex: '��������',width: 60,css:read_only_css
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
			            colModel: colModel,
			            tbar: ['ע��:��ɫ��Ϊ���ɱ༭�','->',{
			                text: '�ύ',
			                width:80,
			                iconCls: 'icon-wanChen',
			                handler: function () {
			                    var data = [];
			                    var validate_pass = true;
			                    xf_store.each(function(record){
			                        var ds = record.data.����;
			                        if (ds === '') {
			                            validate_pass = false;
			                            return false;
			                        }
			                        data.push(record.data);
			                    });
			                    if (!validate_pass) {
			                        Ext.Msg.alert('¼��','���������');
			                        return;
			                    }
			                    Ext.Ajax.request({
			                         url: "ajax/sfgl/sjlr.aspx?action=lr_tj", 
			                         params: {
			                            htid: self.zbdata.id, // ��ͬid
			                            xh: r.data.���,
			                            year: r.data.����·�.split('/')[0],
			                            month: r.data.����·�.split('/')[1],
			                            data: Ext.encode(data)
			                         },
			                         success: function () {
			                            Ext.Msg.alert('�ύ','�����ύ�ɹ���');
			                            self.store.reload();
			                            win.close();
			                            Ext.StoreMgr.get('luru').reload();
			                         }
			                    });			                    
			                }
			            }  
			            ]
            		});
            		var win = new Ext.Window({
            		    layout: 'fit',
			            height: 500,
			            width: 850,
            		    title: '¼��',
            		    items: grid
            		});
            		
            		if (btnLR.text == "�޸�¼��" && r.data.�ɷ�״̬=='�ѽɷ�'){
            		    Ext.MessageBox.confirm("��ʾ","����¼���ѽɷѣ��������ݻ�����ɷ���Ϣ����Ҫ���½ɷ�", function(btn){
                            if (btn == 'yes'){
                                win.show();
                            }
                        });
            		}else{
            		    win.show();
            		}  
		        }
	       
		        // �ɷ�
		        function jf() {
		        	var r = self.getSelectionModel().getSelected();
				    if (!r) return;		            
				    Ext.Ajax.request({
				        url: 'ajax/sfgl/sjlr.aspx?action=list_jf&id='+self.zbdata.id+'&xh='+r.data.���, // idΪ��ͬid
				            success: function(response, opts) {
                                var obj = Ext.decode(response.responseText);
                                var xf_store = new Ext.data.JsonStore({
                                    url: 'ajax/sfgl/sjlr.aspx?action=list_jf&id='+self.zbdata.id+'&xh='+r.data.���, // idΪ��ͬid
                                    data: obj.data,
                                    fields: ['���','�շ���Ŀ','�շ�����','ֵ','����','���','���ɽ�','���¶���','����','����','˵��']
                                });         	            
                                xf_store.on("load",function (store, records) {
                                    
                                })
                                var x = obj.�ܽ��;
                                var sf_textfield = new Ext.form.NumberField({});		            
                                var grid = new Ext.grid.GridPanel({
                                    store: xf_store,
                                    columns: [{
                                        header: '���', dataIndex: '���', width: 40
                                    },{
                                         header: '������Ŀ', dataIndex: '�շ���Ŀ', width: 110
                                    },{
                                        header: '��������', dataIndex: '�շ�����', width: 70
                                    },{
                                        header: 'ֵ', dataIndex: 'ֵ',  width: 70
                                    },{
                                        header: '����', dataIndex: '����', width: 70
                                    },{
                                        header: '���', dataIndex: '���', width: 70
                                    },{
                                        header: '���ɽ�', dataIndex: '���ɽ�', width: 70
                                    },{
                                        header: '���¶���', dataIndex: '���¶���',  width: 70
                                    },{
                                        header: '����', dataIndex: '����',  width: 80
                                    },{
                                        header: '����', dataIndex: '����',width: 60
                                    },{
                                        header: '˵��', dataIndex: '˵��',  width: 110
                                    }],
                                    tbar: {
                                        items: ['']
                                    },
                                    bbar: {
                                        items: ['�ܽ���&nbsp;',''+obj.�ܽ��,'�ϴν��ࣺ��',''+obj.�ϴν���,'&nbsp;&nbsp;&nbsp;��Ҫ���ѽ���',''+obj.��Ҫ���ѽ��,'ʵ�ս�&nbsp',sf_textfield]
                                    },
                                    buttons: [{
                                        text: '�ύ',
                                        iconCls: 'icon-wanChen',
                                        handler: function () {			                    
                                            Ext.Ajax.request({
                                                 url: "ajax/sfgl/sjlr.aspx?action=jf_tj", 
                                                 params: {
                                                    zbid: r.data.id,
                                                    �ɷѽ��: sf_textfield.getValue(),
                                                    �ܷ���: obj.�ܽ��,
                                                    �ϴ����: obj.�ϴν���
                                                 },
                                                 success: function (response, opts) {
                                                    var obj = Ext.decode(response.responseText);
                                                    if (obj.success) {
                                                        Ext.Msg.alert('�ύ','�ɷѳɹ���');
                                                        self.store.reload();
                                                        win.close();
                                                        Ext.StoreMgr.get('jiaofei').reload();
                                                    }
                                                    else {
                                                        Ext.Msg.alert('�ύʧ��', obj.errorMessage);                                                        
                                                    }
                                                 }
                                            });			                    
                                        }
                                    }  
                                    ]
                                });
                                var win = new Ext.Window({
                                    layout: 'fit',
                                    height: 500,
                                    width: 850,
                                    title: '�ɷ�',
                                    items: grid
                                });
                                win.show();
                            }
				    });
		        }
		        
		        if (self.jfgl) {
		            jf();
		        }
		        else
		            lr();
		    }// handler
	    });
	    self.getSelectionModel().on('rowselect', function(sm, rowIdx, r) {
	        btnLR.setDisabled(true);
	        btnXQ.setDisabled(true);
	        if (self.jfgl) { //�ɷ�	            
	            if (r.data.�ɷ�״̬=='�ѽɷ�') btnXQ.setDisabled(false);
	            if (r.data.�ɷ�״̬=='δ�ɷ�' && r.data.¼��״̬=='��¼��') btnLR.setDisabled(false);
	        }	        
	        else // ¼��
	        {	       
	            btnLR.setText('¼��');     
	            if ((r.data.¼��״̬=='��¼��') && (r.data.�ɷ�״̬!='��Ҫ����')) {
	                btnXQ.setDisabled(false);
	                btnLR.setDisabled(false);
	                btnLR.setText('�޸�¼��');
                }
	            if (r.data.¼��״̬=='δ¼��') btnLR.setDisabled(false);
	        }	            
	    });
		this.tbar=['->',btnXQ,btnLR];
		
		self.store.load({params:{
            htbh: self.zbdata.����
		}});
		Ext.Hudongsoft.lrzbGrid.superclass.initComponent.call(this);
	}
})

/*
 *	�տ���ϸ�б� (�տ��վ�)
 */
Ext.Hudongsoft.sksjGrid=Ext.extend(Ext.grid.GridPanel ,{
    djbh: null,
	store:new Ext.data.JsonStore({
		url: 'ajax/sfgl/sjlr.aspx?action=list_lb',
		fields:[
		    'id','���','�շ���Ŀ','�շ�����','���¶���','���¶���','ֵ','����','���','����','���ɽ�','����','¼��״̬'
		]
	}),
	width:700,
	height:400,
	columns:[
		{
			header:"���",
			dataIndex:"���",
			width:40		
		},
		{
			header:"�շ���Ŀ",
			dataIndex:"�շ���Ŀ",
			width:100
		},
		{
			header:"���¶���",
			dataIndex:"���¶���",
			width:60
		},
		{
			header:"���¶���",
			dataIndex:"���¶���",
			width:60
		},
		{
			header:"����",
			dataIndex:"����",
			width:60
		},
		{
			header:"���",
			dataIndex:"���",
			width:60
		},
		{
			header:"����",
			dataIndex:"����",
			width:60
		},
		{
			header:"ֵ",
			dataIndex:"ֵ",
			width:60
		},
		{
			header:"���ɽ�",
			dataIndex:"���ɽ�",
			width:60
		},
		{
			header:"����",
			dataIndex:"����",
			width:60
		},
		{
			header:"˵��",
			dataIndex:"˵��",
			width:80
		}
	],
	initComponent: function(){
	    var self = this;
		this.tbar=['->',{
		    text: '��ӡ',
		    handler: function () {		        
		    }
		}];
		self.store.load({params:{
		    djbh: self.djbh
		}});
		Ext.Hudongsoft.sksjGrid.superclass.initComponent.call(this);
	}
})
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
});Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.xgmmWin=Ext.extend(Ext.Window ,{
    xtype:"window",
	title:"�޸�����",
	layout: 'fit',
	width:320,
	height:150,
	initComponent: function(){
	    var self = this;
	    var password1 = new Ext.form.TextField({ 
            fieldLabel: '����',
            name: 'admin_pwd',
            inputType: 'password',
            allowBlank:false 	   
        });
        
        var password2 = new Ext.form.TextField({ 
            fieldLabel: 'ȷ������',
            name: 'admin_pwd2',
            allowBlank:false,
            inputType: 'password'	   
        });
        
		var form = new Ext.FormPanel({
		    padding:10,
		    //width:300,
		    items:[
		      password1,password2
		        
		    ],
		    buttons:[
		        {
		            text:'����',// callback
	                iconCls: 'icon-save',
	                handler:function () {
	                    if (password1.getValue() != password2.getValue()) {
	                         Ext.Msg.alert("��ʾ","�����������벻һ��,���������룡");
	                         return;
	                    };
	                    form.getForm().submit({
	                        url:'ajax/xtgl/glylb.aspx',
	                        params:{
	                            action:'updata_self'
	                        },
	                        success:function () {
	                            self.close();
	                            Ext.Msg.alert("�޸�����","�����޸ĳɹ�");
	                        }
	                    });
	                }
	                
		        },
		        {
		            text:'ȡ��',// callback
	                iconCls: 'icon-cancel',
	                handler: function () {
                        self.close();
                    }
		        }
		    ]
		});
		this.items=[
		    form
		]

		Ext.Hudongsoft.xgmmWin.superclass.initComponent.call(this);
	}
});Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.htdqtsGrid=Ext.extend(Ext.grid.GridPanel ,{
    xtype:"grid",
	title:"��ͬ�����б�",
    store : new Ext.data.JsonStore({
        root : 'data',
		totalProperty : 'totalProperty',
        url: 'ajax/zlgl/htdqts.aspx?action=list',
		fields:[
		    'id','����','�ͻ�����','������ҵ԰','��������','��ͬ��ʼʱ��','��ͬ����ʱ��','������'
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
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			dataIndex:"��ͬ��ʼʱ��",
			width:100
		},
		{
			header:"��ͬ����ʱ��",
			sortable:true,
			resizable:true,
			dataIndex:"��ͬ����ʱ��",
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			width:100
		},
		{
			header:"��ͬ״̬",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:100,
			renderer: Ext.Hudongsoft.util.Format.htztRenderer()
		},
		{
		    header:"��������ʾ",
		    sortable:true,
		    resizable:true,
		    dataIndex:"������" ,
		    //value: new Date(),
		    renderer: Ext.Hudongsoft.util.Format.dateRenderer()		    
		}
	],
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
		    '->',
			{
				xtype:"label",
				text:"�ͻ����ƣ�"
			},
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
			{
				xtype:"label",
				text:"���룺"
			},
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
		Ext.Hudongsoft.htdqtsGrid.superclass.initComponent.call(this);
	}
});Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.zphtglWin=Ext.extend(Ext.Window ,{
	title:"��ʱ��Ʊ",
	width:520,
	height:330,
	initComponent: function(){
	    var form = new Ext.FormPanel({
	        padding:10,
	        //width:300,
	        items:[
              {
                xtype: 'textfield',
                fieldLabel: '��ҵ԰����',
                name: 'role_id',
                width:226
              },
              {
                xtype: 'textfield',
                fieldLabel: '�û�����',
                name: 'role_id',
                width:226
              },
              {
                xtype: 'textfield',
                fieldLabel: '�·�',
                name: 'role_id',
                width:226
              },
              {
                xtype: 'textfield',
                fieldLabel: '�ͻ�����',
                name: 'role_id',
                width:226
              },
              {
                xtype: 'textfield',
                fieldLabel: '����',
                name: 'role_id',
                width:226
              }
    	        
	       ]
	    });
	    this.items=[
	        form
	    ]
		Ext.Hudongsoft.zphtglWin.superclass.initComponent.call(this);
	}
});Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.skfltsGrid=Ext.extend(Ext.grid.GridPanel ,{
    xfxtj: false,		
	width:792,
	height:560,
	columns:[
		{
			header:"���",
			dataIndex:"���",
			width:50
		},
		{
			header:"��ҵ԰����",
			dataIndex:"��ҵ԰����",
			width:100
		},
		{
			header:"��������",
			dataIndex:"��������",
			width:100
		},
		{
			header:"������Ŀ",
			dataIndex:"������Ŀ",
			width:100
		},
		{
			header:"�·�",
			dataIndex:"�·�",
			width:100
		},
		{
			header:"����",
			dataIndex:"����",
			width:100
		}
	],
	initComponent: function(){
	    var self = this;
	    self.title = self.xfxtj?"�տ���ϸͳ��":"�տ����ͳ��";
        var xfxm = new Ext.sfxmCombox({hidden: !self.xfxtj});
        var gyy_lx = new Ext.GyyLxCombox({value:'����'}); //{nextCombox: xfxm}
	    var gyy = new Ext.GyyCombox({nextCombox: gyy_lx});
	    
	    var nian = new Ext.YearCombox();
	    var yue = new Ext.MonthCombox();
//        var sf = new Ext.sfxmCombox();
		this.tbar=[
			{
				xtype:"label",
				text:"��ҵ԰���ƣ�"
			},
		    gyy,
			{
				xtype:"label",
				text:"�������ͣ�"
			},
			gyy_lx,
			
			{
				xtype:"label",
				text:"������Ŀ",
				hidden: !self.xfxtj
			},
			xfxm,
			{
				xtype:"label",
				text:"�꣺"
			},
			nian,
			{
				xtype:"label",
				text:"�£�"
			},
			yue,
			{
				text:"����",
				iconCls: 'icon-query',
			    handler:function () {
				    self.store.load({
				        params:{
				            xfxtj: self.xfxtj,
				            gyy: gyy.getValue(),
				            gyy_lx:gyy_lx.getValue(),
				            xfxm:xfxm.getValue(),
				            nian:nian.getValue(),
				            yue:yue.getValue()
				        }
				    });
				}
			},
			'->',
			{
			    text:"��ӡ",
			    iconCls:'icon-batch_print',
			    handler:function () {
			        window.open("Print2.aspx?gyy="+ escape(gyy.getValue()) +'&gyy_lx=' + escape(gyy_lx.getValue()) +'&xfxm='+ escape(xfxm.getValue()) +'&nian='+nian.getValue()+'&yue='+yue.getValue()+'&xfxtj='+self.xfxtj);
			    }
			}			
		];
		self.store = new Ext.data.JsonStore({
            totalProperty : 'totalProperty',
            url: 'ajax/zlgl/tj.aspx?action=fltj',
		    fields:[
		        '���','��ҵ԰����','��������','������Ŀ','�·�','����'
		    ]	
        });
		self.store.load({
		    params:{
		        xfxtj: self.xfxtj,
		        gyy_lx: '����',
		        nian:nian.getValue(),
			    yue:yue.getValue()
		    }
		});
		Ext.Hudongsoft.skfltsGrid.superclass.initComponent.call(this);
	}
});Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.fltjGrid=Ext.extend(Ext.grid.GridPanel ,{
    title:"����ͳ��",
    store : new Ext.data.JsonStore({
        //root : 'data',
		totalProperty : 'totalProperty',
        url: 'ajax/zlgl/tj.aspx?action=fltj',
		fields:[
		    '���','��ҵ԰����','��������','������Ŀ','�·�','����'
		]	
    }),
	width:792,
	height:560,
	columns:[
		{
			header:"���",
			dataIndex:"���",
			width:100
		},
		{
			header:"��ҵ԰����",
			dataIndex:"��ҵ԰����",
			width:100
		},
		{
			header:"��������",
			dataIndex:"��������",
			width:100
		},
		{
			header:"������Ŀ",
			dataIndex:"������Ŀ",
			width:100
		},
		{
			header:"�·�",
			dataIndex:"�·�",
			width:100
		},
		{
			header:"����",
			dataIndex:"����",
			width:100
		}
	],
	initComponent: function(){
	    var self = this;
	    this.bbar = new Ext.PagingToolbar({
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
		this.tbar=[
		    '->',
			{
				xtype:"label",
				text:"���ƣ�"
			},
			{
				xtype:"textfield",
				fieldLabel:"��ǩ",
				width:70
			},
			{
				xtype:"label",
				text:"��ҵ԰��"
			},
			{
				xtype:"combo",
				triggerAction:"all",
				fieldLabel:"��ǩ",
				width:70
			},
			{
				xtype:"label",
				text:"���ͣ�"
			},
			{
				xtype:"combo",
				triggerAction:"all",
				fieldLabel:"��ǩ",
				width:70
			},
			{
				xtype:"label",
				text:"���룺"
			},
			{
				xtype:"textfield",
				fieldLabel:"��ǩ",
				width:70
			},
			{
				text:"����",
				iconCls: 'icon-query'
			}
		];
		self.store.load({
		    params:{
		        start:0,
		        limit:20
		    }
		});
		Ext.Hudongsoft.fltjGrid.superclass.initComponent.call(this);
	}
});

Ext.Hudongsoft.xxtjGrid=Ext.extend(Ext.grid.GridPanel ,{
    title:"����ͳ��",
    store : new Ext.data.JsonStore({
        root : 'data',
		totalProperty : 'totalProperty',
        url: 'ajax/zlgl/tj.aspx?action=xxtj',
		fields:[
		    'id','����','�ͻ�����','������ҵ԰','��������','��ͬ��ʼʱ��','��ͬ����ʱ��'
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
			width:100
		},
		{
			header:"��ͬ����ʱ��",
			sortable:true,
			resizable:true,
			dataIndex:"��ͬ����ʱ��",
			width:100,
			format:"m/d/Y"
		},
		{
			header:"��ͬ״̬",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:100
		}
	],
	initComponent: function(){
	    var self = this;
	    this.bbar = new Ext.PagingToolbar({
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
		this.tbar=[
		    '->',
			{
				xtype:"label",
				text:"���ƣ�"
			},
			{
				xtype:"textfield",
				fieldLabel:"��ǩ",
				width:70
			},
			{
				xtype:"label",
				text:"��ҵ԰��"
			},
			{
				xtype:"combo",
				triggerAction:"all",
				fieldLabel:"��ǩ",
				width:70
			},
			{
				xtype:"label",
				text:"���ͣ�"
			},
			{
				xtype:"combo",
				triggerAction:"all",
				fieldLabel:"��ǩ",
				width:70
			},
			{
				xtype:"label",
				text:"���룺"
			},
			{
				xtype:"textfield",
				fieldLabel:"��ǩ",
				width:70
			},
			{
				text:"����",
				iconCls: 'icon-query'
			}
		];
		self.store.load({
		    params:{
		        start:0,
		        limit:20
		    }
		});
		Ext.Hudongsoft.xxtjGrid.superclass.initComponent.call(this);
	}
});Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.xxfytjlbGrid=Ext.extend(Ext.grid.GridPanel ,{
    title:"��ϸ����ͳ���б�",
	store : new Ext.data.JsonStore({
        //root : 'data',
		totalProperty : 'totalProperty',
        url: 'ajax/zlgl/tj.aspx?action=xxtj',
		fields:[
		    '���','����','�ͻ�����','������ҵ԰','��������','��ͬ��ʼʱ��','��ͬ����ʱ��','�·�','����'
		]	
    }),
	width:843,
	height:560,
	columns:[
		{
			header:"���",
			dataIndex:"���",
			width:50
		},
		{
			header:"����",
			dataIndex:"����",
			width:160
		},
		{
			header:"�ͻ�����",
			dataIndex:"�ͻ�����",
			width:80
		},
		{
			header:"������ҵ԰",
			dataIndex:"������ҵ԰",
			width:100
		},
		{
			header:"��������",
			dataIndex:"��������",
			width:100
		},
		{
			header:"��ͬ��ʼʱ��",
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
			header:"������Ŀ",
			dataIndex:"������Ŀ",
			width:100
		},
		{
			header:"�·�",
			dataIndex:"�·�",
			width:50
		},
		{
			header:"����",
			dataIndex:"����",
			width:100,
			format:"0,000.00"
		}
	],
	initComponent: function(){
	    var self = this;
	    this.bbar = new Ext.PagingToolbar({
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
	    
	    var iField = new Ext.form.TextField({ //������
            emptyText:'����������',
	        width:80
    	   
        });

        var gyy_lx = new Ext.GyyLxCombox();
	    var gyy = new Ext.GyyCombox({nextCombox: gyy_lx});
	    var nian = new Ext.YearCombox();
	    var yue = new Ext.MonthCombox();
		this.tbar=[
			"���ƣ�",
			iField,
			{
				xtype:"label",
				text:"��ҵ԰��"
			},
			gyy,
			{
				xtype:"label",
				text:"�������ͣ�"
			},
			gyy_lx,
			{
				xtype:"label",
				text:"���ڣ�"
			},
			nian,
			yue,
			{
				text:"����",
				iconCls: 'icon-query',
				handler:function () {
				    self.store.baseParams = {
			            gyy: gyy.getValue(),
			            gyy_lx:gyy_lx.getValue(),
			            iField:iField.getValue(),
			            nian:nian.getValue(),
			            yue:yue.getValue()
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
		        nian:nian.getValue(),
			    yue:yue.getValue(),
		        start:0,
		        limit:20
		    }
		});
		Ext.Hudongsoft.xxfytjlbGrid.superclass.initComponent.call(this);
	}
});Ext.namespace('Ext.Hudongsoft');

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
});Ext.namespace('Ext.Hudongsoft');

Ext.MyGrid=Ext.extend(Ext.grid.GridPanel ,{
xtype:"grid",
	title:"�ܷ���ͳ���б�",
	store:{
		xtype:"jsonstore",
		
	},
	width:792,
	height:560,
	columns:[
		{
			header:"���",
			sortable:true,
			resizable:true,
			dataIndex:"data1",
			width:40
		},
		{
			header:"����",
			sortable:true,
			resizable:true,
			dataIndex:"data2",
			width:100
		},
		{
			header:"�ͻ�����",
			sortable:true,
			resizable:true,
			dataIndex:"data3",
			width:100
		},
		{
			header:"������ҵ԰",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:100
		},
		{
			header:"��������",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:100,
			format:"m/d/Y"
		},
		{
			header:"��ͬ��ʼʱ��",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:100
		},
		{
			header:"��ͬ����ʱ��",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:100
		},
		{
			header:"�·�",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:70,
			format:"m/d/Y"
		},
		{
			header:"����",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:100,
			format:"0,000.00"
		}
	],
	initComponent: function(){
		this.tbar=[
			{
				xtype:"label",
				text:"���ƣ�"
			},
			{
				xtype:"textfield",
				fieldLabel:"��ǩ"
			},
			{
				xtype:"label",
				text:"��ҵ԰��"
			},
			{
				xtype:"combo",
				triggerAction:"all",
				fieldLabel:"��ǩ",
				width:70
			},
			{
				xtype:"label",
				text:"���ͣ�"
			},
			{
				xtype:"combo",
				triggerAction:"all",
				fieldLabel:"��ǩ",
				width:70
			},
			{
				xtype:"label",
				text:"���ڣ�"
			},
			{
				xtype:"datefield",
				fieldLabel:"��ǩ"
			},
			{
				text:"����"
			}
		]
		Ext.MyGrid.superclass.initComponent.call(this);
	}
});Ext.namespace('Ext.Hudongsoft')

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
});Ext.namespace('Ext.Hudongsoft');


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
});Ext.namespace('Ext.Hudongsoft');

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
});Ext.namespace('Ext.Hudongsoft');

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