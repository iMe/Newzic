using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;

namespace Newzic.Core
{
    public class WebServiceData : IWebServiceData
    {
        public String login(String email, String password)
        {
            /**
            IDataCRUD<Sessao> sData = new DataCRUD<Sessao>();
            IDataCRUD<Jornalista> jData = new JornalistaData();
            
            Sessao sess = new Sessao();
            Jornalista j = (from jornalista in jData.fetchAll() where jornalista.Email == email select jornalista).Single();
            SHA1 sha = SHA1.Create();
            
            byte[] result = sha.ComputeHash(Encoding.UTF8.GetBytes(string.Concat(password, email)));
            sess.JornalistaId = j.JornalistaId;
            sess.Timestamp = DateTime.Now;
            String ret = Convert.ToBase64String(result);
            sess.Token = ret;
            return ret;
            */

            throw new NotImplementedException();
        }

        public void logout(String token)
        {
            throw new NotImplementedException();
        }

        public Boolean isLoged(String token)
        {
            throw new NotImplementedException();
        }

        public Jornalista getUser(String token)
        {
            throw new NotImplementedException();
        }

        public void Save()
        {
            throw new NotImplementedException();
        }
    }
}
