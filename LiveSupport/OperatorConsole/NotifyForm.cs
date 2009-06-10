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

        private int SendIndex;
        public Chat chat;
        private SoundPlayer player = new SoundPlayer();
        public enum NotifyMessageType
        {
            ChatRequest, NewVisitor, SystemMessage, Others
        }

        private NotifyMessageType notifyMessageType;

        public enum TaskbarStates
        {
            Hidden = 0,
            Appearing = 1,
            Visible = 2,
            Disappearing = 3
        }
        protected TaskbarStates taskbarState = TaskbarStates.Hidden;
        protected Timer timer = new Timer();

        private int showFadingTime = 10; //show time in ms
        private int hideFadingTime = 50; //show time in ms
        private int showingTime = 10 * 1000; //hide time in ms

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
            playChatReqSound();
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
                        playChatReqSound();
                        this.Opacity -= 0.01;
                    }
                    else
                    {
                        timer.Stop();                        
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
                player.Play();
            }
        }


        public static void ShowNotifier(bool showCommandButton, string message, Chat chat)
        {
            Chat chat2 = null;
            if (Program.NotifyForms.Count > 0)
            {
                foreach (NotifyForm item in Program.NotifyForms)
                {
                    if (item.chat.ChatId == chat.ChatId)
                    {
                        chat2 = item.chat;
                        return;
                    }

                }
                if (chat2 != null)
                {
                    NotifyForm f = new NotifyForm();
                    f.showNotifier(showCommandButton, message, chat2);
                    Program.NotifyForms.Add(f);
                }
            }
            else
            {
                NotifyForm f = new NotifyForm();
                f.showNotifier(showCommandButton, message, chat);
                Program.NotifyForms.Add(f);

            }


        }

        private void showNotifier(bool showCommandButton, string message, Chat chat)
        {
            this.messageLabel.Text = message;
            this.acceptButton.Visible = showCommandButton;
            this.declineButton.Visible = showCommandButton;
            this.chat = chat;
            this.notifyMessageType = NotifyMessageType.ChatRequest;
            this.Show();
            playChatReqSound();
            switch (taskbarState)
            {
                case TaskbarStates.Hidden:
                    timer.Stop();
                    timer.Interval = showFadingTime;
                    timer.Start();
                    taskbarState = TaskbarStates.Appearing;
                    break;
                case TaskbarStates.Appearing:
                    break;
                case TaskbarStates.Visible:
                    break;
                case TaskbarStates.Disappearing:
                    break;
                default:
                    break;
            }
        }

        public static void ShowNotifier(bool showCommandButton, string message, int Chatindex)
        {
            NotifyForm f = new NotifyForm();
            f.showNotifier(showCommandButton, message, Chatindex);
        }

        private void showNotifier(bool showCommandButton, string message, int Chatindex)
        {
            SendIndex = Chatindex;
            this.messageLabel.Text = message;
            this.acceptButton.Visible = showCommandButton;
            this.declineButton.Visible = showCommandButton;

            this.Show();
            switch (taskbarState)
            {
                case TaskbarStates.Hidden:
                    timer.Stop();
                    timer.Interval = showFadingTime;
                    timer.Start();
                    taskbarState = TaskbarStates.Appearing;
                    break;
                case TaskbarStates.Appearing:
                    break;
                case TaskbarStates.Visible:
                    break;
                case TaskbarStates.Disappearing:
                    break;
                default:
                    break;
            }
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
            player.Stop();
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
                //this.chatSession.ChatingTime = DateTime.Now;
                cf = new ChatForm(this.chat);
                Program.ChatForms.Add(cf);
            }

            cf.Show();
            this.Hide();
            if (Program.NotifyForms.Count > 0)
            {
                NotifyForm nf = null;
                foreach (NotifyForm item in Program.NotifyForms)
                {
                    if (item.chat.ChatId == this.chat.ChatId)
                    {
                        nf = item;

                    }
                }
                if (nf != null)
                {
                    Program.NotifyForms.Remove(nf);
                }
            }
            timer.Stop();
        }

        private void declineButton_Click(object sender, EventArgs e)
        {
            player.Stop();
            this.Hide();
            timer.Stop();
        }
    }
}
