using System;
using System.Data;
using System.Configuration;



/// <summary>
/// Represents a one piece of news 
/// </summary>
public class NewsItem
{
    string      _id;            // unique identifier
    bool        _visible;       // whether to display
    string      _title;         // brief descriptive name
    DateTime    _date;          // date of the news
    string      _content;       // main content of the news
    string      _imageUrl;      // image associated with the news item
    string      _imageAltText;  // in case the image can't be displayed


    public NewsItem(string id, bool visible, string title)
    {
        if (String.IsNullOrEmpty(id)) throw new ArgumentException(Messages.NewsItemIdUndefined);
        if (String.IsNullOrEmpty(title)) throw new ArgumentException(Messages.NewsItemTitleUndefined);
        _id             = id;
        _visible        = visible;
        _title          = title;   
    }

    public string Id
    {
        get { return _id; }        
    }


    public bool Visible
    {
        get { return _visible; }
        set { _visible = value; }
    }


    public string Title
    {
        get { return String.IsNullOrEmpty(_title) ? String.Empty : _title; }
        set 
        {
            if (String.IsNullOrEmpty(value))
                throw new InvalidOperationException(Messages.NewsItemTitleUndefined);            
            _title = value; 
        
        }
    }


    public DateTime Date
    {
        get { return _date; }
        set { _date = value; }
    }

    public string Content
    {
        get { return String.IsNullOrEmpty(_content) ? String.Empty : _content; }
        set { _content = value; }
    }

    public string ImageUrl
    {
        get { return String.IsNullOrEmpty(_imageUrl) ? String.Empty : _imageUrl; }
        set { _imageUrl = value; }
    }

    public string ImageAltText
    {
        get { return String.IsNullOrEmpty(_imageAltText) ? String.Empty : _imageAltText; }
        set { _imageAltText = value; }
    }

}
