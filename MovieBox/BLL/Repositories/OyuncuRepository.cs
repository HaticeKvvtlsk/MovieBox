using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Repositories
{
    public class OyuncuRepository : IRepository<Oyuncular>
    {
        MovieBoxDBEntities db = new MovieBoxDBEntities();
        public void delete(int itemid)
        {
            Oyuncular silinecek = db.Oyuncular.Find(itemid);
            silinecek.isDeleted = true;
            db.SaveChanges();
        }

        public List<Oyuncular> GetAll()
        {
            return db.Oyuncular.ToList();
        }

        public Oyuncular GetById(int id)
        {
            return db.Oyuncular.Find(id);
        }

        public void insert(Oyuncular item)
        {
            db.Oyuncular.Add(item);
            db.SaveChanges();
        }

        public void update(Oyuncular item)
        {
            Oyuncular guncellenecek = db.Oyuncular.Find(item.OyuncuId);
            db.Entry(guncellenecek).CurrentValues.SetValues(item);
            db.SaveChanges();
        }
    }
}
