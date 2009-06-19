using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Drawing.Drawing2D;
using ZYC;
using System.IO;

namespace LiveSupport.OperatorConsole
{
    public partial class Snipping : Form
    {
        #region Field
        private ChatForm cf;  //直接对Main窗体进行控制
        private APIMethod api = new APIMethod();  //调用API的完成类（将API的调用封装起来，是可以直接调用产生效果的类）
        private Rectangle area = Rectangle.Empty;  //截图矩形
        private Point op;  //area起点位置
        private Button b = new Button();  //CancelButton
        private int index = -1;
        private bool draw = false;
        private bool inited = false;  //确定是否已经完成area的绘制，以确定是否要显示矩形大小
        private bool drawing = false;  //确定是否进入画图状态，用来清除多余的GDI+图形
        private int type = -1;  //确定GDI+的类型
        private Graphics graphics;  //进行GDI+绘图
        private Point sl;  //初始位置
        private bool md = false;  //判断是否截图，如果发生MouseDown事件则开始截图，值为true
        private bool isdrew = false;  //是否使用过GDI+，如果使用过则不能拖动area
        private Pen pen;  //GDI+使用的画笔
        GraphicsPath points;  //画笔工具
        private Image img;  //GDI+绘图用的背景
        private Image origin; //原始桌面
        private bool fd = false;  //确定是否进行文字绘制
        private bool drew = false; //控制是否在重绘事件中绘制area

        public Snipping()
        {
            InitializeComponent();
            //System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Snipping));
            pictureBox1.Image = imageList1.Images[0];
            pictureBox2.Image = imageList1.Images[1];
            pictureBox3.Image = imageList1.Images[2];
            pictureBox4.Image = imageList1.Images[3];
            pictureBox5.Image = imageList1.Images[4];
            pictureBox6.Image = imageList1.Images[5];
            pictureBox7.Image = imageList1.Images[6];
            pictureBox8.Image = imageList1.Images[7];
            b.Click += new EventHandler(b_Click);
            this.CancelButton = b;
        }

        private void Snipping_Load(object sender, EventArgs e)
        {
            cf = (ChatForm)this.Owner;
            this.Bounds = System.Windows.Forms.Screen.PrimaryScreen.Bounds;
            this.BackgroundImage = origin =api.GetScreenSnapShot();
            graphics = this.CreateGraphics();
            pen = new Pen(label9.BackColor);
            points = new GraphicsPath();
            comboBox1.SelectedIndex = 0;
            this.SetStyle(ControlStyles.OptimizedDoubleBuffer | ControlStyles.AllPaintingInWmPaint | ControlStyles.UserPaint, true);
            this.UpdateStyles();
        }

        private void b_Click(object sender, EventArgs e)
        {
            api.ReleaseCursor();
            this.Dispose();
        }

        #endregion

        #region DrawLine

        protected override void OnMouseDown(MouseEventArgs e)
        {
            base.OnMouseDown(e);
            if (this.area == Rectangle.Empty && e.Button == MouseButtons.Left)
            {
                this.area.Location = new Point(e.X, e.Y);
            }
            this.op = new Point(e.X, e.Y);
            this.index = this.GetSelectedHandle(new Point(e.X, e.Y));
            this.SetCursor();
            draw = true;
            if (this.area.Contains(e.Location) && drawing)
            {
                sl = e.Location;
                md = true;
                RECT rect = new RECT();
                rect.left = this.area.Left;
                rect.right = this.area.Right;
                rect.top = this.area.Top;
                rect.bottom = this.area.Bottom;
                WindowsAPI.ClipCursor(ref rect);
            }
            if (textBox1.Visible)
            {
                graphics = Graphics.FromImage(origin);
                graphics.DrawString(textBox1.Text, textBox1.Font, new SolidBrush(label9.BackColor), new RectangleF(new Point(textBox1.Location.X, textBox1.Location.Y + 2), textBox1.Size));
                graphics = Graphics.FromImage(img);
                graphics.DrawString(textBox1.Text, textBox1.Font, new SolidBrush(label9.BackColor), new RectangleF(new Point(textBox1.Location.X, textBox1.Location.Y + 2), textBox1.Size));
                graphics = this.CreateGraphics();
                graphics.DrawImage(img, new Point(0, 0));                
                textBox1.Text = "";
                textBox1.Visible = false;
                api.ReleaseCursor();
                fd = false;
            }
        }

        protected override void OnMouseMove(MouseEventArgs e)
        {
            base.OnMouseMove(e);
            if (drawing && md)
            {
                DrawGDI(type, e.Location);
                if (type == 2)
                    fd = true;
            }
            else
            {
                if (this.Capture)
                {
                    this.MoveHandleTo(new Point(e.X, e.Y));
                    this.Invalidate();
                }
                else
                {
                    this.index = this.GetSelectedHandle(new Point(e.X, e.Y));
                    this.SetCursor();
                }
            }
        }

        protected override void OnMouseUp(MouseEventArgs e)
        {
            if (!this.IsDisposed)
            {
                base.OnMouseUp(e);
                int left = area.Left;
                int top = area.Top;
                int right = area.Right;
                int bottom = area.Bottom;
                area.X = Math.Min(left, right);
                area.Y = Math.Min(top, bottom);
                area.Width = Math.Abs(left - right);
                area.Height = Math.Abs(top - bottom);
                if (e.Button == MouseButtons.Right)
                {
                    if (this.area == Rectangle.Empty)
                    {
                        this.DialogResult = DialogResult.Cancel;
                    }
                    else
                    {
                        this.area = Rectangle.Empty;
                        this.Invalidate();
                    }
                }
                this.index = this.GetSelectedHandle(new Point(e.X, e.Y));
                this.SetCursor();
                if (drawing && md)
                {
                    if (type == 2 && fd)
                    {
                        md = false;
                        textBox1.Visible = true;
                        textBox1.Focus();
                    }
                    else
                    {
                        DrawGDI(type, e.Location);
                        md = false;
                        DrawGDI(type, e.Location);
                        api.ReleaseCursor();
                        if (type == 4)
                            points.Reset();
                    }
                }
                draw = false;
                if (!inited)
                    inited = true;
                this.Refresh();
            }
        }

        private void DrawGDI(int drawtype, Point p)
        {
            PointF rectStartPointF = sl;
            switch (drawtype)
            {
                case 0:
                    {
                        float width = Math.Abs(p.X - sl.X);
                        float heigth = Math.Abs(p.Y - sl.Y);
                        if (p.X < sl.X)
                        {
                            rectStartPointF.X = p.X;
                        }
                        if (p.Y < sl.Y)
                        {
                            rectStartPointF.Y = p.Y;
                        }

                        if (!md)
                        {
                            graphics = Graphics.FromImage(origin);
                            graphics.DrawRectangle(pen, rectStartPointF.X, rectStartPointF.Y, width, heigth);
                            graphics = Graphics.FromImage(img);
                            graphics.DrawRectangle(pen, rectStartPointF.X, rectStartPointF.Y, width, heigth);
                            graphics = this.CreateGraphics();
                            graphics.DrawImage(img, new Point(0, 0));

                        }
                        else
                        {
                            Image image = (Image)this.img.Clone();
                            graphics = Graphics.FromImage(image);
                            graphics.DrawRectangle(pen, rectStartPointF.X, rectStartPointF.Y, width, heigth);
                            graphics = this.CreateGraphics();
                            graphics.DrawImage(image, new Point(0, 0));
                        }
                        isdrew = true;
                        break;
                    }
                case 1:
                    {
                        float width = Math.Abs(p.X - sl.X);
                        float heigth = Math.Abs(p.Y - sl.Y);
                        if (p.X < sl.X)
                        {
                            rectStartPointF.X = p.X;
                        }
                        if (p.Y < sl.Y)
                        {
                            rectStartPointF.Y = p.Y;
                        }

                        if (!md)
                        {
                            graphics = Graphics.FromImage(origin);
                            graphics.DrawEllipse(pen, rectStartPointF.X, rectStartPointF.Y, width, heigth);
                            graphics = Graphics.FromImage(img);
                            graphics.DrawEllipse(pen, rectStartPointF.X, rectStartPointF.Y, width, heigth);
                            graphics = this.CreateGraphics();
                            graphics.DrawImage(img, new Point(0, 0));
                        }
                        else
                        {
                            Image image = (Image)this.img.Clone();
                            graphics = Graphics.FromImage(image);
                            graphics.DrawEllipse(pen, rectStartPointF.X, rectStartPointF.Y, width, heigth);
                            graphics = this.CreateGraphics();
                            graphics.DrawImage(image, new Point(0, 0));
                        }
                        isdrew = true;
                        break;
                    }
                case 2:
                    {
                        float width = Math.Abs(p.X - sl.X);
                        float heigth = Math.Abs(p.Y - sl.Y);
                        if (p.X < sl.X)
                        {
                            rectStartPointF.X = p.X;
                        }
                        if (p.Y < sl.Y)
                        {
                            rectStartPointF.Y = p.Y;
                        }
                        Image image = (Image)this.img.Clone();
                        graphics = Graphics.FromImage(image);
                        graphics.DrawRectangle(Pens.Black, rectStartPointF.X, rectStartPointF.Y, width, heigth);
                        textBox1.Size = new Size((int)width, (int)heigth);
                        textBox1.Location = sl;
                        graphics = this.CreateGraphics();
                        graphics.DrawImage(image, new Point(0, 0));
                        isdrew = true;
                        break;
                    }
                case 3:
                    {     
                        if (!md)
                        {
                            graphics = Graphics.FromImage(origin);
                            pen.EndCap = LineCap.ArrowAnchor;
                            pen.Width = 4;
                            graphics.DrawLine(pen, sl, p);
                            graphics = Graphics.FromImage(img);
                            graphics.DrawLine(pen, sl, p);
                            pen.Width = 1;
                            pen.EndCap = LineCap.NoAnchor;
                            graphics = this.CreateGraphics();
                            graphics.DrawImage(img, new Point(0, 0));
                        }
                        else
                        {
                            Image image = (Image)this.img.Clone();
                            graphics = Graphics.FromImage(image);
                            pen.EndCap = LineCap.ArrowAnchor;
                            pen.Width = 4;
                            graphics.DrawLine(pen, sl, p);
                            pen.Width = 1;
                            pen.EndCap = LineCap.NoAnchor;
                            graphics = this.CreateGraphics();
                            graphics.DrawImage(image, new Point(0, 0));
                        }
                        isdrew = true;
                        break;
                    }
                case 4:
                    {
                        if (!md)
                        {
                            points.AddLine(p, p);
                            graphics = Graphics.FromImage(origin);
                            graphics.DrawPath(pen, points);
                            graphics = Graphics.FromImage(img);
                            graphics.DrawPath(pen, points);
                            graphics = this.CreateGraphics();
                            graphics.DrawImage(img, new Point(0, 0));
                        }
                        else
                        {
                            graphics = this.CreateGraphics();
                            points.AddLine(p, p);
                            graphics.DrawPath(pen, points);
                        }
                        isdrew = true;
                        break;
                    }
            }
            drew = true;
        }

        protected override void OnPaint(PaintEventArgs e)
        {
            base.OnPaint(e);
            if (drawing)
                return;
            if (!drew)
            {
                e.Graphics.DrawRectangle(new Pen(this.ForeColor), this.area);
                for (int i = 1; i < 9; i++)
                {
                    e.Graphics.FillRectangle(new SolidBrush(Color.Blue), this.GetHandleRect(i));
                }
            }
            if (draw && !inited)
            {
                Point p = new Point(area.Right, area.Bottom);
                string str = Math.Abs(area.Width).ToString() + " × " + Math.Abs(area.Height).ToString();
                e.Graphics.DrawString(str, new Font("宋体", 12, FontStyle.Bold), Brushes.White, new Point(p.X, p.Y - 30));
                e.Graphics.FillRectangle(Brushes.Black, new Rectangle(new Point(p.X, p.Y - 30), new Size((int)e.Graphics.MeasureString(str, new Font("宋体", 12, FontStyle.Bold)).Width + 4, 20)));
                e.Graphics.DrawString(str, new Font("宋体", 12, FontStyle.Bold), Brushes.White, new Point(p.X, p.Y - 30));
            }
            if (inited && !drawing)
            {

                pictureBox1.Visible = true;
                pictureBox1.Location = new Point(this.area.Left, this.area.Bottom + 5);
                pictureBox2.Visible = true;
                pictureBox2.Location = new Point(this.area.Left + 18, this.area.Bottom + 5);
                pictureBox8.Visible = true;
                pictureBox8.Location = new Point(this.area.Left + 36, this.area.Bottom + 5);
                pictureBox3.Visible = true;
                pictureBox3.Location = new Point(this.area.Left + 54, this.area.Bottom + 5);
                pictureBox4.Visible = true;
                pictureBox4.Location = new Point(this.area.Left + 72, this.area.Bottom + 5);
                pictureBox5.Visible = true;
                pictureBox5.Location = new Point(this.area.Left + 90, this.area.Bottom + 5);
                pictureBox6.Visible = true;
                pictureBox6.Location = new Point(this.area.Left + 108, this.area.Bottom + 5);
                pictureBox7.Visible = true;
                pictureBox7.Location = new Point(this.area.Left + 126, this.area.Bottom + 5);
            }
        }

        #endregion

        #region DrawAREA

        private int GetSelectedHandle(Point p)
        {
            int index = -1;
            for (int i = 1; i < 9; i++)
            {
                if (GetHandleRect(i).Contains(p))
                {
                    index = i;
                    break;
                }
            }
            if (this.area.Contains(p)) index = 0;
            System.Diagnostics.Trace.WriteLine(area.ToString());
            System.Diagnostics.Trace.WriteLine(p.ToString());
            System.Diagnostics.Trace.WriteLine(index.ToString());
            return index;
        }

        private void MoveHandleTo(Point point)
        {
            if (isdrew)
                return;
            int left = area.Left;
            int top = area.Top;
            int right = area.Right;
            int bottom = area.Bottom;
            switch (index)
            {
                case 0:
                    area.X += point.X - op.X;
                    area.Y += point.Y - op.Y;
                    this.op = point;
                    return;
                case 1:
                    left = point.X;
                    top = point.Y;
                    break;
                case 2:
                    top = point.Y;
                    break;
                case 3:
                    right = point.X;
                    top = point.Y;
                    break;
                case 4:
                    right = point.X;
                    break;
                case 5:
                    right = point.X;
                    bottom = point.Y;
                    break;
                case 6:
                    bottom = point.Y;
                    break;
                case 7:
                    left = point.X;
                    bottom = point.Y;
                    break;
                case 8:
                    left = point.X;
                    break;
            }
            this.op = point;
            area.X = left;
            area.Y = top;
            area.Width = right - left;
            area.Height = bottom - top;
        }

        private void SetCursor()
        {
            Cursor cr = Cursors.Default;
            if (index == 1 || index == 5)
            {
                cr = Cursors.SizeNWSE;
            }
            else if (index == 2 || index == 6)
            {
                cr = Cursors.SizeNS;
            }
            else if (index == 3 || index == 7)
            {
                cr = Cursors.SizeNESW;
            }
            else if (index == 4 || index == 8)
            {
                cr = Cursors.SizeWE;
            }
            else if (index == 0)
            {
                cr = Cursors.Default;
            }
            Cursor.Current = cr;
        }

        private Rectangle GetHandleRect(int index)
        {
            Point point = GetHandle(index);
            return new Rectangle(point.X - 3, point.Y - 3, 5, 5);
        }

        private Point GetHandle(int index)
        {
            int x, y, xCenter, yCenter;
            xCenter = area.X + area.Width / 2;
            yCenter = area.Y + area.Height / 2;
            x = area.X;
            y = area.Y;
            switch (index)
            {
                case 1:
                    x = area.X;
                    y = area.Y;
                    break;
                case 2:
                    x = xCenter;
                    y = area.Y;
                    break;
                case 3:
                    x = area.Right;
                    y = area.Y;
                    break;
                case 4:
                    x = area.Right;
                    y = yCenter;
                    break;
                case 5:
                    x = area.Right;
                    y = area.Bottom;
                    break;
                case 6:
                    x = xCenter;
                    y = area.Bottom;
                    break;
                case 7:
                    x = area.X;
                    y = area.Bottom;
                    break;
                case 8:
                    x = area.X;
                    y = yCenter;
                    break;
            }
            return new Point(x, y);
        }

        #endregion

        #region ToolBar

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            if (img == null)
            {
                img = api.GetScreenSnapShot();
                this.BackgroundImage = img;
            }
            if (!drawing || type != 0)
            {
                drawing = true;
                type = 0;
                panel1.Location = new Point(pictureBox1.Location.X, pictureBox1.Location.Y + 20);
                panel1.Visible = true;
                panel2.Visible = false;
            }
            else
            {
                drawing = false;
                type = -1;
                api.ReleaseCursor();
                panel1.Visible = false;
            }
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            if (img == null)
            {
                img = api.GetScreenSnapShot();
                this.BackgroundImage = img;
            }
            if (!drawing || type != 1)
            {
                drawing = true;
                type = 1;
                panel1.Location = new Point(pictureBox1.Location.X, pictureBox1.Location.Y + 20);
                panel1.Visible = true;
                panel2.Visible = false;
            }
            else
            {
                drawing = false;
                type = -1;
                api.ReleaseCursor();
                panel1.Visible = false;
            }
        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {
            SaveFileDialog save = new SaveFileDialog();
            save.FileName = "未命名截图.bmp";
            save.Filter = "BMP文件 (*.bmp)|*.bmp|JPEG (*.jpg;*.jpeg)|*.jpg;*.jpeg|GIF (*.gif)|*.gif";
            Bitmap bitmap = this.GetPhoto();
            if (save.ShowDialog() == DialogResult.OK)
            {
                if (save.FilterIndex == 1)
                    bitmap.Save(save.FileName, System.Drawing.Imaging.ImageFormat.Bmp);
                else if (save.FilterIndex == 2)
                    bitmap.Save(save.FileName, System.Drawing.Imaging.ImageFormat.Jpeg);
                else if (save.FilterIndex == 3)
                    bitmap.Save(save.FileName, System.Drawing.Imaging.ImageFormat.Gif);
            }
            bitmap.Dispose();
        }

        private void pictureBox4_Click(object sender, EventArgs e)
        {
            if (img == null)
            {
                img = api.GetScreenSnapShot();
                this.BackgroundImage = img;
            }
            if (!drawing || type != 2)
            {
                drawing = true;
                type = 2;
                panel2.Location = new Point(pictureBox1.Location.X, pictureBox1.Location.Y + 20);
                panel1.Location = new Point(panel2.Location.X + 82, panel2.Location.Y);
                panel1.Visible = true;
                panel2.Visible = true;
            }
            else
            {
                drawing = false;
                type = -1;
                api.ReleaseCursor();
                panel1.Visible = false;
                panel2.Visible = false;
            }
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {
            if (img == null)
            {
                img = api.GetScreenSnapShot();
                this.BackgroundImage = img;
            }
            if (!drawing || type != 3)
            {
                drawing = true;
                type = 3;
                panel1.Location = new Point(pictureBox1.Location.X, pictureBox1.Location.Y + 20);
                panel1.Visible = true;
                panel2.Visible = false;
            }
            else
            {
                drawing = false;
                type = -1;
                api.ReleaseCursor();
                panel1.Visible = false;
            }
        }

        private void pictureBox6_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void pictureBox7_Click(object sender, EventArgs e)
        {
            Bitmap bitmap = this.GetPhoto();
            this.Dispose();
            cf.sendImage(bitmap);
            
        }

        private void pictureBox8_Click(object sender, EventArgs e)
        {
            if (img == null)
            {
                img = api.GetScreenSnapShot();
                this.BackgroundImage = img;
            }
            if (!drawing || type != 4)
            {
                drawing = true;
                type = 4;
                panel1.Location = new Point(pictureBox1.Location.X, pictureBox1.Location.Y + 20);
                panel1.Visible = true;
                panel2.Visible = false;
            }
            else
            {
                drawing = false;
                type = -1;
                api.ReleaseCursor();
                panel1.Visible = false;
            }
        }

        private void ShowColor_Click(object sender, EventArgs e)
        {
            Label label = (Label)sender;
            label9.BackColor = label.BackColor;
            pen = new Pen(label9.BackColor);
            textBox1.ForeColor = label9.BackColor;
        }

        private void comboBox1_TextChanged(object sender, EventArgs e)
        {
            if (type == 2)
                textBox1.Font = new Font(textBox1.Font.FontFamily, float.Parse(comboBox1.Text));
        }

        private void Snipping_MouseDoubleClick(object sender, MouseEventArgs e)
        {
           
            if (this.area != Rectangle.Empty)
            {
                Bitmap bitmap = this.GetPhoto();
                api.ReleaseCursor();
                this.Dispose();
                cf.sendImage(bitmap);                
            }
        }

        private Bitmap GetPhoto()
        {
            RECT rect = new RECT();
            rect.left = this.area.Left;
            rect.top = this.area.Top;
            rect.right = this.area.Right;
            rect.bottom = this.area.Bottom;
            return api.PartBitmapB(origin, rect.left, rect.top, Math.Abs(rect.right - rect.left), Math.Abs(rect.bottom - rect.top));
        }

        #endregion
    }
}