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
