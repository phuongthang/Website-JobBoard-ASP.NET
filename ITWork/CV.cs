//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ITWork
{
    using System;
    using System.Collections.Generic;
    
    public partial class CV
    {
        public long ID { get; set; }
        public string Username { get; set; }
        public Nullable<System.DateTime> Birthday { get; set; }
        public string ImgCV { get; set; }
        public string Position { get; set; }
        public string Language { get; set; }
        public string Location { get; set; }
        public string Experience { get; set; }
        public string Skill { get; set; }
        public string Pin { get; set; }
    
        public virtual AccountPerson AccountPerson { get; set; }
    }
}
