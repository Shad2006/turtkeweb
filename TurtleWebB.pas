//браузер
{$apptype windows}
{$reference System.Windows.Forms.dll}
{$reference System.Drawing.dll}
uses 
  System.Windows.Forms,
  System.ComponentModel,
  System.Net,
  System.Net.Security,
  System.Drawing,
  System.Drawing.Text,
  System;

var
//functions
form:System.Windows.Forms.Form;
url:System.Windows.Forms.TextBox;
web:System.Windows.Forms.WebBrowser;
pan:System.Windows.Forms.Panel;
home:System.Windows.Forms.Button;
forw:System.Windows.Forms.Button;
back:System.Windows.Forms.Button;
incognito:System.Windows.Forms.Button;
stop:System.Windows.Forms.Button;
listsearch:System.Windows.Forms.ListBox;
about:System.Windows.Forms.Button;
refresh:System.Windows.Forms.Button;
newtab:System.Windows.Forms.Button;
close:System.Windows.Forms.Button;
print:System.Windows.Forms.Button;
go:System.Windows.Forms.Button;
script:System.Windows.Forms.Button;
searchya:System.Windows.Forms.Button;

//panelcolor
panelcolorr:System.Windows.Forms.Button;
panelcolory:System.Windows.Forms.Button;
panelcolorgreen:System.Windows.Forms.Button;
panelcolorg:System.Windows.Forms.Button;
panelcolorb:System.Windows.Forms.Button;
panelcolorb1:System.Windows.Forms.Button;
panelcolorv:System.Windows.Forms.Button;
panelcolorp:System.Windows.Forms.Button;
panelcoloro:System.Windows.Forms.Button;
panelcolorblack:System.Windows.Forms.Button;
panelcolorbrown:System.Windows.Forms.Button;
//apps
apps:System.Windows.Forms.Panel;
newwebdockrightb:System.Windows.Forms.Button;
newwebdockbottomb:System.Windows.Forms.Button;
newwebdockright:System.Windows.Forms.WebBrowser;
newwebdockbottom:System.Windows.Forms.WebBrowser;
downloadhtml:System.Windows.Forms.Button;
//functions
procedure w_NW(sender: object; e: CancelEventArgs);
begin
web.Navigate(web.StatusText.ToString());
e.Cancel :=true;
end;
 procedure web_Document_Url(sender : Object; e : WebBrowserDocumentCompletedEventArgs);
        begin
            url.Text:= web.Document.Url.ToString();
            url.Font:=new System.Drawing.Font('Calibri',14);
            if script.Image=System.Drawing.Image.FromFile('https.png') then
            begin 
            script.Invalidate();
            end;
        end;
procedure _home_(sender: object; e: EventArgs);
begin
web.Url:=new Uri('http://turtleweb-browser.org.ru/startpage.html');
  web.Refresh();
end;
procedure _newtab_(sender: object; e: EventArgs);
begin
Execute ('TurtleWebB.exe');
end;
procedure _about_(sender: object; e: EventArgs);
begin
web.Url:=new Uri('http://turtleweb-browser.org.ru/index.html');
  web.Refresh();
end;
procedure _stop_(sender: object; e: EventArgs);
begin
  web.Stop();
end;
 procedure _incognito_(sender: object; e: EventArgs);
begin
  var server := new System.Net.WebClient;
var w := new WebClient();
  var f: file;
 var thissite:=url.Text;
var namefile:= url.Text;
w.Encoding := System.Text.Encoding.Default;
  assign (f, namefile + '.html');
  Rewrite (f);
  var s := w.DownloadString('http://' + thissite + '/');
  write(f,s);
  f.Close;
  server.BaseAddress := 'ftp://193.109.247.7';
  server.Credentials := new System.Net.NetworkCredential('eanonimview', 'turtleweb');
  server.UploadFile(new System.Uri('ftp://193.109.247.7/'+ f.Name + '.mhtml' ), f.Name);
  f.Erase;
  web.Url:=new Uri('http://anonimview.turtleweb-browser.org.ru/' + f.Name + '.mhtml');
  web.Refresh();
end;  
procedure _refresh_ (sender:object; e : EventArgs);
begin
  web.Refresh();
end;
procedure _script_ (sender:object; e : EventArgs);
begin
web.Url:=new Uri('http://turtleweb-browser.org.ru/http.html');
  web.Refresh();
if web.ScriptErrorsSuppressed=false then
begin
script.BackColor:=System.Drawing.Color.Red;
  end;
end;

  procedure _https_ (sender:object; e : EventArgs);
begin
script.Image:=System.Drawing.Image.FromFile('https.png');
script.Show;
  end;
  procedure _http_ (sender:object; e : WebBrowserNavigatingEventArgs);
begin
script.Image:=System.Drawing.Image.FromFile('http.png');
script.Show;
  end;

procedure _back_(sender: object; e: EventArgs);
begin
  web.GoBack();
end; 
procedure _forward_(sender: object; e: EventArgs);
begin
  web.GoForward();
end; 
procedure _print_(sender: object; e: EventArgs);
begin
web.ShowPageSetupDialog();
  web.Print();
end;
procedure _close_(sender: object; e: EventArgs);
begin
  form.Close;
end;
procedure _search_(sender: object; e: EventArgs);
begin
  web.Url:=new Uri('http://' + url.Text);
  web.Refresh();
end; 
  procedure _searchya_(sender: object; e: EventArgs);
begin
  web.Url:=new Uri('https://' +listsearch.Text + url.Text);
  web.Refresh();
end; 


//panelcolor 
procedure _panelcolorr_(sender: object; e: EventArgs);
begin
pan.BackgroundImage:=System.Drawing.Image.FromFile('design-kreml.jpg');
end;
procedure _panelcoloro_(sender: object; e: EventArgs);
begin
pan.BackgroundImage:=System.Drawing.Image.FromFile('design-rabina.jpg');
end;
procedure _panelcolory_(sender: object; e: EventArgs);
begin
pan.BackgroundImage:=System.Drawing.Image.FromFile('design-vesna.jpg');
end;
procedure _panelcolorgreen_(sender: object; e: EventArgs);
begin
pan.BackgroundImage:=System.Drawing.Image.FromFile('design-earch.png');
end;
procedure _panelcolorg_(sender: object; e: EventArgs);
begin
pan.BackgroundImage:=System.Drawing.Image.FromFile('design-gray.png');
end;
procedure _panelcolorv_(sender: object; e: EventArgs);
begin
pan.BackgroundImage:=System.Drawing.Image.FromFile('design-raduga.jpg');
end;
procedure _panelcolorb_(sender: object; e: EventArgs);
begin
pan.BackgroundImage:=System.Drawing.Image.FromFile('design-water.jpg');
end;
procedure _panelcolorb1_(sender: object; e: EventArgs);
begin
pan.BackgroundImage:=System.Drawing.Image.FromFile('design-winxp.jpg');
end;
procedure _panelcolorp_(sender: object; e: EventArgs);
begin
pan.BackgroundImage:=System.Drawing.Image.FromFile('design-pink.png');
end;

procedure _panelcolorblack_(sender: object; e: EventArgs);
begin
pan.BackgroundImage:=System.Drawing.Image.FromFile('design-cvdrblack.jpg');
end;
procedure _panelcolorbrown_(sender: object; e: EventArgs);
begin
pan.BackgroundImage:=System.Drawing.Image.FromFile('design-coffie.jpg');
end;


//apps


procedure _newwebdockright_(sender: object; e: EventArgs);
begin
   newwebdockright.AllowWebBrowserDrop:=true;
   newwebdockright.ScriptErrorsSuppressed:=true;  
   newwebdockright.Dock:=DockStyle.right;
   form.Controls.Add(newwebdockright);
end; 

procedure _newwebdockbottom_(sender: object; e: EventArgs);
begin
  newwebdockbottom.AllowWebBrowserDrop:=true;
  newwebdockbottom.ScriptErrorsSuppressed:=true;  
  newwebdockbottom.Dock:=DockStyle.Bottom;
   form.Controls.Add(newwebdockbottom);
end; 

procedure _downloadhtml_(sender: object; e: EventArgs);
begin
    var w := new WebClient();
  var f: file;
  var namehtml:=web.Document.Title;
  var thissite:=web.Url.AbsoluteUri.ToString;
  w.Encoding := System.Text.Encoding.Default;
  assign (f, namehtml+ '.html');
  Rewrite (f);
  var s := w.DownloadString(thissite);
  write(f,s);
end; 

begin

  
  //create:
  //functions
  url:=System.Windows.Forms.TextBox.Create;
  web:=System.Windows.Forms.WebBrowser.Create;
  home:=System.Windows.Forms.Button.Create;
  go:=System.Windows.Forms.Button.Create;
  searchya:=System.Windows.Forms.Button.Create;
  listsearch:=System.Windows.Forms.ListBox.Create;
  back:=System.Windows.Forms.Button.Create;
  forw:=System.Windows.Forms.Button.Create;
  stop:=System.Windows.Forms.Button.Create;
  script:=System.Windows.Forms.Button.Create;
  refresh:=System.Windows.Forms.Button.Create;
 incognito:=System.Windows.Forms.Button.Create;
  pan:=System.Windows.Forms.Panel.Create;
  about:=System.Windows.Forms.Button.Create; 
  form:=System.Windows.Forms.Form.Create;
  newtab:=System.Windows.Forms.Button.Create;
  close:=System.Windows.Forms.Button.Create;
  print:=System.Windows.Forms.Button.Create;
  incognito:=System.Windows.Forms.Button.Create;
  //panelcolor
  panelcolorr:=System.Windows.Forms.Button.Create;
   panelcolorg:=System.Windows.Forms.Button.Create;
    panelcolorgreen:=System.Windows.Forms.Button.Create;
     panelcoloro:=System.Windows.Forms.Button.Create;
      panelcolory:=System.Windows.Forms.Button.Create;
       panelcolorv:=System.Windows.Forms.Button.Create;
        panelcolorb:=System.Windows.Forms.Button.Create;
        panelcolorb1:=System.Windows.Forms.Button.Create;
        panelcolorp:=System.Windows.Forms.Button.Create;
        panelcolorblack:=System.Windows.Forms.Button.Create;
        panelcolorbrown:=System.Windows.Forms.Button.Create;
        
  //apps
apps:=System.Windows.Forms.Panel.Create;
newwebdockrightb:=System.Windows.Forms.Button.Create;
newwebdockright:=System.Windows.Forms.WebBrowser.Create;
newwebdockbottomb:=System.Windows.Forms.Button.Create;
newwebdockbottom:=System.Windows.Forms.WebBrowser.Create;
downloadhtml:=System.Windows.Forms.Button.Create;
   //web
   Web.Url:= new Uri ('http://turtleweb-browser.org.ru/startpage.html');
   web.AllowWebBrowserDrop:=true;
   web.ScriptErrorsSuppressed:=true;  
   web.Dock:=DockStyle.Fill;
   //panel
   pan.Width:=275;
   pan.BackgroundImage:=System.Drawing.Image.FromFile ('design-img.jpg');
   pan.Dock:=DockStyle.Left;
  
   //form
   form.Text:='TurtleВеб - удобный, легковесный и анонимный веб-браузер';
   form.Height:=800;
   form.Width:=1500;
   form.WindowState:=FormWindowState.Maximized;
   //url
   url.Width:=120;
   url.Left:=130;
   url.Top:=30;
   url.ShortcutsEnabled:=true;
   //script
   script.Image:=System.Drawing.Image.FromFile ('script.png');
   script.Image:=System.Drawing.Image.FromFile ('http.png');
   script.BackColor:=System.Drawing.Color.YellowGreen;
   script.Left:=0;
   script.Top:=30;
   script.Width:=25;
   script.Height:=30;
      //incognito
   incognito.BackColor:=System.Drawing.Color.White;
   incognito.Image:=System.Drawing.Image.FromFile ('incognito.png');
   incognito.Left:=250;
   incognito.Top:=58;
   incognito.Width:=25;
   incognito.Height:=25;
   //listsearch
   listsearch.Left:=25;
   listsearch.Top:=30;
   listsearch.Width:=100;
   listsearch.Height:=30;
   listsearch.Items.AddRange(new System.Object[16]('Выберите ПС', 'www.google.com/search?q=', 'yandex.ru/search/?lr=213&text=', 'nova.rambler.ru/search?query=', 'go.mail.ru/search?q=', 'www.bing.com/search?q=', 'results.excite.com/serp?q=', 'www.dogpile.com/serp?q=', 'search.yahoo.com/search?p=', 'lite.qwant.com/?q=','search.aol.com/aol/search?q=', 'asknet.ru/webserver/index_ngs.aspx?ngs_q=', 'www.liveinternet.ru/search/?q=', 'duckduckgo.com/?q=', 'www.km.ru/kmsearch/site/0?query=', 'startpage.com/sp/search/'));
   //go
   go.ForeColor:=System.Drawing.Color.DarkRed;
   go.Image:=System.Drawing.Image.FromFile ('go.png');
   go.Left:=250;
   go.Top:=7;
   go.Width:=25;
   go.Height:=25;
   
   //panelcolor
   panelcolorr.BackColor:=System.Drawing.Color.Red;
   panelcolorr.ForeColor:=System.Drawing.Color.Red;
   panelcolorr.Left:=0;
   panelcolorr.Top:=450;
   panelcolorr.Width:=20;
   panelcolorr.Height:=20;
    panelcoloro.BackColor:=System.Drawing.Color.OrangeRed;
   panelcoloro.ForeColor:=System.Drawing.Color.OrangeRed;
   panelcoloro.Left:=20;
   panelcoloro.Top:=450;
   panelcoloro.Width:=20;
   panelcoloro.Height:=20;
    panelcolorg.BackColor:=System.Drawing.Color.Gray;
    panelcolorg.ForeColor:=System.Drawing.Color.Gray;
   panelcolorg.Left:=40;
   panelcolorg.Top:=450;
   panelcolorg.Width:=20;
   panelcolorg.Height:=20;
    panelcolory.BackgroundImage:=System.Drawing.Image.FromFile('design-vesna.jpg');
   panelcolory.Left:=60;
   panelcolory.Top:=450;
   panelcolory.Width:=20;
   panelcolory.Height:=20;
    panelcolorgreen.BackgroundImage:=System.Drawing.Image.FromFile('design-earch1.png');
   panelcolorgreen.Left:=80;
   panelcolorgreen.Top:=450;
   panelcolorgreen.Width:=20;
   panelcolorgreen.Height:=20;
    panelcolorb.BackgroundImage:=System.Drawing.Image.FromFile('design-water.jpg');
    panelcolorb.ForeColor:=System.Drawing.Color.Blue;
   panelcolorb.Left:=100;
   panelcolorb.Top:=450;
   panelcolorb.Width:=20;
   panelcolorb.Height:=20;
    panelcolorv.BackgroundImage:=System.Drawing.Image.FromFile('design-clr.png');
   panelcolorv.Left:=120;
   panelcolorv.Top:=450;
   panelcolorv.Width:=20;
   panelcolorv.Height:=20;
       panelcolorb1.BackgroundImage:=System.Drawing.Image.FromFile('design-winxpl.jpg');
   panelcolorb1.Left:=140;
   panelcolorb1.Top:=450;
   panelcolorb1.Width:=20;
   panelcolorb1.Height:=20;
       panelcolorp.BackColor:=System.Drawing.Color.Pink;
       panelcolorp.ForeColor:=System.Drawing.Color.Pink;
   panelcolorp.Left:=160;
   panelcolorp.Top:=450;
   panelcolorp.Width:=20;
   panelcolorp.Height:=20;
   panelcolorblack.BackColor:=System.Drawing.Color.Black;
       panelcolorblack.ForeColor:=System.Drawing.Color.Black;
   panelcolorblack.Left:=200;
   panelcolorblack.Top:=450;
   panelcolorblack.Width:=20;
   panelcolorblack.Height:=20;
   panelcolorbrown.BackColor:=System.Drawing.Color.Brown;
       panelcolorbrown.ForeColor:=System.Drawing.Color.Brown;
   panelcolorbrown.Left:=220;
   panelcolorbrown.Top:=450;
   panelcolorbrown.Width:=20;
   panelcolorbrown.Height:=20;
     //searchya
   searchya.ForeColor:=System.Drawing.Color.DarkRed;
   searchya.Image:=System.Drawing.Image.FromFile ('search.png');
   searchya.Left:=250;
  searchya.Top:=33;
   searchya.Width:=25;
   searchya.Height:=25;
 

   newtab.Image:=System.Drawing.Image.FromFile ('newtab.png');
   newtab.Left:=1;
   newtab.Top:=1;
   newtab.Width:=29;
   newtab.Height:=29;
       //close
   close.Image:=System.Drawing.Image.FromFile ('close.png');
   close.Left:=30;
   close.Top:=1;
   close.Width:=29;
   close.Height:=29;
       //print
   print.Image:=System.Drawing.Image.FromFile ('print.png');
   print.Text:='Распечатать страницу'; 
   print.Left:=50;
   print.Top:=170;
   print.Width:=150;
   print.Height:=20;
   
  
   //about
   about.Image:=System.Drawing.Image.FromFile ('browser.jpg');
   about.Left:=75;
   about.Top:=500;
   about.Width:=31;
   about.Height:=31;

   //home
   home.Image:=System.Drawing.Image.FromFile ('home.png');
   home.Left:=190;
   home.Top:=1;
   home.Width:=30;
   home.Height:=30;
   //stop
   stop.Image:=System.Drawing.Image.FromFile ('stop.png');
   stop.Left:=70;
   stop.Top:=1;
   stop.Width:=30;
   stop.Height:=30;
   //refresh
    refresh.ForeColor:=System.Drawing.Color.DarkSeaGreen;
   refresh.Image:=System.Drawing.Image.FromFile ('refresh.png');
   refresh.Left:=100;
   refresh.Top:=1;
   refresh.Width:=30;
   refresh.Height:=30;
 
   //forward
   forw.Image:=System.Drawing.Image.FromFile ('forw.png');
   forw.Left:=160;
   forw.Top:=1;
   forw.Width:=30;
   forw.Height:=30;
   //back
   back.Image:=System.Drawing.Image.FromFile ('back.png');
   back.Left:=130;
   back.Top:=1;
   back.Width:=30;
   back.Height:=30;
      //apps
          //apps
   apps.Height:=30;
   apps.BackColor:=System.Drawing.Color.DarkSlateGray;
   apps.Dock:=DockStyle.Bottom;
      //newwebdockrightbutton
    newwebdockrightb.Image:=System.Drawing.Image.FromFile ('newwebdock-right.png');
   newwebdockrightb.Left:=280;
   newwebdockrightb.Top:=675;
   newwebdockrightb.Width:=30;
   newwebdockrightb.Height:=30;
     //newwebdockbottombutton
    newwebdockbottomb.Image:=System.Drawing.Image.FromFile ('newwebdock-bottom.png');
   newwebdockbottomb.Left:=250;
   newwebdockbottomb.Top:=675;
   newwebdockbottomb.Width:=30;
   newwebdockbottomb.Height:=30;
   
          downloadhtml.Image:=System.Drawing.Image.FromFile ('downloadhtml.png');
          downloadhtml.Text:='Сохранить страницу'; 
   downloadhtml.Left:=50;
   downloadhtml.Top:=150;
   downloadhtml.Width:=150;
   downloadhtml.Height:=20;
  //events
  go.Click+=_search_;
  searchya.Click+=_searchya_;
  home.Click+=_home_;
  stop.Click+=_stop_;
  about.Click+=_about_;
  back.Click+=_back_;
  forw.Click+=_forward_;
  newwebdockbottomb.Click+=_newwebdockbottom_;
  script.Click+=_script_;
  print.Click+=_print_;
  incognito.Click+=_incognito_;
  panelcolorr.Click+=_panelcolorr_;
  panelcolorg.Click+=_panelcolorg_;
  panelcolorgreen.Click+=_panelcolorgreen_;
  panelcolory.Click+=_panelcolory_;
  panelcoloro.Click+=_panelcoloro_;
  panelcolorv.Click+=_panelcolorv_;
  panelcolorb.Click+=_panelcolorb_;
  panelcolorp.Click+=_panelcolorp_;
  panelcolorb1.Click+=_panelcolorb1_;
  panelcolorblack.Click+=_panelcolorblack_;
  panelcolorbrown.Click+=_panelcolorbrown_;
  newtab.Click+=_newtab_;
  refresh.Click+=_refresh_;
  newwebdockrightb.Click+=_newwebdockright_;
  close.Click+=_close_;
   downloadhtml.Click+=_downloadhtml_;
  web.NewWindow += w_NW;
  web.DocumentCompleted+=web_Document_Url;
  web.EncryptionLevelChanged+=_https_;
  web.Navigating+=_http_;
  
  //controls
  form.Controls.Add(newtab);
  form.Controls.Add(close);
  form.Controls.Add(stop);
  form.Controls.Add(refresh);
  form.Controls.Add(back);
  form.Controls.Add(forw);
  form.Controls.Add(home);
  form.Controls.Add(script);
  form.Controls.Add(go);
  form.Controls.Add(searchya);
  form.Controls.Add(listsearch);
  form.Controls.Add(url);
  form.Controls.Add(web);
  form.Controls.Add(incognito);
   form.Controls.Add(panelcolorr);
   form.Controls.Add(panelcolorg);
   form.Controls.Add(panelcolorgreen);
   form.Controls.Add(panelcolory);
   form.Controls.Add(panelcoloro);
   form.Controls.Add(panelcolorv);
   form.Controls.Add(panelcolorb);
   form.Controls.Add(panelcolorb1);
   form.Controls.Add(panelcolorp);
   form.Controls.Add(panelcolorblack);
   form.Controls.Add(panelcolorbrown);
       form.Controls.Add(about);
     form.Controls.Add(print);
       form.Controls.Add(downloadhtml);
    form.Controls.Add(newwebdockrightb);
    form.Controls.Add(newwebdockbottomb);
  form.Controls.Add(pan);
  
  form.Controls.Add(apps);
  //logo
  form.Icon:=System.Drawing.Icon.ExtractAssociatedIcon('browser.ico');
  //Application
  Application.Run(form);
end.
