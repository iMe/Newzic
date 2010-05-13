using System;

namespace Newzic.Core
{
    public interface IWebServiceData
    {
        String login(String email, String password);
        void logout(String token);
        Boolean isLoged(String token);
        Jornalista getUser(String token);
        void Save();
    }
}