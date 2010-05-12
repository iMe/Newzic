using System;

namespace Newzic.Data
{
    public interface IWebServiceData
    {
        String login(String email, String password);
        void logout(String token);
        Boolean isLoged(String token);
        Guid getUser(String token);
    }
}