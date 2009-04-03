

using System.Configuration.Provider;
using System.Collections.Generic;


/// <summary>
/// base data access class
/// </summary>
public abstract class TestimonialProvider : ProviderBase
{        
    public abstract List<Testimonial> GetAllTestimonials();
}


