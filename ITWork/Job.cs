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
    
    public partial class Job
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Job()
        {
            this.Applies = new HashSet<Apply>();
        }
    
        public long ID { get; set; }
        public string Username { get; set; }
        public string JobTitle { get; set; }
        public Nullable<System.DateTime> StartDate { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
        public string JobPosition { get; set; }
        public string Location { get; set; }
        public Nullable<long> Salary { get; set; }
        public string Language { get; set; }
        public string Description { get; set; }
        public string RequireSkill { get; set; }
        public string NumPeople { get; set; }
        public string Active { get; set; }
        public string Main { get; set; }
    
        public virtual AccountOrganization AccountOrganization { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Apply> Applies { get; set; }
    }
}
