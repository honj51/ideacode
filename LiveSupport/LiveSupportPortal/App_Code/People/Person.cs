using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Globalization;
/// <summary>
/// Represents a person
/// </summary> 
public class Person
{
    private string  _id;
    private string  _firstName;
    private string  _middleName;
    private string  _lastName;
    
    private bool    _visible;
    private string  _title;
    private string  _description;
    
    // contact info
    private string  _email;
    private string  _phone;
    private string  _fax;

    private string  _streetAddress;
    private string  _city;
    private string  _state;
    private string  _country;
    private string  _postalCode;

    private string  _imageUrl;
    private string _imageAltText;
    
    public Person(string id, bool visible, string firstName, string lastName)
    {
        if (String.IsNullOrEmpty(id)) throw new ArgumentException(Messages.UndefinedId);
        if (String.IsNullOrEmpty(firstName)) throw new ArgumentException(Messages.UndefinedFirstName);
        if (String.IsNullOrEmpty(lastName)) throw new ArgumentException(Messages.UndefinedLastName);
        
        _id = id; 
        _firstName   = firstName;
        _lastName    = lastName;
        _visible     = visible; 
    }


    public string Id
    {
        get { return String.IsNullOrEmpty(_id ) ? String.Empty : _id; }
    }

    
    public string FirstName
    {
        get { return String.IsNullOrEmpty(_firstName) ? String.Empty : _firstName; }
        set 
        {
            if (String.IsNullOrEmpty(value))
                throw new InvalidOperationException(Messages.UndefinedFirstName);
            _firstName = value;
        }
    }


    public string MiddleName
    {
        get { return String.IsNullOrEmpty(_middleName) ? String.Empty : _middleName; }
        set { _middleName = value; }
    }

    public string LastName
    {
        get { return String.IsNullOrEmpty(_lastName) ? String.Empty : _lastName; }
        set
        {
            if (String.IsNullOrEmpty(value))
                throw new InvalidOperationException(Messages.UndefinedLastName);
            _lastName = value;
        }
    }

    public bool Visible
    {
        get { return _visible; }
        set { _visible = value; }
    }

    public string Title
    {
        get { return String.IsNullOrEmpty(_title) ? String.Empty : _title; }
        set { _title = value; }
    }

    public string Description
    {
        get { return String.IsNullOrEmpty(_description) ? String.Empty : _description; }
        set { _description = value; }
    }


    public string Email
    {
        get { return String.IsNullOrEmpty(_email) ? String.Empty : _email; }
        set { _email = value; }
    }


    public string Phone
    {
        get
        {
            if (String.IsNullOrEmpty(_phone))
            {
                return String.Empty;
            }
            else
            {
                if (CultureInfo.CurrentCulture.Name == "en-US")
                {
                    try
                    {
                        string usPhone = "(" + _phone.Substring(0, 3) + ") " + _phone.Substring(3, 3) + "-" + _phone.Substring(6);
                        return usPhone;
                    }
                    catch (ArgumentOutOfRangeException)
                    {
                        return _phone;
                    }
                }
                else
                {
                    return _phone;
                }
            }
        }
        set { _phone = value; }
    }

    public string Fax
    {
        get
        {
            if (String.IsNullOrEmpty(_fax))
            {
                return String.Empty;
            }
            else
            {
                if (CultureInfo.CurrentCulture.Name == "en-US")
                {
                    try
                    {
                        string usFax = "(" + _fax.Substring(0, 3) + ") " + _fax.Substring(3, 3) + "-" + _fax.Substring(6);
                        return usFax;
                    }
                    catch (ArgumentOutOfRangeException)
                    {
                        return _fax;
                    }
                }

                else
                {
                    return _fax;
                }
            }
        }
        set { _fax = value; }
    }

    public string StreetAddress
    {
        get { return String.IsNullOrEmpty(_streetAddress) ? String.Empty : _streetAddress; }
        set { _streetAddress = value; }
    }

    
    public string City
    {
        get { return String.IsNullOrEmpty(_city) ? String.Empty : _city; }
        set { _city = value; }
    }


    public string PostalCode
    {
        get { return String.IsNullOrEmpty(_postalCode) ? String.Empty : _postalCode; }
        set { _postalCode = value; }
    }


    public string State
    {
        get { return String.IsNullOrEmpty(_state) ? String.Empty : _state; }
        set { _state = value; }
    }

    public string Country
    {
        get { return String.IsNullOrEmpty(_country) ? String.Empty : _country; }
        set { _country= value; }
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
