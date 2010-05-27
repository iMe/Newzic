using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;

namespace Newzic.Core
{
    public class WebServiceData : IWebServiceData
    {
        IDataCRUD<Sessao> sData = new DataCRUD<Sessao>();

        public String login(String email, String password)
        {
            
            //IDataCRUD<Sessao> sData = new DataCRUD<Sessao>();
            IDataCRUD<Jornalista> jData = new JornalistaData();
            IDataCRUD<Banido> bData = new DataCRUD<Banido>();
            
            Sessao sess = new Sessao();

            Jornalista j = (from jornalista in jData.fetchAll() where jornalista.Email == email select jornalista).Single();

            bool teste = (from b in bData.fetchAll() where b.JornalistaId == j.JornalistaId select b).Any();
            bool teste2 = (from s in sData.fetchAll() where s.JornalistaId == j.JornalistaId select s).Any();
            if (teste) throw new ApplicationException("O utilizador está banido");
            if (teste2) throw new ApplicationException("O já tem um sessao iniciada");
            
            sess.JornalistaId = j.JornalistaId;
            sess.Timestamp = DateTime.Now;
            String ret = Guid.NewGuid().ToString();
            sess.Token = ret;
            
            sData.create(sess);
            sData.Save();
            
            return ret;
        }

        public void logout(String token)
        {
            //IDataCRUD<Sessao> sData = new DataCRUD<Sessao>();

            Sessao s = (from sess in sData.fetchAll() where sess.Token == token select sess).Single();
            sData.remove(s);
            //sData.Save();
        }

        public Boolean isLoged(String token)
        {
            //IDataCRUD<Sessao> sData = new DataCRUD<Sessao>();

            return (from sess in sData.fetchAll() where sess.Token == token select sess).Any();
        }

        public Jornalista getUser(String token)
        {
            //IDataCRUD<Sessao> sData = new DataCRUD<Sessao>();

            return (from sess in sData.fetchAll() where sess.Token == token select sess.Jornalista).SingleOrDefault();

        }

        public void Save(){
            sData.Save();
        }
    }
}
