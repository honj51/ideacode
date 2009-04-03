using System;
using System.Data;
using System.Configuration;


///<summary>
/// class Testimonial
/// represents a testimonial
///</summary>
public class Testimonial
{
    string      _id;
    bool      _visible;
    string      _title;
    DateTime    _date;
    string      _content;
    string      _testifier;
    string      _testifierCompany;
    string      _imageUrl;
    string      _imageAltText;


   public Testimonial(
                string  id,
                bool visible, 
                string  title,
                DateTime  date,
                string  content,
                string  testifier                     
                )
    {
       // exceptions thrown if reqd attributes are missing
       //
        if (String.IsNullOrEmpty(id)) throw new ArgumentException(Messages.TestimonialsIdUndefined);
        if (String.IsNullOrEmpty(title)) throw new ArgumentException(Messages.TestimonialsTitleUndefined);
        if (String.IsNullOrEmpty(content)) throw new ArgumentException(Messages.TestimonialsContentUndefined);
        if (String.IsNullOrEmpty(testifier)) throw new ArgumentException(Messages.TestimonialsTestifierUndefined);
        if (date.Equals(null)) throw new ArgumentException(Messages.TestimonialsDateUndefined);
        
        _id             = id; 
        _visible        = visible;
        _title          = title;
        _date           = date;
        _content        = content; 
        _testifier      = testifier;            
    }

    public string Id
    {
        get { return String.IsNullOrEmpty(_id) ? String.Empty : _id; }            
    }


    public bool Visible
    {
        get { return  _visible; }
        set { _visible = value; }
    }


    public string Title
    {
        get { return String.IsNullOrEmpty(_title) ? String.Empty : _title; }
        set
        {
            if (String.IsNullOrEmpty(value))
                throw new InvalidOperationException(Messages.TitleUndefined);
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
        set 
        { 
            if (String.IsNullOrEmpty(value))
                throw new InvalidOperationException(Messages.ContentIsNull);
            _content = value; 
        }
    }

    public string Testifier
    {
        get { return String.IsNullOrEmpty(_testifier) ? String.Empty : _testifier; }
        set { _testifier = value; }
    }

    public string TestifierCompany
    {
        get { return String.IsNullOrEmpty(_testifierCompany) ? String.Empty : _testifierCompany; }
        set { _testifierCompany = value; }
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
