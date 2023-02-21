using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Repositories
{
    public class DuyuruRepository : IRepository<Duyurular>
    {
        MovieBoxDBEntities db = new MovieBoxDBEntities();
        public void delete(int itemid)
        {
            Duyurular silinecek = db.Duyurular.Find(itemid);
            silinecek.isDeleted = true;
            db.SaveChanges();
        }

        public List<Duyurular> GetAll()
        {
            return db.Duyurular.ToList();
        }

        public Duyurular GetById(int id)
        {
            return db.Duyurular.Find(id);
        }

        public void insert(Duyurular item)
        {
            db.Duyurular.Add(item);
            db.SaveChanges();
        }

        public void update(Duyurular item)
        {
            Duyurular guncellenecek = db.Duyurular.Find(item.DuyuruId);
            db.Entry(guncellenecek).CurrentValues.SetValues(item);
            db.SaveChanges();
        }
    }
}
