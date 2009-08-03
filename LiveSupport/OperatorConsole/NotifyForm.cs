using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using LiveSupport.OperatorConsole.LiveChatWS;
using System.Media;

namespace LiveSupport.OperatorConsole
{
    public partial class NotifyForm : Form
    {
        public Chat chat;
        private SoundPlayer player = new SoundPlayer();
        protected TaskbarStates taskbarState = TaskbarStates.Hidden;
        protected Timer timer = new Timer();
        private Timer soundPlayerTimer = new Timer();
        private int showFadingTime = 10; //窗体渐变显示速度
        private int hideFadingTime = 100; //窗体渐变隐藏速度
        private int showingTime = 10000; //窗体完全显示的时间
        private NotifyMessageType notifyMessageType;
        public enum NotifyMessageType
        {
            ChatRequest, NewVisitor, SystemMessage, Others
        }

        public enum TaskbarStates
        {
            Hidden = 0,
            Appearing = 1,
            Visible = 2,
            Disappearing = 3
        }

        [DllImport("Gdi32.dll", EntryPoint = "CreateRoundRectRgn")]
        private static extern IntPtr CreateRoundRectRgn
        (
        int nLeftRect, // x-coordinate of upper-left corner
        int nTopRect, // y-coordinate of upper-left corner
        int nRightRect, // x-coordinate of lower-right corner
        int nBottomRect, // y-coordinate of lower-right corner
        int nWidthEllipse, // height of ellipse
        int nHeightEllipse // width of ellipse
        );

        void timer_Tick(object sender, EventArgs e)
        {  
            switch (taskbarState)
            {
                case TaskbarStates.Hidden:
                    break;
                case TaskbarStates.Appearing:
                    
                    if (this.Opacity < 0.99)
                    {
                        this.Opacity += 0.01;
                    }
                    else
                    {
                        timer.Stop();
                        timer.Interval = showingTime;
                        timer.Start();
                        taskbarState = TaskbarStates.Visible;
                    }
                    break;
                case TaskbarStates.Visible:
                    timer.Stop();
                    timer.Interval = hideFadingTime;
                    timer.Start();
                    taskbarState = TaskbarStates.Disappearing;
                    break;
                case TaskbarStates.Disappearing:
                    if (this.Opacity > 0.00)
                    {
                        this.Opacity -= 0.01;
                    }
                    else
                    {
                        soundPlayerTimer.Stop();
                        this.Hide();
                        taskbarState = TaskbarStates.Hidden;
                    }
                    break;
                default:
                    break;
            }
        }

        private void playChatReqSound()
        {
            if (Properties.Settings.Default.PlaySoundOnChatReq)
            {
                player.Stream = Properties.Resources.newchatreq;
                soundPlayerTimer.Interval = 1000;
                soundPlayerTimer.Tick += new EventHandler(soundPlayerTimer_Tick);
                soundPlayerTimer.Start();
            }
        }

        void soundPlayerTimer_Tick(object sender, EventArgs e)
        {
            player.Play();
        }

        public static void ShowNotifier(bool showCommandButton, string message, Chat chat)
        {
            NotifyForm f = new NotifyForm();
            f.showNotifier(showCommandButton, message, chat);
        }

        private void showNotifier(bool showCommandButton, string message, Chat chat)
        {
            this.messageLabel.Text = message;
            this.acceptButton.Visible = showCommandButton;
            this.declineButton.Visible = showCommandButton;
            this.chat = chat;
            this.notifyMessageType = NotifyMessageType.ChatRequest;
            timer.Interval = showFadingTime;
            timer.Start();
            taskbarState = TaskbarStates.Appearing;
            this.Show();
            playChatReqSound();
        }

        public NotifyForm()
        {
            InitializeComponent();
            try
            {
                Region = System.Drawing.Region.FromHrgn(CreateRoundRectRgn(0, 0, Width, Height, 5, 5));
            }
            catch (Exception exc)
            { }
            Location = new Point(Screen.PrimaryScreen.Bounds.Width - this.Width, Screen.PrimaryScreen.Bounds.Height - this.Height - 30);
            timer.Tick += new EventHandler(timer_Tick);
        }

        private void acceptButton_Click(object sender, EventArgs e)
        {
            soundPlayerTimer.Stop();
            ChatForm cf = null;
            foreach (var item in Program.ChatForms)
            {
                if (item.Chat.ChatId == this.chat.ChatId)
                {
                    cf = item;
                    break;
                }
            }

            if (cf == null)
            {
                cf = new ChatForm(Program.OperaterServiceAgent);
                Program.ChatForms.Add(cf);
                cf.Accept(this.chat);
            }

            cf.Show();
            this.Hide();
            timer.Stop();
        }

        private void declineButton_Click(object sender, EventArgs e)
        {
            soundPlayerTimer.Stop();
            this.Hide();
            timer.Stop();
        }
    }
}
