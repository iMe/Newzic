using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace Newzic.Core
{
    public static class Hash
    {
        public static String generate(String pass)
        {
            SHA1 sha = SHA1.Create();
            byte[] result = sha.ComputeHash(Encoding.UTF8.GetBytes(pass));
            return Convert.ToBase64String(result);
        }
    }
}
