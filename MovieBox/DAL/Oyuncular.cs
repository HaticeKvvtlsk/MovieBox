//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class Oyuncular
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Oyuncular()
        {
            this.FilmOyuncular = new HashSet<FilmOyuncular>();
        }
    
        public int OyuncuId { get; set; }
        public string OyuncuAdi { get; set; }
        public string OyuncuSoyadi { get; set; }
        public Nullable<System.DateTime> DogumTarihi { get; set; }
        public string Cinsiyet { get; set; }
        public string Ulkesi { get; set; }
        public string OyuncuOdulleri { get; set; }
        public Nullable<bool> isDeleted { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FilmOyuncular> FilmOyuncular { get; set; }
    }
}
