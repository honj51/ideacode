using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.Providers
{
    public interface IClientProvider
    {
        int AddClient(Client client);
        int UpdateClient(Client client);
        Client GetClientById(string id);
        List<Client> GetClientByGrounpId(string grounpId);
        int DeleteClientById(string id);
    }
}
